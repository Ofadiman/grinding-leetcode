create table if not exists product
(
    product_id   int,
    product_name varchar(10),
    unit_price   int
);
create table if not exists sales
(
    seller_id  int,
    product_id int,
    buyer_id   int,
    sale_date  date,
    quantity   int,
    price      int
);
truncate table product;
insert into product (product_id, product_name, unit_price)
values ('1', 'S8', '1000');
insert into product (product_id, product_name, unit_price)
values ('2', 'G4', '800');
insert into product (product_id, product_name, unit_price)
values ('3', 'iPhone', '1400');
truncate table sales;
insert into sales (seller_id, product_id, buyer_id, sale_date, quantity, price)
values ('1', '1', '1', '2019-01-21', '2', '2000');
insert into sales (seller_id, product_id, buyer_id, sale_date, quantity, price)
values ('1', '2', '2', '2019-02-17', '1', '800');
insert into sales (seller_id, product_id, buyer_id, sale_date, quantity, price)
values ('2', '2', '3', '2019-06-02', '1', '800');
insert into sales (seller_id, product_id, buyer_id, sale_date, quantity, price)
values ('3', '3', '4', '2019-05-13', '2', '2800');

-- Solution
with cte1 as (select seller_id, sum(price) as revenue from sales group by seller_id),
     cte2 as (select max(revenue) from cte1)
select *
from cte1
where revenue = any (select * from cte2);
-- Solution
