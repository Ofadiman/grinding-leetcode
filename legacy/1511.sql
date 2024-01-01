create table if not exists customers
(
    customer_id int,
    name        varchar(30),
    country     varchar(30)
);
create table if not exists product
(
    product_id  int,
    description varchar(30),
    price       int
);

create table if not exists orders
(
    order_id    int,
    customer_id int,
    product_id  int,
    order_date  date,
    quantity    int
);

truncate table customers;
insert into customers (customer_id, name, country)
values ('1', 'Winston', 'USA');
insert into customers (customer_id, name, country)
values ('2', 'Jonathan', 'Peru');
insert into customers (customer_id, name, country)
values ('3', 'Moustafa', 'Egypt');
truncate table product;
insert into product (product_id, description, price)
values ('10', 'LC Phone', '300');
insert into product (product_id, description, price)
values ('20', 'LC T-Shirt', '10');
insert into product (product_id, description, price)
values ('30', 'LC Book', '45');
insert into product (product_id, description, price)
values ('40', 'LC Keychain', '2');
truncate table orders;
insert into orders (order_id, customer_id, product_id, order_date, quantity)
values ('1', '1', '10', '2020-06-10', '1');
insert into orders (order_id, customer_id, product_id, order_date, quantity)
values ('2', '1', '20', '2020-07-01', '1');
insert into orders (order_id, customer_id, product_id, order_date, quantity)
values ('3', '1', '30', '2020-07-08', '2');
insert into orders (order_id, customer_id, product_id, order_date, quantity)
values ('4', '2', '10', '2020-06-15', '2');
insert into orders (order_id, customer_id, product_id, order_date, quantity)
values ('5', '2', '40', '2020-07-01', '10');
insert into orders (order_id, customer_id, product_id, order_date, quantity)
values ('6', '3', '20', '2020-06-24', '2');
insert into orders (order_id, customer_id, product_id, order_date, quantity)
values ('7', '3', '30', '2020-06-25', '2');
insert into orders (order_id, customer_id, product_id, order_date, quantity)
values ('9', '3', '30', '2020-05-08', '3');

-- Solution
select customer_id, name
from orders
         inner join product using (product_id)
         inner join customers using (customer_id)
group by 1, 2
having sum(orders.quantity * product.price)
       filter ( where date_trunc('month'
                          , order_date)::date = '2020-06-01' ) >= 100
   and sum(orders.quantity * product.price)
       filter ( where date_trunc('month'
                          , order_date)::date = '2020-07-01' ) >= 100;
-- Solution
