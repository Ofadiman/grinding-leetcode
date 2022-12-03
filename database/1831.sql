create table if not exists transactions
(
    transaction_id int,
    day            timestamp with time zone,
    amount         int
);
truncate table transactions;
insert into transactions (transaction_id, day, amount)
values ('8', '2021-4-3 15:57:28', '57');
insert into transactions (transaction_id, day, amount)
values ('9', '2021-4-28 08:47:25', '21');
insert into transactions (transaction_id, day, amount)
values ('1', '2021-4-29 13:28:30', '58');
insert into transactions (transaction_id, day, amount)
values ('5', '2021-4-28 16:39:59', '40');
insert into transactions (transaction_id, day, amount)
values ('6', '2021-4-29 23:39:28', '58');

-- Solution
with cte as (select *, rank() over (partition by day::date order by amount desc) as ranking
             from transactions)
select transaction_id
from cte
where ranking = 1;
-- Solution
