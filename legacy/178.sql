create table scores
(
    id    int,
    score decimal
);

insert into scores (id, score)
values (1, 3.50),
       (2, 3.65),
       (3, 4.00),
       (4, 3.85),
       (5, 4.00),
       (6, 3.65);

-- Solution
select score, dense_rank() over (order by score desc) as rank
from scores;
-- Solution
