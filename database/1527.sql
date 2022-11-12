create table patients
(
    patient_id   int,
    patient_name varchar,
    conditions   varchar
);

insert into patients (patient_id, patient_name, conditions)
values (1, 'Daniel', 'YFEV COUGH'),
       (2, 'Alice', null),
       (3, 'Bob', 'DIAB100 MYOP'),
       (4, 'George', 'ACNE DIAB100'),
       (5, 'Alain', 'DIAB201');

-- Solution 1
with cte as (select patient_id, patient_name, unnest(coalesce(string_to_array(conditions, ' '), '{}')) as condition
             from patients)
select cte.patient_id, cte.patient_name
from cte
where cte.condition like 'DIAB1%'
group by cte.patient_id, cte.patient_name;
-- Solution 1

-- Solution 2
select *
from patients
where patients.conditions ~ ' DIAB1.*'
   or patients.conditions ~ 'DIAB1.*';
-- Solution 2

-- Solution 3
select *
from patients
where patients.conditions like '% DIAB1%'
   or patients.conditions like 'DIAB1%';
-- Solution 3
