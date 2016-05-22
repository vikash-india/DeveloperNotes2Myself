import MySQLdb

# Open database connection
db = MySQLdb.connect(host='localhost',  # Host, usually localhost
                     user='root',       # Username
                     passwd='root',     # Password
                     db='test')         # Database Name

# Prepare a cursor object using cursor() method
cursor = db.cursor()

# Drop table if it already exist using execute() method.
cursor.execute("drop table if exists employee;")

# Create table
sql = """create table employee (
         first_name  char(20) not null,
         last_name  char(20),
         age int,
         sex char(1),
         income float);"""

cursor.execute(sql)

# Disconnect from server
db.close()
