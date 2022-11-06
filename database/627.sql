create table salary
(
    id     int  not null,
    name   text not null,
    sex    text not null,
    salary int  not null
);

insert into salary (id, name, sex, salary)
VALUES (1, 'A', 'm', 2500),
       (2, 'B', 'f', 1500),
       (3, 'C', 'm', 5500),
       (4, 'D', 'f', 500);

select *
from salary;

-- Solution
update salary
set sex = case when sex = 'f' then 'm' else 'f' end;
-- Solution

drop table salary;
