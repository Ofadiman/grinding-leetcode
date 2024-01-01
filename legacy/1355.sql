create table if not exists friends
(
    id       int,
    name     varchar(30),
    activity varchar(30)
);
create table if not exists activities
(
    id   int,
    name varchar(30)
);
truncate table friends;
insert into friends (id, name, activity)
values (1, 'Maria C.', 'Eating'),
       (2, 'Jade W.', 'Horse Riding'),
       (3, 'Jonathan D.', 'Eating'),
       (4, 'Claire C.', 'Singing'),
       (5, 'Will W.', 'Eating'),
       (6, 'Anna A.', 'Horse Riding'),
       (7, 'Daniel D.', 'Singing');
truncate table activities;
insert into activities (id, name)
values ('1', 'Eating');
insert into activities (id, name)
values ('2', 'Singing');
insert into activities (id, name)
values ('3', 'Horse Riding');

-- Solution
with grouped_activities as (select activity, count(*) as count from friends group by activity order by count desc),
     most_popular_activity_count as (select count from grouped_activities limit 1),
     least_popular_activity_count as (select count from grouped_activities order by count asc limit 1)
select activity
from grouped_activities
where count not in (select count from most_popular_activity_count union select count from least_popular_activity_count);
-- Solution
