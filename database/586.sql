create table orders
(
    order_id    int not null,
    customer_id int not null
);

insert into orders (order_id, customer_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 3);

-- Solution
select customer_id
from orders
group by customer_id
order by count(order_id) desc
limit 1;
