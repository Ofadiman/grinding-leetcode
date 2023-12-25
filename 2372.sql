create table salesperson
(
    salesperson_id int,
    name           text
);

insert into salesperson (salesperson_id, name)
values (1, 'Alice'),
       (2, 'Bob'),
       (3, 'Jerry');

create table customer
(
    customer_id    int,
    salesperson_id int
);

insert into customer (customer_id, salesperson_id)
values (1, 1),
       (2, 1),
       (3, 2);

create table sales
(
    sale_id     int,
    customer_id int,
    price       int
);

insert into sales (sale_id, customer_id, price)
values (1, 2, 892),
       (2, 1, 354),
       (3, 3, 988),
       (4, 3, 856);

-- Solution
select distinct salesperson.salesperson_id,
                name,
                sum(coalesce(sales.price, 0)) over (partition by salesperson.salesperson_id) as total
from salesperson
         left join customer on salesperson.salesperson_id = customer.salesperson_id
         left join sales on customer.customer_id = sales.customer_id;
-- Solution
