import MySQLdb

# Open database connection
db = MySQLdb.connect(host='localhost',  # Host, usually localhost
                     user='root',       # Username
                     passwd='root',     # Password
                     db='test')         # Database Name

# Prepare a cursor object using cursor() method
cursor = db.cursor()

# Prepare SQL query to UPDATE required records
sql = "update employee set age = age + 1 where sex = '%c'" % ('M')

try:
    # Execute the SQL command
    cursor.execute(sql)

    # Commit changes
    db.commit()
except:

    # Rollback in case there is any error
    db.rollback()

# Disconnect from server
db.close()
