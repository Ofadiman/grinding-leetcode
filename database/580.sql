create table if not exists student
(
    student_id   int,
    student_name varchar(45),
    gender       varchar(6),
    dept_id      int
);
create table if not exists department
(
    dept_id   int,
    dept_name varchar(255)
);
truncate table student;
insert into student (student_id, student_name, gender, dept_id)
values ('1', 'Jack', 'M', '1');
insert into student (student_id, student_name, gender, dept_id)
values ('2', 'Jane', 'F', '1');
insert into student (student_id, student_name, gender, dept_id)
values ('3', 'Mark', 'M', '2');
truncate table department;
insert into department (dept_id, dept_name)
values ('1', 'Engineering');
insert into department (dept_id, dept_name)
values ('2', 'Science');
insert into department (dept_id, dept_name)
values ('3', 'Law');

-- Solution
select dept_name, coalesce(count(student_id), 0) as student_number
from department
         left join student using (dept_id)
group by dept_name
order by student_number desc, dept_name asc;
-- Solution
