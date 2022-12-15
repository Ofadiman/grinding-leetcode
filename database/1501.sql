create table if not exists person
(
    id           int,
    name         varchar(15),
    phone_number varchar(11)
);
create table if not exists country
(
    name         varchar(15),
    country_code varchar(3)
);
create table if not exists calls
(
    caller_id int,
    callee_id int,
    duration  int
);
truncate table person;
insert into person (id, name, phone_number)
values ('3', 'Jonathan', '051-1234567');
insert into person (id, name, phone_number)
values ('12', 'Elvis', '051-7654321');
insert into person (id, name, phone_number)
values ('1', 'Moncef', '212-1234567');
insert into person (id, name, phone_number)
values ('2', 'Maroua', '212-6523651');
insert into person (id, name, phone_number)
values ('7', 'Meir', '972-1234567');
insert into person (id, name, phone_number)
values ('9', 'Rachel', '972-0011100');
truncate table country;
insert into country (name, country_code)
values ('Peru', '051');
insert into country (name, country_code)
values ('Israel', '972');
insert into country (name, country_code)
values ('Morocco', '212');
insert into country (name, country_code)
values ('Germany', '049');
insert into country (name, country_code)
values ('Ethiopia', '251');
truncate table calls;
insert into calls (caller_id, callee_id, duration)
values ('1', '9', '33');
insert into calls (caller_id, callee_id, duration)
values ('2', '9', '4');
insert into calls (caller_id, callee_id, duration)
values ('1', '2', '59');
insert into calls (caller_id, callee_id, duration)
values ('3', '12', '102');
insert into calls (caller_id, callee_id, duration)
values ('3', '12', '330');
insert into calls (caller_id, callee_id, duration)
values ('12', '3', '5');
insert into calls (caller_id, callee_id, duration)
values ('7', '9', '13');
insert into calls (caller_id, callee_id, duration)
values ('7', '1', '3');
insert into calls (caller_id, callee_id, duration)
values ('9', '7', '1');
insert into calls (caller_id, callee_id, duration)
values ('1', '7', '7');

-- Solution
with all_calls as (select caller_id as user_id, country.name as country, duration
                   from calls
                            inner join person on calls.caller_id = person.id
                            inner join country on substring(phone_number from 0 for 4) = country.country_code
                   union
                   select callee_id as user_id, country.name as country, duration
                   from calls
                            inner join person on calls.callee_id = person.id
                            inner join country on substring(phone_number from 0 for 4) = country.country_code),
     average_global_calls as (select avg(duration) from all_calls),
     average_country_calls as (select country, avg(duration) as duration
                               from all_calls
                               group by country)
select country
from average_country_calls
where average_country_calls.duration > (select * from average_global_calls);
-- Solution
