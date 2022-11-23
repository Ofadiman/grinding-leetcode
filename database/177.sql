create table employees
(
    id     int,
    salary int
);

insert into employees (id, salary)
values (1, 100),
       (2, 200),
       (3, 300);

-- Solution
create function get_nth_highest_value(table_name regclass, column_name text, n integer)
    returns int
    language plpgsql
as
$$
declare
    highest_value integer;
begin
    execute format(
                        'with cte as (select *, dense_rank() over (order by %s desc) as dense_ranked from %s) ' ||
                        'select %s ' ||
                        'from cte ' ||
                        'where cte.dense_ranked = %s;',
                        column_name, table_name, column_name, n) into highest_value;
    return highest_value;
end;
$$;

select get_nth_highest_value('employees', 'salary', 2);
-- Solution
