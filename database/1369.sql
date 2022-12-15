create table if not exists user_activity
(
    username   varchar(30),
    activity   varchar(30),
    start_date date,
    end_date   date
);
truncate table user_activity;
insert into user_activity (username, activity, start_date, end_date)
values ('Anna', 'Sing', '2020-01-02', '2020-01-03'),
       ('Jhon', 'Dancing', '2020-01-02', '2020-01-03'),
       ('Jhon', 'Sing', '2020-01-04', '2020-01-06'),
       ('Jhon', 'Dancing', '2020-01-07', '2020-01-08'),
       ('Jade', 'Travel', '2020-01-02', '2020-01-05'),
       ('Jade', 'Sing', '2020-01-06', '2020-01-07');

-- Solution
with cte as (select *,
                    row_number() over (partition by username order by start_date desc)   as activity_order,
                    lead(activity) over (partition by username order by start_date desc) as next_activity
             from user_activity)
select username, activity, start_date, end_date
from cte
where (activity_order = 1 and next_activity is null)
   or (activity_order = 2);
-- Solution
