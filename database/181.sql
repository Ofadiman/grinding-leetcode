create table employees
(
    id         int,
    name       varchar,
    salary     int,
    manager_id int
);

insert into employees (id, name, salary, manager_id)
values (1, 'Joe', 70000, 3),
       (2, 'Henry', 80000, 4),
       (3, 'Sam', 60000, null),
       (4, 'Max', 90000, null);

-- Solution 1
select employees.name
from employees
         inner join employees as managers on employees.manager_id = managers.id
where employees.salary > managers.salary;
-- Solution 1
