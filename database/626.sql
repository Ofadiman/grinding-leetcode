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

-- Solution 1
with cte as (select id, student, lag(student) over () as previous_student, lead(student) over () as next_student
             from seats)
select id,
       case
           when cte.next_student is null and id % 2 = 1 then cte.student
           when id % 2 = 1 then cte.next_student
           else cte.previous_student end as student
from cte;
-- Solution 1

-- Solution 2
select case
           when seats.id % 2 = 1 and seats.id = (select count(*) from seats) then seats.id
           when seats.id % 2 = 0 then seats.id - 1
           else
               seats.id + 1
           end as id,
       student
from seats
order by id;
-- Solution 2

-- Solution 3
select id,
       coalesce(
               case
                   when id % 2 = 1 then lead(student, 1) over ()
                   else lag(student, 1) over () end,
               seats.student
           ) student
from seats;
-- Solution 3
