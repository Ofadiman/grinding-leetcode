create table transactions
(
    account_id int,
    day        date,
    type       text,
    amount     int
);

insert into transactions (account_id, day, type, amount)
values (1, '2021-11-07', 'Deposit', 2000),
       (1, '2021-11-09', 'Withdraw', 1000),
       (1, '2021-11-11', 'Deposit', 3000),
       (2, '2021-12-07', 'Deposit', 7000),
       (2, '2021-12-12', 'Withdraw', 7000);

-- Solution
select account_id,
       day,
       sum(case when type = 'Deposit' then amount else -amount end)
       over
           (partition by account_id order by day rows between unbounded preceding and current row) as balance
from transactions
order by account_id, day;
-- Solution
