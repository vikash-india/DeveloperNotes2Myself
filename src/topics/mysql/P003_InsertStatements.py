import MySQLdb

# Open database connection
db = MySQLdb.connect(host='localhost',  # Host, usually localhost
                     user='root',       # Username
                     passwd='root',     # Password
                     db='test')         # Database Name

# Prepare a cursor object using cursor() method
cursor = db.cursor()

# Prepare SQL query to INSERT a record into the database.
sql = "INSERT INTO EMPLOYEE(FIRST_NAME, \
       LAST_NAME, AGE, SEX, INCOME) \
       VALUES ('%s', '%s', '%d', '%c', '%d' )" % \
      ('Mac', 'Mohan', 20, 'M', 2000)

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
