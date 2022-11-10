create table activities
(
    player_id    int  not null,
    device_id    int  not null,
    event_date   date not null,
    games_played int  not null
);

insert into activities (player_id, device_id, event_date, games_played)
values (1, 2, '2016-03-01', 5),
       (1, 2, '2016-05-02', 6),
       (2, 3, '2017-06-25', 1),
       (3, 1, '2016-03-02', 0),
       (3, 4, '2018-07-03', 5);

-- Solution 1
select player_id, min(event_date)
from activities
group by player_id;
-- Solution 1

-- Solution 2
with ranked_activities as (select player_id,
                                  event_date,
                                  rank() over (
                                      partition by player_id
                                      order by event_date
                                      ) as position
                           from activities)
select player_id, event_date as first_login
from ranked_activities
where position = 1;
-- Solution 2
