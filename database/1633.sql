create table if not exists users
(
    user_id   int,
    user_name varchar(20)
);
create table if not exists register
(
    contest_id int,
    user_id    int
);
truncate table users;
insert into users (user_id, user_name)
values ('6', 'Alice');
insert into users (user_id, user_name)
values ('2', 'Bob');
insert into users (user_id, user_name)
values ('7', 'Alex');
truncate table register;
insert into register (contest_id, user_id)
values ('215', '6');
insert into register (contest_id, user_id)
values ('209', '2');
insert into register (contest_id, user_id)
values ('208', '2');
insert into register (contest_id, user_id)
values ('210', '6');
insert into register (contest_id, user_id)
values ('208', '6');
insert into register (contest_id, user_id)
values ('209', '7');
insert into register (contest_id, user_id)
values ('209', '6');
insert into register (contest_id, user_id)
values ('215', '7');
insert into register (contest_id, user_id)
values ('208', '7');
insert into register (contest_id, user_id)
values ('210', '2');
insert into register (contest_id, user_id)
values ('207', '2');
insert into register (contest_id, user_id)
values ('210', '7');

-- Solution
with cte as (select count(*) from users)
select contest_id, round(count(*)::numeric / (select * from cte)::numeric * 100, 2) as percentage
from register
         join users using (user_id)
group by contest_id
order by percentage desc, contest_id asc;
-- Solution
