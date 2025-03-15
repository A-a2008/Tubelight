import mysql.connector as mysql
import csv
from os.path import join

db = mysql.connect(host="localhost", user="aryan", passwd="nothingx16", database="tubelight")
cursor = db.cursor()

# def update_mysql(file_path):
#     db = mysql.connect(host="localhost", user="aryan", passwd="nothingx16", database="tubelight")
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
    query = f"insert into {table_name} values ("
    for arg in args:
        query += f'"{arg}",'
    query = query[:-1]+")"
    cursor.execute(query)
    db.commit()

def get_table(table_name: str):
    cursor.execute(f"desc {table_name}")
    columns_rows = cursor.fetchall()
    columns = [row[0] for row in columns_rows]
    cursor.execute(f"select * from {table_name}")
    rows = cursor.fetchall()
    data = []
    for row in rows:
        data_row = {}
        for i, value in enumerate(row):
            data_row[columns[i]] = value
        data.append(data_row)
    return data

def update_value(table_name: str, column: str, value: str, identifier_name: str, identifier_value: str):
    cursor.execute(f'update {table_name} set {column}="{value}" where {identifier_name}="{identifier_value}"')
    db.commit()
    print("changed")