import dash_table
from database import fetch_product_name, fetch_discount
import dash_html_components as html



def create_custom_datatable(df):
    return dash_table.DataTable(
        id='table1',
        style_data={'whiteSpace': 'normal'},
        style_cell={'textAlign': 'left'},
        style_header={'fontWeight': 'bold',
                      'textAlign': 'center',
                      'backgroundColor': '#148dff',
                      'font-size': '16px'},
        css=[{
            'selector': '.dash-cell div.dash-cell-value',
            'rule': 'display: inline; white-space: inherit; overflow: inherit',
        }],
        sort_action='native',
        style_table={'border': '1px solid black'},
        filter_action='native',
        columns=[{"name": i, "id": i} for i in df.columns],
        data=df.to_dict('records'),
        export_format='xlsx',
        export_headers='display'
    )


def create_order_table(customer_name):
    # return order items table
    return dash_table.DataTable(
        id='table2',
        style_data={
            'whiteSpace': 'normal'
        },
        style_cell={'textAlign': 'left', 'font-size': '14px'},
        style_header={'fontWeight': 'bold',
                      'textAlign': 'center',
                      'backgroundColor': '#148dff',
                      'font-size': '16px'},
        css=[{
            'selector': '.dash-cell div.dash-cell-value',
            'rule': 'display: inline; white-space: inherit; overflow: inherit'
        }],
        style_cell_conditional=[
            {'if': {'column_id': 'product'},
             'width': '65%'},
            {'if': {'column_id': 'quantity'},
             'width': '10%'},
            {'if': {'column_id': 'discount'},
             'width': '10%'},
            {'if': {'column_id': 'price'},
             'width': '15%'}
        ],
        columns=[{'id': 'product', 'name': 'product', 'presentation': 'dropdown'},
                 {'id': 'quantity', 'name': 'quantity', 'presentation': 'dropdown'},
                 {'id': 'discount', 'name': 'discount', 'editable': False},
                 {'id': 'price', 'name': 'price', 'editable': False}],
        dropdown={
            'product': {
                'options': [
                    {'label': str(i), 'value': str(i)}
                    for i in fetch_product_name()
                ],
                'clearable': False
            },
            'quantity': {
                'options': [
                    {'label': str(i), 'value': i}
                    for i in range(1, 21)
                ],
                'clearable': False
            }
        },
        data=[{'product': None, 'quantity': 1, 'discount': fetch_discount(customer_name), 'price': ''}],
        editable=True,
        row_deletable=True
    )


def out_div_content(value):
    # this function creates content when customer is selected
    children = [html.Label('new order for customer:'),
                html.Span(value, id='customer_name'),
                html.Br(),
                html.Span(id='message2'),
                create_order_table(value),
                html.Div(id='buttons', children=[
                    html.Button('Add Row', id='add-rows-button', n_clicks=0),
                    html.Button('Save', id='save-button', n_clicks=0)]),
                html.Div(id='total_div',
                         children=[html.Span(id='total')]
                         )]
                         
    return [html.Div(id='out_content', children=children)]


def create_add_table(table_name):
    # return table
    return dash_table.DataTable(
        id='table3',
        style_data={
            'whiteSpace': 'normal'
        },
        style_cell={'textAlign': 'left', 'font-size': '14px'},
        style_header={'fontWeight': 'bold',
                      'textAlign': 'center',
                      'backgroundColor': '#148dff',
                      'font-size': '16px'},
        css=[{
            'selector': '.dash-cell div.dash-cell-value',
            'rule': 'display: inline; white-space: inherit; overflow: inherit'
        }],
        columns=[{'id': 'name', 'name': 'name'},
                 {'id': 'telephone', 'name': 'telephone'},
                 {'id': 'email', 'name': 'email'},
                 {'id': 'address_id', 'name': 'address_id'},
                 {'id': 'discount', 'name': 'discount'},
                 {'id': 'vat', 'name': 'vat'}]
                if table_name == 'Customer' else
                [{'id': 'name', 'name': 'name'},
                 {'id': 'price', 'name': 'price'},
                 {'id': 'category', 'name': 'category'}]
                if table_name == 'Product' else
                [{'id': 'street', 'name': 'street'},
                 {'id': 'city', 'name': 'city'},
                 {'id': 'postcode', 'name': 'postcode'}],

        data=[{'name': 'Enter Value', 'price': 'Enter Value', 'category': 'Enter Value'}] if table_name == 'Product' else
        [{'name': 'Enter Value', 'telephone': 'Enter Value', 'email': 'Enter Value',
          'address_id': 'Enter Value', 'discount': 'Enter Value',
          'vat': 'Enter Value'}] if table_name == 'Customer' else
        [{'street': 'Enter Value', 'city': 'Enter Value', 'postcode': 'Enter Value'}],
        editable=True,
        row_deletable=True
    )