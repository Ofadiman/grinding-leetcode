create table users
(
    user_id        int,
    join_date      date,
    favorite_brand varchar
);

insert into users (user_id, join_date, favorite_brand)
values (1, '2018-01-01', 'Lenovo'),
       (2, '2018-02-09', 'Samsung'),
       (3, '2018-01-19', 'LG'),
       (4, '2018-05-21', 'HP');

create table orders
(
    order_id   int,
    order_date date,
    item_id    int,
    buyer_id   int,
    seller_id  int
);

insert into orders (order_id, order_date, item_id, buyer_id, seller_id)
values (1, '2019-08-01', 4, 1, 2),
       (2, '2018-08-02', 2, 1, 3),
       (3, '2019-08-03', 3, 2, 3),
       (4, '2018-08-04', 1, 4, 2),
       (5, '2018-08-04', 1, 3, 4),
       (6, '2019-08-05', 2, 2, 4),
       (7, '2019-01-01', 2, 2, 4),
       (8, '2019-12-31', 2, 2, 4);

create table items
(
    item_id    int,
    item_brand varchar
);

insert into items (item_id, item_brand)
values (1, 'Samsung'),
       (2, 'Lenovo'),
       (3, 'LG'),
       (4, 'HP');

-- Solution 1
with cte as (select buyer_id, count(*) as orders_in_2019
             from orders
             where extract(year from order_date) = 2019
             group by buyer_id, extract(year from order_date))
select user_id as buyer_id, join_date, coalesce(orders_in_2019, 0) as orders_in_2019
from users
         left join cte on cte.buyer_id = users.user_id;
-- Solution 1
