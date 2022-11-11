create table products
(
    product_id   int,
    product_name varchar,
    unit_price   int
);

insert into products (product_id, product_name, unit_price)
values (1, 'S8', 1000),
       (2, 'G4', 800),
       (3, 'iPhone', 1400),
       (4, 'S12', 2000);

create table sales
(
    seller_id  int,
    product_id int,
    buyer_id   int,
    sale_date  date,
    quantity   int,
    price      int
);

insert into sales (seller_id, product_id, buyer_id, sale_date, quantity, price)
values (1, 1, 1, '2019-01-21', 2, 2000),
       (1, 2, 2, '2019-02-17', 1, 800),
       (2, 2, 3, '2019-06-02', 1, 800),
       (3, 3, 4, '2019-05-13', 2, 2800);

-- Solution 1
select products.product_id, products.product_name
from products
         inner join sales using (product_id)
where (sales.sale_date >= '2019-01-01' and sales.sale_date <= '2019-03-31')
  and product_id not in (select product_id from sales where sale_date < '2019-01-01' or sale_date > '2019-03-31');
-- Solution 1

-- Solution 2
select product_id, product_name
from products
where product_id in
      (select product_id
       from sales
       group by product_id
       having min(sale_date) >= '2019-01-01'
          and max(sale_date) <= '2019-03-31');
-- Solution 2

-- Solution 3
select product_id, product_name
from products
         inner join sales using (product_id)
group by product_id, product_name
having min(sale_date) >= '2019-01-01'
   and max(sale_date) <= '2019-03-31';
-- Solution 3
