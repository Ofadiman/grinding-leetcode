create extension tablefunc;

create table departments
(
    id      int  not null,
    revenue int  not null,
    month   text not null
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

-- Solution 1
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
-- Solution 1

-- Solution 2
select id,
       sum(case when month = 'april' then revenue end)     as april,
       sum(case when month = 'august' then revenue end)    as august,
       sum(case when month = 'december' then revenue end)  as december,
       sum(case when month = 'february' then revenue end)  as february,
       sum(case when month = 'january' then revenue end)   as january,
       sum(case when month = 'july' then revenue end)      as july,
       sum(case when month = 'june' then revenue end)      as june,
       sum(case when month = 'march' then revenue end)     as march,
       sum(case when month = 'may' then revenue end)       as may,
       sum(case when month = 'november' then revenue end)  as november,
       sum(case when month = 'october' then revenue end)   as october,
       sum(case when month = 'september' then revenue end) as september
from departments
group by id
order by id;
-- Solution 2

drop table departments;
drop extension tablefunc;
