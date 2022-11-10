create table customers
(
    id   int,
    name varchar
);

insert into customers (id, name)
values (1, 'Joe'),
       (2, 'Henry'),
       (3, 'Sam'),
       (4, 'Max');

create table orders
(
    id          int,
    customer_id int
);

insert into orders (id, customer_id)
values (1, 3),
       (2, 1);

-- Solution 1
select name
from customers
         left join orders on customers.id = orders.customer_id
where orders.id is null;
-- Solution 1

-- Solution 2
select name
from customers
where customers.id not in (select customer_id from orders);
-- Solution 2
