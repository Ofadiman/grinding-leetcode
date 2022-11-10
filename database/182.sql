create table people
(
    id    int,
    email varchar
);

insert into people (id, email)
values (1, 'a@b.com'),
       (2, 'c@d.com'),
       (3, 'a@b.com');

-- Solution 1
select email
from people
group by email
having count(email) >= 2;
-- Solution 1
