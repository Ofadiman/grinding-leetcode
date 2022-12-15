create table if not exists customer
(
    customer_id   int,
    customer_name varchar(20)
);
create table if not exists orders
(
    order_id    int,
    sale_date   date,
    order_cost  int,
    customer_id int,
    seller_id   int
);
create table if not exists seller
(
    seller_id   int,
    seller_name varchar(20)
);
truncate table customer;
insert into customer (customer_id, customer_name)
values ('101', 'Alice');
insert into customer (customer_id, customer_name)
values ('102', 'Bob');
insert into customer (customer_id, customer_name)
values ('103', 'Charlie');
truncate table orders;
insert into orders (order_id, sale_date, order_cost, customer_id, seller_id)
values ('1', '2020-03-01', '1500', '101', '1');
insert into orders (order_id, sale_date, order_cost, customer_id, seller_id)
values ('2', '2020-05-25', '2400', '102', '2');
insert into orders (order_id, sale_date, order_cost, customer_id, seller_id)
values ('3', '2019-05-25', '800', '101', '3');
insert into orders (order_id, sale_date, order_cost, customer_id, seller_id)
values ('4', '2020-09-13', '1000', '103', '2');
insert into orders (order_id, sale_date, order_cost, customer_id, seller_id)
values ('5', '2019-02-11', '700', '101', '2');
truncate table seller;
insert into seller (seller_id, seller_name)
values ('1', 'Daniel');
insert into seller (seller_id, seller_name)
values ('2', 'Elizabeth');
insert into seller (seller_id, seller_name)
values ('3', 'Frank');

-- Solution
select seller_id, seller_name
from seller
except
select seller_id, seller_name
from orders
         inner join seller using (seller_id)
where extract(year from sale_date) = 2020
order by seller_name asc;
-- Solution
