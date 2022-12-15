create table if not exists triangle
(
    x int,
    y int,
    z int
);
truncate table triangle;
insert into triangle (x, y, z)
values ('13', '15', '30');
insert into triangle (x, y, z)
values ('10', '20', '15');
insert into triangle (x, y, z)
values ('10', '20', '30');

-- Solution
select *, case when (x >= y + z or y >= x + z or z >= x + y) then 'No' else 'Yes' end as triangle
from triangle;
-- Solution
