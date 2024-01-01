create table if not exists tasks
(
    task_id        int,
    subtasks_count int
);
create table if not exists executed
(
    task_id    int,
    subtask_id int
);
truncate table tasks;
insert into tasks (task_id, subtasks_count)
values ('1', '3');
insert into tasks (task_id, subtasks_count)
values ('2', '2');
insert into tasks (task_id, subtasks_count)
values ('3', '4');
truncate table executed;
insert into executed (task_id, subtask_id)
values ('1', '2');
insert into executed (task_id, subtask_id)
values ('3', '1');
insert into executed (task_id, subtask_id)
values ('3', '2');
insert into executed (task_id, subtask_id)
values ('3', '3');
insert into executed (task_id, subtask_id)
values ('3', '4');

-- Solution
with recursive cte(task_id, subtask_id) as (select task_id, subtasks_count as subtask_id
                                            from tasks
                                            union all
                                            select task_id, subtask_id - 1 as subtask_id
                                            from cte
                                            where subtask_id > 1)
select *
from cte
except
select *
from executed
order by task_id, subtask_id;
-- Solution
