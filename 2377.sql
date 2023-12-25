create table if not exists olympic
(
    country       varchar(50),
    gold_medals   int,
    silver_medals int,
    bronze_medals int
);
truncate table olympic;
insert into olympic (country, gold_medals, silver_medals, bronze_medals)
values ('China', '10', '10', '20');
insert into olympic (country, gold_medals, silver_medals, bronze_medals)
values ('South Sudan', '0', '0', '1');
insert into olympic (country, gold_medals, silver_medals, bronze_medals)
values ('USA', '10', '10', '20');
insert into olympic (country, gold_medals, silver_medals, bronze_medals)
values ('Israel', '2', '2', '3');
insert into olympic (country, gold_medals, silver_medals, bronze_medals)
values ('Egypt', '2', '2', '2');

-- Solution
select *
from olympic
order by gold_medals desc, silver_medals desc, bronze_medals desc, country;
-- Solution
