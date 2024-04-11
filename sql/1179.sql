create extension tablefunc;

create table departments
(
    id      int,
    revenue int,
    month   text
);

insert into departments (id, revenue, month)
values (1, 11000, 'april'),
       (1, 1000, 'august'),
       (1, 2500, 'december'),
       (1, 7000, 'february'),
       (1, 8000, 'january'),
       (1, 5000, 'july'),
       (1, 12500, 'june'),
       (1, 6000, 'march'),
       (1, 10500, 'may'),
       (1, 15000, 'november'),
       (1, 13500, 'october'),
       (1, 9000, 'september'),
       (2, 9000, 'january'),
       (3, 10000, 'february');

-- Solution
select *
from crosstab('select id, month::text, revenue::text from departments order by id, month',
              'select distinct month from departments order by month')
         as dynamic_table(id int,
                          april text,
                          august text,
                          december text,
                          february text,
                          january text,
                          july text,
                          june text,
                          march text,
                          may text,
                          november text,
                          october text,
                          september text
        );
-- Solution
