create table visits
(
    visit_id    int not null,
    customer_id int not null
);

insert into visits (visit_id, customer_id)
VALUES (1, 23),
       (2, 9),
       (4, 30),
       (5, 54),
       (6, 96),
       (7, 54),
       (8, 54);

create table transactions
(
    transaction_id int not null,
    visit_id       int not null,
    amount         int not null
);

insert into transactions (transaction_id, visit_id, amount)
VALUES (2, 5, 310),
       (3, 5, 300),
       (9, 5, 200),
       (12, 1, 910),
       (13, 2, 970);

select *
from visits;
select *
from transactions;

-- Solution
select customer_id, count(visit_id) as count_no_trans
from visits
         left join transactions using (visit_id)
where transaction_id is null
group by customer_id;
-- Solution

drop table visits;
drop table transactions;
