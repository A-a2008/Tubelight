import mysql.connector as mysql

db = mysql.connect(host="localhost", user="aryan", passwd="nothingx16", database="tubelight_combined")
cursor = db.cursor()

cursor.execute("select * from services")
table_names = [x[1] for x in cursor.fetchall()]
print(table_names)

for table_name in table_names:
    try:
        cursor.execute(f"alter table `{table_name}` add column busy varchar(1000)")
    except:
        print(f"Column busy already exists in table {table_name}")

cursor.execute("desc `Food Caterers`")
print(cursor.fetchall())

db.commit()
db.close()