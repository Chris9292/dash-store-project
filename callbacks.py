from dash.dependencies import Input, Output, State
from app import app
from utils import *
from dash.exceptions import PreventUpdate
from datetime import datetime
from database import execute_query
from sqlalchemy.exc import SQLAlchemyError

# these variables are used to keep track of what triggered the callbacks for layout2
add_row_clicks = [0]
current_customer = [None]


# callbacks for layout1
@app.callback(
    [Output("out_div1", "children")],
    [Input("table_selector_dropdown", 'value')]
)
def create_datatable(table_name):
    print(f'show table: {table_name}')

    # create table
    if not table_name:
        return [None]
    else:
        df = fetch_table(table_name)
        df.sort_values(by='id', inplace=True)

        # show latest orders first
        if table_name == 'Order':
            df['date'] = df['date'].map(lambda x: str(x).strip('T')[:-3])
            df.sort_values(by='id', ascending=False, inplace=True)
        elif table_name == 'OrderItem':
            df.sort_values(by='id', ascending=False, inplace=True)    
        elif table_name == 'Product':
            df.drop(columns=['image'], inplace=True)

        data_table = create_custom_datatable(df)
        return [data_table]


# callbacks for layout2
@app.callback(
    [Output('out_div2', 'children')],
    [Input("customer_selector_dropdown", "value")]
)
def create_out_div_content(customer_dropdown_value):
    if customer_dropdown_value is None:
        raise PreventUpdate

    return out_div_content(customer_dropdown_value)


@app.callback(
    [Output('table2', 'data'), Output('total_div', 'children')],
    [Input('add-rows-button', 'n_clicks'),
     Input('table2', 'data_timestamp')],
    [State('table2', 'data'),
     State('customer_name', 'children')]
)
def add_row_or_calculate_price(n_clicks, timestamp, rows, customer_name):
    # depending on what triggered the callback, add row or calculate price
    if not customer_name:
        return []

    # for every new customer reset add_row_clicks
    if not (current_customer[-1] == customer_name):
        current_customer[-1] = customer_name
        add_row_clicks[-1] = 0

    # calculate price column and total amount
    total = 0
    if rows:
        for i in range(len(rows)):
            # if product is chosen:
            if rows[i]['product']:
                product_price = float(fetch_product_price(rows[i]['product']))
                rows[i]['price'] = round(
                    (product_price - ((rows[i]['discount']) * product_price)) * rows[i]['quantity'], 2)
                total += (rows[i]['price'] * 1.24)

    # if add rows button was clicked
    if n_clicks != add_row_clicks[-1]:
        rows.append({'product': None, 'quantity': 1, 'discount': fetch_discount(customer_name), 'price': None})
        add_row_clicks[-1] = n_clicks
    return rows, ['Total amount: ', html.Span(round(total, 2), id='total')]


@app.callback(
    [Output('message2', 'children')],
    [Input('save-button', 'n_clicks')],
    [State('table2', 'data')]
)
def message_to_user(n_clicks, rows):
    # returns message to user if something is wrong
    if n_clicks == 0:
        raise PreventUpdate

    # if row with product not selected or no rows
    if rows:
        for i in range(len(rows)):
            if not rows[i]['product']:
                return [html.Span("Product is not selected!", id='alert')]
    else:
        return [html.Span("Empty table!", id='alert')]

    return [None]


@app.callback(
    [Output('out_content', 'children')],
    [Input('message2', 'children')],
    [State('table2', 'data'),
     State('save-button', 'n_clicks'),
     State('total', 'children'),
     State('customer_name', 'children')]
)
def add_to_db(message, rows, n_clicks, total, customer_name):
    # add data to db
    if message is not None or n_clicks == 0:
        raise PreventUpdate

    # insert data to db
    # add new order to Order table. to do so fetch customer_id
    customer_id = fetch_customer_id(customer_name)
    add_order_to_db(customer_id, datetime.now().strftime('%Y-%m-%d %H:%M'), total)

    # add items to OrderList table with pandas. to do so fetch product_id and order_id
    df = pd.DataFrame(rows)
    df['product_id'] = df['product'].map(lambda x: fetch_product_id(x))
    current_order_id = fetch_current_order_id()
    df['order_id'] = current_order_id

    # drop non relevant columns
    df.drop(columns=['product', 'discount'], inplace=True)
    add_order_list_to_db(df)

    # create invoice
    invoice(current_order_id)
    return [html.Span('Success! Database updated!', id='success')]


# callbacks for layout3
@app.callback(
    [Output('out_div3', 'children')],
    [Input('table_selector_dropdown', 'value')]
)
def add_table(table_name):
    # show table
    if not table_name:
        content = []
    else:
        content = [html.Span(id='message3'), html.Div(id='buttons', children=[
            html.Button('Add Row', id='add-rows-button', n_clicks=0),
            html.Button('Save', id='save-button', n_clicks=0)]), create_add_table(table_name)]
    return [html.Div(id='out_content3', children=content)]


@app.callback(
    [Output('table3', 'data')],
    [Input('add-rows-button', 'n_clicks')],
    [State('table3', 'data'),
     State('table3', 'columns')]
)
def add_row(n_clicks, rows, columns):
    # add row to datatable
    if n_clicks == 0:
        raise PreventUpdate

    r = {c['id']: 'Enter value' for c in columns}
    rows.append(r)

    return [rows]


@app.callback(
    [Output('message3', 'children')],
    [Input('save-button', 'n_clicks')],
    [State('table3', 'data'),
     State("table_selector_dropdown", 'value')]
)
def save_and_message(n_clicks, rows, table_name):
    # check if everything went ok, return corresponding message
    if n_clicks == 0:
        raise PreventUpdate
    if not rows:
        return [html.Span("Empty table!", id='alert')]

    df = pd.DataFrame(rows)
    engine = create_engine('postgresql://postgres:Chr!$t0tk@localhost:5432/store')
    message = [None]
    try:
        df.to_sql(table_name, engine, index=False, if_exists='append')
    except SQLAlchemyError:
        message = [html.Span('Something went wrong! Check inputs.', id='alert')]
    finally:
        return message


@app.callback(
    [Output('out_content3', 'children')],
    [Input('message3', 'children')],
    [State('save-button', 'n_clicks')]
)
def clear_out_div(message, n_clicks):
    # clear content if success
    if message is not None or n_clicks == 0:
        raise PreventUpdate

    return [html.Span('Success! Database updated!', id='success')]
