create table if not exists keywords
(
    topic_id int,
    word     varchar(25)
);
create table if not exists posts
(
    post_id int,
    content varchar(100)
);
truncate table keywords;
insert into keywords (topic_id, word)
values ('1', 'handball');
insert into keywords (topic_id, word)
values ('1', 'football');
insert into keywords (topic_id, word)
values ('3', 'WAR');
insert into keywords (topic_id, word)
values ('2', 'Vaccine');
truncate table posts;
insert into posts (post_id, content)
values ('1', 'We call it soccer They call it football hahaha');
insert into posts (post_id, content)
values ('2', 'Americans prefer basketball while Europeans love handball and football');
insert into posts (post_id, content)
values ('3', 'stop the war and play handball');
insert into posts (post_id, content)
values ('4', 'warning I planted some flowers this morning and then got vaccinated');

-- Solution
with cte as (select post_id, array_agg(distinct coalesce(topic_id::text, 'Ambiguous!')) as topics
             from posts
                      left join keywords on (posts.content ilike concat(keywords.word, ' ', '%') or
                                             posts.content ilike concat('% ', keywords.word, ' %') or
                                             posts.content ilike concat('% ', keywords.word))
             group by post_id)
select post_id, array_to_string(topics, ',')
from cte;
-- Solution
