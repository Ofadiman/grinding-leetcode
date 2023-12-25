create table if not exists products
(
    product_id       int,
    product_name     varchar(40),
    product_category varchar(40)
);
create table if not exists orders
(
    product_id int,
    order_date date,
    unit       int
);
truncate table products;
insert into products (product_id, product_name, product_category)
values ('1', 'Leetcode Solutions', 'Book');
insert into products (product_id, product_name, product_category)
values ('2', 'Jewels of Stringology', 'Book');
insert into products (product_id, product_name, product_category)
values ('3', 'HP', 'Laptop');
insert into products (product_id, product_name, product_category)
values ('4', 'Lenovo', 'Laptop');
insert into products (product_id, product_name, product_category)
values ('5', 'Leetcode Kit', 'T-shirt');
truncate table orders;
insert into orders (product_id, order_date, unit)
values ('1', '2020-02-05', '60');
insert into orders (product_id, order_date, unit)
values ('1', '2020-02-10', '70');
insert into orders (product_id, order_date, unit)
values ('2', '2020-01-18', '30');
insert into orders (product_id, order_date, unit)
values ('2', '2020-02-11', '80');
insert into orders (product_id, order_date, unit)
values ('3', '2020-02-17', '2');
insert into orders (product_id, order_date, unit)
values ('3', '2020-02-24', '3');
insert into orders (product_id, order_date, unit)
values ('4', '2020-03-01', '20');
insert into orders (product_id, order_date, unit)
values ('4', '2020-03-04', '30');
insert into orders (product_id, order_date, unit)
values ('4', '2020-03-04', '60');
insert into orders (product_id, order_date, unit)
values ('5', '2020-02-25', '50');
insert into orders (product_id, order_date, unit)
values ('5', '2020-02-27', '50');
insert into orders (product_id, order_date, unit)
values ('5', '2020-03-01', '50');

-- Solution
select product_name, sum(unit) as unit
from orders
         inner join products using (product_id)
where extract(year from order_date) = 2020
  and extract(month from order_date) = 2
group by product_name
having sum(unit) >= 100;
-- Solution
