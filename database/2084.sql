create table orders
(
    order_id    int,
    customer_id int,
    order_type  int
);

insert into orders (order_id, customer_id, order_type)
values (1, 1, 0),
       (2, 1, 0),
       (11, 2, 0),
       (12, 2, 1),
       (21, 3, 1),
       (22, 3, 0),
       (31, 4, 1),
       (32, 4, 1);

-- Solution
with cte as (select distinct customer_id
             from orders
             where order_type = 0)
select *
from orders
where not (order_type = 1
    and customer_id in (select * from cte));
-- Solution
