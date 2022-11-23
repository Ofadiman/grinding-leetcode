create table tree
(
    id        int,
    parent_id int
);

insert into tree (id, parent_id)
values (1, null),
       (2, 1),
       (3, 1),
       (4, 2),
       (5, 2);

-- Solution
select distinct tree1.id,
                case
                    when tree1.parent_id is null then 'Root'
                    when tree1.parent_id is not null and tree2.id is null then 'Leaf'
                    else 'Inner'
                    end
                    as type
from tree as tree1
         left join tree as tree2 on tree1.id = tree2.parent_id
order by tree1.id;
-- Solution
