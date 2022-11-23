create table movies
(
    id          int,
    movie       text,
    description text,
    rating      numeric
);

insert into movies (id, movie, description, rating)
values (1, 'War', 'great 3D', 8.9),
       (2, 'Science', 'fiction', 8.5),
       (3, 'irish', 'boring', 6.2),
       (4, 'Ice song', 'Fantasy', 8.6),
       (5, 'House card', 'Interesting', 9.1);

-- Solution
select *
from movies
where (id % 2 != 0)
  and (description != 'boring')
order by rating desc;
-- Solution
