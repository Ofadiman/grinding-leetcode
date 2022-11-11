create table users
(
    user_id int,
    name    varchar
);

insert into users (user_id, name)
values (1, 'aLice'),
       (2, 'bOB');

-- Solution 1
select user_id, concat(upper(substring(name, 1, 1)), lower(substring(name, 2))) as name
from users;
-- Solution 1
