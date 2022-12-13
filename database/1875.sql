create table if not exists employees
(
    employee_id int,
    name        varchar(30),
    salary      int
);
truncate table employees;
insert into employees (employee_id, name, salary)
values ('2', 'Meir', '3000');
insert into employees (employee_id, name, salary)
values ('3', 'Michael', '3000');
insert into employees (employee_id, name, salary)
values ('7', 'Addilyn', '7400');
insert into employees (employee_id, name, salary)
values ('8', 'Juan', '6100');
insert into employees (employee_id, name, salary)
values ('9', 'Kannon', '7400');

-- Solution
with cte as (select *,
                    count(salary)
                    over (partition by salary order by salary rows between unbounded preceding and unbounded following) as team_size
             from employees)
select employee_id, name, salary, dense_rank() over (order by salary) as team_id
from cte
where team_size >= 2;
-- Solution
