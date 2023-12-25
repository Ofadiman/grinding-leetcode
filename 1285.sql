create table logs
(
    log_id int
);

insert into logs (log_id)
values (1),
       (2),
       (3),
       (7),
       (8),
       (10);

-- Solution
with cte as (select log_id, log_id - row_number() over (order by log_id) as group_id
             from logs)
select min(log_id) as start_id, max(log_id) as end_id
from cte
group by cte.group_id
order by start_id;
-- Solution
