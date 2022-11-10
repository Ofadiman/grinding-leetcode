create table views
(
    article_id int  not null,
    author_id  int  not null,
    viewer_id  int  not null,
    view_date  date not null
);

insert into views (article_id, author_id, viewer_id, view_date)
values (1, 3, 5, '2019-08-01'),
       (1, 3, 6, '2019-08-02'),
       (2, 7, 7, '2019-08-01'),
       (2, 7, 6, '2019-08-02'),
       (4, 7, 1, '2019-07-22'),
       (3, 4, 4, '2019-07-21'),
       (3, 4, 4, '2019-07-21');

-- Solution 1
select distinct(author_id)
from views
where author_id = viewer_id
order by author_id;
-- Solution 1
