create table employees
(
    id            int,
    name          varchar,
    salary        int,
    department_id int
);

insert into employees (id, name, salary, department_id)
values (1, 'Joe', 85000, 1),
       (2, 'Henry', 80000, 2),
       (3, 'Sam', 60000, 2),
       (4, 'Max', 90000, 1),
       (5, 'Janet', 69000, 1),
       (6, 'Randy', 85000, 1),
       (7, 'Will', 70000, 1);

create table departments
(
    id   int,
    name varchar
);

insert into departments (id, name)
values (1, 'IT'),
       (2, 'Sales');

-- Solution 1
with t1 as (select departments.name                                                    as department,
                   employees.name                                                      as employee,
                   employees.salary                                                    as salary,
                   dense_rank() over (partition by department_id order by salary desc) as ranked
            from employees
                     inner join departments on departments.id = employees.department_id)
select department, employee, salary
from t1
where t1.ranked <= 3;
-- Solution 1

select *, dense_rank() over (partition by department_id order by salary desc) as ranked
from employees
         inner join departments on departments.id = employees.department_id