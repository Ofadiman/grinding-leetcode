create table people
(
    id    int,
    email varchar
);

insert into people (id, email)
values (1, 'john@example.com'),
       (2, 'bob@example.com'),
       (3, 'john@example.com');

-- Solution
with cte as (select *, row_number() over (partition by email) as row_number from people)
delete
from people
where id in (select id
             from cte
             where id = cte.id
               and cte.row_number >= 2);
-- Solution
