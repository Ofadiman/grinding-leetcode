create table users
(
    id   int,
    name varchar
);

insert into users (id, name)
values (1, 'Alice'),
       (2, 'Bob'),
       (3, 'Alex'),
       (4, 'Donald'),
       (7, 'Lee'),
       (13, 'Jonathan'),
       (19, 'Elvis');



create table rides
(
    id       int,
    user_id  int,
    distance int
);

insert into rides (id, user_id, distance)
values (1, 1, 120),
       (2, 2, 317),
       (3, 3, 222),
       (4, 7, 100),
       (5, 13, 312),
       (6, 19, 50),
       (7, 7, 120),
       (8, 19, 400),
       (9, 7, 230);

-- Solution 1
select users.name, coalesce(sum(rides.distance), 0) as travelled_distance
from users
         left join rides on users.id = rides.user_id
group by users.name, users.id
order by travelled_distance desc, name;
-- Solution 1

-- Solution 2
select distinct name, coalesce(sum(rides.distance) over (partition by users.id), 0) as travelled_distance
from users
         left join rides on users.id = rides.user_id
order by travelled_distance desc, name;
-- Solution 2
