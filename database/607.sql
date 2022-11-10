create table sales_people
(
    sales_person_id int,
    name            varchar,
    salary          int,
    commission_rate int,
    hire_date       date
);

insert into sales_people (sales_person_id, name, salary, commission_rate, hire_date)
values (1, 'John', 100000, 6, '4/1/2006'),
       (2, 'Amy', 12000, 5, '5/1/2010'),
       (3, 'Mark', 65000, 12, '12/25/2008'),
       (4, 'Pam', 25000, 25, '1/1/2005'),
       (5, 'Alex', 5000, 10, '2/3/2007');

create table companies
(
    company_id int,
    name       varchar,
    city       varchar
);

insert into companies (company_id, name, city)
values (1, 'RED', 'Boston'),
       (2, 'ORANGE', 'New York'),
       (3, 'YELLOW', 'Boston'),
       (4, 'GREEN', 'Austin');

create table orders
(
    order_id        int,
    order_date      date,
    company_id      int,
    sales_person_id int,
    amount          int
);

insert into orders (order_id, order_date, company_id, sales_person_id, amount)
values (1, '1/1/2014', 3, 4, 10000),
       (2, '2/1/2014', 4, 5, 5000),
       (3, '3/1/2014', 1, 1, 50000),
       (4, '4/1/2014', 1, 4, 25000);

-- Solution 1
with red_company_sales_person_ids as (select sales_people.sales_person_id
                                      from sales_people
                                               left join orders using (sales_person_id)
                                               left join companies using (company_id)
                                      where companies.name = 'RED')
select name
from sales_people
where sales_person_id not in
      (select red_company_sales_person_ids.sales_person_id from red_company_sales_person_ids);
-- Solution 1

-- Solution 2
select sales_people.name
from orders
         inner join companies on (orders.company_id = companies.company_id and companies.name = 'RED')
         right join sales_people using (sales_person_id)
where orders.sales_person_id is null;
-- Solution 2
