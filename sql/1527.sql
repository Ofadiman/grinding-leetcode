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

-- Solution
with cte as (select patient_id, patient_name, unnest(coalesce(string_to_array(conditions, ' '), '{}')) as condition
             from patients)
select cte.patient_id, cte.patient_name
from cte
where cte.condition like 'DIAB1%'
group by cte.patient_id, cte.patient_name;
-- Solution
