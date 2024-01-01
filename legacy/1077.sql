create table if not exists project
(
    project_id  int,
    employee_id int
);
create table if not exists employee
(
    employee_id      int,
    name             varchar(10),
    experience_years int
);
truncate table project;
insert into project (project_id, employee_id)
values ('1', '1');
insert into project (project_id, employee_id)
values ('1', '2');
insert into project (project_id, employee_id)
values ('1', '3');
insert into project (project_id, employee_id)
values ('2', '1');
insert into project (project_id, employee_id)
values ('2', '4');
truncate table employee;
insert into employee (employee_id, name, experience_years)
values ('1', 'Khaled', '3');
insert into employee (employee_id, name, experience_years)
values ('2', 'Ali', '2');
insert into employee (employee_id, name, experience_years)
values ('3', 'John', '3');
insert into employee (employee_id, name, experience_years)
values ('4', 'Doe', '2');

-- Solution
with cte as (select *, rank() over (partition by project_id order by experience_years desc) as ranking
             from project
                      inner join employee using (employee_id))
select project_id, employee_id
from cte
where ranking = 1;
-- Solution
