create table if not exists cinema
(
    seat_id int primary key,
    free    bool
);
truncate table cinema;
insert into cinema (seat_id, free)
values ('1', '1');
insert into cinema (seat_id, free)
values ('2', '0');
insert into cinema (seat_id, free)
values ('3', '1');
insert into cinema (seat_id, free)
values ('4', '1');
insert into cinema (seat_id, free)
values ('5', '1');

-- Solution
with cte1 as (select *, seat_id - row_number() over (order by seat_id asc) as group_id
              from cinema
              where free = true),
     cte2 as (select group_id
              from cte1
              group by group_id
              having count(*) >= 2)
select seat_id
from cte2
         join cte1 using (group_id);
-- Solution
