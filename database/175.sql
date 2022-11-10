create table people
(
    person_id  int  not null,
    last_name  text not null,
    first_name text not null
);

insert into people (person_id, last_name, first_name)
values (1, 'Wang', 'Allen'),
       (2, 'Alice', 'Bob');

create table addresses
(
    address_id int not null,
    person_id  int not null,
    city       text,
    state      text
);

insert into addresses (address_id, person_id, city, state)
values (1, 2, 'New York City', 'New York'),
       (2, 3, 'Leetcode', 'California');

-- Solution 1
select first_name, last_name, city, state
from people
         left join addresses using (person_id);
-- Solution 1
