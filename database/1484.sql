create table activities
(
    sell_date date not null,
    product   text not null
);

insert into activities (sell_date, product)
VALUES ('2020-05-30', 'Headphone'),
       ('2020-06-01', 'Pencil'),
       ('2020-06-02', 'Mask'),
       ('2020-05-30', 'Basketball'),
       ('2020-06-01', 'Bible'),
       ('2020-06-02', 'Mask'),
       ('2020-05-30', 'T-Shirt');

select *
from activities;

-- Solution
select sell_date,
       count(distinct product)                                            as total_sold,
       array_to_string(array_agg(distinct product order by product), ',') as products
from activities
group by sell_date
order by sell_date;
-- Solution

drop table activities;
