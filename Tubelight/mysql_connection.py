import mysql.connector as mysql
import csv
from os.path import join

# db = mysql.connect(host="localhost", user="root", passwd="cajc", database="tubelight")
db = mysql.connect(host="localhost", user="root", passwd="ihatecorona2021", database="tubelight")
cursor = db.cursor()

datatypes = {
    "text": "varchar(100)",
    "textarea": "varchar(1000)",
    "checkbox": "varchar(100)",
    "radio": "varchar(100)",
    "select": "varchar(100)",
    "number": "int(11)",
    "date": "date",
    "time": "time",
    "datetime": "datetime",
    "foriegn_key": "int(4)",
    "foriegn_key_parent": "int(4) primary key",
    "id": "int(4) primary key",
}

# def update_mysql(file_path):
#     db = mysql.connect(host="localhost", user="root", passwd="cajc", database="tubelight")
#     cursor = db.cursor()
#     file_name = file_path[len("./database/"):-len(".csv")]
#     with open(file_path, 'r') as file:
#         reader = csv.DictReader(file)
#         cursor.execute(f"delete from {file_name}")
#         for row in reader:
#             query = f"insert into {file_name} values ("
#             for key, value in row.items():
#                 query += f'"{value}",'
#             query = query[:-1]+")"
#             cursor.execute(query)
#     db.commit()

def add_row(table_name: str, *args):
    query = f"insert into `{table_name}` values ("
    for arg in args:
        query += f'"{arg}",'
    query = query[:-1]+")"
    cursor.execute(query)
    db.commit()

def add_row_dict(table_name: str, row_data: dict):
    columns, values = list(row_data.keys()), list(row_data.values())
    query = f"insert into `{table_name}`("
    for column in columns:
        query += f"`{column}`,"
    query = query[:-1] + ") values ("
    for value in values:
        query += f'"{value}",'
    query = query[:-1]+")"
    cursor.execute(query)
    db.commit()

def get_table(table_name: str):
    try:
        cursor.execute(f"desc `{table_name}`")
    except Exception as e:
        return -1
    columns_rows = cursor.fetchall()
    columns = [row[0] for row in columns_rows]
    cursor.execute(f"select * from `{table_name}`")
    rows = cursor.fetchall()
    data = []
    for row in rows:
        data_row = {}
        for i, value in enumerate(row):
            data_row[columns[i]] = value
        data.append(data_row)
    return data

def update_value(table_name: str, column: str, value: str, identifier_name: str, identifier_value: str):
    cursor.execute(f'update `{table_name}` set `{column}`="{value}" where `{identifier_name}`="{identifier_value}"')
    db.commit()

def create_table(table_name: str, columns: dict):
    query = f"create table `{table_name}` ("
    for column_name, column_type in columns.items():
        query += f"`{column_name}` {datatypes[column_type]},"
    query = query[:-1]+")"
    print(query)
    try:
        cursor.execute(query)
    except Exception as e:
        if "already exists" in str(e):
            return -1
    db.commit()
    return 0

def create_table_foreign_key(table_name: str, columns: dict, foreign_key_table: str, foreign_key__parent_column: str, foreign_key__child_column: str):
    query = f"create table `{table_name}` ("
    for column_name, column_type in columns.items():
        query += f"`{column_name}` {datatypes[column_type]}, "
    query += f"foreign key(`{foreign_key__child_column}`) references `{foreign_key_table}`(`{foreign_key__parent_column}`))"
    # query = query[:-1]+")"
    print(query)
    try:
        cursor.execute(query)
    except Exception as e:
        if "already exists" in str(e):
            return -1
    db.commit()
    return 0

def fetch_columns(table_name: str):
    try:
        cursor.execute(f"desc `{table_name}`")
    except Exception as e:
        return -1
    columns_rows = cursor.fetchall()
    columns = [row[0] for row in columns_rows]
    return columns

def drop_table(table_name: str):
    try:
        cursor.execute(f"drop table `{table_name}`")
    except Exception as e:
        print(e)
        return -1
