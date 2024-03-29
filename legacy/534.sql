create table if not exists activity
(
    player_id    int,
    device_id    int,
    event_date   date,
    games_played int
);
truncate table activity;
insert into activity (player_id, device_id, event_date, games_played)
values ('1', '2', '2016-03-01', '5');
insert into activity (player_id, device_id, event_date, games_played)
values ('1', '2', '2016-05-02', '6');
insert into activity (player_id, device_id, event_date, games_played)
values ('1', '3', '2017-06-25', '1');
insert into activity (player_id, device_id, event_date, games_played)
values ('3', '1', '2016-03-02', '0');
insert into activity (player_id, device_id, event_date, games_played)
values ('3', '4', '2018-07-03', '5');

-- Solution
select player_id,
       event_date,
       sum(games_played)
       over (partition by player_id order by event_date rows unbounded preceding) as games_played_so_far
from activity;
-- Solution
