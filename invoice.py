import openpyxl
from database import execute_query

# function that modifies existing invoice template
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
            execute_query("""SELECT name, price FROM "Product" WHERE "id"={}""".format(order_items_info[i][0]))[0]
        sheet[f'A{current_row}'].value = product_info[0]
        sheet[f'E{current_row}'].value = order_items_info[i][1]
        sheet[f'F{current_row}'].value = customer_info[5]
        sheet[f'G{current_row}'].value = product_info[1]
        sheet[f'H{current_row}'].value = order_items_info[i][2]
        current_row += 1

    # save excel file to invoice folder
    wb.save(f"invoice/invoice_{order_id}.xlsx")
    wb.close()