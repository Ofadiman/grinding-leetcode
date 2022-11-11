create table people
(
    id    int,
    email varchar
);

insert into people (id, email)
values (1, 'john@example.com'),
       (2, 'bob@example.com'),
       (3, 'john@example.com');

-- Solution 1
with duplicates as (select *, row_number() over (partition by email) as row_number from people)
delete
from people
where id in (select id
             from duplicates
             where id = duplicates.id
               and duplicates.row_number >= 2);
-- Solution 1

-- Solution 2
with uniques as (select min(id) as id
                 from people
                 group by email
                 order by id)
delete
from people
where id not in (select id from uniques);
-- Solution 2
