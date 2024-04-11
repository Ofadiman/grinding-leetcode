create table if not exists students
(
    student_id    int,
    department_id int,
    mark          int
);
truncate table students;
insert into students (student_id, department_id, mark)
values ('2', '2', '650');
insert into students (student_id, department_id, mark)
values ('8', '2', '650');
insert into students (student_id, department_id, mark)
values ('7', '1', '920');
insert into students (student_id, department_id, mark)
values ('1', '1', '610');
insert into students (student_id, department_id, mark)
values ('3', '1', '530');

-- Solution
select student_id,
       department_id,
       round((percent_rank() over (partition by department_id order by mark desc)::numeric * 100::numeric),
             2) as percentage
from students;
-- Solution
