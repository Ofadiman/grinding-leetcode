create table customers
(
    customer_id int,
    name        text
);

insert into customers (customer_id, name)
values (1, 'Winston'),
       (2, 'Jonathan'),
       (3, 'Annabelle'),
       (4, 'Marwan'),
       (5, 'Khaled');

create table orders
(
    order_id    int,
    order_date  date,
    customer_id int,
    cost        int
);

insert into orders (order_id, order_date, customer_id, cost)
values (1, '2020-07-31', 1, 30),
       (2, '2020-07-30', 2, 40),
       (3, '2020-07-31', 3, 70),
       (4, '2020-07-29', 4, 100),
       (5, '2020-06-10', 1, 1010),
       (6, '2020-08-01', 2, 102),
       (7, '2020-08-01', 3, 111),
       (8, '2020-08-03', 1, 99),
       (9, '2020-08-07', 2, 32),
       (10, '2020-07-15', 1, 2);

-- Solution
explain with cte as (select *,
                    row_number() over (partition by customer_id order by order_date desc) as order_number
             from orders
                      inner join customers using (customer_id)
             order by order_date desc)
select name as customer_name, customer_id, order_id, order_date
from cte
where cte.order_number <= 3
order by customer_name, customer_id, order_date desc;
-- Solution
