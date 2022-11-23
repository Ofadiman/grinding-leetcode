create table activities
(
    user_id       int,
    session_id    int,
    activity_date date,
    activity_type varchar
);

insert into activities (user_id, session_id, activity_date, activity_type)
values (1, 1, '2019-07-20', 'open_session'),
       (1, 1, '2019-07-20', 'scroll_down'),
       (1, 1, '2019-07-20', 'end_session'),
       (2, 4, '2019-07-20', 'open_session'),
       (2, 4, '2019-07-21', 'send_message'),
       (2, 4, '2019-07-21', 'end_session'),
       (3, 2, '2019-07-21', 'open_session'),
       (3, 2, '2019-07-21', 'send_message'),
       (3, 2, '2019-07-21', 'end_session'),
       (4, 3, '2019-06-25', 'open_session'),
       (4, 3, '2019-06-25', 'end_session');

-- Solution
select activity_date, count(distinct user_id)
from activities
where activity_date between date('2019-07-27') - interval '30 days' and date('2019-07-27')
group by activity_date;
-- Solution
