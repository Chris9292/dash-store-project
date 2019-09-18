import dash_core_components as dcc
import dash_html_components as html
from database import fetch_customer_name

layout1 = html.Div(id='container', children=[
    html.Div(id='header',
             className='banner',
             children=[
                 html.H1('Table Viewer',
                         id='title')
             ]),
    html.Div(id='dropdown_div', children=[
        dcc.Dropdown(id='table_selector_dropdown',
                     placeholder='Select table',
                     className='dropdown',
                     options=[{'label': i, 'value': i} for i in ['Product', 'Customer', 'Address', 'Order', 'OrderItem']],
                     )]),
    html.Div(id='out_div1',
             className='out_div')
])

layout2 = html.Div(id='container', children=[
    html.Div(id='header',
             className='banner',
             children=[
                 html.H1('Order Creator', id='title')
             ]),
    html.Div(id='dropdown_div', children=[
        dcc.Dropdown(id='customer_selector_dropdown',
                     placeholder='Select CUSTOMER',
                     className='dropdown',
                     clearable=False,
                     options=[{'label': i, 'value': i} for i in fetch_customer_name()])
    ]),
    # create empty elements to avoid dependency errors
    html.Div(id='out_div2',
             className='out_div',
             children=[html.Div(id='total'),
                       html.Div(id='customer_name')]
             )
])

layout3 = html.Div(id='container', children=[
    html.Div(id='header',
             className='banner',
             children=[
                 html.H1('Add record to database',
                         id='title')
             ]),
    html.Div(id='dropdown_div', children=[
        dcc.Dropdown(id='table_selector_dropdown',
                     placeholder='Select table',
                     className='dropdown',
                     options=[{'label': i, 'value': i} for i in ['Product', 'Customer', 'Address']],
                     )]),
    html.Div(id='out_div3',
             className='out_div')
])
