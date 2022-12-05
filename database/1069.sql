create table if not exists sales
(
    sale_id    int,
    product_id int,
    year       int,
    quantity   int,
    price      int
);
create table if not exists product
(
    product_id   int,
    product_name varchar(10)
);
truncate table sales;
insert into sales (sale_id, product_id, year, quantity, price)
values ('1', '100', '2008', '10', '5000');
insert into sales (sale_id, product_id, year, quantity, price)
values ('2', '100', '2009', '12', '5000');
insert into sales (sale_id, product_id, year, quantity, price)
values ('7', '200', '2011', '15', '9000');
truncate table product;
insert into product (product_id, product_name)
values ('100', 'Nokia');
insert into product (product_id, product_name)
values ('200', 'Apple');
insert into product (product_id, product_name)
values ('300', 'Samsung');

-- Solution
select product_id, sum(coalesce(quantity, 0)) as total_quantity
from product
         left join sales using (product_id)
group by product_id;
-- Solution
