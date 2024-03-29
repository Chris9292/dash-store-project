import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output
from layouts import layout1, layout2, layout3
from app import app


app.layout = html.Div([
    dcc.Location(id='url', refresh=False),
    html.Div(id = 'nav-menu', children=[
        dcc.Link('Navigate to "Table Viewer"', href='/'),
        html.Br(),
        dcc.Link('Navigate to "Order Creator"', href='/order_creator'),
        html.Br(),
        dcc.Link('Navigate to "Add record to database"', href='/add_record')
        ]),
    html.Div(id='page-content')
])


@app.callback(Output('page-content', 'children'),
              [Input('url', 'pathname')])
def display_page(pathname):
    if pathname == '/':
        return layout1
    elif pathname == '/order_creator':
        return layout2
    elif pathname == '/add_record':
        return layout3
    else:
        return [html.Span('Error 404: Page Not Found!', id='error_404')]


if __name__ == '__main__':
    app.run_server(debug=False)