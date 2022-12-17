create table if not exists sales
(
    sale_id    int,
    product_id int,
    user_id    int,
    quantity   int
);
create table if not exists product
(
    product_id int,
    price      int
);
truncate table sales;
insert into sales (sale_id, product_id, user_id, quantity)
values ('1', '1', '101', '10');
insert into sales (sale_id, product_id, user_id, quantity)
values ('2', '2', '101', '1');
insert into sales (sale_id, product_id, user_id, quantity)
values ('3', '3', '102', '3');
insert into sales (sale_id, product_id, user_id, quantity)
values ('4', '3', '102', '2');
insert into sales (sale_id, product_id, user_id, quantity)
values ('5', '2', '103', '3');
truncate table product;
insert into product (product_id, price)
values ('1', '10');
insert into product (product_id, price)
values ('2', '25');
insert into product (product_id, price)
values ('3', '15');

-- Solution
select user_id, sum(quantity * price) as spending
from sales
         join product using (product_id)
group by user_id
order by spending desc, user_id asc;
-- Solution
