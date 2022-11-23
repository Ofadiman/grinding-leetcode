create table people
(
    person_id  int,
    last_name  text,
    first_name text
);

insert into people (person_id, last_name, first_name)
values (1, 'Wang', 'Allen'),
       (2, 'Alice', 'Bob');

create table addresses
(
    address_id int,
    person_id  int,
    city       text,
    state      text
);

insert into addresses (address_id, person_id, city, state)
values (1, 2, 'New York City', 'New York'),
       (2, 3, 'Leetcode', 'California');

-- Solution
select first_name, last_name, city, state
from people
         left join addresses using (person_id);
-- Solution
