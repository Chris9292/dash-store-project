import dash

app = dash.Dash(__name__, assets_external_path = 'assets')
server = app.server
app.config.suppress_callback_exceptions = True
