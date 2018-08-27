### Description: MySQL Master Slave Replication Setup

### Note
* This is a setup where ONE single master sends replication information to ONE single slave.
* Replication Details
    - 192.168.0.1 - Master Database  
    - 192.168.0.2 - Slave Database 

### Configure Master Database
* MySQL Configuration File Changes

```
Edit the mysql configuration file on the master server
sudo vim /etc/mysql/my.cnf

# Bind the server from localhost IP to Master Server IP
# bind-address          = 127.0.0.1
bind-address            = 192.168.0.1 

# Update the server-id located in the [mysqld] section
# - Choose any number for this spot (it may just be easier to start with 1), but the number must be unique and cannot 
#   match any other server-id in your replication group.
# - Uncomment the following line and update it.
server-id               = 1

# Setup Binary Logs
# - The slave is going to copy all of the changes that are registered in the log.
# - Uncomment the following line
log_bin                 = /var/log/mysql/mysql-bin.log

# Enable Database For Replication
# - Add a list of database that will be replicated on the slave server.
# - Repeat the lines to replicate multiple database. 
binlog_do_db            = employee
# binlog_do_db          = movies

# Save the my.cnf and and exit.

# Restart MySQL
sudo service mysql restart
```
* MySQL Shell Changes

```
# Open MySQL Shell
mysql -u root -p

# Grant privileges to the slave
# - Use this command to name the slave and set up their password.
# - Syntax: GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'slave01'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

# Lock the database to prevent any new changes
USE employee;
FLUSH TABLES WITH READ LOCK;

# Get the Master Status
SHOW MASTER STATUS;
# - The output should like as follows
# mysql> SHOW MASTER STATUS;
# +------------------+----------+--------------+------------------+
# | File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
# +------------------+----------+--------------+------------------+
# | mysql-bin.000001 |      107 | employee     |                  |
# +------------------+----------+--------------+------------------+
# 1 row in set (0.00 sec)
# 
# - Note the position value (107 here). This is the position from which the slave database will start replicating. 
# - Record these numbers, they will come in useful later.

# IMPORTANT: LEAVE THIS WINDOW OPEN AND OPEN A NEW TAB/WINDOW.
# - If any any new changes is made in the same window, the database will automatically unlock. For this reason, one 
#   should open the new tab or window and continue with the next steps there.
```

* Export Database Using mysqldump
```
# Export the 'employee' database
mysqldump -u root -p --opt employee > employee.sql
```

* Switch Back To First MySQL Shell
```
# Open MySQL Shell
mysql -u root -p

# Unlock the tables
UNLOCK TABLES;

QUIT;
```

### Configure Slave Database
* Import Database to Slave
``` 
Log into your slave server, open up the MySQL shell and create the new database that you will be replicating from the master (then exit):
CREATE DATABASE employee;

EXIT;

# Import Database on Slave
# - Import the database that was previously exported from the master database.
# - Transfer the file employee.sql from master server to the slave server before importing below.
mysql -u root -p employee < /path/to/employee.sql
```

* MySQL Configuration File Changes

``` 
sudo vim /etc/mysql/my.cnf

# Bind the server from localhost IP to Slave Server IP
# - This is not required on slave for master-slave replication. 
# - Update this if this slave is a master to some other database.
# bind-address          = 127.0.0.1
# bind-address          = 192.168.0.2

# Update the server-id located in the [mysqld] section
# - Choose any number for this spot (it may just be easier to start with 1), but the number must be unique and cannot 
#   match any other server-id in your replication group.
# - Uncomment the following line and update it to a value not used by master.
server-id               = 2

# Add in the relay-log line 
relay-log               = /var/log/mysql/mysql-relay-bin.log

# Setup Binary Logs
# - Uncomment the following line
log_bin                 = /var/log/mysql/mysql-bin.log

# Enable Database For Replication
# - Add a list of database that will be replicated from the master server.
# - Repeat the lines to replicate multiple database. 
binlog_do_db            = employee
# binlog_do_db          = movies

# Save the my.cnf and and exit.

# Restart MySQL
sudo service mysql restart
```

* Enable Replication

``` 
# Open MySQL Shell
mysql -u root -p

# Setup replication
# - This command designates the current server as the slave of our master server.
# - This command provides the server the correct login credentials
# - This command lets the slave server know where to start replicating from - the master log file and log position come  
#   from the numbers noted down previously.
CHANGE MASTER TO 
MASTER_HOST='192.168.0.1',
MASTER_USER='slave01', 
MASTER_PASSWORD='password', 
MASTER_LOG_FILE='mysql-bin.000001', 
MASTER_LOG_POS=  107;

# Activate the slave server
# - If there is an issue in connecting, try starting slave with the command to skip over it,
#   SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1; SLAVE START; 
START SLAVE;

# View Replication Status
# - The \G rearranges the text to make it more readable.
SHOW SLAVE STATUS\G
```