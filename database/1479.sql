create table if not exists orders
(
    order_id    int,
    customer_id int,
    order_date  date,
    item_id     varchar(30),
    quantity    int
);
create table if not exists items
(
    item_id       varchar(30),
    item_name     varchar(30),
    item_category varchar(30)
);
truncate table orders;
insert into orders (order_id, customer_id, order_date, item_id, quantity)
values ('1', '1', '2020-06-01', '1', '10');
insert into orders (order_id, customer_id, order_date, item_id, quantity)
values ('2', '1', '2020-06-08', '2', '10');
insert into orders (order_id, customer_id, order_date, item_id, quantity)
values ('3', '2', '2020-06-02', '1', '5');
insert into orders (order_id, customer_id, order_date, item_id, quantity)
values ('4', '3', '2020-06-03', '3', '5');
insert into orders (order_id, customer_id, order_date, item_id, quantity)
values ('5', '4', '2020-06-04', '4', '1');
insert into orders (order_id, customer_id, order_date, item_id, quantity)
values ('6', '4', '2020-06-05', '5', '5');
insert into orders (order_id, customer_id, order_date, item_id, quantity)
values ('7', '5', '2020-06-05', '1', '10');
insert into orders (order_id, customer_id, order_date, item_id, quantity)
values ('8', '5', '2020-06-14', '4', '5');
insert into orders (order_id, customer_id, order_date, item_id, quantity)
values ('9', '5', '2020-06-21', '3', '5');
truncate table items;
insert into items (item_id, item_name, item_category)
values ('1', 'LC Alg. Book', 'Book');
insert into items (item_id, item_name, item_category)
values ('2', 'LC DB. Book', 'Book');
insert into items (item_id, item_name, item_category)
values ('3', 'LC SmarthPhone', 'Phone');
insert into items (item_id, item_name, item_category)
values ('4', 'LC Phone 2020', 'Phone');
insert into items (item_id, item_name, item_category)
values ('5', 'LC SmartGlass', 'Glasses');
insert into items (item_id, item_name, item_category)
values ('6', 'LC T-Shirt XL', 'T-shirt');

-- Solution
select item_category                                                            as category,
       sum(case when extract(dow from order_date) = 1 then quantity else 0 end) as monday,
       sum(case when extract(dow from order_date) = 2 then quantity else 0 end) as tuesday,
       sum(case when extract(dow from order_date) = 3 then quantity else 0 end) as wednesday,
       sum(case when extract(dow from order_date) = 4 then quantity else 0 end) as thursday,
       sum(case when extract(dow from order_date) = 5 then quantity else 0 end) as friday,
       sum(case when extract(dow from order_date) = 6 then quantity else 0 end) as saturday,
       sum(case when extract(dow from order_date) = 7 then quantity else 0 end) as sunday
from orders
         inner join items using (item_id)
group by item_category
order by category;
-- Solution
