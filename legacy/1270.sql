create table employees
(
    employee_id   int,
    employee_name text,
    manager_id    int
);

insert into employees (employee_id, employee_name, manager_id)
values (1, 'Boss', 1),
       (3, 'Alice', 3),
       (2, 'Bob', 1),
       (4, 'Daniel', 2),
       (7, 'Luis', 4),
       (8, 'Jhon', 3),
       (9, 'Angela', 8),
       (77, 'Robert', 1);

-- Solution
with recursive cte(employee_id, manager_id, employee_name, depth)
                   as (select employee_id, manager_id, employee_name, 0 as depth
                       from employees
                       where employee_id = 1
                       union all
                       select e.employee_id, e.manager_id, e.employee_name, depth + 1
                       from employees e
                                inner join cte on e.manager_id = cte.employee_id
                       where e.employee_id != e.manager_id)
select employee_id
from cte
where depth between 1 and 3;
-- Solution
