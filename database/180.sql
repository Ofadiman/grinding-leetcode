create table if not exists logs
(
    id  int,
    num int
);
truncate table logs;
insert into logs (id, num)
values ('1', '1');
insert into logs (id, num)
values ('2', '1');
insert into logs (id, num)
values ('3', '1');
insert into logs (id, num)
values ('4', '2');
insert into logs (id, num)
values ('5', '1');
insert into logs (id, num)
values ('6', '2');
insert into logs (id, num)
values ('7', '2');

-- Solution
select distinct l1.num as consecutive_number
from logs l1
         inner join logs l2 on (l1.id = l2.id + 1)
         inner join logs l3 on (l2.id = l3.id + 1)
where l1.num = l2.num
  and l2.num = l3.num;
-- Solution
