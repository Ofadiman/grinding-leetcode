create table if not exists delivery
(
    delivery_id                 int,
    customer_id                 int,
    order_date                  date,
    customer_pref_delivery_date date
);
truncate table delivery;
insert into delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('1', '1', '2019-08-01', '2019-08-02');
insert into delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('2', '5', '2019-08-02', '2019-08-02');
insert into delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('3', '1', '2019-08-11', '2019-08-11');
insert into delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('4', '3', '2019-08-24', '2019-08-26');
insert into delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('5', '4', '2019-08-21', '2019-08-22');
insert into delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
values ('6', '2', '2019-08-11', '2019-08-13');

-- Solution
select round(count(*) filter (where order_date = customer_pref_delivery_date)::numeric /
             count(*)::numeric * 100, 2)
from delivery;
-- Solution
