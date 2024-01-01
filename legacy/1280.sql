create table if not exists students
(
    student_id   int,
    student_name varchar(20)
);
create table if not exists subjects
(
    subject_name varchar(20)
);
create table if not exists examinations
(
    student_id   int,
    subject_name varchar(20)
);
truncate table students;
insert into students (student_id, student_name)
values ('1', 'Alice');
insert into students (student_id, student_name)
values ('2', 'Bob');
insert into students (student_id, student_name)
values ('13', 'John');
insert into students (student_id, student_name)
values ('6', 'Alex');
truncate table subjects;
insert into subjects (subject_name)
values ('Math');
insert into subjects (subject_name)
values ('Physics');
insert into subjects (subject_name)
values ('Programming');
truncate table examinations;
insert into examinations (student_id, subject_name)
values ('1', 'Math');
insert into examinations (student_id, subject_name)
values ('1', 'Physics');
insert into examinations (student_id, subject_name)
values ('1', 'Programming');
insert into examinations (student_id, subject_name)
values ('2', 'Programming');
insert into examinations (student_id, subject_name)
values ('1', 'Physics');
insert into examinations (student_id, subject_name)
values ('1', 'Math');
insert into examinations (student_id, subject_name)
values ('13', 'Math');
insert into examinations (student_id, subject_name)
values ('13', 'Programming');
insert into examinations (student_id, subject_name)
values ('13', 'Physics');
insert into examinations (student_id, subject_name)
values ('2', 'Math');
insert into examinations (student_id, subject_name)
values ('1', 'Math');

-- Solution
select students.student_id,
       students.student_name,
       subjects.subject_name,
       coalesce(count(examinations.student_id), 0) as attended_exams
from students
         join subjects on true
         left join examinations on students.student_id = examinations.student_id and
                                   subjects.subject_name = examinations.subject_name
group by students.student_id, students.student_name, subjects.subject_name
order by students.student_id;
-- Solution
