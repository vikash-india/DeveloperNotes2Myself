# Description: SQL Queries for Employees Database

####1. Display all databases in a MySQL instance.


####2. Switch to EMPLOYEES database.
```sql
```

####3. Display all tables from the EMPLOYEES database.
```sql
```

####4. Display the schema of EMPLOYEES table in the EMPLOYEES database.
```sql
```

####5. Display all the information from the EMPLOYEES table.
```sql
select * from employees;
```

####6. Display total number of records in the EMPLOYEES table.
```sql
```

####7. Display any 10 records from the EMPLOYEES table.
```sql
```

####8. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table.
```sql
```

####9. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table sorted by FIRST_NAME.
```sql
```

####10. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table sorted by LAST_NAME in descending order.
```sql
```

####11. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table sorted by LAST_NAME in descending order and FIRST_NAME in ascending order.
```sql
```

####12. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table sorted by LAST_NAME in descending order and FIRST_NAME in ascending order. Limit the result set to just 20 records.
```sql
```

####13. Find all those employees whose FIRST_NAME is 'Bikash'.
```sql
```

####14. Find all those employees whose FIRST_NAME starts with the letter 'B'.
```sql
```

####15. Find the total number of employees whose FIRST_NAME is 'Bikash'.
```sql
```

####16. Find the total number of male and female employees.
```sql
```

####16. Display all unique FIRST_NAME from the EMPLOYEES table.
```sql
```

####17. Find all those employees who joined before 1990.
```sql
```

####18. Find all those 'male' employees who joined before 1990 with first_name as 'Bikash' and last_name as 'Juneja'. Sort the result in descending order of their birthdays.
```sql
select
    *
from
    employees
where
    hire_date < '1990-01-01'
    and first_name = 'Bikash'
    and last_name  = 'Juneja'
    and gender = 'M'
order by
    birth_date DESC;
```

####19. Find those employees who joined on 15-May-1999 or 28-Jul-1999 or 20-Nov-1999 or 28-Dec-1999.
```sql
```

####20. Find those employees who did NOT join on 15-May-1999 or 28-Jul-1999 or 20-Nov-1999 or 28-Dec-1999.
```sql
```


####21. Find those employees whose first_name has 5 characters or less.
```sql
```
