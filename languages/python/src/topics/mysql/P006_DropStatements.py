import MySQLdb

# Open database connection
db = MySQLdb.connect(host='localhost',  # Host, usually localhost
                     user='root',       # Username
                     passwd='root',     # Password
                     db='test')         # Database Name

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Prepare SQL query to DELETE required records
sql = "delete from employee where age > '%d'" % (20)
try:
    # Execute the SQL command
    cursor.execute(sql)

    # Commit your changes in the database
    db.commit()
except:
    # Rollback in case there is any error
    db.rollback()

# Disconnect from server
db.close()
