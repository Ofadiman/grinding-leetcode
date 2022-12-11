create table if not exists candidates
(
    employee_id int,
    experience  text,
    salary      int
);
truncate table candidates;
insert into candidates (employee_id, experience, salary)
values ('1', 'Junior', '10000');
insert into candidates (employee_id, experience, salary)
values ('9', 'Junior', '10000');
insert into candidates (employee_id, experience, salary)
values ('2', 'Senior', '20000');
insert into candidates (employee_id, experience, salary)
values ('11', 'Senior', '20000');
insert into candidates (employee_id, experience, salary)
values ('13', 'Senior', '50000');
insert into candidates (employee_id, experience, salary)
values ('4', 'Junior', '40000');

-- Solution
with candidates_with_cumulative_salary as (select *,
                                                  sum(salary)
                                                  over (partition by experience order by salary rows unbounded preceding) as cumulative_salary
                                           from candidates),
     seniors_to_hire as (select *
                         from candidates_with_cumulative_salary
                         where experience = 'Senior'
                           and candidates_with_cumulative_salary.cumulative_salary < 70000),
     total_spent_on_seniors as (select coalesce(sum(salary), 0) as value from seniors_to_hire),
     money_left_for_juniors as (select 70000 - total_spent_on_seniors.value as value from total_spent_on_seniors),
     juniors_with_salary_diff as (select *, value - cumulative_salary as diff
                                  from candidates_with_cumulative_salary
                                           inner join money_left_for_juniors on true
                                  where experience = 'Junior'),
     juniors_to_hire as (select * from juniors_with_salary_diff where diff > 0)
select 'Seniors' as experience, coalesce(count(*), 0) as accepted_candidates
from seniors_to_hire
union
select 'Juniors' as experience, count(*) as accepted_candidates
from juniors_to_hire;
-- Solution
