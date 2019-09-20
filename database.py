import psycopg2
import pandas as pd
from sqlalchemy import create_engine

username = 'postgres'
password = 'Chr!$t0tk'
database = 'store'
port = 5432 # default

# create engine for pd.to_sql() function
engine = create_engine(f'postgresql://{username}:{password}@localhost:{port}/{database}')

def execute_query(query):
    result = []
    # connect to database
    con = psycopg2.connect(dbname=database, host='localhost', user=username, password=password, port=port)

    # create cursor object
    cursor = con.cursor()
    try:
        # execute query
        cursor.execute(query)
    except psycopg2.Error:
        return 'An error occurred!'

    if 'SELECT' in query:
        result = cursor.fetchall()
    # save changes
    con.commit()

    # close communication with the database
    cursor.close()
    con.close()
    return result


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
