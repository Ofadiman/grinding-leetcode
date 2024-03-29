create table visits
(
    visit_id    int,
    customer_id int
);

insert into visits (visit_id, customer_id)
values (1, 23),
       (2, 9),
       (4, 30),
       (5, 54),
       (6, 96),
       (7, 54),
       (8, 54);

create table transactions
(
    transaction_id int,
    visit_id       int,
    amount         int
);

insert into transactions (transaction_id, visit_id, amount)
values (2, 5, 310),
       (3, 5, 300),
       (9, 5, 200),
       (12, 1, 910),
       (13, 2, 970);

-- Solution
select customer_id, count(visit_id) as count_no_trans
from visits
         left join transactions using (visit_id)
where transaction_id is null
group by customer_id;
-- Solution
