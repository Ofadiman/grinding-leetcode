create table employees
(
    emp_id    int  not null,
    event_day date not null,
    in_time   int  not null,
    out_time  int  not null
);

insert into employees (emp_id, event_day, in_time, out_time)
VALUES (1, '2020-11-28', 4, 32),
       (1, '2020-11-28', 55, 200),
       (1, '2020-12-03', 1, 42),
       (2, '2020-11-28', 3, 33),
       (2, '2020-12-09', 47, 74);

select * from employees;

-- Solution
select event_day as day, emp_id, sum(out_time - in_time) as total_time
from employees
group by emp_id, event_day
order by day, emp_id;
-- Solution

drop table employees;
