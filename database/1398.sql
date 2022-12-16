create table if not exists customers
(
    customer_id   int,
    customer_name varchar(30)
);
create table if not exists orders
(
    order_id     int,
    customer_id  int,
    product_name varchar(30)
);
truncate table customers;
insert into customers (customer_id, customer_name)
values ('1', 'Daniel');
insert into customers (customer_id, customer_name)
values ('2', 'Diana');
insert into customers (customer_id, customer_name)
values ('3', 'Elizabeth');
insert into customers (customer_id, customer_name)
values ('4', 'Jhon');
truncate table orders;
insert into orders (order_id, customer_id, product_name)
values ('10', '1', 'A');
insert into orders (order_id, customer_id, product_name)
values ('20', '1', 'B');
insert into orders (order_id, customer_id, product_name)
values ('30', '1', 'D');
insert into orders (order_id, customer_id, product_name)
values ('40', '1', 'C');
insert into orders (order_id, customer_id, product_name)
values ('50', '2', 'A');
insert into orders (order_id, customer_id, product_name)
values ('60', '3', 'A');
insert into orders (order_id, customer_id, product_name)
values ('70', '3', 'B');
insert into orders (order_id, customer_id, product_name)
values ('80', '3', 'D');
insert into orders (order_id, customer_id, product_name)
values ('90', '4', 'C');

-- Solution
with cte as (select customer_id
             from orders
             group by customer_id
             having coalesce(count(*) filter ( where product_name = 'A' ), 0) > 0
                and coalesce(count(*) filter ( where product_name = 'B' ), 0) > 0
                and coalesce(count(*) filter ( where product_name = 'C' ), 0) = 0)
select customer_id, customer_name
from cte
         join customers using (customer_id);
-- Solution
