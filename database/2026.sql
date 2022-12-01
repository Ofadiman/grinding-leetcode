create table problems
(
    problem_id int,
    likes      int,
    dislikes   int
);

insert into problems (problem_id, likes, dislikes)
values (6, 1290, 425),
       (11, 2677, 8659),
       (1, 4446, 2760),
       (7, 8569, 6086),
       (13, 2050, 4164),
       (10, 9002, 7446);

-- Solution
select problem_id
from problems
where (likes::numeric / (likes::numeric + dislikes::numeric) < 0.6::numeric)
order by problem_id;
-- Solution
