--Select queries

--Query 1
select personId, firstName,LastName
from Person natural join Student
where personId in(select personId
                  from Studenttakecourse natural join Courseinsemester
                  where examGrade>55 and currentYear=2020 and semester='A'
                        and courseId in(select courseId
                                        from Course
                                        where courseName='Infi1' or courseName='Infi2'));
                                        
--Query 2
select L.seniority as sen, count(*) as numoflec
from Lecturer L
where L.seniority >= &< name = "seniority"
hint = "seniority value between 0 - 50" type = "integer"
required = true >
group by seniority
order by L.seniority &< name = "Descending sort order" 
checkbox = "desc, asc" >;

--Query 3
select Semester, CourseID, count(*) as numofstudents
from CourseInSemester natural join StudentTakeCourse 
group by Semester, CourseID
having count(*) < &< name = "Students" type ="integer" required = true >
order by Semester, CourseID;

--Query 4
select personId, firstName, lastName, seniority,salary
from Person natural join Lecturer
where PersonId in (select personId
                   from Lecturer natural join Lecturerteachcourse
                   where currentYear>2019 and seniority>5)
order by salary;

--Query 5
select CourseId,
       count(*) "numOfQuestion",
       max(score_) "maxScore",
       min(score_) "minScore",
       sum(score_) "totalScore"
from Question natural join Coursequestions
where courseId in(select courseId
                  from Courseinsemester
                  where currentYear=2020)
group by courseId;

--Query 6
select studentID, (0.25*assignmentsGrade + 0.75*examGrade) as "finalGrade"
from Student natural join Studenttakecourse natural join Courseinsemester
     natural join Course natural join exam 
where semester='A' and moed='B' and currentYear=2020 and CourseName='Infi1'
order by "finalGrade";

--Query 7
select personId, firstName, LastName, sum(credit) as "credit"
from Person natural join Student natural join Studenttakecourse 
     natural join courseinsemester natural join Course
where currentYear=2020 and semester='A'
group by personId, firstName,LastName
order by "credit";

--Query 8
select personID, email, avg(examGrade) as "score"
from Person natural join Student natural join StudentTakeCourse natural join CourseInSemester
where personID not in (select personID
                         from StudentTakeCourse
                         where assignmentsGrade<55 and semester = 'A' and currentYear=2020)
      and semester = 'A' and currentYear=2020
group by personID,email  
order by "score" desc;





--Update queries

--Query 1
select * from Lecturer;                                                                                           
update Lecturer
set salary = salary*1.25
where seniority > 18 and LecturerID in (select LecturerID 
                                      from lecturerteachcourse natural join Courseinsemester
                                      where currentYear = 2020
                                      group By LecturerID
                                      having Count(*)=1);                                              
                                   
--Query 2
select * from Student;                                              
                                              
update Student
set studingYear= studingYear +1
where studentID in (select studentID
                   from student natural join (select studentID, sum(credit) as "SUM1"
                                              from studenttakecourse natural join course
                                              group by studentID) T
                    where T.SUM1 > 5);    

--Delete queries
                                             
--Query 1
select * from Exam;
delete from Exam
where courseId in (select courseId
                   from course
                   where courseId not in (select courseId
                                          from Courseinsemester
                                          where currentYear= 2019 or currentYear= 2020 
                                                or currentYear= 2021));
--Query 2
delete from Coursequestions
where questionId in (select questionId 
                     from Coursequestions 
                     where CourseId in(select courseId
                                       from Course 
                                       where courseId not in (select courseId
                                                              from Courseinsemester
                                                              where currentYear= 2021)));
