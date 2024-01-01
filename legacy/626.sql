create table seats
(
    id      int,
    student varchar
);

insert into seats (id, student)
values (1, 'Abbot'),
       (2, 'Doris'),
       (3, 'Emerson'),
       (4, 'Green'),
       (5, 'James');

-- Solution
with cte as (select id, student, lag(student) over () as previous_student, lead(student) over () as next_student
             from seats)
select id,
       case
           when cte.next_student is null and id % 2 = 1 then cte.student
           when id % 2 = 1 then cte.next_student
           else cte.previous_student end as student
from cte;
-- Solution
