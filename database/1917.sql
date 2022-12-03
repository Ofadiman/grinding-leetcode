create table listens
(
    user_id int,
    song_id int,
    day     date
);

insert into listens (user_id, song_id, day)
values (1, 10, '2021-03-15'),
       (1, 11, '2021-03-15'),
       (1, 12, '2021-03-15'),
       (2, 10, '2021-03-15'),
       (2, 11, '2021-03-15'),
       (2, 12, '2021-03-15'),
       (3, 10, '2021-03-15'),
       (3, 11, '2021-03-15'),
       (3, 12, '2021-03-15'),
       (4, 10, '2021-03-15'),
       (4, 11, '2021-03-15'),
       (4, 13, '2021-03-15'),
       (5, 10, '2021-03-16'),
       (5, 11, '2021-03-16'),
       (5, 12, '2021-03-16');

create table friendships
(
    user1_id int,
    user2_id int
);

insert into friendships (user1_id, user2_id)
values (1, 2);

-- Solution
explain with cte1 as (select user_id, day, array_agg(song_id) as songs
              from listens
              group by user_id, day),
     cte2 as (select distinct cte1.user_id as user1_id, cte2.user_id as user2_id
              from cte1
                       inner join cte1 as cte2 on (cte1.songs @> cte2.songs and cte1.songs <@ cte2.songs)
              where array_length(cte1.songs, 1) >= 3
                and array_length(cte2.songs, 1) >= 3
                and cte1.day = cte2.day
                and cte1.user_id != cte2.user_id
              group by cte1.user_id, cte2.user_id)
select cte2.user1_id as user_id, cte2.user2_id as recommended_id
from cte2
         left outer join friendships
                         on (cte2.user1_id = friendships.user1_id and cte2.user2_id = friendships.user2_id or
                             cte2.user1_id = friendships.user2_id and cte2.user2_id = friendships.user1_id)
where friendships.user1_id is null;
-- Solution
