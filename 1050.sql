create table actors_directors
(
    id          int,
    actor_id    int,
    director_id int
);

insert into actors_directors (id, actor_id, director_id)
values (1, 1, 1),
       (2, 1, 1),
       (3, 1, 1),
       (4, 1, 2),
       (5, 1, 2),
       (6, 2, 1),
       (7, 2, 1);

-- Solution
select actor_id, director_id
from actors_directors
group by actor_id, director_id
having count(*) >= 3;
-- Solution
