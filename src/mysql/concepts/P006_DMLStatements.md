# Description: DML Statements

####001. Insert one row.
```sql
insert into players(name, birthdate, age, salary, gender, worldcup_winner) values
('Sachin Tendulkar', '1973-04-24', 43, 1030000.90, 'Male', true);
```

####001. Insert multiple rows.
```sql
insert into players(name, birthdate, age, salary, gender, worldcup_winner) values
('Sachin Tendulkar', '1973-04-24', 43, 103000.90, 'Male', true),
('Rahul Dravid', '1970-06-19', 45, 999999.90, 'Male', false);
```

####002. Update row(s).
```
update players set salary = 999, age = 65 where id = 1;
```

####003. Delete a row
```
delete from players where id = 1;
```

####004. Delete multiple rows
```
delete from players where id in (1, 2, 3, 4);
```

####005. Delete all rows in a table
```
delete from players;
truncate players;
```

####006. Export data from table to a file.
```
select * into outfile '/tmp/players.txt' from players order by id;
```

####006. Load data from file to a table.
```
load data local infile '/tmp/players.txt' into table players;
```
