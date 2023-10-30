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



# a)
print("a")
print()
with mariaDB.cursor() as cursor:
    cursor.execute("""select distinct Ort from Angebot""")
    results = cursor.fetchall()
    for i in results:
      session.execute("""insert into kurs_orte (ort) values (%s)""", (i[0], ))

rows = session.execute("""select distinct ort from kurs_orte""")
for user_row in rows:
    print(user_row)


# b)
print("b")
print()
with mariaDB.cursor() as cursor:
    cursor.execute("""select TnNr, Name, Ort from Teilnehmer""")
    results = cursor.fetchall()
    for i in results:
      session.execute("""insert into teilnehmer (tn_nr, name, ort) values (%s, %s, %s)""", (i[0], i[1], i[2]))

# TODO: Room for improvement by removing the allow filtering
rows = session.execute("""select * from teilnehmer where ort = 'Augsburg' allow filtering""")
for user_row in rows:
    print(user_row)



# c)
print("c")
print()
with mariaDB.cursor() as cursor:
    cursor.execute("""select PersNr, Name, Gehalt from Kursleiter""")
    results = cursor.fetchall()
    for i in results:
      session.execute("""insert into kursleiter (pers_nr, name, gehalt) values (%s, %s, %s)""", (i[0], i[1], i[2]))

# TODO: Room for improvement by removing the allow filtering
rows = session.execute("""select * from kursleiter where gehalt > 3000 and gehalt < 4000 allow filtering""")
for user_row in rows:
    print(user_row)



# d+e)
print("d+e")
print()
with mariaDB.cursor() as cursor:
    cursor.execute("""select k.KursNr, k.Titel, Datum, Name 'Kursleiter' from Kurs k
inner join Angebot a on k.KursNr = a.KursNr
inner join Fuehrt_durch fd on fd.AngNr = a.AngNr AND fd.KursNr = k.KursNr
inner join Kursleiter kl on kl.PersNr = fd.PersNr""")
    results = cursor.fetchall()
    for i in results:
      # TODO: Date conversion
      session.execute("""insert into kursdetail (kurs_nr, titel, datum, kursleiter) values (%s, %s, %s, %s)""", (i[0], i[1], None, i[3], ))

# TODO: Room for improvement by removing the allow filtering
rows = session.execute("""select * from kursdetail""")
for user_row in rows:
    print(user_row)




print("g")
print()
with mariaDB.cursor() as cursor:
    cursor.execute("""select k.Titel, a.Ort 'Kursort', t.Name 'TNName', t.Ort 'TNOrt' from Kurs k
left join Angebot a on  a.KursNr = k.KursNr
left join Nimmt_teil nt  on a.AngNr = nt.AngNr and k.KursNr = nt.KursNr
left join Teilnehmer t on t.TnNr = nt.TnNr
where t.name is not null
""")
    results = cursor.fetchall()
    for i in results:
      # TODO: Date conversion
      kurs_ort = i[1]
      tn_ort = i[3]
      eq_ort = kurs_ort == tn_ort
      session.execute("""insert into kurs_teilnehmer (titel, kurs_ort, tn_name, tn_ort, eq_ort) values (%s, %s, %s, %s, %s)""", (i[0], kurs_ort, i[2], tn_ort, int(eq_ort), ))

# TODO: Room for improvement by removing the allow filtering
rows = session.execute("""select * from test.kurs_teilnehmer where eq_ort = 1 allow filtering""")
for user_row in rows:
    print(user_row)



mariaDB.close()
