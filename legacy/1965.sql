create table employees
(
    employee_id int,
    name        text
);

insert into employees (employee_id, name)
values (2, 'Crew'),
       (4, 'Haven'),
       (5, 'Kristian');

create table salaries
(
    employee_id int,
    salary      int
);

insert into salaries (employee_id, salary)
values (5, 76071),
       (1, 22517),
       (4, 63539);

-- Solution
select coalesce(employees.employee_id, salaries.employee_id) as employee_id
from employees
         full outer join salaries on employees.employee_id = salaries.employee_id
where employees.name is null
   or salaries.salary is null
order by employee_id;
-- Solution
