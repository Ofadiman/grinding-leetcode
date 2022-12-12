create table if not exists candidates
(
    candidate_id int,
    name         varchar(30),
    years_of_exp int,
    interview_id int
);
create table if not exists rounds
(
    interview_id int,
    round_id     int,
    score        int
);
truncate table candidates;
insert into candidates (candidate_id, name, years_of_exp, interview_id)
values ('11', 'Atticus', '1', '101');
insert into candidates (candidate_id, name, years_of_exp, interview_id)
values ('9', 'Ruben', '6', '104');
insert into candidates (candidate_id, name, years_of_exp, interview_id)
values ('6', 'Aliza', '10', '109');
insert into candidates (candidate_id, name, years_of_exp, interview_id)
values ('8', 'Alfredo', '0', '107');
truncate table rounds;
insert into rounds (interview_id, round_id, score)
values ('109', '3', '4');
insert into rounds (interview_id, round_id, score)
values ('101', '2', '8');
insert into rounds (interview_id, round_id, score)
values ('109', '4', '1');
insert into rounds (interview_id, round_id, score)
values ('107', '1', '3');
insert into rounds (interview_id, round_id, score)
values ('104', '3', '6');
insert into rounds (interview_id, round_id, score)
values ('109', '1', '4');
insert into rounds (interview_id, round_id, score)
values ('104', '4', '7');
insert into rounds (interview_id, round_id, score)
values ('104', '1', '2');
insert into rounds (interview_id, round_id, score)
values ('109', '2', '1');
insert into rounds (interview_id, round_id, score)
values ('104', '2', '7');
insert into rounds (interview_id, round_id, score)
values ('107', '2', '3');
insert into rounds (interview_id, round_id, score)
values ('101', '1', '8');

-- Solution
select candidate_id
from rounds
         inner join candidates using (interview_id)
where years_of_exp >= 2
group by candidate_id
having sum(score) > 15;
-- Solution
