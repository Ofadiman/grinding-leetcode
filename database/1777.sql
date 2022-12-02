create table products
(
    product_id int,
    store      text,
    price      int
);

insert into products (product_id, store, price)
values (0, 'store1', 95),
       (0, 'store3', 105),
       (0, 'store2', 100),
       (1, 'store1', 70),
       (1, 'store3', 80);

-- Solution
select product_id,
       sum(case when store = 'store1' then price else null end) as store1,
       sum(case when store = 'store2' then price else null end) as store2,
       sum(case when store = 'store3' then price else null end) as store3
from products
group by product_id;
-- Solution
