create table accounts
(
    account_id int  not null,
    name       text not null
);

insert into accounts (account_id, name)
values (900001, 'Alice'),
       (900002, 'Bob'),
       (900003, 'Charlie');

create table transactions
(
    transaction_id int  not null,
    account_id     int  not null,
    amount         int  not null,
    transacted_on  date not null
);

insert into transactions (transaction_id, account_id, amount, transacted_on)
values (1, 900001, 7000, '2020-08-01'),
       (2, 900001, 7000, '2020-09-01'),
       (3, 900001, -3000, '2020-09-02'),
       (4, 900002, 1000, '2020-09-12'),
       (5, 900003, 6000, '2020-08-07'),
       (6, 900003, 6000, '2020-09-07'),
       (7, 900003, -4000, '2020-09-11');

-- Solution 1
select name, sum(amount) as balance
from accounts
         inner join transactions using (account_id)
group by name
having sum(amount) > 10000;
-- Solution 1
