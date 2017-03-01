import MySQLdb as SQL

myDB = SQL.connect("localhost", "root", "YES")

DB = myDB.cursor()

DB.execute("show databases")
databases = DB.fetchall()

print "\t"+"DATABASES"+"\n"+"################################"+"\n"

for i in  databases:
    print i
