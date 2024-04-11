create table daily_sales
(
    date_id    date,
    make_name  varchar,
    lead_id    int,
    partner_id int
);

insert into daily_sales (date_id, make_name, lead_id, partner_id)
values ('2020-12-8', 'toyota', 0, 1),
       ('2020-12-8', 'toyota', 1, 0),
       ('2020-12-8', 'toyota', 1, 2),
       ('2020-12-7', 'toyota', 0, 2),
       ('2020-12-7', 'toyota', 0, 1),
       ('2020-12-8', 'honda', 1, 2),
       ('2020-12-8', 'honda', 2, 1),
       ('2020-12-7', 'honda', 0, 1),
       ('2020-12-7', 'honda', 1, 2),
       ('2020-12-7', 'honda', 2, 1);

-- Solution
select date_id, make_name, count(distinct lead_id) as unique_leads, count(distinct partner_id) as unique_partners
from daily_sales
group by date_id, make_name
order by make_name desc, date_id desc;
-- Solution
