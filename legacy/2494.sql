create table if not exists hall_events
(
    hall_id   int,
    start_day date,
    end_day   date
);
truncate table hall_events;
insert into hall_events (hall_id, start_day, end_day)
values ('1', '2023-01-13', '2023-01-14');
insert into hall_events (hall_id, start_day, end_day)
values ('1', '2023-01-14', '2023-01-17');
insert into hall_events (hall_id, start_day, end_day)
values ('1', '2023-01-18', '2023-01-25');
insert into hall_events (hall_id, start_day, end_day)
values ('2', '2022-12-09', '2022-12-23');
insert into hall_events (hall_id, start_day, end_day)
values ('2', '2022-12-13', '2022-12-17');
insert into hall_events (hall_id, start_day, end_day)
values ('3', '2022-12-01', '2023-01-30');

-- Solution
with prepared_data as (select *,
                              lag(start_day) over (partition by hall_id order by start_day asc) as previous_start_day,
                              lag(end_day) over (partition by hall_id order by start_day asc)   as previous_end_day,
                              row_number() over ()                                              as id,
                              row_number() over (partition by hall_id order by start_day asc)   as partition_id
                       from hall_events),
     grouped_data as (select *, id - partition_id as group_id
                      from prepared_data
                      where concat('[', start_day, ',', end_day, ']')::daterange &&
                            concat('[', previous_start_day, ',', previous_end_day, ']')::daterange),
     merged_events as (select hall_id, min(start_day) as start_day, max(end_day) as end_date
                       from grouped_data
                       group by hall_id, group_id),
     not_merged_events as (select hall_events.hall_id, hall_events.start_day, hall_events.end_day
                           from hall_events,
                                merged_events
                           where hall_events.hall_id = merged_events.hall_id
                             and not (concat('[', hall_events.start_day, ',', hall_events.end_day, ']')::daterange &&
                                      concat('[', merged_events.start_day, ',', merged_events.end_date, ']')::daterange))
select hall_id, start_day, end_date
from merged_events
union
select hall_id, start_day, end_day
from not_merged_events
order by hall_id, start_day, end_date;
-- Solution
