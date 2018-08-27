# Description: DDL Statements

####001. Drop and create a database.
```sql
drop database if exists players;
create database players;
```

####002. Drop and create a table.
```
drop table if exists players;
create table players (
  id int(11) not null auto_increment,
  name varchar(64) not null,
  birthdate date not null,
  age smallint default null,
  salary decimal(12,2) default 0.00,
  gender enum('Male','Female') not null,
  worldcup_winner boolean not null default false,
  created timestamp not null default current_timestamp on update current_timestamp,
  primary key  (id)
) engine=innodb default charset=latin1;
```
