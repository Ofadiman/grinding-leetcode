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

create table department
(
    id   int,
    name varchar
);

insert into department (id, name)
values (1, 'IT'),
       (2, 'Sales');

-- Solution 1
with cte as (select employees.name                                                      as employee_name,
                    employees.salary                                                    as empoyee_salary,
                    department.name                                                     as department_name,
                    dense_rank() over (partition by department.id order by salary desc) as rank
             from employees
                      inner join department on department.id = employees.department_id)
select employee_name, empoyee_salary, department_name
from cte
where rank = 1;
-- Solution 1

-- Solution 2
select employees.name  as employee_name,
       employees.salary,
       department.name as department_name
from employees
         inner join department on department.id = employees.department_id
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);
-- Solution 2
