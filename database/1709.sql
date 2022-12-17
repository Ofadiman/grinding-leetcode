create table if not exists user_visits
(
    user_id    int,
    visit_date date
);
truncate table user_visits;
insert into user_visits (user_id, visit_date)
values ('1', '2020-11-28');
insert into user_visits (user_id, visit_date)
values ('1', '2020-10-20');
insert into user_visits (user_id, visit_date)
values ('1', '2020-12-3');
insert into user_visits (user_id, visit_date)
values ('2', '2020-10-5');
insert into user_visits (user_id, visit_date)
values ('2', '2020-12-9');
insert into user_visits (user_id, visit_date)
values ('3', '2020-11-11');

-- Solution
with cte as (select *,
                    coalesce(lead(visit_date) over (partition by user_id order by visit_date asc),
                             '2021-01-01'::date) - visit_date                        as diff_between_visits,
                    row_number() over (partition by user_id order by visit_date asc) as number
             from user_visits)
select user_id, max(diff_between_visits) as biggest_window
from cte
group by user_id;
-- Solution
