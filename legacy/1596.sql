create table customers
(
    customer_id int,
    name        text
);

insert into customers (customer_id, name)
values (1, 'Alice'),
       (2, 'Bob'),
       (3, 'Tom'),
       (4, 'Jerry'),
       (5, 'John');

create table orders
(
    order_id    int,
    order_date  date,
    customer_id int,
    product_id  int
);

insert into orders (order_id, order_date, customer_id, product_id)
values (1, '2020-07-31', 1, 1),
       (2, '2020-07-30', 2, 2),
       (3, '2020-08-29', 3, 3),
       (4, '2020-07-29', 4, 1),
       (5, '2020-06-10', 1, 2),
       (6, '2020-08-01', 2, 1),
       (7, '2020-08-01', 3, 3),
       (8, '2020-08-03', 1, 2),
       (9, '2020-08-07', 2, 3),
       (10, '2020-07-15', 1, 2);

create table products
(
    product_id   int,
    product_name text,
    price        int
);

insert into products (product_id, product_name, price)
values (1, 'keyboard', 120),
       (2, 'mouse', 80),
       (3, 'screen', 600),
       (4, 'hard disk', 450);

-- Solution
with cte1 as (select customer_id, product_id, count(product_id) as total
              from customers
                       inner join orders using (customer_id)
                       inner join products using (product_id)
              group by customer_id, product_id
              order by customer_id, total desc),
     cte2 as (select *, rank() over (partition by customer_id order by total desc) as ranking
              from cte1)
select customer_id, product_id, product_name
from cte2
         inner join products using (product_id)
where ranking = 1
order by customer_id, product_id;
-- Solution
