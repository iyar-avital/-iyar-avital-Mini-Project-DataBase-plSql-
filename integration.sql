/* create a new user */
session set "_ORACLE_SCRIPT"=true;  
create user iyar --user name
IDENTIFIED BY 124124    --passward
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;

grant create session to iyar; 
grant create table to iyar; 
grant unlimited tablespace to iyar;
grant create view , create procedure , create sequence to iyar;
ALTER USER iyar quota unlimited on SYSTEM;


/* add all address to ADDRESS TABLE */
insert into Address select ROW_NUMBER() 
                     OVER(ORDER BY personID ASC)+2020 AS addressID,      
      SUBSTR(address,1,instr(address,' ',-1) - 1) AS street, 
      SUBSTR(address, INSTR(address, ' ',-1)+1,INSTR(address, ' ')+6) AS city,
      NULL as Country
      FROM Person_2;

/* chande 'address' in 'addressID' with reference to address */
alter table person_2 add addressID INTEGER; 
    
update person_2
set addressID = (select max(addressID))
                 from (select ROW_NUMBER() 
                       OVER(ORDER BY personID ASC)+2020 AS addressID, 
                     address AS OldAddress
                     from Person_2) T
                 where address = OldAddress);

/* delete 'address' column in person_2 */
alter table person_2 drop column address;

/* merge person table and person_2 table */
insert into person (select personID, firstname, lastname, 
                         email, birthdate, addressid, 
                         phonenumber 
                    from person_2); 
/* change the reference to point PERSON */
/* first, change personID from integer to varchar(9)*/
alter table LECTURER add lecturerid varchar2(9);
alter table STUDENT add studentid varchar2(9);
alter table STUDENTTAKECOURSE add studentid varchar2(9);
alter table LECTURERTEACHCOURSE add lecturerid varchar2(9);

update LECTURER
set lecturerid = (cast(personID as varchar2(30)))  ; 
update STUDENT
set studentid = (cast(personID as varchar2(30)))  ; 
update LECTURERTEACHCOURSE
set lecturerid = (cast(personID as varchar2(30)))  ; 
update STUDENTTAKECOURSE
set studentid = (cast(personID as varchar2(30)))  ; 

/* add varchar column to primary key (for the reference)*/
alter table STUDENT
  drop constraint SYS_C0014247 cascade;
alter table STUDENT
  add primary key (STUDENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

alter table LECTURER
  drop constraint SYS_C0014187 cascade;
alter table LECTURER
  add primary key (LECTURERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
alter table STUDENTTAKECOURSE
  drop constraint SYS_C0014200 cascade;
alter table STUDENTTAKECOURSE
  add primary key (SEMESTER, CURRENTYEAR, COURSEID, STUDENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

alter table LECTURERTEACHCOURSE
  drop constraint SYS_C0014207 cascade;
alter table LECTURERTEACHCOURSE
  add primary key (SEMESTER, CURRENTYEAR, COURSEID, LECTURERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

/* add foreign key */
alter table STUDENT
add foreign key (STUDENTID)
references PERSON (PERSONID);

alter table LECTURER
add foreign key (LECTURERID)
references PERSON (PERSONID);

alter table STUDENTTAKECOURSE
add foreign key (STUDENTID)
references STUDENT (STUDENTID);
          
alter table LECTURERTEACHCOURSE
add foreign key (LECTURERID)
references LECTURER (LECTURERID);  

/* delete INTEGER column */
alter table STUDENT drop column PERSONID;
alter table LECTURER drop column PERSONID;
alter table STUDENTTAKECOURSE drop column PERSONID;
alter table LECTURERTEACHCOURSE drop column PERSONID;

/* delete PERSON_2 tablr */
drop table person_2;
    
/*-----------------courseInAreaStudy-----------------*/
/* create new table for courseInAreaStudy connection */
create table courseInAreaStudy(
   courseid INTEGER not null,
   areaName varchar2(30),
   PRIMARY KEY (courseid),
   FOREIGN KEY (courseid) REFERENCES Course(courseid),
   FOREIGN KEY (areaName) REFERENCES Areastudy(areaName)
);

/* insert courseID */
insert into courseInAreaStudy select courseID, 
                                 NULL AS AreaName
                              from Course;
                                                          
/* choose areastudy for each course */        
update courseInAreaStudy
set areaName = (select areaname
               from (select areaname, ROW_NUMBER() 
                    OVER(ORDER BY areaName ASC)as row_number
                    from AreaStudy) A
               where courseID = row_number);
                
 
/*-----------------studentIsStuding-----------------*/
/* create new table for studentIsStuding connection */
create table studentIsStuding(
   studID varchar2(30) not null,
   areaName varchar2(30),
   PRIMARY KEY (studID),
   FOREIGN KEY (studID) REFERENCES student(studentID),
   FOREIGN KEY (areaName) REFERENCES Areastudy(areaName)
);

/* insert personID- just student */
insert into studentIsStuding select studentID, 
                             NULL AS AreaName
                             from student;
                                                          
/* choose areastudy for each student */        
update studentIsStuding
set areaName = (select areaname
               from (select min(C.courseid) as courseid
                     from courseInAreaStudy C, studenttakecourse S
                     where C.courseid = S.courseid and
                           s.studentid = studentid) T
                           natural join courseInAreaStudy)

/* constraints */

alter table person
     add constraint check_email
     check (email LIKE '%@%');    
insert into person 
values ('361536899', 'shir', 'Lev', 's.Lev@g.jct.ac.il', to_date('09-05-2001', 'dd-mm-yyyy'), 431, '0556565333');   
insert into person 
values ('215012318', 'dvir', 'lol', 'dd525', to_date('12-07-1995', 'dd-mm-yyyy'), 432, '0556265987');

alter table exam   
     add constraint checks_exam_time
     check (timeOfExam <= 7);
insert into exam
values ('python', 'openQuestion', 'B',  to_date('12-07-2021', 'dd-mm-yyyy'), 3, 'C', 2021, 21);   
insert into exam 
values ('c++', 'openQuestion', 'A',  to_date('12-05-2021', 'dd-mm-yyyy'), 10, 'C', 2018, 18);   
     
alter table Studenttakecourse   
     add constraint checks_student_grade
     check (examgrade > 0);
insert into studenttakecourse
values (80, 95, 'C', 2018, 21, '732696916');   
insert into studenttakecourse
values (-15, 92, 'C', 2018, 21, '732696916');   
