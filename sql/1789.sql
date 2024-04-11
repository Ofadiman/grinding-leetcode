create table if not exists employee
(
    employee_id   int,
    department_id int,
    primary_flag  text
);
truncate table employee;
insert into employee (employee_id, department_id, primary_flag)
values ('1', '1', 'N');
insert into employee (employee_id, department_id, primary_flag)
values ('2', '1', 'Y');
insert into employee (employee_id, department_id, primary_flag)
values ('2', '2', 'N');
insert into employee (employee_id, department_id, primary_flag)
values ('3', '3', 'N');
insert into employee (employee_id, department_id, primary_flag)
values ('4', '2', 'N');
insert into employee (employee_id, department_id, primary_flag)
values ('4', '3', 'Y');
insert into employee (employee_id, department_id, primary_flag)
values ('4', '4', 'N');

-- Solution
with cte as (select employee_id, count(department_id) as departments_count
             from employee
             group by employee_id)
select employee_id, department_id
from employee innjer
         join cte using (employee_id)
where (departments_count = 1)
   or (primary_flag = 'Y');
-- Solution
