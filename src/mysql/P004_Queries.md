# Description: SQL Queries for Employees Database

####001. Display all databases in any MySQL instance.
```sql
show databases;
```

####002. Switch to EMPLOYEES database.
```sql
use employees;
```

####003. Display all tables in the EMPLOYEES database.
```sql
show tables;
```

####004. Display the schema of EMPLOYEES table in the EMPLOYEES database.
```sql
describe employees;
```

####005. Display all the information from the EMPLOYEES table.
```sql
select * from employees;
```

####006. Find the total number of records in the EMPLOYEES table.
```sql
select count(*) from employees;
```

####007. Display any 10 records from the EMPLOYEES table.
```sql
select * from employees limit 10;
```

####008. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table.
```sql
select emp_no, first_name, last_name, gender from employees;
```

####009. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table sorted by FIRST_NAME.
```sql
select emp_no, first_name, last_name, gender from employees order by first_name;
```

####010. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table sorted by LAST_NAME in descending order.
```sql
select emp_no, first_name, last_name, gender from employees order by last_name desc;
```

####011. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table sorted by LAST_NAME in descending order and FIRST_NAME in ascending order.
```sql
select emp_no, first_name, last_name, gender from employees order by last_name desc, first_name asc;
```

####012. Display EMP_NO, FIRST_NAME, LAST_NAME and GENDER from the EMPLOYEES table sorted by LAST_NAME in descending order and FIRST_NAME in ascending order. Limit the result set to just 20 records.
```sql
select emp_no, first_name, last_name, gender from employees order by last_name desc, first_name asc limit 20;
```

####013. Find all those employees whose FIRST_NAME is 'Bikash'.
```sql
select * from employees where first_name = 'Bikash';
```

####014. Find all those employees whose FIRST_NAME starts with the letter 'B'.
```sql
select * from employees where first_name like 'B%';
```

####015. Find the total number of employees whose FIRST_NAME is 'Bikash'.
```sql
select count(*) from employees where first_name = 'Bikash';
```

####016. Find the total number of male and female employees.
```sql
select count(*), gender from employees group by gender;
```

####017. Display all unique FIRST_NAME from the EMPLOYEES table.
```sql
select distinct first_name from employees;
```

####018. Find all those employees who joined before 1986.
```sql
select * from employees where hire_date < '1986-01-01';
```

####019. Find all those employees who joined during last 3 days of 1986. Display the result in ascending order of their hiring date.
```sql
select * from employees where hire_date between '1986-12-29' and '1986-12-31' order by hire_date;
```

####020. Find all those male employees who joined before 1990 with first_name as 'Bikash' and last_name as 'Juneja'. Sort the result in descending order of their birthdays.
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
    birth_date desc;
```

####021. Find those employees who joined on 3-Jan-1999 or 6-Jan-1999 or 10-March-1999 or 31-May-1999. Sort the result in ascending order of their hiring date.
```sql
select * from employees where hire_date in ('1999-01-03', '1999-01-06', '1999-03-10', '1999-05-31') order by hire_date;
```

####022. Find those employees who did NOT join on 3-Jan-1999 or 6-Jan-1999 or 10-March-1999 or 31-May-1999. Sort the result in ascending order of their hiring date.
```sql
select * from employees where hire_date NOT in ('1999-01-03', '1999-01-06', '1999-03-10', '1999-05-31') order by hire_date;
```

####023. Find those employees whose first_name has 5 characters or less.
```sql
select * from employees where length(first_name) <= 5;
```

####024. Find the maximum/highest salary.
```sql
select max(salary) from salaries;

-- OR

select distinct (salary) from salaries order by salary desc limit 0, 1;
```

####025. Find the second highest salary.
```sql
select max(salary) from salaries where salary != (select max(salary) from salaries);

-- OR

select distinct (salary) from salaries order by salary desc limit 1, 1;
```

####026. Find the third highest salary.
```sql
select distinct (salary) from salaries order by salary desc limit 2, 1;
```

####027. Find the Nth highest salary.
```sql
-- Replace N with a value in the query below.
select distinct (salary) from salaries order by salary desc limit N - 1, 1;
```

####028. Find the details of all those employee(s) who are getting the maximum/highest salary.
```sql
select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    s.salary = (select MAX(salary) from salaries);
```

####029. Find the details of all those employee(s) who are getting the second highest salary.
```sql
select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    s.salary = (select
                    max(salary)
                from
                    employees e,
                    salaries s
                where
                    e.emp_no = s.emp_no and
                    s.salary != (select max(salary) from salaries)
                );

-- OR

