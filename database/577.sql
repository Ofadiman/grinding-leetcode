create table if not exists employee
(
    emp_id     int,
    name       varchar(255),
    supervisor int,
    salary     int
);
create table if not exists bonus
(
    emp_id int,
    bonus  int
);
truncate table employee;
insert into employee (emp_id, name, supervisor, salary)
values ('3', 'Brad', null, '4000');
insert into employee (emp_id, name, supervisor, salary)
values ('1', 'John', '3', '1000');
insert into employee (emp_id, name, supervisor, salary)
values ('2', 'Dan', '3', '2000');
insert into employee (emp_id, name, supervisor, salary)
values ('4', 'Thomas', '3', '4000');
truncate table bonus;
insert into bonus (emp_id, bonus)
values ('2', '500');
insert into bonus (emp_id, bonus)
values ('4', '2000');

-- Solution
select name, bonus
from employee
         left join bonus using (emp_id)
where bonus < 1000
   or bonus is null;
-- Solution
