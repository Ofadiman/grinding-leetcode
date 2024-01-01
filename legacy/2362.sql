create table products
(
    product_id int,
    price      int
);

insert into products (product_id, price)
values (1, 100),
       (2, 200);


create table purchases
(
    invoice_id int,
    product_id int,
    quantity   int
);

insert into purchases (invoice_id, product_id, quantity)
values (1, 1, 2),
       (3, 2, 1),
       (2, 2, 3),
       (2, 1, 4),
       (4, 1, 10);

-- Solution
with cte as (select invoice_id, sum(quantity * price) as total
             from purchases
                      inner join products using (product_id)
             group by invoice_id
             order by total desc, invoice_id
             limit 1)
select product_id, quantity, price * purchases.quantity as price
from purchases
         inner join products using (product_id)
where invoice_id = any (select invoice_id from cte);
-- Solution
