create table employees
(
    employee_id int,
    name        varchar,
    salary      int
);

insert into employees (employee_id, name, salary)
values (2, 'Meir', 3000),
       (3, 'Michael', 3800),
       (7, 'Addilyn', 7400),
       (8, 'Juan', 6100),
       (9, 'Kannon', 7700);

-- Solution
select employee_id,
       case
           when employees.employee_id % 2 = 0 or employees.name like 'M%' then 0
           else employees.salary end as bonus
from employees
order by employee_id;
-- Solution
