create table countries
(
    name       text not null,
    continent  text not null,
    area       bigint  not null,
    population bigint  not null,
    gdp        bigint  not null
);

insert into countries (name, continent, area, population, gdp)
values ('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
       ('Albania', 'Europe', 28748, 2831741, 12960000000),
       ('Algeria', 'Africa', 2381741, 37100000, 188681000000),
       ('Andorra', 'Europe', 468, 78115, 3712000000),
       ('Angola', 'Africa', 1246700, 20609294, 100990000000);

select *
from countries;

-- Solution
select *
from countries
where area >= 3000000
   or population >= 25000000;
-- Solution

drop table countries;
