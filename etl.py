import mysql.connector
from cassandra.cluster import Cluster


mariaDB = mysql.connector.connect(
  host="localhost",
  user="root",
  password="toor",
  port="3307",
  database="fwpnosql"
)


cluster = Cluster(['localhost'])
cluster = Cluster()
session = cluster.connect('test')

print(session)



with mariaDB.cursor() as cursor:
    cursor.execute("""select distinct Ort from Angebot""")
    results = cursor.fetchall()
    for i in results:
      session.execute("""insert into kurs_orte (ort) values (%s)""", (i[0], ))

rows = session.execute("""select distinct ort from kurs_orte""")
for user_row in rows:
    print(user_row)





mariaDB.close()
