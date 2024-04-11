create table employees
(
    id            int,
    name          varchar,
    salary        int,
    department_id int
);

insert into employees (id, name, salary, department_id)
values (1, 'Joe', 70000, 1),
       (2, 'Jim', 90000, 1),
       (3, 'Henry', 80000, 2),
       (4, 'Sam', 60000, 2),
       (5, 'Max', 90000, 1);

create table departments
(
    id   int,
    name varchar
);

insert into departments (id, name)
values (1, 'IT'),
       (2, 'Sales');

-- Solution
with cte as (select employees.name                                                       as employee_name,
                    employees.salary                                                     as empoyee_salary,
                    departments.name                                                     as department_name,
                    dense_rank() over (partition by departments.id order by salary desc) as rank
             from employees
                      inner join departments on departments.id = employees.department_id)
select employee_name, empoyee_salary, department_name
from cte
where rank = 1;
-- Solution