select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    s.salary = (select distinct (salary) from salaries order by salary desc limit 1, 1);
```

####030. Find the details of all those employee(s) who are getting the third highest salary.
```sql
select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    s.salary = (select distinct (salary) from salaries order by salary desc limit 2, 1);
```

####031. Find the details of all those employee(s) who are getting the Nth highest salary.
```sql
-- Replace N with a value
select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    s.salary = (select distinct (salary) from salaries order by salary desc limit N - 1, 1);
```

####032. Find the details of all those employee(s) who got the maximum salary in the year 2000.
```sql
select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    s.salary = (select
                    max(salary)
                from
                    salaries
                where
                    (from_date < '2000-01-01' and to_date >= '2000-01-01') or
                    (from_date >= '2000-01-01' and from_date < '2000-12-31'));
```

####033. List employee number, first name, last name, birth date, salary, salary from date, salary to date of the youngest employees. Sort the result in ascending order of employee number, salary from date and salary to date.
```sql
select
    e.emp_no, e.first_name, e.last_name, e.birth_date, s.salary, s.from_date, s.to_date
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    e.birth_date = (select
                        min(birth_date)
                    from
                        employees)
order by
    emp_no, from_date, to_date;
```

####034. List employee number, first name, last name, birth date, gender, salary, salary from date, salary to date of the youngest female employees. Sort the result in ascending order of employee number, salary from date and salary to date.
```sql
select
    e.emp_no, e.first_name, e.last_name, e.birth_date, e.gender, s.salary, s.from_date, s.to_date
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    e.gender = 'F' and
    e.birth_date = (select
                        min(birth_date)
                    from
                        employees
                    where gender = 'F')
order by
    emp_no, from_date, to_date;
```

####035. List employee number, first name, last name, birth date, gender, salary, salary from date, salary to date of the oldest male employees. Sort the result in ascending order of employee number, salary from date and salary to date.
```sql
select
    e.emp_no, e.first_name, e.last_name, e.birth_date, e.gender, s.salary, s.from_date, s.to_date
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    e.gender = 'M' and
    e.birth_date = (select
                        max(birth_date)
                    from
                        employees
                    where gender = 'M')
order by
    emp_no, from_date, to_date;
```

####036. Find the employee(s) who are earning salaries between 155000 and 160000.
```sql
select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    s.salary between 155000 and 160000;
```

####037. Find all those employee(s) whose salary is more than the salary of Georgi Facello.
```sql
select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date and
    s.salary > (select
                    s.salary
                    from
                    employees e,
                    salaries s
                    where
                    e.emp_no = s.emp_no and
                    first_name = 'Georgi' and
                    last_name = 'Facello' and
                    curdate() < to_date);
```

####038. Find all those employee(s) whose salary is same as Georgi Facello's salary or Somnath Foote's salary. Sort the result in descending order of their salaries.
```sql
select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date and
    s.salary > (select
                    min(s.salary)
                from
                    employees e,
                    salaries s
                where
                    e.emp_no = s.emp_no and
                    (
                        (first_name = 'Georgi' and last_name = 'Facello') or
                        (first_name = 'Somnath' and last_name = 'Foote')
                    ) and
                    curdate() < to_date)
order by
    s.salary desc;
```

####039. Find the number of employees whose salary is greater than the current average salary.
```sql
select
    count(*)
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date and
    s.salary > (select
                    avg(salary)
                from
                    salaries
                where
                    curdate() < to_date);
```

####040. Find the average salary of all those employees who have more than 20 years of work experience. Round the average salary to 2 places of decimal. Use 365.25 as number of days in a year.
```sql
select
    ROUND(avg(s.salary), 2)
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date and
    floor(datediff(curdate(), e.hire_date) / 365.25) > 20;
```

####041. List all those employees whose current salary ends with '500'.
```sql
select
    e.*, s.salary, s.from_date, s.to_date
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date and
    s.salary like '%500';
```

####042. List all those employees whose salary is a multiple of 500.
```sql
select
    e.*, s.salary, s.from_date, s.to_date
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date and
    (s.salary like '%500' or
    s.salary like '%000');
```

####043. List all the employees whose current annual salary is more than 1.85 million.
```sql
select
    e.*, s.salary, s.from_date, s.to_date
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date and
    s.salary * 12 > 1850000
order by
    s.salary desc;
```

####044. List all the employees whose daily salary is more than 5151. Assume there are 30 days in a month.
```sql
select
    e.*, s.salary, s.from_date, s.to_date
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date and
    s.salary / 30 > 5151;
```

####045. List the total number of male and female employees along with their average, maximum and minimum salaries.
```sql
select
    e.gender as 'Gender',
    count(*) 'Total Employees',
    round(avg(s.salary), 2) as 'Average Salary',
    max(s.salary) as 'Maximum Salary',
    min(s.salary) as 'Minimum Salary'
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date
group by
    e.gender;
