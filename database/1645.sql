create table if not exists drivers
(
    driver_id int,
    join_date date
);
create table if not exists rides
(
    ride_id      int,
    user_id      int,
    requested_at date
);
create table if not exists acceptedrides
(
    ride_id       int,
    driver_id     int,
    ride_distance int,
    ride_duration int
);
truncate table drivers;
insert into drivers (driver_id, join_date)
values ('10', '2019-12-10');
insert into drivers (driver_id, join_date)
values ('8', '2020-1-13');
insert into drivers (driver_id, join_date)
values ('5', '2020-2-16');
insert into drivers (driver_id, join_date)
values ('7', '2020-3-8');
insert into drivers (driver_id, join_date)
values ('4', '2020-5-17');
insert into drivers (driver_id, join_date)
values ('1', '2020-10-24');
insert into drivers (driver_id, join_date)
values ('6', '2021-1-5');
truncate table rides;
insert into rides (ride_id, user_id, requested_at)
values ('6', '75', '2019-12-9');
insert into rides (ride_id, user_id, requested_at)
values ('1', '54', '2020-2-9');
insert into rides (ride_id, user_id, requested_at)
values ('10', '63', '2020-3-4');
insert into rides (ride_id, user_id, requested_at)
values ('19', '39', '2020-4-6');
insert into rides (ride_id, user_id, requested_at)
values ('3', '41', '2020-6-3');
insert into rides (ride_id, user_id, requested_at)
values ('13', '52', '2020-6-22');
insert into rides (ride_id, user_id, requested_at)
values ('7', '69', '2020-7-16');
insert into rides (ride_id, user_id, requested_at)
values ('17', '70', '2020-8-25');
insert into rides (ride_id, user_id, requested_at)
values ('20', '81', '2020-11-2');
insert into rides (ride_id, user_id, requested_at)
values ('5', '57', '2020-11-9');
insert into rides (ride_id, user_id, requested_at)
values ('2', '42', '2020-12-9');
insert into rides (ride_id, user_id, requested_at)
values ('11', '68', '2021-1-11');
insert into rides (ride_id, user_id, requested_at)
values ('15', '32', '2021-1-17');
insert into rides (ride_id, user_id, requested_at)
values ('12', '11', '2021-1-19');
insert into rides (ride_id, user_id, requested_at)
values ('14', '18', '2021-1-27');
truncate table acceptedrides;
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('10', '10', '63', '38');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('13', '10', '73', '96');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('7', '8', '100', '28');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('17', '7', '119', '68');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('20', '1', '121', '92');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('5', '7', '42', '101');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('2', '4', '6', '38');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('11', '8', '37', '43');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('15', '8', '108', '82');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('12', '8', '38', '34');
insert into acceptedrides (ride_id, driver_id, ride_distance, ride_duration)
values ('14', '1', '90', '74');

-- Solution
with cte1 as (select driver_id, extract(month from join_date) as join_month
              from drivers
              where extract(year from join_date) = 2020
              union
              select driver_id, 1 as join_month
              from drivers
              where extract(year from join_date) < 2020),
     cte2 as (select join_month, count(distinct driver_id) as total
              from generate_series(1, 12) as series(join_month)
                       left join cte1 using (join_month)
              group by join_month
              order by join_month),
     cte3 as (select *, sum(total) over (rows unbounded preceding) as total_drivers
              from cte2),
     cte4 as (select count(distinct driver_id) as working_drivers, extract(month from requested_at) as join_month
              from acceptedrides
                       inner join rides using (ride_id)
                       inner join drivers using (driver_id)
              where extract(year from requested_at) = 2020
              group by extract(month from requested_at))
select join_month                                                                     as month,
       coalesce(round(working_drivers::numeric / total_drivers::numeric * 100, 2), 0) as working_percentage
from cte3
         left join cte4 using (join_month)
order by join_month;
-- Solution
