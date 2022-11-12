create table courses
(
    student varchar,
    class   varchar
);

insert into courses (student, class)
values ('A', 'Math'),
       ('B', 'English'),
       ('C', 'Math'),
       ('D', 'Biology'),
       ('E', 'Math'),
       ('F', 'Computer'),
       ('G', 'Math'),
       ('H', 'Math'),
       ('I', 'Math');

-- Solution 1
select class
from courses
group by class
having count(student) >= 5;
-- Solution 1
