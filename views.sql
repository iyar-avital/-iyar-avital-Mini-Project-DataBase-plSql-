/*--------------- UNIT1 ---------------*/
create view daily_Planner as(
select trunc(M.MEETDATE) AS meeting_date,
           M.counselorid AS id,
           CONCAT(CONCAT(P1.FIRSTNAME, ' '), P1.LASTNAME) AS name,
           count(COUNSELORID) AS num_daily_meeting,
           'counselor' AS role
    from meeting M, counselor C, person P1
    where P1.PERSONID = M.COUNSELORID and 
          C.PERSONID = P1.PERSONID
    group by M.COUNSELORID, M.MEETDATE, P1.FIRSTNAME, P1.LASTNAME
UNION
select trunc(M.MEETDATE) AS meeting_date,
           M.PERSONID AS id,
           CONCAT(CONCAT(P1.FIRSTNAME, ' '), P1.LASTNAME) AS name,
           count(M.PERSONID) AS num_daily_meeting,
           'interested' AS role
    from meeting M, interested I, person P1
    where P1.PERSONID = M.PERSONID and 
          I.PERSONID_ = P1.PERSONID
    group by M.PERSONID, M.MEETDATE, P1.FIRSTNAME, P1.LASTNAME
);


select *
from daily_Planner


/*--------------- UNIT2 ---------------*/
create view Test_Schedule as(
select Examdate, examname, coursename,typeofexam,timeofexam, 
count(s.studentid ) as Number_of_examinees  
from exam e natural join course c
     natural join studenttakecourse s
     natural join courseinsemester co
where moed = 'A' and -- selected moed
semester= 'A' -- selected semester
group by examdate, examname, coursename,typeofexam,timeofexam

UNION 

select Examdate, examname, coursename,typeofexam,timeofexam, 
0 as Number_of_examinees  
from exam e natural join course c
     natural join courseinsemester co
where courseid not in (select courseid from studenttakecourse) and
moed = 'A' and -- selected moed
semester= 'A' -- selected semester
group by examdate, examname, coursename,typeofexam,timeofexam);


select * 
from test_schedule
