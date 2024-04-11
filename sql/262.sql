create table trips
(
    id         int,
    client_id  int,
    driver_id  int,
    city_id    int,
    status     text,
    request_at date
);

insert into trips (id, client_id, driver_id, city_id, status, request_at)
values (1, 1, 10, 1, 'completed', '2013-10-01'),
       (2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
       (3, 3, 12, 6, 'completed', '2013-10-01'),
       (4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
       (5, 1, 10, 1, 'completed', '2013-10-02'),
       (6, 2, 11, 6, 'completed', '2013-10-02'),
       (7, 3, 12, 6, 'completed', '2013-10-02'),
       (8, 2, 12, 12, 'completed', '2013-10-03'),
       (9, 3, 10, 12, 'completed', '2013-10-03'),
       (10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');

create table users
(
    users_id int,
    banned   text,
    role     text
);

insert into users (users_id, banned, role)
values (1, 'No', 'client'),
       (2, 'Yes', 'client'),
       (3, 'No', 'client'),
       (4, 'No', 'client'),
       (10, 'No', 'driver'),
       (11, 'No', 'driver'),
       (12, 'No', 'driver'),
       (13, 'No', 'driver');

-- Solution
with cte as (select *,
                    count(request_at) over (partition by request_at)                                as total_rides,
                    count(case when status = 'completed' then 1 end) over (partition by request_at) as completed_rides
             from trips
                      inner join users as clients on (clients.users_id = trips.client_id and clients.role = 'client')
                      inner join users as drivers on (drivers.users_id = trips.driver_id and drivers.role = 'driver')
             where clients.banned = 'No'
               and drivers.banned = 'No')
select distinct cte.request_at,
                trunc((cte.total_rides::numeric - cte.completed_rides::numeric) / cte.total_rides::numeric,
                      2) as cancellation_rate
from cte;
-- Solution
