create table customers
(
    id         int  not null,
    name       text not null,
    referee_id int
);

insert into customers (id, name, referee_id)
values (1, 'Will', null),
       (2, 'Jane', null),
       (3, 'Alex', 2),
       (4, 'Bill', null),
       (5, 'Zack', 1),
       (6, 'Mark', 2);

-- Solution 1
select name
from customers
where referee_id != 2
   or referee_id is null;
-- Solution 1
