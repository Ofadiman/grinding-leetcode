create table if not exists prices
(
    product_id int,
    start_date date,
    end_date   date,
    price      int
);
create table if not exists units_sold
(
    product_id    int,
    purchase_date date,
    units         int
);
truncate table prices;
insert into prices (product_id, start_date, end_date, price)
values ('1', '2019-02-17', '2019-02-28', '5');
insert into prices (product_id, start_date, end_date, price)
values ('1', '2019-03-01', '2019-03-22', '20');
insert into prices (product_id, start_date, end_date, price)
values ('2', '2019-02-01', '2019-02-20', '15');
insert into prices (product_id, start_date, end_date, price)
values ('2', '2019-02-21', '2019-03-31', '30');
truncate table units_sold;
insert into units_sold (product_id, purchase_date, units)
values ('1', '2019-02-25', '100');
insert into units_sold (product_id, purchase_date, units)
values ('1', '2019-03-01', '15');
insert into units_sold (product_id, purchase_date, units)
values ('2', '2019-02-10', '200');
insert into units_sold (product_id, purchase_date, units)
values ('2', '2019-03-22', '30');

-- Solution
select units_sold.product_id,
       round(sum(units::numeric * price::numeric) / sum(units::numeric), 2) as average_price
from units_sold
         inner join prices on (units_sold.product_id = prices.product_id and
                               units_sold.purchase_date between prices.start_date and prices.end_date)
group by units_sold.product_id;
-- Solution
