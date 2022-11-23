create table weather
(
    id          int,
    record_date date,
    temperature int
);

insert into weather (id, record_date, temperature)
values (1, '2015-01-01', 10),
       (2, '2015-01-02', 25),
       (3, '2015-01-03', 20),
       (4, '2015-01-04', 30),
       (5, '2015-01-06', 35),
       (6, '2015-01-08', 30);

-- Solution
with cte as (select weather.*,
                    lag(temperature) over (order by weather.record_date) as previous_temperature,
                    lag(record_date) over (order by weather.record_date) as previous_date
             from weather)
select *
from cte
where cte.record_date - cte.previous_date = 1
  and cte.temperature > cte.previous_temperature;
-- Solution
