/*-------------------- UNIT1 --------------------*/
/*--------------- Query 1- select ---------------*/
select D1.name AS counselor, D2.name AS interested, 
       D2.meeting_date AS the_date
from DAILY_PLANNER D1, DAILY_PLANNER D2, PERSON P1, PERSON P2 
where D1.role <> D2.role and
      D1.id <> D2.id and
      D1.role = 'counselor' and /*provide duplicate in pair*/
      D1.id = P1.PERSONID and
      D2.id = P2.PERSONID and
      P2.LASTNAME = P1.LASTNAME and
      trunc(D1.meeting_date) = trunc(D2.meeting_date) and
      D1.num_daily_meeting = D2.num_daily_meeting;  

/*--------------- Query 2- select ---------------*/
select D.name AS name, trunc(D.meeting_date) AS meeting_date,
       trunc(P.BIRTHDATE) AS birthday_date
from DAILY_PLANNER D, PERSON P
where D.role = 'interested' and 
      D.id = P.PERSONID and
      extract(MONTH from P.BIRTHDATE) =
      extract(MONTH from D.meeting_date) and 
      extract(DAY from P.BIRTHDATE) =
      extract(DAY from D.meeting_date);  
      
     
/*--------------- Query 3- update ---------------*/ 
update DAILY_PLANNER
set num_daily_meeting = 0
where num_daily_meeting > 12;
 
/*--------------- Query 4- delete ---------------*/
delete DAILY_PLANNER
where name like 'A%';

/*--------------- Query 5- drop ---------------*/
drop view DAILY_PLANNER;



/*-------------------- UNIT2 --------------------*/
/*--------------- Query 1- select ---------------*/
select st.studentid, lastname, firstname, studingyear, email
from person p, studenttakecourse s, student st, course c, Test_Schedule t
where p.personid = s.studentid and
      s.courseid = c.courseid and
      c.coursename = t.coursename and
      st.studentid = s.studentid and
      st.GPA > 80 and
      c.coursename LIKE 'Infi%'
order by lastname, firstname


/*--------------- Query 2- select ---------------*/
select coursename
from Test_Schedule
where examname in (select examname 
                   from exam 
                   where moed = 'B' and
                         semester = 'A' and
                   extract (year from examdate)=2021 and
                   extract (month from examdate)>1) and
      coursename not in(select coursename 
                        from course 
                        where credit<3)               
order by coursename
      
     
/*--------------- Query 3- update ---------------*/ 
Update Test_Schedule
Set timeofexam = timeofexam*1.25
where typeofexam = 'openQuestion' and 
      extract(YEAR from examdate) = 2021 
      and timeofexam < 3;
      
/*--------------- Query 4- delete ---------------*/
Delete From Test_Schedule
where (number_of_examinees < 1 or timeofexam < 3) and 
       examname not in(select examname 
                       from Test_Schedule
                       where coursename='infi1');

/*--------------- Query 5- drop ---------------*/
drop view test_schedule;                      




