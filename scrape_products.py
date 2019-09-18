from bs4 import BeautifulSoup
import requests
import psycopg2
from database import username, password, database

urls = ['https://www.skroutz.gr/c/32/cpu-epeksergastes.html', 'https://www.skroutz.gr/c/55/kartes-grafikwn-vga.html']
categories = ['cpu', 'graphics card']

# create connection
con = psycopg2.connect(dbname=database, host='localhost', user=username, password=password)
cursor = con.cursor()

for i in range(len(urls)):
    print(f'Processing products in: {urls[i]}')
    # calculate total number of pages
    soup = BeautifulSoup(requests.get(urls[i]).text, 'html.parser')
    pages = int(soup.findAll('ol', {'class': 'react-component paginator cf'})[0].findAll('li')[4].text)
    # iterate over pages
    for j in range(pages):
        soup = BeautifulSoup(requests.get(urls[i] + f'?page={j+1}').text, 'html.parser')
        # list of items
        item_list = soup.findAll('li', {'class': 'cf card'})

        # for each product retrieve product name, price, image source
        for item in item_list:
            product_name = item.findAll('a', {'class': 'js-sku-link'})[0]['title']
            price = item.findAll('div', {'class': 'price react-component'})[0].div.a.text.replace('.', '').strip(' €').replace(',', '.')
            image_src = item.findAll('div', {'class': 'pic'})[0].a.img['src']
            image_bytes = requests.get('https:' + image_src).content
            cursor.execute("""INSERT INTO "Product" (name, price, category) VALUES (%s, %s, %s)""", (product_name, float(price), categories[i]))

# save changes to db and close connection
con.commit()
cursor.close()
con.close()