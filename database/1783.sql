create table players
(
    player_id   int,
    player_name text
);

insert into players (player_id, player_name)
values (1, 'Nadal'),
       (2, 'Federer'),
       (3, 'Novak');

create table championships
(
    year      int,
    wimbledon int,
    fr_open   int,
    us_open   int,
    au_open   int
);

insert into championships (year, wimbledon, fr_open, us_open, au_open)
values (2018, 1, 1, 1, 1),
       (2019, 1, 1, 2, 2),
       (2020, 2, 1, 2, 2);

-- Solution
with cte as (select *
             from players
                      inner join championships on players.player_id = championships.wimbledon
             union all
             select *
             from players
                      inner join championships on players.player_id = championships.fr_open
             union all
             select *
             from players
                      inner join championships on players.player_id = championships.us_open
             union all
             select *
             from players
                      inner join championships on players.player_id = championships.au_open)
select count(*) as grand_slams_count, player_id, player_name
from cte
group by cte.player_id, cte.player_name;
-- Solution
