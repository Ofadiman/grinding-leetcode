create table if not exists employee
(
    id         int,
    name       varchar(255),
    department varchar(255),
    manager_id int
);
truncate table employee;
insert into employee (id, name, department, manager_id)
values ('101', 'John', 'A', null);
insert into employee (id, name, department, manager_id)
values ('102', 'Dan', 'A', '101');
insert into employee (id, name, department, manager_id)
values ('103', 'James', 'A', '101');
insert into employee (id, name, department, manager_id)
values ('104', 'Amy', 'A', '101');
insert into employee (id, name, department, manager_id)
values ('105', 'Anne', 'A', '101');
insert into employee (id, name, department, manager_id)
values ('106', 'Ron', 'B', '101');

-- Solution
with cte as (select manager_id
             from employee
             group by manager_id
             having count(manager_id) >= 5)
select name
from cte
         join employee on cte.manager_id = employee.id;
-- Solution
