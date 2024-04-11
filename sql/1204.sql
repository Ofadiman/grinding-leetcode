create table if not exists queue
(
    person_id   int,
    person_name varchar(30),
    weight      int,
    turn        int
);
truncate table queue;
insert into queue (person_id, person_name, weight, turn)
values ('5', 'Alice', '250', '1');
insert into queue (person_id, person_name, weight, turn)
values ('4', 'Bob', '175', '5');
insert into queue (person_id, person_name, weight, turn)
values ('3', 'Alex', '350', '2');
insert into queue (person_id, person_name, weight, turn)
values ('6', 'John Cena', '400', '3');
insert into queue (person_id, person_name, weight, turn)
values ('1', 'Winston', '500', '6');
insert into queue (person_id, person_name, weight, turn)
values ('2', 'Marie', '200', '4');

-- Solution
with cte as (select *, sum(weight) over (order by turn asc rows unbounded preceding) as cumulative_weigth
             from queue
             order by turn asc)
select person_name
from cte
where cumulative_weigth <= 1000
order by turn desc
limit 1;
-- Solution
