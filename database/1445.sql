create table sales
(
    sale_date date,
    fruit     text,
    sold_num  int
);

insert into sales (sale_date, fruit, sold_num)
values ('2020-05-01', 'apples', 10),
       ('2020-05-01', 'oranges', 8),
       ('2020-05-02', 'apples', 15),
       ('2020-05-02', 'oranges', 15),
       ('2020-05-03', 'apples', 20),
       ('2020-05-03', 'oranges', 0),
       ('2020-05-04', 'apples', 15),
       ('2020-05-04', 'oranges', 16);

-- Solution
select sum(case when fruit = 'apples' then sold_num else -sold_num end) as diff, sale_date
from sales
group by sale_date
order by sale_date;
-- Solution
