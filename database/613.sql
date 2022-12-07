create table if not exists point
(
    x int not null
);
truncate table point;
insert into point (x)
values ('-1');
insert into point (x)
values ('0');
insert into point (x)
values ('2');

-- Solution
with cte as (select *, lag(x) over (order by x) as previous
             from point)
select min(abs(x - previous)) as shortest
from cte
where abs(x - previous) is not null;
-- Solution
