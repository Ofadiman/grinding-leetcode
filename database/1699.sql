create table calls
(
    from_id  int,
    to_id    int,
    duration int
);

insert into calls (from_id, to_id, duration)
values (1, 2, 59),
       (2, 1, 11),
       (1, 3, 20),
       (3, 4, 100),
       (3, 4, 200),
       (3, 4, 200),
       (4, 3, 499);

-- Solution
select case when from_id > to_id then from_id else to_id end as person1,
       case when from_id > to_id then to_id else from_id end as person2,
       sum(duration)                                         as total_duration,
       count(*)                                              as call_count
from calls
group by person1, person2;
-- Solution
