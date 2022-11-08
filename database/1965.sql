create table employees
(
    employee_id int not null,
    name        text
);

create table salaries
(
    employee_id int not null,
    salary      int
);

insert into employees (employee_id, name)
values (2, 'Crew'),
       (4, 'Haven'),
       (5, 'Kristian');

insert into salaries (employee_id, salary)
values (5, 76071),
       (1, 22517),
       (4, 63539);

select *
from employees;
select *
from salaries;

-- Solution 1
select coalesce(employees.employee_id, salaries.employee_id) as employee_id
from employees
         full outer join salaries on employees.employee_id = salaries.employee_id
where employees.name is null
   or salaries.salary is null
order by employee_id;
-- Solution 1

-- Solution 2 - MySQL does not support `FULL OUTER JOIN` but you can achieve the same results combining `LEFT JOIN` and `RIGHT JOIN`.
with simulated_full_outer_join as (select *
                                   from employees
                                            left join salaries using (employee_id)
                                   union
                                   select *
                                   from employees
                                            right join salaries using (employee_id))
select simulated_full_outer_join.employee_id
from simulated_full_outer_join
where simulated_full_outer_join.salary is null
   or simulated_full_outer_join.name is null
order by employee_id;
-- Solution 2

drop table employees;
drop table salaries;
