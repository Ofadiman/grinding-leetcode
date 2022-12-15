create table if not exists insurance
(
    pid      int,
    tiv_2015 float,
    tiv_2016 float,
    lat      float,
    lon      float
);
truncate table insurance;
insert into insurance (pid, tiv_2015, tiv_2016, lat, lon)
values ('1', '10', '5', '10', '10');
insert into insurance (pid, tiv_2015, tiv_2016, lat, lon)
values ('2', '20', '20', '20', '20');
insert into insurance (pid, tiv_2015, tiv_2016, lat, lon)
values ('3', '10', '30', '20', '20');
insert into insurance (pid, tiv_2015, tiv_2016, lat, lon)
values ('4', '10', '40', '40', '40');

-- Solution
with unique_coordinates as (select lat, lon
                            from insurance
                            group by lat, lon
                            having count(*) = 1),
     not_unique_tiv_2015 as (select tiv_2015
                             from insurance
                             group by tiv_2015
                             having count(*) > 1)
select round(sum(tiv_2016)::numeric, 2) as tiv_2016
from unique_coordinates
         inner join insurance using (lat, lon)
         inner join not_unique_tiv_2015 using (tiv_2015);
-- Solution
