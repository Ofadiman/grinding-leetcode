create table if not exists elements
(
    symbol    varchar(2),
    type      text,
    electrons int
);
truncate table elements;
insert into elements (symbol, type, electrons)
values ('He', 'Noble', '0');
insert into elements (symbol, type, electrons)
values ('Na', 'Metal', '1');
insert into elements (symbol, type, electrons)
values ('Ca', 'Metal', '2');
insert into elements (symbol, type, electrons)
values ('La', 'Metal', '3');
insert into elements (symbol, type, electrons)
values ('Cl', 'Nonmetal', '1');
insert into elements (symbol, type, electrons)
values ('O', 'Nonmetal', '2');
insert into elements (symbol, type, electrons)
values ('N', 'Nonmetal', '3');

-- Solution
select e1.symbol as metal, e2.symbol as nonmetal
from elements e1
         inner join elements e2 on (e1.type = 'Metal' and e2.type = 'Nonmetal');
-- Solution
