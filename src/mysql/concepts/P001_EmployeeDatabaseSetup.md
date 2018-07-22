# Description: Employee MySQL Database Setup

### MySQL Sample Database - Employee
- A sample database **employee** is available on [GitHub](https://github.com/datacharmer/test_db)
- The Enhanced Entity–Relationship (EER) diagram for employee schema is available on the official website of [MySQL](https://dev.mysql.com/doc/employee/en/sakila-structure.html)
- The file P002_Employee_EER_Diagram.pdf contains the EER diagram in PDF format.
- Steps to load the employee database into a MySQL instance.
```
git clone git@github.com:datacharmer/test_db.git
cd test_tb
mysql -hlocalhost -udb_user_name -p < employees.sql
```
- Steps to verify the correctness of the imported database.
```
mysql -hlocalhost -udb_user_name -p < test_employees_md5.sql;
mysql -hlocalhost -udb_user_name -p < test_employees_sha.sql; # An alternative
```
