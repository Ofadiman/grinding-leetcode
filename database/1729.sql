create table followers
(
    user_id     int,
    follower_id int
);

insert into followers (user_id, follower_id)
values (0, 1),
       (1, 0),
       (2, 0),
       (2, 1);

-- Solution 1
select user_id, count(*) as followers_count
from followers
group by user_id
order by user_id;
-- Solution 1
