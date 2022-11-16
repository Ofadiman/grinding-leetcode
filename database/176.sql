create table employees
(
    id     int,
    salary int
);

insert into employees (id, salary)
values (1, 100),
       (2, 200),
       (3, 300);

-- Solution 1
with cte as (select salary, dense_rank() over (order by salary desc) as ranking from employees)
select cte.salary
from cte
where cte.ranking = 2;
-- Solution 1

-- Solution 2
select salary
from employees
order by salary desc
offset 1 limit 1;
-- Solution 2
