create table if not exists sessions
(
    session_id int,
    duration   int
);
truncate table sessions;
insert into sessions (session_id, duration)
values ('1', '30');
insert into sessions (session_id, duration)
values ('2', '199');
insert into sessions (session_id, duration)
values ('3', '299');
insert into sessions (session_id, duration)
values ('4', '580');
insert into sessions (session_id, duration)
values ('5', '1000');

-- Solution
with ranges as (select 0 as min, 299 as max, '[0-5>' as bin
                union
                select 300, 599, '[5-10>'
                union
                select 600, 899, '[10-15>'
                union
                select 900, 2147483647, '15 minutes or more')
select bin, count(session_id) as total
from ranges
         left join sessions on duration between min and max
group by bin;
-- Solution
