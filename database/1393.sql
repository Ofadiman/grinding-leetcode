create table stocks
(
    stock_name    varchar,
    operation     varchar,
    operation_day int,
    price         int
);

insert into stocks (stock_name, operation, operation_day, price)
values ('Leetcode', 'Buy', 1, 1000),
       ('Corona Masks', 'Buy', 2, 10),
       ('Leetcode', 'Sell', 5, 9000),
       ('Handbags', 'Buy', 17, 30000),
       ('Corona Masks', 'Sell', 3, 1010),
       ('Corona Masks', 'Buy', 4, 1000),
       ('Corona Masks', 'Sell', 5, 500),
       ('Corona Masks', 'Buy', 6, 1000),
       ('Handbags', 'Sell', 29, 7000),
       ('Corona Masks', 'Sell', 10, 10000);

-- Solution
select stock_name, sum(case when operation = 'Buy' then -price else price end) as capital_gain_loss
from stocks
group by stock_name;
-- Solution
