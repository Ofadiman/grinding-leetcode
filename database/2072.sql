create table if not exists new_york
(
    student_id int,
    score      int
);
create table if not exists california
(
    student_id int,
    score      int
);
truncate table new_york;
insert into new_york (student_id, score)
values ('1', '90');
insert into new_york (student_id, score)
values ('2', '87');
truncate table california;
insert into california (student_id, score)
values ('2', '89');
insert into california (student_id, score)
values ('3', '88');

-- Solution
with cte1 as (select count(*) filter ( where score >= 90 ) as new_york_count
              from new_york),
     cte2 as (select count(*) filter ( where score >= 90 ) as california_count
              from california)
select case
           when cte1.new_york_count > cte2.california_count then 'New York University'
           when cte1.new_york_count < cte2.california_count then 'California University'
           else 'No Winner' end as winner
from cte1
         join cte2 on true;
-- Solution
