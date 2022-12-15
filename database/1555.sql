create table if not exists users
(
    user_id   int,
    user_name varchar(20),
    credit    int
);
create table if not exists transactions
(
    trans_id      int,
    paid_by       int,
    paid_to       int,
    amount        int,
    transacted_on date
);
truncate table users;
insert into users (user_id, user_name, credit)
values ('1', 'Moustafa', '100');
insert into users (user_id, user_name, credit)
values ('2', 'Jonathan', '200');
insert into users (user_id, user_name, credit)
values ('3', 'Winston', '10000');
insert into users (user_id, user_name, credit)
values ('4', 'Luis', '800');
truncate table transactions;
insert into transactions (trans_id, paid_by, paid_to, amount, transacted_on)
values ('1', '1', '3', '400', '2020-08-01');
insert into transactions (trans_id, paid_by, paid_to, amount, transacted_on)
values ('2', '3', '2', '500', '2020-08-02');
insert into transactions (trans_id, paid_by, paid_to, amount, transacted_on)
values ('3', '2', '1', '200', '2020-08-03');

-- Solution
with expenses as (select paid_by as user_id, sum(amount) as total_expenses
                  from transactions
                  group by paid_by),
     incomes as (select paid_to as user_id, sum(amount) as total_incomes
                 from transactions
                 group by paid_to)
select user_id,
       user_name,
       (credit - coalesce(total_expenses, 0) + coalesce(total_incomes, 0)) as credit,
       case
           when (credit - coalesce(total_expenses, 0) + coalesce(total_incomes, 0)) < 0 then 'Yes'
           else 'No' end                                                   as credit_limit_breached
from users
         left join expenses using (user_id)
         left join incomes using (user_id);
-- Solution
