create table if not exists salaries
(
    company_id    int,
    employee_id   int,
    employee_name varchar(13),
    salary        int
);
truncate table salaries;
insert into salaries (company_id, employee_id, employee_name, salary)
values ('1', '1', 'Tony', '2000');
insert into salaries (company_id, employee_id, employee_name, salary)
values ('1', '2', 'Pronub', '21300');
insert into salaries (company_id, employee_id, employee_name, salary)
values ('1', '3', 'Tyrrox', '10800');
insert into salaries (company_id, employee_id, employee_name, salary)
values ('2', '1', 'Pam', '300');
insert into salaries (company_id, employee_id, employee_name, salary)
values ('2', '7', 'Bassem', '450');
insert into salaries (company_id, employee_id, employee_name, salary)
values ('2', '9', 'Hermione', '700');
insert into salaries (company_id, employee_id, employee_name, salary)
values ('3', '7', 'Bocaben', '100');
insert into salaries (company_id, employee_id, employee_name, salary)
values ('3', '2', 'Ognjen', '2200');
insert into salaries (company_id, employee_id, employee_name, salary)
values ('3', '13', 'Nyancat', '3300');
insert into salaries (company_id, employee_id, employee_name, salary)
values ('3', '15', 'Morninngcat', '7777');

-- Solution
with cte as (select company_id,
                    case
                        when max(salary) < 1000 then 0
                        when max(salary) >= 1000 and max(salary) <= 10000 then 24
                        else 49 end as tax_rate
             from salaries
             group by company_id)
select company_id, employee_id, employee_name, round(salary::numeric * (100 - tax_rate) / 100) as salary
from salaries
         inner join cte using (company_id);
-- Solution