```

####046. What is the salary that is given to the maximum number of employees. How many such employees are there.
```sql
select
    s.salary as 'Salary', count(*) as 'Total Employees'
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no and
    curdate() < to_date
group by
    s.salary
order by
    count(*) desc
limit 1;
```

####047. List all unique titles available to employees.
```sql
select distinct title from titles;
```

####048. List all employees in ascending order of their salaries.
```sql
select
    *
from
    employees e,
    salaries s
where
    e.emp_no = s.emp_no
order by
    s.salary;
```

####049. Display employee number, first name, last name, department name and title in ascending order of their department name and descending order of their title.
```sql
select
    e.emp_no, e.first_name, e.last_name,  d.dept_name, t.title
from
    employees e,
    departments d,
    dept_emp de,
    titles t
where
    e.emp_no = t.emp_no and
    e.emp_no = de.emp_no and
    de.dept_no = d.dept_no
order by
    d.dept_name,
    t.title desc;
```

####050. Display employee number, first name, last_name and title of all the Managers in employee database.
```sql
select
    e.emp_no, e.first_name, e.last_name,  t.title
from
    employees e,
    titles t
where
    e.emp_no = t.emp_no and
    t.title = 'Manager';
```

####051. Find all those pairs of employees who have the same birth dates.
```sql
select
    e1.emp_no, e1.first_name, e1.last_name, e1.birth_date, e2.emp_no, e2.first_name, e2.last_name
from
    employees e1,
    employees e2
where
    e1.emp_no != e2.emp_no and
    e1.birth_date = e2.birth_date;
```

####052. List employee number, first name, last name, hire date and experience in months of all the managers sorted in descending order of their experience.
```sql
select
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title,
    -- The periods parameters P1 and P2 to period_diff() should be in the format YYMM or YYYYMM.
    -- Note that the period arguments P1 and P2 are not date values.abs().
    period_diff(date_format(curdate(),'%Y%m'), date_format(hire_date, '%Y%m')) as 'Experience'
from
    employees e,
    titles t
where
    e.emp_no = t.emp_no and
    t.title = 'Manager'
order by
    Experience desc;
```

####053.A List all the employees along with their department names who work in department number d005 or d009.
```sql
select
    e.*, d.dept_name
from
    employees e,
    dept_emp de,
    departments d
where
    e.emp_no = de.emp_no and
    de.dept_no = d.dept_no and
    d.dept_no in ('d005', 'd009')
order by
    d.dept_name;
```

####054. List all the employees who works as 'Senior Staff' in the 'Customer Service' department sorted based on their joining date.
```sql
select
    e.*, d.dept_name, t.title, d.dept_name
from
    employees e,
    titles t,
    dept_emp de,
    departments d
where
    e.emp_no = t.emp_no and
    e.emp_no = de.emp_no and
    de.dept_no = d.dept_no and
    d.dept_name = 'Customer Service' and
    t.title = 'Senior Staff' and
    curdate() <= t.to_date and
    curdate() <= de.to_date
order by
    hire_date asc;
```

####055. List all the employees who work as either 'Senior Engineer' or 'Engineer' sorted in that order.
```sql
select
    e.*, t.title
from
    employees e,
    titles t
where
    e.emp_no = t.emp_no and
    t.title in ('Senior Engineer', 'Engineer') and
    curdate() <= t.to_date
order by
    t.title desc;
```

####056. List all the female employees hired in the month of Februrary of 1952, whose first name has 6 characters and starts with the letter V. Sort the result based on their hiring date.
```sql
select
    *
from
    employees
where
    first_name like 'V%' and
    length(first_name) = 6  and
    gender = 'F' and
    -- Alternatively, use date_format(hire_date, '%M-%Y')  = 'February-1985' for the below expression
    hire_date between '1985-02-01' and '1985-02-29'
order by
    hire_date;
```

####057. List all the employees whose first name has 'V' as the third character.
```sql
select
    *
from
    employees
where
    first_name like '__V%';
```

####058. List all the employees whose first name starts with the letter 'A' and has 'll' together.
```sql
select
    *
from
    employees
where
    first_name like 'A%ll%';
```

####059. List all the employees who joined in the 90’s.
```sql
select
    *
from
    employees
where
    -- Year in YY format
    date_format(hire_date, '%y') like '9%';
```

####060. List all the employees who are senior to Bikash Morton.
```sql
select
    *
from
    employees
where
    hire_date < (select
                    hire_date
                 from
                    employees
                 where
                    first_name = 'Bikash' and
                    last_name = 'Morton');
```
