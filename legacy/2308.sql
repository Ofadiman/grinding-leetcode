create table if not exists genders
(
    user_id int,
    gender  text
);
truncate table genders;
insert into genders (user_id, gender)
values ('4', 'male');
insert into genders (user_id, gender)
values ('7', 'female');
insert into genders (user_id, gender)
values ('2', 'other');
insert into genders (user_id, gender)
values ('5', 'male');
insert into genders (user_id, gender)
values ('3', 'female');
insert into genders (user_id, gender)
values ('8', 'male');
insert into genders (user_id, gender)
values ('6', 'other');
insert into genders (user_id, gender)
values ('1', 'other');
insert into genders (user_id, gender)
values ('9', 'female');

-- Solution
select *
from genders
order by row_number() over (partition by gender order by user_id), array_position(array ['female', 'other', 'male'], gender);
-- Solution
