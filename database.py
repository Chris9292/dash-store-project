import psycopg2


def execute_query(query):
    result = []
    # connect to database
    con = psycopg2.connect(dbname='store', host='localhost', user='postgres', password='Chr!$t0tk')

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
    print('Successfully executed query!')
    return result
