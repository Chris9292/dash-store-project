import pandas as pd
from sqlalchemy import create_engine
import dash_table
from database import execute_query
import dash_html_components as html
import openpyxl

# used for pd.to_sql() function
engine = create_engine('postgresql://postgres:Chr!$t0tk@localhost:5432/store')


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


# function that modifies existing excel invoice template
def invoice(order_id):
    wb = openpyxl.load_workbook("prototype.xlsx", read_only=False)
    sheet = wb.get_sheet_by_name("Invoice")

    # fetch data from database (id, customer_id, date, total)
    order = execute_query("""SELECT * FROM "Order" WHERE "id"={}""".format(order_id))[0]
    # set INVOICE# = order_id
    sheet['F5'].value = order[0]
    # set date
    sheet['H5'].value = order[2]
    # set customer_id
    sheet['F8'].value = order[1]

    # fetch customer info (id, name, telephone, email, address_id, discount, vat)
    customer_info = execute_query("""SELECT * FROM "Customer" WHERE "id"={}""".format(order[1]))[0]

    # fetch address info (id, street, city, postcode)
    address_info = execute_query("""SELECT * FROM "Address" WHERE "id"={}""".format(customer_info[4]))[0]

    # set billing info
    sheet['C8'].value = customer_info[1]
    sheet['C9'].value = address_info[1]
    sheet['C10'].value = f'{address_info[2]}, {address_info[3]}'
    sheet['C11'].value = customer_info[2]
    sheet['C12'].value = customer_info[3]
    sheet['C13'].value = customer_info[6]

    # fetch OrderItems (product_id, quantity, price)
    order_items_info = execute_query(
        """SELECT product_id, quantity, price FROM "OrderItem" WHERE "order_id"={}""".format(order[0]))

    # for each item fill the corresponding cells
    current_row = 16
    for i in range(len(order_items_info)):
        product_info = \
            execute_query("""SELECT name, price FROM "Product" WHERE "id" = {}""".format(order_items_info[i][0]))[0]
        sheet[f'A{current_row}'].value = product_info[0]
        sheet[f'E{current_row}'].value = order_items_info[i][1]
        sheet[f'F{current_row}'].value = customer_info[5]
        sheet[f'G{current_row}'].value = product_info[1]
        sheet[f'H{current_row}'].value = order_items_info[i][2]
        current_row += 1

    # save excel file to invoice folder
    wb.save(f"invoice/invoice_{order_id}.xlsx")
    wb.close()


# select functions to fetch data from related tables
def fetch_table(table_name):
    # read data from database
    df = pd.read_sql(table_name, engine)
    return df


def fetch_customer_name():
    result = [r[0] for r in execute_query('SELECT name FROM "Customer"')]
    return result


def fetch_product_name():
    result = [r[0] for r in execute_query('SELECT name FROM "Product"')]
    return result


def fetch_product_price(product_name):
    return execute_query("""SELECT price FROM "Product" WHERE name = '{}'""".format(product_name))[0][0]


def fetch_product_id(product_name):
    return execute_query("""SELECT "id" FROM "Product" WHERE name = '{}'""".format(product_name))[0][0]


def fetch_discount(customer_name):
    return execute_query("""SELECT discount FROM "Customer" WHERE name = '{}'""".format(str(customer_name)))[0][0]


def fetch_customer_id(customer_name):
    return execute_query("""SELECT "id" FROM "Customer" WHERE name = '{}'""".format(customer_name))[0][0]


def fetch_current_order_id():
    # return the last row (latest record)
    return execute_query("""SELECT "id" FROM "Order" ORDER BY "id" DESC LIMIT 1""")[0][0]


# following functions used to insert data to db
def add_order_to_db(customer_id, date, total):
    query = """INSERT INTO "Order"(customer_id, date, total_cost) VALUES ({}, '{}', {})""".format(customer_id, date, total)
    execute_query(query)


def add_order_list_to_db(df):
    df.to_sql('OrderItem', engine, index=False, if_exists='append')
