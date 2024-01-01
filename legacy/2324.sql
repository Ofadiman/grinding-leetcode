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
values ('2', '3', '101', '7');
insert into sales (sale_id, product_id, user_id, quantity)
values ('3', '1', '102', '9');
insert into sales (sale_id, product_id, user_id, quantity)
values ('4', '2', '102', '6');
insert into sales (sale_id, product_id, user_id, quantity)
values ('5', '3', '102', '10');
insert into sales (sale_id, product_id, user_id, quantity)
values ('6', '1', '102', '6');
truncate table product;
insert into product (product_id, price)
values ('1', '10');
insert into product (product_id, price)
values ('2', '25');
insert into product (product_id, price)
values ('3', '15');

-- Solution
with cte1 as (select user_id, product_id, sum(quantity * price) as spent
              from sales
                       inner join product using (product_id)
              group by user_id, product_id),
     cte2 as (select *, rank() over (partition by user_id order by spent desc) as ranking
              from cte1)
select user_id, product_id
from cte2
where ranking = 1;
-- Solution
