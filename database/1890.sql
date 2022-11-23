create table users
(
    user_id       int,
    last_login_at timestamp with time zone
);

insert into users (user_id, last_login_at)
values (6, '2020-06-30 15:06:07'),
       (6, '2021-04-21 14:06:06'),
       (6, '2019-03-07 00:18:15'),
       (8, '2020-02-01 05:10:53'),
       (8, '2020-12-30 00:46:50'),
       (2, '2020-01-16 02:49:50'),
       (2, '2019-08-25 07:59:08'),
       (14, '2019-07-14 09:00:00'),
       (14, '2021-01-06 11:59:59');

-- Solution
with cte as (select *, row_number() over (partition by user_id order by last_login_at desc) row_number
             from users
             where tstzrange('2020-01-01'::timestamptz, '2021-01-01'::timestamptz, '[)') @> last_login_at)
select *
from cte
where row_number = 1;
-- Solution
