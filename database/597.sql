create table if not exists friend_request
(
    sender_id    int,
    send_to_id   int,
    request_date date
);
create table if not exists request_accepted
(
    requester_id int,
    accepter_id  int,
    accept_date  date
);
truncate table friend_request;
insert into friend_request (sender_id, send_to_id, request_date)
values ('1', '2', '2016/06/01');
insert into friend_request (sender_id, send_to_id, request_date)
values ('1', '3', '2016/06/01');
insert into friend_request (sender_id, send_to_id, request_date)
values ('1', '4', '2016/06/01');
insert into friend_request (sender_id, send_to_id, request_date)
values ('2', '3', '2016/06/02');
insert into friend_request (sender_id, send_to_id, request_date)
values ('3', '4', '2016/06/09');
truncate table request_accepted;
insert into request_accepted (requester_id, accepter_id, accept_date)
values ('1', '2', '2016/06/03');
insert into request_accepted (requester_id, accepter_id, accept_date)
values ('1', '3', '2016/06/08');
insert into request_accepted (requester_id, accepter_id, accept_date)
values ('2', '3', '2016/06/08');
insert into request_accepted (requester_id, accepter_id, accept_date)
values ('3', '4', '2016/06/09');
insert into request_accepted (requester_id, accepter_id, accept_date)
values ('3', '4', '2016/06/10');

-- Solution
with all_requests_count as (select count(*) as count
                            from friend_request),
     accepted_requests_count as (select count(distinct (requester_id, accepter_id)) as count
                                 from request_accepted)
select coalesce(round(accepted_requests_count.count::numeric / all_requests_count.count::numeric, 2), 0) as accept_rate
from all_requests_count
         join accepted_requests_count on true;
-- Solution
