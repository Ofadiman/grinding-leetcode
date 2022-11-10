create table salary
(
    id     int  not null,
    name   text not null,
    sex    text not null,
    salary int  not null
);

insert into salary (id, name, sex, salary)
values (1, 'A', 'm', 2500),
       (2, 'B', 'f', 1500),
       (3, 'C', 'm', 5500),
       (4, 'D', 'f', 500);

-- Solution 1
update salary
set sex = case when sex = 'f' then 'm' else 'f' end;
-- Solution 1
