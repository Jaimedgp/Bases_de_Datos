import MySQLdb as SQL

myDB = SQL.connect("localhost", "root", "YES")

DB = myDB.cursor()

DB.execute("show databases")
databases = DB.fetchall()

print "\t"+"DATABASES"+"\n"+"################################"+"\n"

for i in  databases:
    print i

DB.execute("use yes")
tabla = 'create table if not exists algepe(dni char(9));'
DB.execute(tabla)

DB.execute('show tables;')
tables = DB.fetchall()
print tables
