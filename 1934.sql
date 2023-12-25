create table if not exists signups
(
    user_id    int,
    time_stamp timestamptz
);
create table if not exists confirmations
(
    user_id    int,
    time_stamp timestamptz,
    action     text
);
truncate table signups;
insert into signups (user_id, time_stamp)
values ('3', '2020-03-21 10:16:13');
insert into signups (user_id, time_stamp)
values ('7', '2020-01-04 13:57:59');
insert into signups (user_id, time_stamp)
values ('2', '2020-07-29 23:09:44');
insert into signups (user_id, time_stamp)
values ('6', '2020-12-09 10:39:37');
truncate table confirmations;
insert into confirmations (user_id, time_stamp, action)
values ('3', '2021-01-06 03:30:46', 'timeout');
insert into confirmations (user_id, time_stamp, action)
values ('3', '2021-07-14 14:00:00', 'timeout');
insert into confirmations (user_id, time_stamp, action)
values ('7', '2021-06-12 11:57:29', 'confirmed');
insert into confirmations (user_id, time_stamp, action)
values ('7', '2021-06-13 12:58:28', 'confirmed');
insert into confirmations (user_id, time_stamp, action)
values ('7', '2021-06-14 13:59:27', 'confirmed');
insert into confirmations (user_id, time_stamp, action)
values ('2', '2021-01-22 00:00:00', 'confirmed');
insert into confirmations (user_id, time_stamp, action)
values ('2', '2021-02-28 23:59:59', 'timeout');

-- Solution
select user_id,
       round(count(*) filter ( where action = 'confirmed' )::numeric / count(*)::numeric, 2) as confirmation_rate
from signups
         left join confirmations using (user_id)
group by user_id;
-- Solution
