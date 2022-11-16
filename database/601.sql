create table stadiums
(
    id         int,
    visit_date date,
    people     int
);

insert into stadiums (id, visit_date, people)
values (1, '2017-01-01', 10),
       (2, '2017-01-02', 109),
       (3, '2017-01-03', 150),
       (4, '2017-01-04', 99),
       (5, '2017-01-05', 145),
       (6, '2017-01-06', 1455),
       (7, '2017-01-07', 199),
       (8, '2017-01-09', 188);

-- Solution 1
with t1 as (select *,
                   row_number() over (order by id)      as row_number,
                   id - row_number() over (order by id) as group_identifier
            from stadiums
            where people >= 100),
     t2 as (select *, count(group_identifier) over (partition by group_identifier) as partition_records_count from t1)
select *
from t2 where partition_records_count >= 3;
-- Solution 1
