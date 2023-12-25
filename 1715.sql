create table if not exists boxes
(
    box_id       int,
    chest_id     int,
    apple_count  int,
    orange_count int
);
create table if not exists chests
(
    chest_id     int,
    apple_count  int,
    orange_count int
);
truncate table boxes;
insert into boxes (box_id, chest_id, apple_count, orange_count)
values ('2', null, '6', '15');
insert into boxes (box_id, chest_id, apple_count, orange_count)
values ('18', '14', '4', '15');
insert into boxes (box_id, chest_id, apple_count, orange_count)
values ('19', '3', '8', '4');
insert into boxes (box_id, chest_id, apple_count, orange_count)
values ('12', '2', '19', '20');
insert into boxes (box_id, chest_id, apple_count, orange_count)
values ('20', '6', '12', '9');
insert into boxes (box_id, chest_id, apple_count, orange_count)
values ('8', '6', '9', '9');
insert into boxes (box_id, chest_id, apple_count, orange_count)
values ('3', '14', '16', '7');
truncate table chests;
insert into chests (chest_id, apple_count, orange_count)
values ('6', '5', '6');
insert into chests (chest_id, apple_count, orange_count)
values ('14', '20', '10');
insert into chests (chest_id, apple_count, orange_count)
values ('2', '8', '8');
insert into chests (chest_id, apple_count, orange_count)
values ('3', '19', '4');
insert into chests (chest_id, apple_count, orange_count)
values ('16', '19', '19');

-- Solution
select sum(coalesce(boxes.apple_count, 0) + coalesce(chests.apple_count, 0))   as apple_count,
       sum(coalesce(boxes.orange_count, 0) + coalesce(chests.orange_count, 0)) as orange_count
from boxes
         left join chests using (chest_id);
-- Solution
