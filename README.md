# dash-store-project
## Description

web app based on dash framework which manages orders and creates invoices in xlsx format

This program:
- keeps your data organized
- makes the workflow more efficient
- saves time from paperwork
- reduce the risk of human error through automation

Functionalities of this app:
- view tables (filtering enabled)
- create orders and prepare ready for print invoice
- add product/customer

## Installation

1. clone repo using: **git clone https://github.com/Chris9292/dash-store-project.git** or download zip file
2. download and install Postgres [https://www.postgresql.org/](https://www.postgresql.org/) (set superuser password)
3. add **[path to PostgreSQL]\\[version]\bin** to **path** for windows: 
4. open Terminal in project directory and connect to psql: **psql -U postgres**
5. create database: **CREATE DATABASE database_name;**
6. exit psql: ctrl+c
7. import sql file: **psql -U postgres -d database_name > db/db.sql**
8. configure database.py: set _username_, _password_, _database_, _port_
9. run the app from virtual environment: **[path to project folder]\venv\scripts\python.exe index.py** in terminal or double click **app.bat** for windows systems or alternatively install the required packages from _requirements.txt_ with **pip freeze > requirements.txt** and run **index.py**
10. the app is running on **http://127.0.0.1:8050/** by default


## Database structure

![database structure_1](images/database_structure_dbeaver.png)
![database structure_2](images/database_structure_omni_db.png)


## App presentation

- Table Viewer:

<p align="center">
    <img src="images/product.png" alt="Image"/>
</p>

<p align="center">
    <img src="images/customer.png" alt="Image"/>
</p>

- order example:

<p align="center">
    <img src="images/order.png" alt="Image"/>
</p>

- clicking save adds order to database and creates xlsx file in invoice folder with corresponding order_id (INVOICE#):

<p align="center">
    <img src="images/example_invoice.png" alt="Image"/>
</p>

- check order in database:
<p align="center">
    <img src="images/order_item.png" alt="Image"/>
</p>


