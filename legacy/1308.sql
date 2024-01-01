create table scores
(
    player_name  text,
    gender       text,
    day          date,
    score_points int
);

insert into scores (player_name, gender, day, score_points)
values ('Aron', 'F', '2020-01-01', 17),
       ('Alice', 'F', '2020-01-07', 23),
       ('Bajrang', 'M', '2020-01-07', 7),
       ('Khali', 'M', '2019-12-25', 11),
       ('Slaman', 'M', '2019-12-30', 13),
       ('Joe', 'M', '2019-12-31', 3),
       ('Jose', 'M', '2019-12-18', 2),
       ('Priya', 'F', '2019-12-31', 23),
       ('Priyanka', 'F', '2019-12-30', 17);

-- Solution
select gender, day, sum(score_points) over (partition by gender order by day) as total
from scores;
-- Solution
