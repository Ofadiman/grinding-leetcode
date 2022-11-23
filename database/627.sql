create table salary
(
    id     int,
    name   text,
    sex    text,
    salary int
);

insert into salary (id, name, sex, salary)
values (1, 'A', 'm', 2500),
       (2, 'B', 'f', 1500),
       (3, 'C', 'm', 5500),
       (4, 'D', 'f', 500);

-- Solution
update salary
set sex = case when sex = 'f' then 'm' else 'f' end;
-- Solution
