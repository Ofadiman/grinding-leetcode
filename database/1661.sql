create table if not exists activity
(
    machine_id    int,
    process_id    int,
    activity_type text,
    timestamp     numeric
);
truncate table activity;
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('0', '0', 'start', '0.712');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('0', '0', 'end', '1.52');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('0', '1', 'start', '3.14');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('0', '1', 'end', '4.12');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('1', '0', 'start', '0.55');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('1', '0', 'end', '1.55');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('1', '1', 'start', '0.43');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('1', '1', 'end', '1.42');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('2', '0', 'start', '4.1');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('2', '0', 'end', '4.512');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('2', '1', 'start', '2.5');
insert into activity (machine_id, process_id, activity_type, timestamp)
values ('2', '1', 'end', '5');

-- Solution
select machine_id,
       round(sum(case when activity_type = 'start' then -timestamp else timestamp end) /
             count(*) filter ( where activity_type = 'start' ), 3)
from activity
group by machine_id;
-- Solution
