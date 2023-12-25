create table if not exists customers
(
    customer_id   int,
    customer_name varchar(20),
    email         varchar(30)
);
create table if not exists contacts
(
    user_id       int,
    contact_name  varchar(20),
    contact_email varchar(30)
);
create table if not exists invoices
(
    invoice_id int,
    price      int,
    user_id    int
);
truncate table customers;
insert into customers (customer_id, customer_name, email)
values ('1', 'Alice', 'alice@leetcode.com');
insert into customers (customer_id, customer_name, email)
values ('2', 'Bob', 'bob@leetcode.com');
insert into customers (customer_id, customer_name, email)
values ('13', 'John', 'john@leetcode.com');
insert into customers (customer_id, customer_name, email)
values ('6', 'Alex', 'alex@leetcode.com');
truncate table contacts;
insert into contacts (user_id, contact_name, contact_email)
values ('1', 'Bob', 'bob@leetcode.com');
insert into contacts (user_id, contact_name, contact_email)
values ('1', 'John', 'john@leetcode.com');
insert into contacts (user_id, contact_name, contact_email)
values ('1', 'Jal', 'jal@leetcode.com');
insert into contacts (user_id, contact_name, contact_email)
values ('2', 'Omar', 'omar@leetcode.com');
insert into contacts (user_id, contact_name, contact_email)
values ('2', 'Meir', 'meir@leetcode.com');
insert into contacts (user_id, contact_name, contact_email)
values ('6', 'Alice', 'alice@leetcode.com');
truncate table invoices;
insert into invoices (invoice_id, price, user_id)
values ('77', '100', '1');
insert into invoices (invoice_id, price, user_id)
values ('88', '200', '1');
insert into invoices (invoice_id, price, user_id)
values ('99', '300', '2');
insert into invoices (invoice_id, price, user_id)
values ('66', '400', '2');
insert into invoices (invoice_id, price, user_id)
values ('55', '500', '13');
insert into invoices (invoice_id, price, user_id)
values ('44', '60', '6');

-- Solution
with all_contacts as (select customer_id, count(contacts.user_id) as count
                      from customers
                               left join contacts on customers.customer_id = contacts.user_id
                      group by customer_id),
     trusted_contacts as (select customer_id, count(*) as count
                          from customers
                                   left join contacts on customers.customer_id = contacts.user_id
                          where contacts.contact_email in (select email from customers)
                          group by customer_id)
select invoice_id,
       customer_name,
       price,
       coalesce(all_contacts.count, 0)     as contacts_cnt,
       coalesce(trusted_contacts.count, 0) as trusted_contacts_cnt
from invoices
         left join all_contacts on invoices.user_id = all_contacts.customer_id
         left join trusted_contacts on invoices.user_id = trusted_contacts.customer_id
         inner join customers on invoices.user_id = customers.customer_id
order by invoice_id;
-- Solution
