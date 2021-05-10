prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by User on יום ראשון 14 מרץ 2021
set feedback off
set define off

prompt Creating COURSE...
create table COURSE
(
  courseid   INTEGER not null,
  coursename VARCHAR2(40) not null,
  credit     FLOAT not null
)
 ;
alter table COURSE
  add primary key (COURSEID)
   ;

prompt Creating COURSEINSEMESTER...
create table COURSEINSEMESTER
(
  semester    VARCHAR2(10) not null,
  currentyear INTEGER not null,
  groupnumber INTEGER not null,
  courseid    INTEGER not null
)
 ;
alter table COURSEINSEMESTER
  add primary key (SEMESTER, CURRENTYEAR, COURSEID)
  ;
alter table COURSEINSEMESTER
  add foreign key (COURSEID)
  references COURSE (COURSEID);

prompt Creating QUESTION...
create table QUESTION
(
  questionid     INTEGER not null,
  score_         FLOAT not null,
  typeofquestion VARCHAR2(20) not null,
  questionbody   VARCHAR2(30) not null
)
 ;
alter table QUESTION
  add primary key (QUESTIONID)
   ;

prompt Creating COURSEQUESTIONS...
create table COURSEQUESTIONS
(
  courseid   INTEGER not null,
  questionid INTEGER not null
)
 ;
alter table COURSEQUESTIONS
  add primary key (COURSEID, QUESTIONID)
   ;
alter table COURSEQUESTIONS
  add foreign key (COURSEID)
  references COURSE (COURSEID);
alter table COURSEQUESTIONS
  add foreign key (QUESTIONID)
  references QUESTION (QUESTIONID);

prompt Creating EXAM...
create table EXAM
(
  examname    VARCHAR2(30) not null,
  typeofexam  VARCHAR2(20) not null,
  moed        VARCHAR2(10) not null,
  examdate    DATE not null,
  timeofexam  INTEGER not null,
  semester    VARCHAR2(10) not null,
  currentyear INTEGER not null,
  courseid    INTEGER not null
)
 ;
alter table EXAM
  add primary key (SEMESTER, CURRENTYEAR, COURSEID, MOED)
   ;
alter table EXAM
  add foreign key (SEMESTER, CURRENTYEAR, COURSEID)
  references COURSEINSEMESTER (SEMESTER, CURRENTYEAR, COURSEID);

prompt Creating PERSON...
create table PERSON
(
  personid    INTEGER not null,
  firstname   VARCHAR2(20) not null,
  lastname    VARCHAR2(20) not null,
  birthdate   DATE not null,
  email       VARCHAR2(20) not null,
  phonenumber VARCHAR2(20) not null,
  address     VARCHAR2(30) not null
)
 ;
alter table PERSON
  add primary key (PERSONID)
   ;

prompt Creating LECTURER...
create table LECTURER
(
  seniority INTEGER not null,
  salary    FLOAT not null,
  personid  INTEGER not null
)
 ;
alter table LECTURER
  add primary key (PERSONID)
   ;
alter table LECTURER
  add foreign key (PERSONID)
  references PERSON (PERSONID);

prompt Creating LECTURERTEACHCOURSE...
create table LECTURERTEACHCOURSE
(
  semester    VARCHAR2(10) not null,
  currentyear INTEGER not null,
  courseid    INTEGER not null,
  personid    INTEGER not null
)
 ;
alter table LECTURERTEACHCOURSE
  add primary key (SEMESTER, CURRENTYEAR, COURSEID, PERSONID)
   ;
alter table LECTURERTEACHCOURSE
  add foreign key (SEMESTER, CURRENTYEAR, COURSEID)
  references COURSEINSEMESTER (SEMESTER, CURRENTYEAR, COURSEID);
alter table LECTURERTEACHCOURSE
  add foreign key (PERSONID)
  references LECTURER (PERSONID);

prompt Creating STUDENT...
create table STUDENT
(
  gpa         FLOAT not null,
  studingyear INTEGER not null,
  personid    INTEGER not null
)
 ;
alter table STUDENT
  add primary key (PERSONID)
   ;
alter table STUDENT
  add foreign key (PERSONID)
  references PERSON (PERSONID);

prompt Creating STUDENTTAKECOURSE...
create table STUDENTTAKECOURSE
(
  examgrade        FLOAT not null,
  assignmentsgrade FLOAT not null,
  personid         INTEGER not null,
  semester         VARCHAR2(10) not null,
  currentyear      INTEGER not null,
  courseid         INTEGER not null
)
 ;
alter table STUDENTTAKECOURSE
  add primary key (PERSONID, SEMESTER, CURRENTYEAR, COURSEID)
   ;
alter table STUDENTTAKECOURSE
  add foreign key (PERSONID)
  references STUDENT (PERSONID);
alter table STUDENTTAKECOURSE
  add foreign key (SEMESTER, CURRENTYEAR, COURSEID)
  references COURSEINSEMESTER (SEMESTER, CURRENTYEAR, COURSEID);

prompt Disabling triggers for COURSE...
alter table COURSE disable all triggers;
prompt Disabling triggers for COURSEINSEMESTER...
alter table COURSEINSEMESTER disable all triggers;
prompt Disabling triggers for QUESTION...
alter table QUESTION disable all triggers;
prompt Disabling triggers for COURSEQUESTIONS...
alter table COURSEQUESTIONS disable all triggers;
prompt Disabling triggers for EXAM...
alter table EXAM disable all triggers;
prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for LECTURER...
alter table LECTURER disable all triggers;
prompt Disabling triggers for LECTURERTEACHCOURSE...
alter table LECTURERTEACHCOURSE disable all triggers;
prompt Disabling triggers for STUDENT...
alter table STUDENT disable all triggers;
prompt Disabling triggers for STUDENTTAKECOURSE...
alter table STUDENTTAKECOURSE disable all triggers;
prompt Disabling foreign key constraints for COURSEINSEMESTER...
alter table COURSEINSEMESTER disable constraint SYS_C009598;
prompt Disabling foreign key constraints for COURSEQUESTIONS...
alter table COURSEQUESTIONS disable constraint SYS_C009628;
alter table COURSEQUESTIONS disable constraint SYS_C009629;
prompt Disabling foreign key constraints for EXAM...
alter table EXAM disable constraint SYS_C009639;
prompt Disabling foreign key constraints for LECTURER...
alter table LECTURER disable constraint SYS_C009603;
prompt Disabling foreign key constraints for LECTURERTEACHCOURSE...
alter table LECTURERTEACHCOURSE disable constraint SYS_C009623;
alter table LECTURERTEACHCOURSE disable constraint SYS_C009624;
prompt Disabling foreign key constraints for STUDENT...
alter table STUDENT disable constraint SYS_C009588;
prompt Disabling foreign key constraints for STUDENTTAKECOURSE...
alter table STUDENTTAKECOURSE disable constraint SYS_C009616;
alter table STUDENTTAKECOURSE disable constraint SYS_C009617;
prompt Deleting STUDENTTAKECOURSE...
delete from STUDENTTAKECOURSE;
commit;
prompt Deleting STUDENT...
delete from STUDENT;
commit;
prompt Deleting LECTURERTEACHCOURSE...
delete from LECTURERTEACHCOURSE;
commit;
prompt Deleting LECTURER...
delete from LECTURER;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Deleting EXAM...
delete from EXAM;
commit;
prompt Deleting COURSEQUESTIONS...
delete from COURSEQUESTIONS;
commit;
prompt Deleting QUESTION...
delete from QUESTION;
commit;
prompt Deleting COURSEINSEMESTER...
delete from COURSEINSEMESTER;
commit;
prompt Deleting COURSE...
delete from COURSE;
commit;
prompt Loading COURSE...
insert into COURSE (courseid, coursename, credit)
values (1, 'Infi1', 5);
insert into COURSE (courseid, coursename, credit)
values (2, 'Infi2', 5);
insert into COURSE (courseid, coursename, credit)
values (3, 'Algebra1', 3);
insert into COURSE (courseid, coursename, credit)
values (4, 'Algebra2', 3);
insert into COURSE (courseid, coursename, credit)
values (5, 'Physics1', 3.5);
insert into COURSE (courseid, coursename, credit)
values (6, 'Physics2', 3);
insert into COURSE (courseid, coursename, credit)
values (7, 'IntroductionToComputerScience', 4);
insert into COURSE (courseid, coursename, credit)
values (8, 'ComputerStructure', 3);
insert into COURSE (courseid, coursename, credit)
values (9, 'C++', 2);
insert into COURSE (courseid, coursename, credit)
values (10, 'Logic', 2.5);
insert into COURSE (courseid, coursename, credit)
values (11, 'OOP', 4);
insert into COURSE (courseid, coursename, credit)
values (12, 'OOP', 1);
insert into COURSE (courseid, coursename, credit)
values (13, 'Differential Equations', 3);
insert into COURSE (courseid, coursename, credit)
values (14, 'java', 2);
insert into COURSE (courseid, coursename, credit)
values (15, 'Big Data', 1);
insert into COURSE (courseid, coursename, credit)
values (16, 'Data Security', 1);
insert into COURSE (courseid, coursename, credit)
values (17, 'java', 5);
insert into COURSE (courseid, coursename, credit)
values (18, 'Data mining', 3);
insert into COURSE (courseid, coursename, credit)
values (19, 'Operating Systems', 4);
insert into COURSE (courseid, coursename, credit)
values (20, 'Differential Equations', 4);
insert into COURSE (courseid, coursename, credit)
values (21, 'java', 1);
commit;
prompt 21 records loaded
prompt Loading COURSEINSEMESTER...
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2019, 63, 16);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2020, 79, 11);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2018, 76, 18);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2021, 35, 21);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2020, 79, 19);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2018, 33, 21);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2020, 21, 14);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2018, 98, 14);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 78, 19);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2019, 65, 12);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2019, 15, 18);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2020, 1, 13);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2019, 31, 14);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 56, 11);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2018, 64, 19);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2018, 49, 18);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2018, 7, 13);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2020, 80, 20);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2021, 69, 13);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2019, 78, 17);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2019, 59, 13);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2019, 75, 19);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2018, 3, 14);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2020, 92, 20);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 70, 12);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 76, 20);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2018, 34, 16);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2018, 84, 20);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2019, 98, 11);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2018, 59, 18);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2020, 32, 16);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 62, 19);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2020, 60, 17);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2021, 39, 15);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 20, 11);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2019, 25, 17);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 53, 18);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 60, 21);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2020, 74, 18);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 35, 21);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 85, 17);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 85, 18);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2021, 97, 11);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2021, 55, 13);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2019, 65, 14);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2021, 84, 12);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 79, 14);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2019, 73, 16);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2020, 12, 11);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2020, 37, 13);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2019, 83, 15);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2020, 50, 19);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2020, 7, 16);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2019, 69, 21);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2021, 19, 12);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2021, 26, 18);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2020, 6, 12);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2020, 98, 21);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2018, 17, 13);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 42, 16);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 55, 13);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2019, 84, 11);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2019, 55, 13);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 21, 15);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2021, 97, 14);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 10, 14);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2021, 13, 16);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 30, 1);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 25, 1);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2021, 22, 1);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 30, 2);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 23, 2);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2021, 20, 2);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('B', 2021, 30, 3);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('C', 2021, 32, 3);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 16, 3);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 38, 4);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('A', 2020, 37, 5);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''A''', 2020, 30, 1);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''B''', 2021, 25, 1);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''C''', 2021, 22, 1);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''A''', 2020, 30, 2);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''B''', 2021, 23, 2);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''C''', 2021, 20, 2);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''B''', 2021, 30, 3);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''C''', 2021, 32, 3);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''A''', 2020, 16, 3);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''A''', 2020, 38, 4);
insert into COURSEINSEMESTER (semester, currentyear, groupnumber, courseid)
values ('''A''', 2020, 37, 5);
commit;
prompt 89 records loaded
prompt Loading QUESTION...
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (11, 30, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (12, 32, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (13, 8, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (14, 29, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (15, 34, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (16, 32, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (17, 13, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (18, 22, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (19, 5, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (20, 12, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (21, 28, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (22, 26, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (23, 17, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (24, 17, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (25, 29, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (26, 5, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (27, 32, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (28, 5, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (29, 17, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (30, 34, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (31, 23, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (32, 35, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (33, 8, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (34, 8, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (35, 9, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (36, 7, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (37, 20, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (38, 7, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (39, 24, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (40, 27, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (41, 17, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (42, 6, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (43, 31, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (44, 19, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (45, 16, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (46, 31, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (47, 18, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (48, 13, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (49, 32, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (50, 29, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (51, 11, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (52, 17, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (53, 26, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (54, 7, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (55, 12, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (56, 24, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (57, 18, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (58, 27, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (59, 6, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (60, 8, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (61, 7, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (62, 18, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (63, 24, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (64, 9, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (65, 20, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (66, 32, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (67, 5, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (68, 21, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (69, 17, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (70, 34, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (71, 11, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (72, 25, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (73, 29, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (74, 14, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (75, 8, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (76, 25, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (77, 28, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (78, 15, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (79, 31, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (80, 15, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (81, 18, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (82, 33, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (83, 6, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (84, 35, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (85, 32, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (86, 9, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (87, 18, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (88, 17, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (89, 24, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (90, 17, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (91, 6, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (92, 12, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (93, 8, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (94, 30, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (95, 10, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (96, 20, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (97, 8, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (98, 30, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (99, 12, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (100, 29, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (101, 7, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (102, 16, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (103, 24, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (104, 10, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (105, 27, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (106, 6, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (107, 18, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (108, 31, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (109, 23, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (110, 6, 'openQuestion', 'Solve the exercise');
commit;
prompt 100 records committed...
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (111, 35, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (112, 29, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (113, 9, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (114, 35, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (115, 31, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (116, 16, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (117, 28, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (118, 26, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (119, 11, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (120, 22, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (121, 25, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (122, 27, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (123, 34, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (124, 6, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (125, 28, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (126, 5, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (127, 23, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (128, 14, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (129, 28, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (130, 13, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (131, 13, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (132, 30, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (133, 6, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (134, 22, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (135, 33, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (136, 33, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (137, 12, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (138, 18, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (139, 15, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (140, 19, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (141, 20, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (142, 25, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (143, 11, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (144, 29, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (145, 34, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (146, 9, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (147, 28, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (148, 25, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (149, 22, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (150, 33, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (151, 31, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (152, 35, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (153, 30, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (154, 31, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (155, 10, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (156, 16, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (157, 21, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (158, 31, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (159, 25, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (160, 9, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (161, 33, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (162, 25, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (163, 15, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (164, 15, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (165, 31, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (166, 9, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (167, 8, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (168, 18, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (169, 21, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (170, 12, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (171, 23, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (172, 11, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (173, 21, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (174, 23, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (175, 15, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (176, 35, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (177, 16, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (178, 23, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (179, 24, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (180, 27, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (181, 22, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (182, 13, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (183, 26, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (184, 19, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (185, 26, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (186, 23, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (187, 13, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (188, 13, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (189, 20, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (190, 35, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (191, 30, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (192, 10, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (193, 27, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (194, 19, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (195, 21, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (196, 29, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (197, 32, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (198, 34, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (199, 13, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (200, 13, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (201, 34, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (202, 28, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (203, 10, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (204, 6, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (205, 7, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (206, 11, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (207, 30, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (208, 17, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (209, 22, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (210, 23, 'multipleChoice', 'Answer the question');
commit;
prompt 200 records committed...
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (211, 9, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (212, 6, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (213, 29, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (214, 22, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (215, 6, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (216, 27, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (217, 31, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (218, 15, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (219, 12, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (220, 35, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (221, 34, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (222, 29, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (223, 33, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (224, 32, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (225, 32, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (226, 12, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (227, 21, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (228, 13, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (229, 18, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (230, 13, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (231, 20, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (232, 31, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (233, 34, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (234, 33, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (235, 16, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (236, 5, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (237, 35, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (238, 22, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (239, 20, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (240, 24, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (241, 17, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (242, 22, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (243, 25, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (244, 31, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (245, 13, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (246, 35, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (247, 13, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (248, 18, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (249, 10, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (250, 6, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (251, 9, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (252, 5, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (253, 26, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (254, 25, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (255, 16, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (256, 13, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (257, 30, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (258, 27, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (259, 34, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (260, 23, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (261, 24, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (262, 23, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (263, 31, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (264, 24, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (265, 9, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (266, 12, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (267, 27, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (268, 19, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (269, 19, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (270, 25, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (271, 29, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (272, 22, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (273, 13, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (274, 34, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (275, 16, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (276, 7, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (277, 30, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (278, 34, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (279, 25, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (280, 15, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (281, 21, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (282, 11, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (283, 20, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (284, 35, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (285, 32, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (286, 24, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (287, 8, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (288, 31, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (289, 22, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (290, 23, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (291, 7, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (292, 14, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (293, 23, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (294, 32, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (295, 19, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (296, 35, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (297, 14, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (298, 28, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (299, 7, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (300, 32, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (301, 8, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (302, 12, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (303, 25, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (304, 26, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (305, 16, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (306, 12, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (307, 13, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (308, 14, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (309, 13, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (310, 14, 'multipleChoice', 'Solve the exercise');
commit;
prompt 300 records committed...
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (311, 23, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (312, 34, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (313, 6, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (314, 34, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (315, 34, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (316, 28, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (317, 6, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (318, 26, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (319, 21, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (320, 20, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (321, 28, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (322, 25, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (323, 35, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (324, 24, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (325, 12, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (326, 14, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (327, 19, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (328, 12, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (329, 14, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (330, 8, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (331, 19, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (332, 5, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (333, 32, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (334, 33, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (335, 19, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (336, 32, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (337, 16, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (338, 6, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (339, 35, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (340, 33, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (341, 10, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (342, 10, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (343, 20, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (344, 32, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (345, 32, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (346, 34, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (347, 20, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (348, 18, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (349, 9, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (350, 23, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (351, 23, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (352, 21, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (353, 27, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (354, 31, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (355, 21, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (356, 20, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (357, 18, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (358, 18, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (359, 34, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (360, 26, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (361, 10, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (362, 22, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (363, 13, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (364, 28, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (365, 11, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (366, 10, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (367, 12, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (368, 20, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (369, 25, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (370, 6, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (371, 6, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (372, 34, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (373, 10, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (374, 35, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (375, 27, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (376, 24, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (377, 18, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (378, 20, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (379, 14, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (380, 12, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (381, 20, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (382, 34, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (383, 29, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (384, 30, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (385, 18, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (386, 8, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (387, 13, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (388, 22, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (389, 32, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (390, 8, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (391, 8, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (392, 22, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (393, 8, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (394, 32, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (395, 8, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (396, 12, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (397, 30, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (398, 11, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (399, 18, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (400, 12, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (401, 13, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (402, 5, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (403, 26, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (404, 7, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (405, 24, 'multipleChoice', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (406, 21, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (407, 26, 'openQuestion', 'Solve the exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (408, 25, 'openQuestion', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (409, 10, 'multipleChoice', 'Answer the question');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (410, 17, 'multipleChoice', 'Answer the question');
commit;
prompt 400 records committed...
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (1, 20, 'open', 'Solve the following exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (2, 20, 'open', 'Solve the following exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (3, 20, 'open', 'Solve the following exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (4, 20, 'open', 'Solve the following exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (5, 20, 'open', 'Solve the following exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (6, 20, 'open', 'Solve the following exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (7, 20, 'open', 'Solve the following exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (8, 20, 'open', 'Solve the following exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (9, 20, 'open', 'Solve the following exercise');
insert into QUESTION (questionid, score_, typeofquestion, questionbody)
values (10, 20, 'open', 'Solve the following exercise');
commit;
prompt 410 records loaded
prompt Loading COURSEQUESTIONS...
insert into COURSEQUESTIONS (courseid, questionid)
values (19, 15);
insert into COURSEQUESTIONS (courseid, questionid)
values (14, 330);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 252);
insert into COURSEQUESTIONS (courseid, questionid)
values (19, 28);
insert into COURSEQUESTIONS (courseid, questionid)
values (13, 314);
insert into COURSEQUESTIONS (courseid, questionid)
values (20, 402);
insert into COURSEQUESTIONS (courseid, questionid)
values (16, 332);
insert into COURSEQUESTIONS (courseid, questionid)
values (21, 289);
insert into COURSEQUESTIONS (courseid, questionid)
values (20, 329);
insert into COURSEQUESTIONS (courseid, questionid)
values (21, 338);
insert into COURSEQUESTIONS (courseid, questionid)
values (17, 267);
insert into COURSEQUESTIONS (courseid, questionid)
values (14, 45);
insert into COURSEQUESTIONS (courseid, questionid)
values (20, 307);
insert into COURSEQUESTIONS (courseid, questionid)
values (16, 24);
insert into COURSEQUESTIONS (courseid, questionid)
values (13, 211);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 31);
insert into COURSEQUESTIONS (courseid, questionid)
values (16, 184);
insert into COURSEQUESTIONS (courseid, questionid)
values (12, 157);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 116);
insert into COURSEQUESTIONS (courseid, questionid)
values (13, 15);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 86);
insert into COURSEQUESTIONS (courseid, questionid)
values (17, 13);
insert into COURSEQUESTIONS (courseid, questionid)
values (17, 36);
insert into COURSEQUESTIONS (courseid, questionid)
values (14, 263);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 85);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 147);
insert into COURSEQUESTIONS (courseid, questionid)
values (12, 370);
insert into COURSEQUESTIONS (courseid, questionid)
values (13, 103);
insert into COURSEQUESTIONS (courseid, questionid)
values (19, 213);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 70);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 96);
insert into COURSEQUESTIONS (courseid, questionid)
values (21, 324);
insert into COURSEQUESTIONS (courseid, questionid)
values (14, 51);
insert into COURSEQUESTIONS (courseid, questionid)
values (11, 165);
insert into COURSEQUESTIONS (courseid, questionid)
values (16, 158);
insert into COURSEQUESTIONS (courseid, questionid)
values (19, 395);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 128);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 18);
insert into COURSEQUESTIONS (courseid, questionid)
values (13, 290);
insert into COURSEQUESTIONS (courseid, questionid)
values (12, 123);
insert into COURSEQUESTIONS (courseid, questionid)
values (16, 353);
insert into COURSEQUESTIONS (courseid, questionid)
values (13, 383);
insert into COURSEQUESTIONS (courseid, questionid)
values (12, 54);
insert into COURSEQUESTIONS (courseid, questionid)
values (12, 119);
insert into COURSEQUESTIONS (courseid, questionid)
values (14, 273);
insert into COURSEQUESTIONS (courseid, questionid)
values (14, 368);
insert into COURSEQUESTIONS (courseid, questionid)
values (19, 114);
insert into COURSEQUESTIONS (courseid, questionid)
values (11, 302);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 350);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 245);
insert into COURSEQUESTIONS (courseid, questionid)
values (16, 120);
insert into COURSEQUESTIONS (courseid, questionid)
values (13, 22);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 270);
insert into COURSEQUESTIONS (courseid, questionid)
values (21, 291);
insert into COURSEQUESTIONS (courseid, questionid)
values (19, 36);
insert into COURSEQUESTIONS (courseid, questionid)
values (13, 208);
insert into COURSEQUESTIONS (courseid, questionid)
values (12, 269);
insert into COURSEQUESTIONS (courseid, questionid)
values (14, 46);
insert into COURSEQUESTIONS (courseid, questionid)
values (20, 76);
insert into COURSEQUESTIONS (courseid, questionid)
values (16, 344);
insert into COURSEQUESTIONS (courseid, questionid)
values (17, 293);
insert into COURSEQUESTIONS (courseid, questionid)
values (19, 400);
insert into COURSEQUESTIONS (courseid, questionid)
values (11, 73);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 270);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 177);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 107);
insert into COURSEQUESTIONS (courseid, questionid)
values (19, 276);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 398);
insert into COURSEQUESTIONS (courseid, questionid)
values (12, 47);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 319);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 362);
insert into COURSEQUESTIONS (courseid, questionid)
values (21, 373);
insert into COURSEQUESTIONS (courseid, questionid)
values (20, 157);
insert into COURSEQUESTIONS (courseid, questionid)
values (18, 349);
insert into COURSEQUESTIONS (courseid, questionid)
values (16, 285);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 138);
insert into COURSEQUESTIONS (courseid, questionid)
values (15, 139);
insert into COURSEQUESTIONS (courseid, questionid)
values (20, 259);
insert into COURSEQUESTIONS (courseid, questionid)
values (1, 1);
insert into COURSEQUESTIONS (courseid, questionid)
values (1, 2);
insert into COURSEQUESTIONS (courseid, questionid)
values (1, 3);
insert into COURSEQUESTIONS (courseid, questionid)
values (1, 4);
insert into COURSEQUESTIONS (courseid, questionid)
values (1, 5);
insert into COURSEQUESTIONS (courseid, questionid)
values (2, 6);
insert into COURSEQUESTIONS (courseid, questionid)
values (2, 7);
insert into COURSEQUESTIONS (courseid, questionid)
values (2, 8);
insert into COURSEQUESTIONS (courseid, questionid)
values (2, 9);
insert into COURSEQUESTIONS (courseid, questionid)
values (2, 10);
commit;
prompt 88 records loaded
prompt Loading EXAM...
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('java', 'multipleChoice', 'A', to_date('12-03-2021', 'dd-mm-yyyy'), 180, 'C', 2020, 13);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Infi1Exam', 'openQuestion', 'A', to_date('05-01-2021', 'dd-mm-yyyy'), 180, 'A', 2020, 1);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Infi1Exam', 'openQuestion', 'B', to_date('05-02-2021', 'dd-mm-yyyy'), 180, 'A', 2020, 1);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Infi2Exam', 'openQuestion', 'A', to_date('08-01-2021', 'dd-mm-yyyy'), 180, 'A', 2020, 2);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Infi2Exam', 'openQuestion', 'B', to_date('08-02-2021', 'dd-mm-yyyy'), 180, 'A', 2020, 2);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Algebra1Exam', 'openQuestion', 'A', to_date('10-01-2021', 'dd-mm-yyyy'), 180, 'A', 2020, 3);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Algebra1Exam', 'openQuestion', 'B', to_date('10-02-2021', 'dd-mm-yyyy'), 180, 'A', 2020, 3);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Algebra2Exam', 'openQuestion', 'A', to_date('12-01-2021', 'dd-mm-yyyy'), 180, 'A', 2020, 4);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Algebra2Exam', 'openQuestion', 'B', to_date('12-02-2021', 'dd-mm-yyyy'), 180, 'A', 2020, 4);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Physics1Exam', 'openQuestion', 'A', to_date('15-01-2021', 'dd-mm-yyyy'), 180, 'A', 2020, 5);
insert into EXAM (examname, typeofexam, moed, examdate, timeofexam, semester, currentyear, courseid)
values ('Physics1Exam', 'openQuestion', 'B', to_date('15-02-2021', 'dd-mm-yyyy'), 120, 'A', 2020, 5);
commit;
prompt 11 records loaded
prompt Loading PERSON...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (987706237, 'Jet', 'Harary', to_date('14-06-1979', 'dd-mm-yyyy'), 'jharary@cyberthink.h', '054-4931878', '53 Sander');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (855235239, 'Mary Beth', 'Culkin', to_date('14-01-2070', 'dd-mm-yyyy'), 'marybethc@activeserv', '058-8671111', '67 Cleary Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (115508457, 'Maury', 'Stevens', to_date('12-09-1983', 'dd-mm-yyyy'), 'maury@envisionteleph', '058-6828486', '697 Lea Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (949432805, 'Marty', 'Mahood', to_date('15-04-1974', 'dd-mm-yyyy'), 'marty.mahood@ogioint', '052-6751425', '54 Silverman Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (268569712, 'Jack', 'Niven', to_date('29-09-1989', 'dd-mm-yyyy'), 'jack.niven@refinery.', '055-3148233', '38 Judge Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (67198066, 'David', 'Moreno', to_date('28-02-1972', 'dd-mm-yyyy'), 'david.moreno@netnumi', '052-5755148', '13rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (459535362, 'Balthazar', 'Zeta-Jones', to_date('27-10-1990', 'dd-mm-yyyy'), 'bzetajones@abatix.es', '054-1440665', '97 Sandler');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (304940772, 'Fred', 'Ingram', to_date('18-08-1979', 'dd-mm-yyyy'), 'fred.ingram@stiknowl', '058-6052531', '40 Paltrow Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (718081417, 'Cole', 'Elwes', to_date('18-05-2063', 'dd-mm-yyyy'), 'c.elwes@credopetrole', '050-8447357', '28 Humphrey Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (329328663, 'Stewart', 'Quaid', to_date('17-03-1985', 'dd-mm-yyyy'), 'squaid@mds.com', '058-5864995', '63 Lund');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (980664568, 'Simon', 'Bates', to_date('08-08-2069', 'dd-mm-yyyy'), 'simon.bates@ungertec', '052-0185658', '28 Hiatt Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (549249344, 'First', 'Stanton', to_date('01-09-1981', 'dd-mm-yyyy'), 'first.stanton@httpri', '058-1753791', '60 Dorval Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (326491118, 'Brenda', 'Willard', to_date('11-08-1987', 'dd-mm-yyyy'), 'brenda.willard@matte', '054-6876291', '53 Miller Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (864758241, 'Terry', 'Elizondo', to_date('21-09-2001', 'dd-mm-yyyy'), 'terry.elizondo@oneso', '054-8528406', '31 Houston Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (387496628, 'Hank', 'Posey', to_date('03-03-2062', 'dd-mm-yyyy'), 'hank@epamsystems.se', '058-0712711', '286 Hayek Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (595686130, 'Catherine', 'Reeves', to_date('22-09-2064', 'dd-mm-yyyy'), 'catherine.reeves@mcd', '054-4509748', '590 Wells Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (121375281, 'Randy', 'Steenburgen', to_date('04-05-1981', 'dd-mm-yyyy'), 'randy.steenburgen@cl', '055-9786784', '74 Belles Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (202719706, 'Anna', 'Plowright', to_date('20-05-2001', 'dd-mm-yyyy'), 'anna.plowright@sears', '058-3997662', '823 Elias Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (321430237, 'Brent', 'O''Hara', to_date('07-06-1988', 'dd-mm-yyyy'), 'bohara@hotmail.com', '058-4705387', '86 Kyunnam Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (245074638, 'Anjelica', 'Mazzello', to_date('06-12-1977', 'dd-mm-yyyy'), 'anjelica.mazzello@ac', '055-3236920', '36 Linney Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (433335843, 'Gino', 'Rauhofer', to_date('09-04-2061', 'dd-mm-yyyy'), 'gino.rauhofer@atxfor', '052-4501925', '60 Salonga Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (711336337, 'Josh', 'Liu', to_date('02-07-1973', 'dd-mm-yyyy'), 'josh.liu@calence.de', '054-0551579', '50 Lucien Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (490516574, 'Tramaine', 'Chapman', to_date('16-06-1988', 'dd-mm-yyyy'), 'tramaine.chapman@ser', '050-6159848', '5 Neville Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (42835570, 'Liam', 'Azaria', to_date('01-02-1999', 'dd-mm-yyyy'), 'liama@asa.com', '052-6526699', '72 Schneider Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (480845033, 'Frankie', 'Pleasence', to_date('19-08-1986', 'dd-mm-yyyy'), 'frankie.pleasence@cn', '058-0633267', '56 Stewart Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (150668055, 'Olympia', 'Trevino', to_date('15-12-2066', 'dd-mm-yyyy'), 'olympiat@career.nl', '054-5117148', '53rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (775743751, 'Ethan', 'Love', to_date('22-07-2065', 'dd-mm-yyyy'), 'ethan.love@peerlessm', '058-2055569', '33 Sparrows Point Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (851267103, 'Jimmie', 'McClinton', to_date('17-07-1974', 'dd-mm-yyyy'), 'jimmie@sweetproducti', '055-2344859', '6 Newman Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (777305978, 'Noah', 'Tucker', to_date('13-12-1996', 'dd-mm-yyyy'), 'noah.tucker@catamoun', '055-8454014', '874 Debbie Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (457536747, 'Hope', 'Weston', to_date('16-03-2069', 'dd-mm-yyyy'), 'hopew@dvdt.de', '050-7551971', '238 Toledo');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (239808651, 'Howard', 'Craven', to_date('09-11-2060', 'dd-mm-yyyy'), 'howard.craven@trinit', '058-2267993', '925 Junior Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (561545378, 'Eileen', 'Marie', to_date('11-10-1994', 'dd-mm-yyyy'), 'eileen@shirtfactory.', '052-6057791', '66 Camp Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (733950591, 'Chanté', 'Hatosy', to_date('18-03-2068', 'dd-mm-yyyy'), 'chant.hatosy@egroup.', '050-2776690', '685 Plowright Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (585564072, 'Cledus', 'Durning', to_date('01-03-1972', 'dd-mm-yyyy'), 'cledusd@reckittbenck', '050-2552411', '702 Weiss Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (136164997, 'Aida', 'Connelly', to_date('25-09-1999', 'dd-mm-yyyy'), 'aida.connelly@telwar', '054-5232600', '22 Seoul Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (698761583, 'Denis', 'Peniston', to_date('09-11-1992', 'dd-mm-yyyy'), 'denis.peniston@woron', '050-2476030', '37 Chambers Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (978704660, 'Phil', 'Meniketti', to_date('30-05-1978', 'dd-mm-yyyy'), 'phil.meniketti@fam.c', '052-6636719', '24 Francis Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (701694775, 'Boyd', 'Pollack', to_date('16-03-1980', 'dd-mm-yyyy'), 'boyd@smartdrawcom.br', '055-1344932', '83 Gracie Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (317122187, 'Melba', 'Rudd', to_date('30-05-1985', 'dd-mm-yyyy'), 'mrudd@newtoninteract', '055-5103592', '36 Leigh Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (939898859, 'Steven', 'Payton', to_date('04-01-1984', 'dd-mm-yyyy'), 'steven.payton@ads.ee', '054-5558441', '80 Vertical');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (488765611, 'Robin', 'Martin', to_date('27-09-2062', 'dd-mm-yyyy'), 'robin.martin@emt.com', '050-6060118', '26 Emerson Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (596713071, 'Pete', 'Blades', to_date('28-06-1974', 'dd-mm-yyyy'), 'pete@mms.com', '052-4562799', '48 Osbourne Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (985327418, 'Lauren', 'Elizabeth', to_date('18-06-2066', 'dd-mm-yyyy'), 'lauren.elizabeth@spa', '055-9461815', '166 Davidson Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (104502177, 'Emerson', 'Bening', to_date('13-10-1973', 'dd-mm-yyyy'), 'emersonb@air.com', '058-5201322', '26 Tippe Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (992849681, 'Jody', 'Esposito', to_date('08-04-1989', 'dd-mm-yyyy'), 'jodye@homedepot.jp', '058-0273127', '373 Walker Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (118568790, 'Will', 'Sisto', to_date('11-12-2060', 'dd-mm-yyyy'), 'wills@nsd.ca', '055-8740262', '12 Burgess Hill Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (202058922, 'Rosario', 'Collins', to_date('03-04-1989', 'dd-mm-yyyy'), 'rosario@adolph.com', '050-8668888', '82 Winstone Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (408673521, 'Elle', 'Knight', to_date('10-02-1982', 'dd-mm-yyyy'), 'elle.k@yashtechnolog', '050-7631955', '32 Randall Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (341785016, 'Colm', 'Stamp', to_date('18-12-2070', 'dd-mm-yyyy'), 'colm.stamp@ivci.ar', '050-3019806', '535 Savage Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (953763701, 'Drew', 'Johansson', to_date('30-01-1995', 'dd-mm-yyyy'), 'djohansson@zoneperfe', '058-7767663', '7 Parish Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (794737882, 'Hugh', 'Bloch', to_date('16-05-2001', 'dd-mm-yyyy'), 'hugh.b@wyeth.de', '050-3266555', '919 Kinski Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (243883061, 'Queen', 'Borgnine', to_date('27-01-1998', 'dd-mm-yyyy'), 'queen.b@activeservic', '052-8102934', '29 Swayze Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (479937328, 'Carla', 'Flanagan', to_date('27-08-1983', 'dd-mm-yyyy'), 'c.flanagan@ciwservic', '058-1375024', '86 Carole');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (903405045, 'Meredith', 'Shaye', to_date('23-05-1995', 'dd-mm-yyyy'), 'mshaye@pra.ca', '058-5021457', '99 Ellicott City Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (928352880, 'Wang', 'Black', to_date('14-09-1982', 'dd-mm-yyyy'), 'wang@efcbancorp.cr', '058-1743429', '85 Schwarzenegger Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (129637563, 'Martin', 'Plummer', to_date('28-07-1971', 'dd-mm-yyyy'), 'martin.plummer@bigya', '050-7595579', '95 Bad Oeynhausen Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (304724063, 'Winona', 'Santa Rosa', to_date('05-04-1974', 'dd-mm-yyyy'), 'winona.santarosa@ins', '058-6668579', '7 Berkshire Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (872282547, 'Cesar', 'Khan', to_date('17-07-1994', 'dd-mm-yyyy'), 'cesar@qas.jp', '054-5231834', '8 Liam Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (120183857, 'Bette', 'Shelton', to_date('03-10-1978', 'dd-mm-yyyy'), 'bette.shelton@sm.pl', '052-0172740', '78 Johansson Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (737898492, 'Collective', 'Cole', to_date('25-03-1980', 'dd-mm-yyyy'), 'collective.c@ivorysy', '052-8711767', '41 Street Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (962731634, 'Temuera', 'DiCaprio', to_date('18-01-1991', 'dd-mm-yyyy'), 'temuera.dicaprio@sps', '050-6232026', '71 James Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (700080500, 'Emily', 'Costello', to_date('21-10-1990', 'dd-mm-yyyy'), 'emily.costello@linac', '052-9282195', '50 Lund Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (516915528, 'Phil', 'Hopper', to_date('30-12-2063', 'dd-mm-yyyy'), 'phil.hopper@sbc.dk', '055-6163072', '245 Rodney Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (750618104, 'Katrin', 'Rawls', to_date('06-10-2066', 'dd-mm-yyyy'), 'katrinr@mqsoftware.c', '055-0754247', '69 Fort Collins Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (103592706, 'Judi', 'Matthau', to_date('18-12-1977', 'dd-mm-yyyy'), 'judi@toyotamotor.ca', '050-4853711', '47 Peet Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (161726447, 'Morris', 'Osment', to_date('08-01-1990', 'dd-mm-yyyy'), 'm.osment@venoco.com', '052-5304415', '23 Price Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (283600819, 'Tcheky', 'Garfunkel', to_date('02-07-1976', 'dd-mm-yyyy'), 'tchekyg@networkdispl', '050-4521548', '10 Pesci Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (290590229, 'Andie', 'Harmon', to_date('15-09-1990', 'dd-mm-yyyy'), 'a.harmon@bowman.com', '050-8071054', '664 Lynn Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (557447136, 'Ruth', 'Carr', to_date('21-03-1997', 'dd-mm-yyyy'), 'ruthc@saksinc.es', '050-4219057', '35 Warsaw Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (931275619, 'Oro', 'Matarazzo', to_date('25-04-1987', 'dd-mm-yyyy'), 'oro.matarazzo@spotfi', '058-2602087', '59 DiBiasio Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (384149926, 'Nickel', 'Harary', to_date('03-01-1981', 'dd-mm-yyyy'), 'nickel.harary@execus', '055-9609135', '22nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (102748297, 'Ricardo', 'Sorvino', to_date('26-04-1998', 'dd-mm-yyyy'), 'ricardo@avr.uk', '054-8013500', '92 Altstätten Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (247202049, 'Hugh', 'Gaines', to_date('22-01-1982', 'dd-mm-yyyy'), 'hgaines@jcpenney.uk', '054-7997892', '95 Brooke Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (190149862, 'Anthony', 'Berkoff', to_date('09-05-2066', 'dd-mm-yyyy'), 'anthony.berkoff@atxf', '050-7049401', '56 Bend Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (832970471, 'Cary', 'Stiller', to_date('14-11-1979', 'dd-mm-yyyy'), 'cary.stiller@mwh.ca', '054-1502691', '41st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (67254093, 'Ivan', 'Tippe', to_date('24-03-1978', 'dd-mm-yyyy'), 'ivan.t@staffforce.de', '050-4608549', '26 Englund Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (378246373, 'Rickie', 'Ronstadt', to_date('26-11-2064', 'dd-mm-yyyy'), 'rickie@genextechnolo', '058-6798847', '52 Fiorentino Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (269329659, 'Ron', 'Craddock', to_date('12-01-1997', 'dd-mm-yyyy'), 'r.craddock@evergreen', '050-1889280', '22nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (761643967, 'Anthony', 'James', to_date('20-01-1987', 'dd-mm-yyyy'), 'anthony.james@priori', '052-9330317', '91 Woodbridge Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (375062577, 'Jay', 'Whitaker', to_date('05-08-1998', 'dd-mm-yyyy'), 'jay.whitaker@ppr.uk', '052-8512749', '43 Bristol Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (601509435, 'Milla', 'Merchant', to_date('27-10-1994', 'dd-mm-yyyy'), 'milla.merchant@pearl', '055-9748508', '419 Hikaru Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (138594233, 'Amanda', 'Maxwell', to_date('23-03-2066', 'dd-mm-yyyy'), 'amanda.m@hardwoodwho', '055-8308753', '72nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (751848618, 'Jane', 'Puckett', to_date('29-08-2060', 'dd-mm-yyyy'), 'j.puckett@telesynthe', '058-5120623', '20 Bridget Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (163146214, 'Debby', 'Slater', to_date('21-11-2065', 'dd-mm-yyyy'), 'debby.s@pinnaclestaf', '052-7898914', '62nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (647480529, 'Seann', 'Boothe', to_date('26-09-2066', 'dd-mm-yyyy'), 'seann.boothe@kingsto', '055-4975883', '59 Sal Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (449497415, 'Kelly', 'Schock', to_date('15-07-1985', 'dd-mm-yyyy'), 'kelly.schock@saralee', '058-1920287', '76 McGoohan Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (56092674, 'Ozzy', 'Chaplin', to_date('27-05-1995', 'dd-mm-yyyy'), 'ozzy.chaplin@sht.com', '058-8208861', '16 Tennison Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (612497477, 'Miriam', 'Colon', to_date('03-11-1995', 'dd-mm-yyyy'), 'miriam.colon@pearlla', '052-8572412', '21st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (562278524, 'Oliver', 'Carrack', to_date('06-08-1973', 'dd-mm-yyyy'), 'oliverc@accesssystem', '052-0901682', '94 Nelson Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (295939328, 'Ike', 'Bradford', to_date('10-09-1987', 'dd-mm-yyyy'), 'ike.bradford@allstar', '054-8358711', '30 North Yorkshire');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (655899083, 'Arturo', 'O''Sullivan', to_date('26-08-2000', 'dd-mm-yyyy'), 'aosullivan@drinkmore', '054-0282386', '139 Jane Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (575041418, 'Gilberto', 'Hoffman', to_date('19-07-1988', 'dd-mm-yyyy'), 'gilberto@ufs.de', '050-5172216', '3 Olsztyn Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (802148688, 'Eugene', 'Heatherly', to_date('08-07-1992', 'dd-mm-yyyy'), 'e.heatherly@marsinc.', '052-1303620', '54 Janney Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (358022421, 'Ted', 'Danger', to_date('21-04-1978', 'dd-mm-yyyy'), 'ted.d@woronocobancor', '054-2660674', '6 Balmoral Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (727539312, 'Kelli', 'Carr', to_date('21-08-2061', 'dd-mm-yyyy'), 'kelli.carr@zaiqtechn', '050-1421712', '38 Grant Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (278724873, 'Daniel', 'Kennedy', to_date('31-08-1974', 'dd-mm-yyyy'), 'danielk@usainstrumen', '055-8345843', '58 D''Onofrio Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (220114163, 'Trace', 'Lachey', to_date('20-11-1982', 'dd-mm-yyyy'), 'trace.lachey@ivorysy', '052-0486873', '82 Slater Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (446246201, 'Neve', 'Jonze', to_date('03-09-1991', 'dd-mm-yyyy'), 'neve@ipsadvisory.com', '052-0926108', '48 Bradford Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (799133061, 'Stevie', 'Lange', to_date('18-11-1979', 'dd-mm-yyyy'), 'steviel@royalgold.co', '052-0588607', '392 Christine Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (910141667, 'Isaac', 'Driver', to_date('14-07-1980', 'dd-mm-yyyy'), 'isaac.driver@midwest', '050-6854418', '41st Street');
commit;
prompt 100 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (854909503, 'Lizzy', 'El-Saher', to_date('13-02-1976', 'dd-mm-yyyy'), 'lizzy.elsaher@pacifi', '055-5924237', '100 Diesel Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (675091717, 'Ani', 'Lithgow', to_date('11-05-1990', 'dd-mm-yyyy'), 'ani.lithgow@merck.th', '050-6169920', '51 LuPone Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (623437545, 'Kim', 'Davidson', to_date('15-02-2062', 'dd-mm-yyyy'), 'kim.davidson@vfs.com', '055-3356809', '34 Mt. Laurel Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (578275155, 'Nik', 'Curry', to_date('14-06-1974', 'dd-mm-yyyy'), 'nikc@dvdt.de', '050-9567991', '61st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (657012116, 'Albert', 'Zevon', to_date('25-09-1973', 'dd-mm-yyyy'), 'albert.z@faef.it', '058-5044879', '45 Mekhi');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (271213948, 'Sal', 'Vaughn', to_date('21-03-2070', 'dd-mm-yyyy'), 'sal.vaughn@staffforc', '050-6239740', '33 Cle Elum');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (58764259, 'Earl', 'Alston', to_date('15-05-1998', 'dd-mm-yyyy'), 'earl.alston@gdi.com', '055-3740926', '27 Berkeley');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (357266312, 'Taylor', 'Studi', to_date('08-01-2067', 'dd-mm-yyyy'), 'tstudi@pacificdatade', '054-7914077', '81st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (14573086, 'Mandy', 'Rivers', to_date('18-03-1990', 'dd-mm-yyyy'), 'mandy.r@smg.jp', '055-1991078', '96 Vance Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (646825246, 'Liam', 'Jonze', to_date('25-02-1995', 'dd-mm-yyyy'), 'liam@jma.nz', '050-5449554', '54 Downey Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (739962065, 'Vonda', 'Balin', to_date('25-04-1996', 'dd-mm-yyyy'), 'vonda@ksj.com', '052-0142060', '71 Vicious Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (518996574, 'Dustin', 'McGovern', to_date('01-02-1987', 'dd-mm-yyyy'), 'dustin.mcgovern@asa.', '054-8120111', '9 Tilly');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (453899324, 'Ice', 'Lawrence', to_date('26-06-1977', 'dd-mm-yyyy'), 'icel@fflcbancorp.au', '050-2353554', '26 Amanda Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (837171156, 'Willem', 'Burns', to_date('29-06-2067', 'dd-mm-yyyy'), 'willem.burns@spas.ca', '058-9839768', '31 Ingram Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (626016075, 'Rosanne', 'Kinski', to_date('31-08-1991', 'dd-mm-yyyy'), 'rosanne.kinski@abs.d', '055-9210680', '91 Hirsch Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (167738387, 'Chrissie', 'Herrmann', to_date('29-10-1993', 'dd-mm-yyyy'), 'chrissie@marriottint', '054-9718288', '13 Hässleholm Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (510523506, 'Annie', 'Faithfull', to_date('19-02-1995', 'dd-mm-yyyy'), 'afaithfull@cima.com', '052-6167212', '20 Bologna Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (773613808, 'Geoffrey', 'Ness', to_date('05-11-1999', 'dd-mm-yyyy'), 'gness@linacsystems.c', '058-7768237', '65 Madsen Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (40267213, 'Franco', 'Sweet', to_date('18-07-1979', 'dd-mm-yyyy'), 'franco.sweet@securit', '055-9302102', '19 Sandra Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (732497977, 'Lonnie', 'Potter', to_date('13-12-1977', 'dd-mm-yyyy'), 'lonnie@diamondgroup.', '054-8062475', '23 New Haven Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (42953284, 'Juliet', 'Azaria', to_date('25-11-1981', 'dd-mm-yyyy'), 'juliet.azaria@jsa.co', '054-4625201', '70 Debra Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (302014611, 'Charlie', 'Horton', to_date('24-08-2063', 'dd-mm-yyyy'), 'charlie.horton@telwa', '058-9746254', '84 Rickie');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (564015449, 'Rene', 'Deejay', to_date('23-04-2069', 'dd-mm-yyyy'), 'rene.deejay@bluffcit', '050-1393020', '23 Cincinnati Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (634414862, 'Yaphet', 'Faithfull', to_date('16-09-1981', 'dd-mm-yyyy'), 'yaphet.f@kitba.br', '050-9642649', '23 Suzy Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (484642804, 'Viggo', 'Jackman', to_date('30-06-1992', 'dd-mm-yyyy'), 'viggo.jackman@solips', '052-2108017', '61 Coley Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (86606144, 'Bebe', 'Lindley', to_date('20-03-2060', 'dd-mm-yyyy'), 'bebe.lindley@esoftso', '055-9534624', '57 Reynolds Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (143171657, 'Lloyd', 'Walken', to_date('20-02-1982', 'dd-mm-yyyy'), 'lloyd.w@vertexsoluti', '058-3779352', '18 Luongo Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (795121722, 'Halle', 'Vincent', to_date('15-04-2070', 'dd-mm-yyyy'), 'h.vincent@berkshireh', '055-8823605', '9 Eliza Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (448224864, 'Rob', 'Lonsdale', to_date('12-03-1988', 'dd-mm-yyyy'), 'r.lonsdale@zoneperfe', '054-6859509', '597 Owen Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (247033005, 'Hookah', 'Kimball', to_date('24-05-2061', 'dd-mm-yyyy'), 'hookah.kimball@clubo', '052-6522717', '25 Pordenone Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (277280966, 'Cesar', 'Osment', to_date('01-05-1988', 'dd-mm-yyyy'), 'cosment@its.com', '052-5005989', '22nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (446290911, 'Madeleine', 'Flatts', to_date('18-10-1998', 'dd-mm-yyyy'), 'madeleine.flatts@mse', '054-7303706', '97 Richmond Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (772651087, 'Kenneth', 'Benet', to_date('27-08-1998', 'dd-mm-yyyy'), 'kenneth.benet@sht.co', '058-0088910', '222 Thurman Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (804670522, 'Mel', 'Duke', to_date('25-06-1973', 'dd-mm-yyyy'), 'mduke@unit.de', '054-5542267', '69 Palminteri Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (225378677, 'Rene', 'Armstrong', to_date('04-05-1983', 'dd-mm-yyyy'), 'r.armstrong@ubp.de', '054-0267464', '49 Nils Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (732696916, 'Samantha', 'Shearer', to_date('12-02-1987', 'dd-mm-yyyy'), 'samanthas@allegiantb', '054-7162121', '81st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (627799076, 'Gaby', 'Addy', to_date('02-12-1972', 'dd-mm-yyyy'), 'gaddy@shufflemaster.', '055-2792525', '7 Carlsbad Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (118950297, 'Carl', 'Arthur', to_date('02-11-1977', 'dd-mm-yyyy'), 'carl.arthur@sony.com', '055-9541170', '49 Watson Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (329528702, 'Sylvester', 'Bradford', to_date('14-05-2067', 'dd-mm-yyyy'), 'sylvester.bradford@y', '058-9780343', '70 Braintree Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (17862847, 'Marie', 'Ferrer', to_date('02-03-1980', 'dd-mm-yyyy'), 'marief@astafunding.e', '058-6993411', '48 Guinness Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (854243954, 'Lennie', 'Elizondo', to_date('09-10-1984', 'dd-mm-yyyy'), 'lennie.elizondo@vfs.', '052-1340615', '93rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (907237889, 'Alan', 'Kurtz', to_date('17-06-1998', 'dd-mm-yyyy'), 'alan.kurtz@bat.jp', '058-1441209', '44 Hong Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (325654383, 'Liev', 'Lennix', to_date('24-05-1974', 'dd-mm-yyyy'), 'liev.lennix@infinity', '054-0266853', '976 Wainwright Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (404357409, 'Merillee', 'Fonda', to_date('08-09-2067', 'dd-mm-yyyy'), 'merillee.fonda@verit', '052-0010992', '95 Exeter Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (955908228, 'Bo', 'Perez', to_date('17-05-2068', 'dd-mm-yyyy'), 'bo36@venoco.com', '052-4886086', '80 Levy Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (934423172, 'Henry', 'Short', to_date('28-08-2065', 'dd-mm-yyyy'), 'hshort@mwp.de', '055-8976864', '46 Wariner Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (798586087, 'Ashley', 'Li', to_date('15-11-1974', 'dd-mm-yyyy'), 'ashley.li@digitalmot', '054-6190652', '13rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (889310794, 'Meg', 'Preston', to_date('23-03-1996', 'dd-mm-yyyy'), 'meg.preston@restaura', '054-5510692', '29 Heron Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (67569364, 'Miguel', 'Pollak', to_date('04-06-1975', 'dd-mm-yyyy'), 'miguel.pollak@pearll', '052-0457284', '15 Wood Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (556230324, 'Taylor', 'Hubbard', to_date('30-11-2000', 'dd-mm-yyyy'), 'taylor.hubbard@sm.ch', '050-1671067', '7 Chaka Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (134559759, 'Mary Beth', 'Schwarzenegger', to_date('18-09-2001', 'dd-mm-yyyy'), 'marybeth@gateway.de', '052-3201570', '11st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (750969168, 'Keanu', 'Matheson', to_date('28-08-2069', 'dd-mm-yyyy'), 'k.matheson@cascadeba', '055-6895785', '721 Harvey Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (716609955, 'Dom', 'Curfman', to_date('05-02-1997', 'dd-mm-yyyy'), 'dom.curfman@caliber.', '058-4748128', '46 Balmoral Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (983985575, 'Jackson', 'Dillane', to_date('29-05-1993', 'dd-mm-yyyy'), 'jackson.dillane@sbc.', '054-1790972', '86 Protvino Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (881292458, 'Wallace', 'Russell', to_date('01-01-1998', 'dd-mm-yyyy'), 'wallacer@intel.ca', '055-8075874', '654 Raye Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (701235684, 'Garth', 'Raybon', to_date('07-05-1983', 'dd-mm-yyyy'), 'garth@americanland.c', '054-1080138', '73 Tillis Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (192508750, 'Suzanne', 'Woodward', to_date('15-10-1994', 'dd-mm-yyyy'), 's.woodward@naturescu', '054-2470395', '51st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (771582656, 'Oro', 'O''Connor', to_date('07-05-2069', 'dd-mm-yyyy'), 'oro.oconnor@pib.at', '050-7787722', '49 Bobbi Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (784677078, 'Busta', 'Ronstadt', to_date('31-12-2063', 'dd-mm-yyyy'), 'busta.r@grs.com', '055-4286539', '28 Levin Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (593492279, 'Sal', 'Portman', to_date('25-01-1995', 'dd-mm-yyyy'), 'sportman@bmm.no', '050-8127109', '77 Mclean');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (315762216, 'Powers', 'Marley', to_date('15-09-1987', 'dd-mm-yyyy'), 'p.marley@progressive', '054-1295957', '802 LaSalle Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (544136034, 'Ritchie', 'Hopkins', to_date('23-11-1982', 'dd-mm-yyyy'), 'ritchieh@providentba', '050-8736099', '43rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (390627617, 'Vienna', 'Judd', to_date('29-01-1995', 'dd-mm-yyyy'), 'viennaj@integramedam', '054-4607771', '857 Brothers Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (292924108, 'Franz', 'Marin', to_date('26-06-1990', 'dd-mm-yyyy'), 'franz@msdw.de', '050-3524099', '93 Lowe Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (972613162, 'Randy', 'Lemmon', to_date('13-01-2068', 'dd-mm-yyyy'), 'randy@sony.com', '055-6486550', '881 McGowan Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (881869835, 'Geraldine', 'Pierce', to_date('16-04-1974', 'dd-mm-yyyy'), 'geraldine@kis.za', '058-5135376', '63rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (248507079, 'Ashton', 'Minogue', to_date('21-09-1975', 'dd-mm-yyyy'), 'ashton.minogue@conqu', '058-4471608', '19 Canal Winchester');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (317550319, 'Kris', 'Noseworthy', to_date('08-12-2066', 'dd-mm-yyyy'), 'kris.noseworthy@prp.', '054-6063615', '27 Springfield Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (947360514, 'Darius', 'Foley', to_date('29-04-1974', 'dd-mm-yyyy'), 'darius@topicsenterta', '054-3654531', '61st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (113032438, 'Cledus', 'Irons', to_date('24-08-1990', 'dd-mm-yyyy'), 'c.irons@outsourcegro', '058-5067330', '57 Ruiz Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (933823004, 'Carlene', 'Ticotin', to_date('15-07-1981', 'dd-mm-yyyy'), 'carlenet@stonebrewin', '055-2043879', '10 Patrick Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (399231677, 'Jerry', 'Skarsgard', to_date('07-05-1997', 'dd-mm-yyyy'), 'jskarsgard@unicru.it', '054-2996908', '148 McCracken Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (880249718, 'Will', 'Sandler', to_date('12-02-1971', 'dd-mm-yyyy'), 'wsandler@nhhc.au', '058-9011025', '10 Aiken Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (678468405, 'Pamela', 'Westerberg', to_date('03-02-1979', 'dd-mm-yyyy'), 'pamela.westerberg@ib', '054-4593354', '61 Harrison Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (763454499, 'Candice', 'Cocker', to_date('13-10-1988', 'dd-mm-yyyy'), 'candice.cocker@unit.', '058-8308394', '74 Guilfoyle Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (273155600, 'Jane', 'Salt', to_date('23-12-1981', 'dd-mm-yyyy'), 'janes@callhenry.com', '055-9074597', '597 Ozzy Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (485614666, 'Jonny Lee', 'Scorsese', to_date('25-01-1980', 'dd-mm-yyyy'), 'jonnylee.scorsese@ow', '055-4530803', '53rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (409533789, 'Franco', 'Daniels', to_date('20-09-2064', 'dd-mm-yyyy'), 'franco.daniels@astaf', '052-7801677', '23 Nunn Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (642138538, 'Tobey', 'Spall', to_date('25-11-1984', 'dd-mm-yyyy'), 'tobey.spall@paintedw', '052-9563321', '30 Espoo Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (188671176, 'Collective', 'Sharp', to_date('30-05-2001', 'dd-mm-yyyy'), 'csharp@pfizer.au', '058-2509007', '298 Peter Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (484598231, 'Tony', 'Coughlan', to_date('07-01-1989', 'dd-mm-yyyy'), 'tony.c@taycorfinanci', '050-7707343', '18 Oldham Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (610951728, 'Cathy', 'Gershon', to_date('27-02-1977', 'dd-mm-yyyy'), 'c.gershon@ataservice', '055-9120270', '24 Palo Alto Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (203659659, 'Renee', 'Schock', to_date('21-09-1980', 'dd-mm-yyyy'), 'r.schock@bigdoughcom', '052-9880624', '788 League city Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (579225577, 'Jonatha', 'Hunt', to_date('22-06-2069', 'dd-mm-yyyy'), 'jonatha.hunt@mercant', '055-4954719', '100 Aaron Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (828434655, 'Tom', 'Colin Young', to_date('05-09-2060', 'dd-mm-yyyy'), 'tom@iss.com', '054-9966204', '894 Max Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (730676831, 'Harris', 'Loeb', to_date('28-06-1991', 'dd-mm-yyyy'), 'harris.loeb@floorgra', '050-7877934', '3 Hugh Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (335634509, 'Kelli', 'Ponty', to_date('06-03-1971', 'dd-mm-yyyy'), 'kelli.ponty@ssci.ca', '050-0479381', '759 Stevie Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (893688647, 'Holland', 'Witherspoon', to_date('27-11-1994', 'dd-mm-yyyy'), 'hwitherspoon@genghis', '050-0099005', '66 Albert Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (152460542, 'Vertical', 'Fishburne', to_date('17-01-2065', 'dd-mm-yyyy'), 'vertical.fishburne@b', '055-1032182', '89 Rupert Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (850567949, 'Gordie', 'Danger', to_date('09-12-2063', 'dd-mm-yyyy'), 'gordie.d@arkidata.uk', '050-8724352', '85 Baranski Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (900326314, 'Edward', 'Bullock', to_date('13-04-1976', 'dd-mm-yyyy'), 'edward.bullock@beste', '054-1726942', '20 Battle Creek Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (232927661, 'Elle', 'Margulies', to_date('19-08-1974', 'dd-mm-yyyy'), 'elle.margulies@jlpho', '058-1123833', '48 Cruise Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (16077752, 'Minnie', 'Streep', to_date('15-12-2060', 'dd-mm-yyyy'), 'minnie.streep@univer', '054-9524811', '55 Lineback Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (278148043, 'Loren', 'Blaine', to_date('08-11-2000', 'dd-mm-yyyy'), 'lblaine@ipsadvisory.', '054-3214217', '47 Gloria Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (850228776, 'Rick', 'Willis', to_date('18-02-1998', 'dd-mm-yyyy'), 'rwillis@sfmai.com', '058-2756962', '238 Penelope Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (807344480, 'Pat', 'Young', to_date('02-12-1989', 'dd-mm-yyyy'), 'paty@monitronicsinte', '054-3095681', '79 Smyrna Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (670826383, 'Joe', 'Dickinson', to_date('12-05-1994', 'dd-mm-yyyy'), 'jdickinson@kellogg.f', '050-3898147', '43 Kershaw Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (952368085, 'Arnold', 'Rosas', to_date('05-04-1988', 'dd-mm-yyyy'), 'a.rosas@columbiabanc', '052-5731526', '71 Turku Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (51232047, 'Allan', 'Van Damme', to_date('08-04-2063', 'dd-mm-yyyy'), 'allanv@novartis.com', '050-9488322', '21 Cheadle Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (5788049, 'Angelina', 'Carlton', to_date('10-04-2070', 'dd-mm-yyyy'), 'angelina.carlton@ban', '055-6573969', '556 Levine Road');
commit;
prompt 200 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (863863106, 'Dylan', 'Flanagan', to_date('10-05-1991', 'dd-mm-yyyy'), 'dylan@aldensystems.c', '052-8284282', '257 Porto alegre Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (538219352, 'Alec', 'McGoohan', to_date('11-11-2070', 'dd-mm-yyyy'), 'a.mcgoohan@americanp', '058-2300277', '590 Kattan Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (870999361, 'Harrison', 'Walken', to_date('25-07-1996', 'dd-mm-yyyy'), 'harrison.walken@prp.', '055-2114238', '18 Cruise Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (710267871, 'Denise', 'Gambon', to_date('30-07-2070', 'dd-mm-yyyy'), 'denise.gambon@mitsub', '054-1766809', '21 Paltrow Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (539603054, 'Kelly', 'Overstreet', to_date('26-01-2065', 'dd-mm-yyyy'), 'kelly.overstreet@hom', '054-8880077', '92 Aurora');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (307385375, 'Loren', 'Stamp', to_date('30-05-1992', 'dd-mm-yyyy'), 'loren.stamp@american', '050-6010352', '889 København Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (758519887, 'Geena', 'Flanagan', to_date('03-05-1974', 'dd-mm-yyyy'), 'geena.flanagan@allst', '052-4695038', '3 Beckinsale Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (140572763, 'Pete', 'Root', to_date('24-10-1993', 'dd-mm-yyyy'), 'pete.root@saltgroup.', '050-6064816', '58 Delroy Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (9415222, 'Ani', 'Levin', to_date('04-05-1988', 'dd-mm-yyyy'), 'a.levin@gdatechnolog', '058-1985883', '949 Cusack Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (923499812, 'Mary-Louise', 'Lynskey', to_date('30-10-1988', 'dd-mm-yyyy'), 'mlynskey@universalso', '054-1366963', '35 Murdock Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (497737675, 'Shannyn', 'Balin', to_date('30-06-1995', 'dd-mm-yyyy'), 'shannyn@noodles.com', '050-1479890', '10 Arnold Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (991635518, 'Powers', 'Lizzy', to_date('23-04-2070', 'dd-mm-yyyy'), 'powers.lizzy@envisio', '050-5714080', '44 Pony Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (356996400, 'Matt', 'Carter', to_date('03-10-1981', 'dd-mm-yyyy'), 'matt.carter@voicelog', '052-8488920', '73 Danni Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (191611384, 'Morgan', 'Lunch', to_date('06-04-1992', 'dd-mm-yyyy'), 'morgan.lunch@horizon', '058-1600024', '61 Robby');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (990786616, 'Rosanna', 'Blackwell', to_date('31-07-1999', 'dd-mm-yyyy'), 'rosanna.blackwell@ms', '058-5343629', '67 Neill Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (471406941, 'Jann', 'Fehr', to_date('13-08-1989', 'dd-mm-yyyy'), 'jann.fehr@ssci.dk', '055-5712563', '93 Quinn Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (454449777, 'Wade', 'Broadbent', to_date('28-04-1975', 'dd-mm-yyyy'), 'wadeb@afs.com', '054-2348952', '40 Kingston Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (691138819, 'Aimee', 'McKennitt', to_date('07-01-1984', 'dd-mm-yyyy'), 'aimee.mckennitt@pfiz', '058-3721482', '72 Heron Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (106946669, 'Jimmy', 'Heald', to_date('24-12-1980', 'dd-mm-yyyy'), 'jimmy.heald@aldensys', '052-5477066', '38 Plummer Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (3259235, 'Julia', 'McCoy', to_date('24-09-1993', 'dd-mm-yyyy'), 'juliam@spenser.com', '054-8032496', '86 Mint');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (149143552, 'Leon', 'Mueller-Stahl', to_date('25-10-1973', 'dd-mm-yyyy'), 'l.muellerstahl@aquic', '052-9256345', '28 Mos Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (131638598, 'Edwin', 'Rauhofer', to_date('08-08-1978', 'dd-mm-yyyy'), 'edwin.rauhofer@msdw.', '058-0767547', '47 Sample Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (112885771, 'Gino', 'Coltrane', to_date('03-04-1975', 'dd-mm-yyyy'), 'g.coltrane@mattel.co', '058-5663902', '83rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (955806682, 'Richard', 'Baez', to_date('12-11-1979', 'dd-mm-yyyy'), 'richard.baez@elmco.i', '052-7554017', '29 Columbus Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (759100156, 'Nelly', 'Buckingham', to_date('03-12-1976', 'dd-mm-yyyy'), 'nelly.buckingham@pro', '055-0340470', '91 Roanoke Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (730837724, 'Shannon', 'Yulin', to_date('20-09-2061', 'dd-mm-yyyy'), 'shannon.yulin@sensor', '054-1035999', '22nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (166294914, 'Heath', 'Vassar', to_date('19-05-1972', 'dd-mm-yyyy'), 'heath@stonebrewing.c', '054-2523114', '7 Liotta Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (898248512, 'Uma', 'Frampton', to_date('22-11-2060', 'dd-mm-yyyy'), 'uma.frampton@general', '054-6882380', '915 Ellis Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (93837744, 'Andie', 'Griffiths', to_date('21-09-2001', 'dd-mm-yyyy'), 'andie.g@consultants.', '054-5052759', '62 Leto');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (229666566, 'Jason', 'Lloyd', to_date('17-09-1992', 'dd-mm-yyyy'), 'jlloyd@larkinenterpr', '050-4454405', '33 Bailey Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (145847200, 'Peter', 'Soda', to_date('04-06-1977', 'dd-mm-yyyy'), 'peter.soda@mastercar', '055-1989823', '39 Price Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (520624373, 'Val', 'Mohr', to_date('20-02-1971', 'dd-mm-yyyy'), 'valm@electricalsolut', '052-5759107', '4 Corey Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (398592749, 'Pam', 'Kudrow', to_date('11-09-1986', 'dd-mm-yyyy'), 'p.kudrow@stiknowledg', '058-3833398', '14 Merrilee Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (861697940, 'Corey', 'Spall', to_date('16-10-2066', 'dd-mm-yyyy'), 'corey.spall@american', '054-8977412', '56 Bale Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (334607657, 'Roberta', 'Arkin', to_date('19-12-1981', 'dd-mm-yyyy'), 'roberta@pra.com', '052-1562749', '71 Fountain Hills Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (245535783, 'Grace', 'Cheadle', to_date('15-06-1974', 'dd-mm-yyyy'), 'grace.cheadle@efcban', '055-5296565', '152 Willie Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (172651778, 'Avenged', 'Harrison', to_date('27-11-1994', 'dd-mm-yyyy'), 'avenged@newviewgifts', '055-6551295', '467 Lattimore Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (892064530, 'Avenged', 'Duschel', to_date('08-04-1975', 'dd-mm-yyyy'), 'avenged@calence.ar', '052-6614321', '22nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (752916919, 'Karon', 'Deschanel', to_date('04-02-2070', 'dd-mm-yyyy'), 'k.deschanel@mms.it', '054-2393416', '62nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (879632809, 'Hookah', 'Roy Parnell', to_date('25-10-1993', 'dd-mm-yyyy'), 'hookah@hospitalsolut', '054-4617662', '82 Bo Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (461446498, 'Christina', 'Shannon', to_date('09-11-1975', 'dd-mm-yyyy'), 'christina.shannon@st', '058-7842088', '2 Seattle Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (323472847, 'Ashton', 'DeLuise', to_date('08-09-1980', 'dd-mm-yyyy'), 'ashton.deluise@accus', '055-8137076', '756 Mira Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (211851761, 'Angela', 'Pepper', to_date('23-02-1998', 'dd-mm-yyyy'), 'angela.pepper@educat', '055-9145003', '54 Tate');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (159812923, 'Martha', 'Rudd', to_date('06-06-1986', 'dd-mm-yyyy'), 'martha.r@vms.it', '058-5189961', '97 Barueri Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (505211974, 'Neil', 'Beckham', to_date('26-05-1978', 'dd-mm-yyyy'), 'neil@fmt.dk', '055-5541016', '88 Vin Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (346553711, 'Freda', 'Springfield', to_date('29-05-1987', 'dd-mm-yyyy'), 'fspringfield@traffic', '055-9525033', '19 Playboys Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (297553286, 'Kim', 'Evett', to_date('22-08-1986', 'dd-mm-yyyy'), 'kim.evett@gulfmarkof', '052-4580272', '40 Gauteng Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (717053350, 'Cole', 'Easton', to_date('13-09-2062', 'dd-mm-yyyy'), 'ceaston@larkinenterp', '055-6371614', '23rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (710754129, 'Vickie', 'Tyler', to_date('02-10-2000', 'dd-mm-yyyy'), 'vickie@americanpan.c', '050-3451404', '9 Jovovich Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (344997269, 'Giovanni', 'Day', to_date('20-10-2000', 'dd-mm-yyyy'), 'gday@venoco.uk', '054-4984324', '491 Plimpton Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (373001770, 'Rebeka', 'Sinise', to_date('07-04-1978', 'dd-mm-yyyy'), 'r.sinise@mse.com', '058-9893341', '70 Ravensburg Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (490101171, 'Max', 'Coe', to_date('10-05-2062', 'dd-mm-yyyy'), 'max.c@tilsonhr.es', '054-1334352', '37 Devon Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (50790431, 'Eileen', 'Hubbard', to_date('04-07-1987', 'dd-mm-yyyy'), 'eileen@avs.com', '058-3888798', '24 Dolenz Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (488097850, 'Patty', 'Flemyng', to_date('25-04-1972', 'dd-mm-yyyy'), 'patty.flemyng@catamo', '050-4953806', '30 Dresden');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (323894716, 'Trini', 'Roundtree', to_date('06-09-1980', 'dd-mm-yyyy'), 'trini.roundtree@fam.', '050-1320140', '100 Dale Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (479387983, 'Guy', 'Conlee', to_date('01-03-2067', 'dd-mm-yyyy'), 'guy.conlee@acsis.dk', '058-9333482', '40 Enschede Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (758299525, 'Willie', 'Womack', to_date('01-10-2065', 'dd-mm-yyyy'), 'willie.womack@interf', '052-8772173', '12nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (180735733, 'Sheena', 'Weaving', to_date('10-01-1990', 'dd-mm-yyyy'), 'sweaving@diamondgrou', '055-0004509', '65 Henry Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (144556909, 'Giovanni', 'Biehn', to_date('26-06-1999', 'dd-mm-yyyy'), 'giovannib@fmb.com', '052-5549083', '74 Condition Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (863649180, 'Ving', 'Belles', to_date('27-06-1999', 'dd-mm-yyyy'), 'ving.belles@biorefer', '054-7795380', '7 Fisher Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (546344529, 'Caroline', 'Braugher', to_date('05-10-2062', 'dd-mm-yyyy'), 'caroline@arkidata.co', '050-4585201', '39 Gatlin Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (85160278, 'Joaquim', 'Dupree', to_date('15-11-2068', 'dd-mm-yyyy'), 'joaquim@sony.com', '054-1564131', '39 Milwaukee Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (624574126, 'Kid', 'Byrne', to_date('25-03-1995', 'dd-mm-yyyy'), 'kid@pepsico.com', '052-4098878', '11 Stanton Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (416556986, 'Rosario', 'Bratt', to_date('28-05-1974', 'dd-mm-yyyy'), 'rosario.bratt@provid', '054-5150063', '25 Kasey Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (883389167, 'Wally', 'Lillard', to_date('01-02-2067', 'dd-mm-yyyy'), 'wallyl@outsourcegrou', '054-7917761', '51 Lincoln');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (115028698, 'Alannah', 'Hong', to_date('08-12-1971', 'dd-mm-yyyy'), 'alannah.hong@irissof', '052-3643370', '88 Cerritos Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (988436195, 'Albertina', 'McCann', to_date('01-01-1994', 'dd-mm-yyyy'), 'albertina.mccann@clu', '055-8955923', '73 Holden');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (735045595, 'Cheech', 'Breslin', to_date('22-11-1990', 'dd-mm-yyyy'), 'cheech.breslin@sourc', '055-9829196', '13rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (976639143, 'Nathan', 'Arkin', to_date('08-01-2069', 'dd-mm-yyyy'), 'nathan@bayer.com', '054-9056592', '63 Hyde Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (948584711, 'Lonnie', 'Boone', to_date('07-12-2069', 'dd-mm-yyyy'), 'lonnie.boone@operati', '058-0134172', '19 Jude Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (629004840, 'Laurie', 'Rush', to_date('16-04-2066', 'dd-mm-yyyy'), 'laurie@afs.de', '058-1003054', '82 Russell Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (518120976, 'Gloria', 'Holly', to_date('21-06-1977', 'dd-mm-yyyy'), 'gloria.holly@sfgo.de', '052-3163260', '8 Dorff Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (665730745, 'Noah', 'Bedelia', to_date('27-10-1987', 'dd-mm-yyyy'), 'noah.bedelia@actives', '055-6587668', '70 Tara Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (447981658, 'Melba', 'Colin Young', to_date('01-12-1979', 'dd-mm-yyyy'), 'melba@perfectorder.c', '058-5058750', '8 Munich Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (920835728, 'Mindy', 'Blair', to_date('26-12-2067', 'dd-mm-yyyy'), 'mindy.blair@carteret', '052-2398526', '482 Unger Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (129704999, 'Ramsey', 'Wiest', to_date('13-11-1999', 'dd-mm-yyyy'), 'ramsey.wiest@solutio', '052-3692721', '671 Wariner Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (991354629, 'Minnie', 'Kirkwood', to_date('07-03-2000', 'dd-mm-yyyy'), 'minnie.k@swi.com', '050-2810057', '974 Goran Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (534027819, 'Richie', 'Hiatt', to_date('01-07-1978', 'dd-mm-yyyy'), 'richie.h@gateway.com', '055-9552252', '3 Lineback Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (416036705, 'Tramaine', 'Humphrey', to_date('01-08-1973', 'dd-mm-yyyy'), 'thumphrey@escalade.j', '058-1273872', '670 DeVita Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (876952766, 'Ashton', 'Caviezel', to_date('20-01-1994', 'dd-mm-yyyy'), 'ashton.c@angieslist.', '054-2532779', '53 Grace');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (800079255, 'Robby', 'Viterelli', to_date('06-08-1982', 'dd-mm-yyyy'), 'robby.viterelli@digi', '050-6950629', '44 Hong Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (784669838, 'Kim', 'LaPaglia', to_date('16-12-2061', 'dd-mm-yyyy'), 'kim.lapaglia@actechn', '050-5723623', '218 Ryder Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (262836484, 'Kate', 'Holiday', to_date('15-12-2060', 'dd-mm-yyyy'), 'kate.holiday@employe', '054-8947556', '30 Curfman');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (869113227, 'Remy', 'Stamp', to_date('19-04-1993', 'dd-mm-yyyy'), 'remy.stamp@wendysint', '054-7011709', '41 Suwon');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (823895037, 'Collective', 'Sevigny', to_date('22-07-2066', 'dd-mm-yyyy'), 'collective.sevigny@n', '055-6246811', '8 Genève Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (652573249, 'Whoopi', 'Lucas', to_date('23-05-2067', 'dd-mm-yyyy'), 'whoopi.lucas@at.de', '058-5879518', '97 Molly Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (646104398, 'Hank', 'Fraser', to_date('26-06-2069', 'dd-mm-yyyy'), 'hank@learningvoyage.', '050-3674886', '11 Caldwell');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (420334118, 'Glen', 'McLachlan', to_date('21-01-1976', 'dd-mm-yyyy'), 'glenm@ceom.ch', '054-7530947', '46 Santa rita sapucaí Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (232043794, 'Ming-Na', 'O''Keefe', to_date('16-06-2000', 'dd-mm-yyyy'), 'mingna@sunstream.com', '055-2736406', '168 Martinez Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (65721218, 'Roberta', 'Overstreet', to_date('23-06-2062', 'dd-mm-yyyy'), 'roberta.overstreet@s', '052-3654841', '45 Saucedo Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (117427949, 'Rita', 'Stanley', to_date('02-04-1999', 'dd-mm-yyyy'), 'rita.stanley@north.c', '052-5632226', '21 Gandolfini Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (453391134, 'Joely', 'Dalley', to_date('18-03-1987', 'dd-mm-yyyy'), 'joely.dalley@glacier', '050-2208299', '53 Pompeia Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (743011756, 'Raul', 'O''Donnell', to_date('19-01-1981', 'dd-mm-yyyy'), 'raulo@computersource', '054-9646253', '47 Tommy Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (615558142, 'Sheena', 'Gordon', to_date('25-12-2001', 'dd-mm-yyyy'), 'sgordon@apexsystems.', '050-7789457', '42nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (562061915, 'Gene', 'Orlando', to_date('16-03-1975', 'dd-mm-yyyy'), 'gene.o@capitalautomo', '055-8947387', '70 Rowan Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (718416532, 'Tommy', 'Coolidge', to_date('13-08-1980', 'dd-mm-yyyy'), 'tommy.c@sfb.com', '054-2949089', '28 Flatts Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (109238670, 'Millie', 'Leoni', to_date('02-03-1976', 'dd-mm-yyyy'), 'millie@trainersoft.d', '054-4757219', '26 Eric Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (933653773, 'Vondie', 'Hackman', to_date('21-02-2001', 'dd-mm-yyyy'), 'vondie@httprint.jp', '050-2533411', '65 Lydia Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (488563122, 'Ozzy', 'Stoltz', to_date('19-04-1982', 'dd-mm-yyyy'), 'ozzy.stoltz@sbc.ar', '054-1363484', '75 McGregor');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (721839265, 'Brent', 'McDonald', to_date('31-03-1996', 'dd-mm-yyyy'), 'brent.mcdonald@cns.d', '052-6457701', '71 Louise Road');
commit;
prompt 300 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (416216676, 'Brittany', 'Eat World', to_date('10-12-2000', 'dd-mm-yyyy'), 'brittany.eatworld@pd', '054-7211483', '75 Waldbronn');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (930877311, 'Halle', 'Frampton', to_date('31-07-2070', 'dd-mm-yyyy'), 'halle.frampton@conqu', '058-9056135', '66 Jaime Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (438364769, 'Brittany', 'Foley', to_date('21-09-1974', 'dd-mm-yyyy'), 'brittany.foley@ameri', '055-0855152', '23 Nagoya Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (632546513, 'Randy', 'Kinski', to_date('22-06-2064', 'dd-mm-yyyy'), 'rkinski@naturescure.', '054-1911502', '13 Palin Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (856071544, 'Marianne', 'Allison', to_date('20-04-1997', 'dd-mm-yyyy'), 'marianne.allison@bas', '055-0457530', '15 Padova Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (947886426, 'Mary', 'Durning', to_date('19-11-2062', 'dd-mm-yyyy'), 'mary.durning@als.com', '050-8565430', '88 Freising Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (876181053, 'Miki', 'Reid', to_date('21-06-2061', 'dd-mm-yyyy'), 'mikir@priorityleasin', '052-9292467', '65 Kingsley Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (340865810, 'Judge', 'Ruffalo', to_date('25-11-1990', 'dd-mm-yyyy'), 'judge.ruffalo@albert', '052-9765102', '52 Bergen Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (633132847, 'Ty', 'Ali', to_date('07-12-2060', 'dd-mm-yyyy'), 'ty13@techbooks.com', '054-9339776', '33 Beth Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (960835490, 'Franz', 'Laurie', to_date('30-01-2070', 'dd-mm-yyyy'), 'franz.laurie@securit', '052-0262597', '343 St Kilda Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (320117990, 'Hilary', 'Tankard', to_date('25-04-2068', 'dd-mm-yyyy'), 'hilary.tankard@alter', '050-0902277', '36 Ted Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (444516362, 'Jeremy', 'Elliott', to_date('23-11-1991', 'dd-mm-yyyy'), 'jeremy.elliott@dcgro', '054-4798261', '63 Vanian Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (436868631, 'Russell', 'Burstyn', to_date('07-02-2070', 'dd-mm-yyyy'), 'russell.burstyn@henc', '055-8103805', '69 Bassett Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (385275650, 'Bridgette', 'Rifkin', to_date('02-08-1980', 'dd-mm-yyyy'), 'bridgette.rifkin@pri', '055-5373913', '81 Täby Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (828733912, 'Tony', 'Amos', to_date('03-05-2065', 'dd-mm-yyyy'), 'tonya@microsoft.uk', '050-6626856', '400 Herdecke Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (144034695, 'Rickie', 'Belushi', to_date('07-05-1981', 'dd-mm-yyyy'), 'rickie.belushi@gsat.', '052-3624722', '18 New Hyde Park Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (326672648, 'Meg', 'McIntosh', to_date('25-05-2065', 'dd-mm-yyyy'), 'mmcintosh@linacsyste', '052-2386181', '74 Dick');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (607937673, 'Larnelle', 'Kidman', to_date('12-04-1992', 'dd-mm-yyyy'), 'larnelle.kidman@card', '054-1001026', '41 Dan Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (830042921, 'Ray', 'Berry', to_date('03-11-1975', 'dd-mm-yyyy'), 'r.berry@virbac.de', '052-6864571', '881 Bretzfeld-Waldbach Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (32186042, 'Ethan', 'Gates', to_date('13-01-1993', 'dd-mm-yyyy'), 'ethan.g@signature.nl', '052-5435409', '99 Durning Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (545847994, 'Avril', 'Palmieri', to_date('27-03-2065', 'dd-mm-yyyy'), 'a.palmieri@bigdoughc', '052-6388410', '22nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (590219765, 'Pam', 'Bello', to_date('24-03-1978', 'dd-mm-yyyy'), 'pam.bello@worldcom.s', '052-8236919', '87 Vendetta Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (739358534, 'Jennifer', 'Woodward', to_date('20-06-1977', 'dd-mm-yyyy'), 'j.woodward@floorgrap', '050-1512641', '78 Ruiz Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (913800398, 'Frederic', 'Madsen', to_date('28-09-1974', 'dd-mm-yyyy'), 'fredericm@advancedne', '058-0114512', '95 Lucy Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (654372709, 'Tim', 'Herndon', to_date('01-01-1995', 'dd-mm-yyyy'), 'tim.herndon@paisley.', '052-6257129', '93 Pony Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (954376448, 'Kasey', 'Watson', to_date('27-08-2066', 'dd-mm-yyyy'), 'k.watson@bluffcityst', '058-4031653', '82 Javon Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (31123107, 'Cevin', 'Alston', to_date('28-08-1972', 'dd-mm-yyyy'), 'calston@trinityhomec', '050-2291140', '895 Plymouth Meeting Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (825472490, 'Garth', 'Carlton', to_date('18-11-1994', 'dd-mm-yyyy'), 'garth@talx.hk', '050-1120016', '27 Polito Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (749822347, 'Mira', 'Logue', to_date('28-09-1989', 'dd-mm-yyyy'), 'mira.logue@curagroup', '052-5324319', '70 Kista Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (108763247, 'Gilberto', 'Hauer', to_date('20-07-1998', 'dd-mm-yyyy'), 'ghauer@mse.de', '054-7600809', '32nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (822629798, 'Ashton', 'Armatrading', to_date('15-07-1979', 'dd-mm-yyyy'), 'aarmatrading@dcgroup', '052-4265433', '57 Davis Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (177458194, 'Nathan', 'Shaye', to_date('06-02-1995', 'dd-mm-yyyy'), 'nathan.shaye@uem.jp', '050-6756287', '495 Nanci Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (754587008, 'Benjamin', 'Deschanel', to_date('24-01-2000', 'dd-mm-yyyy'), 'benjamin.deschanel@t', '054-2620189', '82nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (678905172, 'Elle', 'Duschel', to_date('18-02-1983', 'dd-mm-yyyy'), 'elle.duschel@venoco.', '054-8116200', '145 Janney Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (158830196, 'Vonda', 'Worrell', to_date('06-04-1992', 'dd-mm-yyyy'), 'vonda.worrell@palmbe', '058-1816969', '36 Goldblum Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (578327214, 'Mira', 'Lange', to_date('19-03-2065', 'dd-mm-yyyy'), 'mira.lange@veritekin', '050-6746972', '29 Irkutsk Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (647104630, 'Stephanie', 'Sirtis', to_date('23-03-2068', 'dd-mm-yyyy'), 'stephanie.sirtis@nmr', '054-4581361', '71 Moss Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (289838501, 'Guy', 'Studi', to_date('17-05-1999', 'dd-mm-yyyy'), 'guy@gillani.com', '052-6625363', '67 urban Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (732499794, 'Taylor', 'Francis', to_date('06-05-2069', 'dd-mm-yyyy'), 'taylor.francis@mitsu', '054-6906690', '17 Enschede Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (193381008, 'Loreena', 'Woods', to_date('24-12-1980', 'dd-mm-yyyy'), 'loreena.woods@unicru', '058-4276644', '49 Mechelen Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (964685021, 'Ian', 'Taylor', to_date('02-09-1993', 'dd-mm-yyyy'), 'ian@formatech.fi', '050-2150407', '61 Koblenz');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (832765018, 'Catherine', 'Nicholson', to_date('08-12-1996', 'dd-mm-yyyy'), 'catherinen@hotmail.e', '050-8618809', '10 Ferry Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (96182382, 'Rosario', 'Schiff', to_date('08-06-2069', 'dd-mm-yyyy'), 'rosario.schiff@peerl', '058-8791619', '24 Thorton Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (144840904, 'Jena', 'Nicks', to_date('04-04-1998', 'dd-mm-yyyy'), 'jena.nicks@formatech', '052-2592962', '55 Springfield Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (573664497, 'Selma', 'Webb', to_date('17-02-2069', 'dd-mm-yyyy'), 'selma.webb@telechemi', '052-9737601', '21 Marie');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (887434521, 'Red', 'Moody', to_date('24-05-1972', 'dd-mm-yyyy'), 'red.m@tilsonlandscap', '055-4655552', '73rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (971575897, 'Taylor', 'Astin', to_date('16-10-1994', 'dd-mm-yyyy'), 'taylor.astin@parksit', '050-3718884', '85 Aykroyd Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (854938402, 'Hilary', 'Steenburgen', to_date('19-02-2065', 'dd-mm-yyyy'), 'hilary.steenburgen@b', '050-2208065', '92nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (848397906, 'Gil', 'Ojeda', to_date('01-12-1995', 'dd-mm-yyyy'), 'gil.ojeda@gdatechnol', '055-4193257', '4 Espoo Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (965019165, 'Saffron', 'Chao', to_date('15-04-1976', 'dd-mm-yyyy'), 'saffron.chao@lms.ch', '058-9343537', '33 Dorn Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (891979841, 'Thomas', 'Dourif', to_date('17-04-1989', 'dd-mm-yyyy'), 'thomasd@ois.com', '050-9060333', '100 Kristin Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (938733161, 'Sharon', 'Neeson', to_date('09-12-1999', 'dd-mm-yyyy'), 'sneeson@magnet.com', '055-1590338', '82 Peebles Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (434418310, 'Gerald', 'Wiest', to_date('29-12-1985', 'dd-mm-yyyy'), 'gerald.wiest@fnb.com', '058-2559489', '107 Bretzfeld-Waldbach Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (39493470, 'Halle', 'Rain', to_date('13-03-2065', 'dd-mm-yyyy'), 'halle.rain@trm.com', '050-8926560', '691 Doug Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (630956611, 'Holly', 'Steenburgen', to_date('12-02-1983', 'dd-mm-yyyy'), 'h.steenburgen@glaxos', '052-9150963', '42 Mraz Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (594235102, 'Powers', 'Stuart', to_date('15-04-1981', 'dd-mm-yyyy'), 'powers.stuart@base.c', '054-4433164', '48 Curtis Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (136849513, 'Neve', 'Zahn', to_date('16-08-1980', 'dd-mm-yyyy'), 'neve.zahn@cns.cn', '054-0846953', '57 Kaunas Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (330741959, 'Avenged', 'Banderas', to_date('12-12-1989', 'dd-mm-yyyy'), 'avengedb@telechemint', '058-8467561', '479 Kadison Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (770553743, 'Orlando', 'Pastore', to_date('26-06-1992', 'dd-mm-yyyy'), 'orlando@hudsonriverb', '055-0793406', '19 Streamwood Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (177146553, 'Ozzy', 'Pollack', to_date('03-04-1978', 'dd-mm-yyyy'), 'ozzy.p@prometheuslab', '058-2086265', '25 Dortmund Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (771418239, 'Cloris', 'Griffiths', to_date('25-12-1991', 'dd-mm-yyyy'), 'cloris@invisioncom.z', '055-1704765', '10 Salonga');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (790323367, 'Liv', 'Vicious', to_date('17-04-1976', 'dd-mm-yyyy'), 'liv.vicious@priority', '052-8534571', '109 Singletary Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (850027552, 'Udo', 'Bandy', to_date('16-12-1985', 'dd-mm-yyyy'), 'udo.b@hfn.mo', '055-3680718', '62 Davison Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (37546950, 'Vertical', 'Kinski', to_date('29-06-1974', 'dd-mm-yyyy'), 'vertical.kinski@inve', '052-9687046', '132 Quaid Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (366128640, 'Pelvic', 'Niven', to_date('19-06-1997', 'dd-mm-yyyy'), 'pelvic.niven@travizo', '050-3949474', '36 Aykroyd Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (744567912, 'Beth', 'Gatlin', to_date('21-01-1982', 'dd-mm-yyyy'), 'b.gatlin@inspiration', '058-7546855', '92 Larter Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (707081977, 'Lea', 'Mellencamp', to_date('11-02-1975', 'dd-mm-yyyy'), 'lmellencamp@alogent.', '052-7755391', '8 Squier Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (176800580, 'Tommy', 'Ruiz', to_date('26-07-1998', 'dd-mm-yyyy'), 'tommy@spotfireholdin', '055-9269906', '37 Elle Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (961175624, 'Christmas', 'Lennox', to_date('01-10-2060', 'dd-mm-yyyy'), 'christmas.lennox@qls', '052-4823785', '51 Marisa Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (410530395, 'Rebeka', 'Jonze', to_date('24-04-1985', 'dd-mm-yyyy'), 'rebekaj@fiberlink.co', '050-0392027', '39 Seagal Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (60357300, 'Connie', 'Oakenfold', to_date('11-09-1987', 'dd-mm-yyyy'), 'connie.oakenfold@bes', '058-7170703', '59 Wilder Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (884845886, 'Hikaru', 'Mirren', to_date('25-03-1994', 'dd-mm-yyyy'), 'hmirren@pulaskifinan', '050-3290018', '61 Breda Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (768774544, 'Jean-Luc', 'Heche', to_date('25-10-1993', 'dd-mm-yyyy'), 'jeanluc.heche@pfizer', '058-6241143', '99 Carolyn Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (878161920, 'Alicia', 'Penders', to_date('01-01-1983', 'dd-mm-yyyy'), 'alicia.penders@gener', '055-9081211', '67 Fats Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (955036615, 'Trick', 'Phillippe', to_date('20-12-2065', 'dd-mm-yyyy'), 'trick.phillippe@sysc', '054-3772550', '73 Candy Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (717566283, 'Daniel', 'Brooks', to_date('15-06-1993', 'dd-mm-yyyy'), 'daniel.brooks@herita', '054-1854451', '224 Gil Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (440941273, 'Carlos', 'Rodriguez', to_date('10-09-1972', 'dd-mm-yyyy'), 'carlos.rodriguez@cur', '055-5228580', '31st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (281132015, 'Merrill', 'Landau', to_date('24-11-2067', 'dd-mm-yyyy'), 'mlandau@quakercityba', '055-6325561', '4 Glenshaw Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (836628761, 'Ike', 'Raye', to_date('27-05-1973', 'dd-mm-yyyy'), 'ike.raye@ogiointerna', '058-6829872', '100 Hochwald Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (745285688, 'Elias', 'Wopat', to_date('02-07-1980', 'dd-mm-yyyy'), 'elias.wopat@eagleone', '054-1753433', '50 Eileen Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (524239122, 'Jason', 'Tippe', to_date('09-08-2061', 'dd-mm-yyyy'), 'jason.t@employerserv', '054-2594798', '10 Kenoly Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (809640188, 'Sandra', 'Witt', to_date('15-04-2070', 'dd-mm-yyyy'), 'sandra.witt@american', '052-6478100', '84 Trejo Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (451142224, 'Judy', 'Lee', to_date('17-11-1974', 'dd-mm-yyyy'), 'judy@bowman.com', '055-1798262', '2 Zellweger Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (723294788, 'Harry', 'Finney', to_date('22-03-1990', 'dd-mm-yyyy'), 'harry@envisionteleph', '054-6354017', '96 Liv Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (76966053, 'Debbie', 'Hiatt', to_date('21-01-1977', 'dd-mm-yyyy'), 'debbie.hiatt@terrafi', '055-1894466', '40 Bekescsaba Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (947446774, 'Vern', 'Duschel', to_date('04-04-2000', 'dd-mm-yyyy'), 'vern.duschel@mainstr', '052-9186176', '13rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (838138932, 'Salma', 'Oszajca', to_date('25-04-1992', 'dd-mm-yyyy'), 'salma@aristotle.com', '054-7953080', '55 Cale Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (972137775, 'Stellan', 'Cole', to_date('18-09-1980', 'dd-mm-yyyy'), 'stellan.cole@network', '058-1771067', '85 Carolyn Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (113097552, 'Lindsey', 'Ingram', to_date('08-01-1991', 'dd-mm-yyyy'), 'lindsey@trafficmanag', '058-4232001', '59 Brolin Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (643339827, 'Mary-Louise', 'Imperioli', to_date('13-09-2065', 'dd-mm-yyyy'), 'marylouise.imperioli', '058-5312073', '82 Davis Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (159398509, 'Vern', 'Ponty', to_date('27-01-1997', 'dd-mm-yyyy'), 'vern.p@softworld.ch', '055-0045475', '89 Melrose park Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (729070842, 'Anne', 'Harmon', to_date('09-06-2060', 'dd-mm-yyyy'), 'aharmon@clorox.ch', '050-0192538', '76 Cox Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (93904798, 'Victoria', 'Buscemi', to_date('25-03-2063', 'dd-mm-yyyy'), 'victoria.buscemi@fab', '055-3047525', '966 Diamond Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (124141581, 'Lydia', 'Makeba', to_date('08-04-2063', 'dd-mm-yyyy'), 'lydiam@avs.de', '052-9956975', '72 Merrilee Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (331245991, 'Mika', 'Bening', to_date('09-05-1983', 'dd-mm-yyyy'), 'mikab@scooterstore.c', '052-5743363', '417 Hong Kong Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (148510955, 'Merrill', 'Mifune', to_date('05-07-1980', 'dd-mm-yyyy'), 'merrill.mifune@news.', '050-2021144', '81st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (13152430, 'Rutger', 'Detmer', to_date('18-04-1979', 'dd-mm-yyyy'), 'rutger.detmer@hfg.co', '055-2884553', '965 Merrill Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (659545694, 'Kyra', 'Crewson', to_date('27-06-1979', 'dd-mm-yyyy'), 'kcrewson@fmb.nl', '058-3392825', '78 Earl Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (240843810, 'Lenny', 'Chambers', to_date('19-11-1981', 'dd-mm-yyyy'), 'lenny@hitechpharmaca', '054-5153267', '82 Amos Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (931053125, 'Terry', 'Gracie', to_date('02-10-1991', 'dd-mm-yyyy'), 'terry.gracie@palmbea', '055-7157428', '40 Dalton Blvd');
commit;
prompt 400 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (199145776, 'Saffron', 'Baez', to_date('09-12-1972', 'dd-mm-yyyy'), 'saffron.baez@hotmail', '050-8607437', '40 Ferrer Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (444414904, 'Nikka', 'Leary', to_date('06-07-2061', 'dd-mm-yyyy'), 'nikka.leary@accucode', '058-1560053', '64 Avital Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (151003072, 'Night', 'Holiday', to_date('21-04-1984', 'dd-mm-yyyy'), 'night@bigdoughcom.uk', '055-4407133', '15 Coslada Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (95879199, 'Thin', 'Loring', to_date('11-05-2066', 'dd-mm-yyyy'), 'thin.loring@neogen.i', '050-4804401', '27 Vinton');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (458802088, 'Wayne', 'Sedgwick', to_date('01-03-2064', 'dd-mm-yyyy'), 'waynes@ipsadvisory.c', '052-5242037', '10 Uggams Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (929112309, 'Diane', 'Hirsch', to_date('19-03-1985', 'dd-mm-yyyy'), 'diane.hirsch@pearlla', '055-7890677', '35 Askew Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (321726505, 'Christine', 'Neil', to_date('19-01-1978', 'dd-mm-yyyy'), 'christine@usgovernme', '052-8097688', '744 Bean Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (148086105, 'Coley', 'Colon', to_date('13-02-1990', 'dd-mm-yyyy'), 'coley.colon@coridian', '050-7919809', '24 Krabbe Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (866328015, 'Ani', 'Cube', to_date('15-07-1998', 'dd-mm-yyyy'), 'ani.cube@eagleone.br', '052-1373094', '84 Lonnie Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (729309899, 'Lupe', 'Buscemi', to_date('27-08-2066', 'dd-mm-yyyy'), 'lupe.buscemi@america', '055-4137978', '28 Greg Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (106140833, 'Angela', 'Howard', to_date('25-01-1976', 'dd-mm-yyyy'), 'angela.howard@socket', '050-7807245', '795 Morgan Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (421858774, 'Kevin', 'Folds', to_date('01-10-1971', 'dd-mm-yyyy'), 'kevinf@atlanticnet.i', '054-9741235', '17 Kevelaer Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (198557947, 'Dorry', 'Winans', to_date('21-08-1978', 'dd-mm-yyyy'), 'dorry@philipmorris.d', '054-2437703', '47 Bret Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (8687147, 'Nelly', 'Quinlan', to_date('12-01-2061', 'dd-mm-yyyy'), 'nquinlan@denaliventu', '050-5607998', '84 Busey Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (769516762, 'Claude', 'Humphrey', to_date('06-03-1993', 'dd-mm-yyyy'), 'claude.h@sandyspring', '050-3425292', '100 Atlanta Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (739085019, 'Brenda', 'Krabbe', to_date('01-11-1977', 'dd-mm-yyyy'), 'brenda.krabbe@mcdona', '055-0008286', '15 Washington Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (602605712, 'Kate', 'Gordon', to_date('23-09-1983', 'dd-mm-yyyy'), 'kateg@ibm.com', '058-5754401', '32nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (931508418, 'Maceo', 'Alston', to_date('31-10-1994', 'dd-mm-yyyy'), 'maceo.a@americanheal', '052-2710511', '47 Pony Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (294934486, 'Nils', 'Withers', to_date('16-05-1977', 'dd-mm-yyyy'), 'nils.withers@typhoon', '058-6205549', '34 Sossamon Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (887738270, 'Orlando', 'Burns', to_date('25-01-2001', 'dd-mm-yyyy'), 'orlando.burns@tarrag', '055-0851440', '41 Himmelman Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (64144850, 'Nicholas', 'Spall', to_date('09-06-2070', 'dd-mm-yyyy'), 'nspall@reckittbencki', '050-0490081', '28 Lloyd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (862283098, 'Nelly', 'Lauper', to_date('28-12-1988', 'dd-mm-yyyy'), 'n.lauper@innovateeco', '058-9520966', '21 Antwerpen Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (93181652, 'Donald', 'Raybon', to_date('03-04-1984', 'dd-mm-yyyy'), 'd.raybon@avs.com', '050-5056125', '71st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (93113901, 'Anthony', 'Mazar', to_date('02-12-2068', 'dd-mm-yyyy'), 'anthony@vms.br', '058-2201572', '29 Richie Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (371759716, 'Nicky', 'Weisberg', to_date('23-02-2070', 'dd-mm-yyyy'), 'n.weisberg@inspirati', '054-4206390', '71 Bretzfeld-Waldbach Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (607695244, 'Morgan', 'Hurt', to_date('12-09-1972', 'dd-mm-yyyy'), 'mhurt@flavorx.com', '054-5917810', '78 Christian Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (485576518, 'Dennis', 'Birch', to_date('17-09-1975', 'dd-mm-yyyy'), 'dennisb@nha.de', '058-9425503', '24 Kasey Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (632389430, 'Nora', 'Biel', to_date('13-08-1989', 'dd-mm-yyyy'), 'nora.b@midwestmedia.', '058-4622923', '79 Grant Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (370376620, 'Christine', 'Yorn', to_date('16-03-1987', 'dd-mm-yyyy'), 'cyorn@telechemintern', '052-3358164', '96 de Lancie Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (813358663, 'Teri', 'Hannah', to_date('12-10-1990', 'dd-mm-yyyy'), 'teri.h@lms.com', '054-4938370', '47 Charleston Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (456435065, 'Ramsey', 'Feore', to_date('10-07-1989', 'dd-mm-yyyy'), 'ramsey@safehomesecur', '052-2246795', '23 Groton Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (691718518, 'LeVar', 'Gray', to_date('12-06-1982', 'dd-mm-yyyy'), 'levar.gray@exinomtec', '054-1274002', '63 Cash');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (807397413, 'Bridget', 'Wine', to_date('03-01-2060', 'dd-mm-yyyy'), 'bridget@waltdisney.u', '055-8292800', '89 Ewan Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (200316093, 'Tamala', 'Milsap', to_date('24-11-2063', 'dd-mm-yyyy'), 'tamala.milsap@mitsub', '050-7317693', '23 Rip Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (94028487, 'Emmylou', 'Johnson', to_date('11-06-1979', 'dd-mm-yyyy'), 'emmylou.johnson@ever', '055-2213672', '95 Brampton Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (608696748, 'Debbie', 'Kennedy', to_date('19-10-1995', 'dd-mm-yyyy'), 'debbie.kennedy@ksj.c', '050-8081379', '63 Cronin Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (146693007, 'Meredith', 'Schock', to_date('22-03-1983', 'dd-mm-yyyy'), 'meredith@mosaic.uk', '054-4377371', '62 Naha Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (123242105, 'John', 'Bracco', to_date('26-09-2069', 'dd-mm-yyyy'), 'j.bracco@taycorfinan', '058-2726823', '1 Aurora Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (996373474, 'Ashton', 'Reeve', to_date('07-08-1974', 'dd-mm-yyyy'), 'ashton@nbs.il', '055-5647604', '18 Zagreb Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (471211347, 'Grace', 'Dench', to_date('14-06-2063', 'dd-mm-yyyy'), 'grace.dench@ibm.com', '052-9688246', '58 Long Island City Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (274685639, 'Denise', 'Chaplin', to_date('06-12-1984', 'dd-mm-yyyy'), 'denise@navigatorsyst', '055-7618756', '53rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (386198992, 'Nicholas', 'Chung', to_date('13-06-2060', 'dd-mm-yyyy'), 'nicholas.chung@allst', '050-4461843', '344 Greene');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (1982472, 'Jodie', 'Guilfoyle', to_date('22-07-1987', 'dd-mm-yyyy'), 'j.guilfoyle@monitron', '050-7507347', '42 Claude Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (206852715, 'Gabrielle', 'Tarantino', to_date('16-06-2066', 'dd-mm-yyyy'), 'gabrielle.tarantino@', '052-9745867', '32nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (436042421, 'Darius', 'Teng', to_date('01-02-1982', 'dd-mm-yyyy'), 'darius.teng@horizon.', '054-8566481', '41 First');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (332140938, 'Patti', 'Dupree', to_date('14-01-1979', 'dd-mm-yyyy'), 'patti.dupree@compute', '050-5924787', '88 Derek Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (982497346, 'Gabriel', 'Foxx', to_date('27-04-2001', 'dd-mm-yyyy'), 'gabriel.f@infovision', '055-0952579', '1 Kirshner Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (447923226, 'Michael', 'Gershon', to_date('01-08-2061', 'dd-mm-yyyy'), 'michael@insurmark.uk', '050-9442979', '96 Veruca Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (255889405, 'Isaac', 'Rudd', to_date('22-11-1998', 'dd-mm-yyyy'), 'isaac.rudd@operation', '054-6919072', '43 Graham Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (364704767, 'Sammy', 'Phoenix', to_date('20-03-2069', 'dd-mm-yyyy'), 'sammy@newmedia.com', '055-2585147', '3 Bismarck Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (586295820, 'Night', 'Moreno', to_date('07-11-1973', 'dd-mm-yyyy'), 'night.moreno@astafun', '055-5844382', '15 Pollak Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (452166306, 'Faye', 'Todd', to_date('27-09-1971', 'dd-mm-yyyy'), 'faye.todd@marlabs.co', '050-8320581', '7 Smurfit Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (398581585, 'Patrick', 'Beals', to_date('20-06-1993', 'dd-mm-yyyy'), 'patrick.beals@loreal', '055-1550201', '51st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (942787577, 'Terri', 'Sweeney', to_date('15-10-1994', 'dd-mm-yyyy'), 'terri.s@seiaarons.co', '052-9696822', '447 Shaw Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (152067677, 'Millie', 'Stevenson', to_date('18-01-2070', 'dd-mm-yyyy'), 'millie.stevenson@cap', '058-1711365', '81 Rhys-Davies Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (485274725, 'Rhys', 'Neill', to_date('19-12-2066', 'dd-mm-yyyy'), 'rhys@ibfh.uk', '058-1336222', '96 Neve Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (365747882, 'Johnette', 'Elliott', to_date('25-04-1996', 'dd-mm-yyyy'), 'j.elliott@swp.pl', '052-0781372', '888 Kwun Tong Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (77424916, 'Jean', 'Reeves', to_date('21-10-2070', 'dd-mm-yyyy'), 'jean@hcoa.jp', '055-1223466', '96 Dionne Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (743832416, 'Nastassja', 'Brosnan', to_date('04-02-1983', 'dd-mm-yyyy'), 'nastassja.brosnan@he', '052-8352123', '62nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (243843226, 'Meryl', 'Klugh', to_date('25-11-2061', 'dd-mm-yyyy'), 'meryl.klugh@ams.uk', '054-5636138', '89 Tyrone Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (69560250, 'Tony', 'Palmer', to_date('25-05-1987', 'dd-mm-yyyy'), 'tony.palmer@jlphor.b', '058-9743151', '3 Getty Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (346161274, 'Naomi', 'Olyphant', to_date('09-03-2001', 'dd-mm-yyyy'), 'naomi.olyphant@spotf', '058-4818186', '81 Dan Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (95804382, 'Randy', 'Moss', to_date('10-12-2064', 'dd-mm-yyyy'), 'randy.moss@nobrainer', '055-2699553', '847 Somerset Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (433266048, 'Patti', 'Heald', to_date('14-04-1999', 'dd-mm-yyyy'), 'patti.heald@greene.c', '058-7557176', '23 Rockville Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (693982166, 'Carl', 'Lovitz', to_date('08-09-1998', 'dd-mm-yyyy'), 'carl@unilever.fr', '054-6043036', '84 Sellers');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (106234632, 'Rick', 'Tomlin', to_date('29-05-1992', 'dd-mm-yyyy'), 'rick.tomlin@toyotamo', '058-0337602', '45 Connick Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (351404022, 'Stephanie', 'Gary', to_date('21-07-2068', 'dd-mm-yyyy'), 'stephanie.gary@hotma', '054-8092430', '63 Zevon Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (862019747, 'Rupert', 'Sizemore', to_date('31-10-1988', 'dd-mm-yyyy'), 'r.sizemore@ibm.br', '055-6390358', '528 Pat Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (993262551, 'Bob', 'Palminteri', to_date('02-08-2070', 'dd-mm-yyyy'), 'bob.palminteri@techr', '058-9388358', '57 Thurman Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (823103884, 'Machine', 'Shaye', to_date('21-04-2001', 'dd-mm-yyyy'), 'machine.shaye@abs.br', '058-3211311', '86 Thornton Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (711368713, 'Brad', 'Austin', to_date('16-01-1993', 'dd-mm-yyyy'), 'baustin@techbooks.co', '050-4302938', '586 Berkshire Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (115955194, 'Garry', 'Carrington', to_date('22-06-1988', 'dd-mm-yyyy'), 'garry.carrington@dat', '058-8566876', '368 Arden Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (272351024, 'Charles', 'Johansen', to_date('16-07-1983', 'dd-mm-yyyy'), 'charles.johansen@fam', '052-6796250', '72 Chalee Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (968435354, 'Nigel', 'Reno', to_date('13-09-1996', 'dd-mm-yyyy'), 'nigel.reno@knightsbr', '055-0275606', '17 Aomori Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (28301254, 'Carole', 'Burstyn', to_date('31-07-2067', 'dd-mm-yyyy'), 'caroleb@vesta.au', '055-4175976', '92 Rtp Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (352220223, 'Chuck', 'Stuart', to_date('24-08-1991', 'dd-mm-yyyy'), 'chuck@fnb.it', '055-5224349', '67 McDowell Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (62415092, 'Jennifer', 'Kennedy', to_date('23-09-1974', 'dd-mm-yyyy'), 'jennifer@apexsystems', '054-0354906', '100 McKellen Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (161131792, 'Harrison', 'Mars', to_date('18-05-1978', 'dd-mm-yyyy'), 'harrison.mars@sci.co', '058-7393609', '97 Palmieri Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (525140854, 'Bernard', 'Bruce', to_date('13-08-2068', 'dd-mm-yyyy'), 'bernard.bruce@yashte', '054-3871572', '140 Rodgers Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (220693849, 'Joshua', 'Copeland', to_date('06-03-1974', 'dd-mm-yyyy'), 'joshua.c@esteelauder', '052-1842792', '18 Crystal Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (339554743, 'Nickel', 'Jeter', to_date('29-11-2070', 'dd-mm-yyyy'), 'nickel.jeter@nobrain', '058-9983645', '30 Bad Camberg');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (1267620, 'Bobby', 'McBride', to_date('03-08-2068', 'dd-mm-yyyy'), 'bobby.m@speakeasy.co', '058-3015617', '69 Jamal Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (10724800, 'Freda', 'Nicholson', to_date('11-10-1986', 'dd-mm-yyyy'), 'freda.nicholson@shot', '054-0327322', '75 Buckingham Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (640844671, 'Anjelica', 'Marshall', to_date('30-07-1989', 'dd-mm-yyyy'), 'anjelica.marshall@pr', '058-3191812', '90 Isaacs Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (121599664, 'Melba', 'Kilmer', to_date('02-11-2068', 'dd-mm-yyyy'), 'm.kilmer@johnson.com', '054-0113337', '50 McKean Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (1418985, 'Pete', 'Matthau', to_date('05-01-1997', 'dd-mm-yyyy'), 'p.matthau@marsinc.de', '052-4726387', '68 Gayle Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (149410895, 'Bradley', 'O''Keefe', to_date('18-03-2063', 'dd-mm-yyyy'), 'bradley@mastercardin', '055-1819253', '40 Jean-Claude Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (447416891, 'Cole', 'Thurman', to_date('28-11-1984', 'dd-mm-yyyy'), 'cole.thurman@meridia', '052-6965909', '11 Sydney Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (118504803, 'Natacha', 'Reiner', to_date('13-02-1985', 'dd-mm-yyyy'), 'natachar@ezecastleso', '052-8571401', '42 Kenneth Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (72369375, 'Jane', 'Liu', to_date('12-03-1982', 'dd-mm-yyyy'), 'jane.liu@faef.com', '055-8668728', '99 Hartnett Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (819639448, 'Treat', 'Curfman', to_date('08-09-2061', 'dd-mm-yyyy'), 'treat.curfman@swi.uk', '054-5694215', '579 Flanery Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (803541099, 'Gloria', 'Greenwood', to_date('08-11-2063', 'dd-mm-yyyy'), 'gloria.g@lemproducts', '054-2944481', '93 Mars Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (861479801, 'Billy', 'Crow', to_date('05-11-1972', 'dd-mm-yyyy'), 'billy.crow@extremepi', '055-1550041', '59 Uetikon am See Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (425333127, 'Dorry', 'Pacino', to_date('03-10-1996', 'dd-mm-yyyy'), 'dpacino@securitychec', '054-7649731', '812 Dickinson Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (309389994, 'Debra', 'McDonnell', to_date('20-05-2063', 'dd-mm-yyyy'), 'debram@ibm.de', '054-8951435', '83 Mahood Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (360541635, 'Frederic', 'Pigott-Smith', to_date('09-02-1972', 'dd-mm-yyyy'), 'frederic.pigottsmith', '054-2183322', '954 Margulies Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (516760318, 'Art', 'Madsen', to_date('12-06-2066', 'dd-mm-yyyy'), 'art.madsen@reckittbe', '050-2293905', '50 Hayek Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (186388372, 'Gran', 'Rawls', to_date('29-07-2068', 'dd-mm-yyyy'), 'gran@marlabs.com', '058-5714208', '18 Navarro Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (343744198, 'Goldie', 'Clayton', to_date('07-05-1995', 'dd-mm-yyyy'), 'goldie.c@ivorysystem', '055-9388530', '56 Duschel Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (147881640, 'Ike', 'Borgnine', to_date('14-04-1983', 'dd-mm-yyyy'), 'ike.borgnine@restaur', '050-0993048', '80 Sinatra Street');
commit;
prompt 500 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (762060472, 'Gabriel', 'Sarsgaard', to_date('29-03-1971', 'dd-mm-yyyy'), 'gabriel@sfgo.au', '052-7165745', '3 Itu Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (750672811, 'Daryle', 'Spine', to_date('26-09-2063', 'dd-mm-yyyy'), 'daryle.spine@vivendi', '054-3875791', '74 Boulogne Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (979434066, 'Armand', 'Heatherly', to_date('29-08-1999', 'dd-mm-yyyy'), 'a.heatherly@whitewav', '050-8130928', '24 Whitman Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (675102372, 'Phil', 'Pearce', to_date('19-03-1993', 'dd-mm-yyyy'), 'phil.pearce@ecopy.de', '055-7552600', '48 Spears');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (633583093, 'Joe', 'McKean', to_date('17-03-1978', 'dd-mm-yyyy'), 'joe.mckean@verizon.d', '055-4876937', '22 Miyazaki Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (111666051, 'Sal', 'Borden', to_date('21-08-2068', 'dd-mm-yyyy'), 'sal.b@3tsystems.ar', '055-2554459', '551 Santa Cruz Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (560138093, 'Will', 'Duncan', to_date('12-10-1982', 'dd-mm-yyyy'), 'w.duncan@floorgraphi', '054-2400711', '544 Ohita Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (213233951, 'Cameron', 'Rhodes', to_date('06-08-1992', 'dd-mm-yyyy'), 'cameron.rhodes@bigya', '058-8515937', '57 Xander Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (379334764, 'Sal', 'Bridges', to_date('25-08-1996', 'dd-mm-yyyy'), 'salb@jollyenterprise', '050-3581923', '4 Paisley Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (732374485, 'Nanci', 'Coleman', to_date('03-09-2068', 'dd-mm-yyyy'), 'nancic@tilsonhr.de', '050-0124800', '94 Nikki Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (848499731, 'Marlon', 'Sedgwick', to_date('20-10-1976', 'dd-mm-yyyy'), 'marlon.sedgwick@east', '055-9532512', '88 Davis Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (337483564, 'Tara', 'Holmes', to_date('04-08-1999', 'dd-mm-yyyy'), 'tara.holmes@shar.uk', '058-0998480', '856 Johor Bahru Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (90157560, 'Edward', 'Deejay', to_date('08-01-1990', 'dd-mm-yyyy'), 'edward@y2marketing.c', '054-1809950', '100 Speaks Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (838747878, 'Gailard', 'Secada', to_date('23-05-1977', 'dd-mm-yyyy'), 'gailards@prahs.ca', '058-7585646', '873 McDormand Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (48480908, 'Terrence', 'Myers', to_date('14-09-2065', 'dd-mm-yyyy'), 'tmyers@lfg.uk', '054-6341754', '28 Griffin Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (207783091, 'Harvey', 'Schiff', to_date('29-04-2000', 'dd-mm-yyyy'), 'hschiff@ubp.com', '055-7216021', '27 Bernex Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (221644592, 'Morgan', 'Collins', to_date('24-05-2065', 'dd-mm-yyyy'), 'mcollins@netnumina.u', '052-7600703', '623 Nils Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (736021178, 'Curt', 'Kweller', to_date('27-01-2061', 'dd-mm-yyyy'), 'curt.kweller@mission', '055-0397380', '19 Pacino Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (385354173, 'Dorry', 'Baez', to_date('03-04-1987', 'dd-mm-yyyy'), 'dbaez@vivendiunivers', '058-3849263', '29 Wes Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (190535655, 'Joan', 'Coverdale', to_date('01-07-2067', 'dd-mm-yyyy'), 'joan.coverdale@elite', '050-4896879', '373 Kier Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (623658991, 'Dabney', 'Bonneville', to_date('28-11-1976', 'dd-mm-yyyy'), 'dabney@dbprofessiona', '052-1189547', '60 Alex Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (777479275, 'Lionel', 'Ball', to_date('17-05-2000', 'dd-mm-yyyy'), 'lionel.ball@bestbuy.', '058-8875088', '52 Alfie Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (164886975, 'Carole', 'Arquette', to_date('18-01-1977', 'dd-mm-yyyy'), 'carole.arquette@inte', '050-6147324', '44 Conners Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (150789473, 'Famke', 'Lapointe', to_date('08-06-2063', 'dd-mm-yyyy'), 'flapointe@horizon.co', '052-4019248', '470 Polley');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (283079742, 'Raul', 'Tillis', to_date('28-01-1973', 'dd-mm-yyyy'), 'rtillis@pulaskifinan', '052-3078383', '87 Gayle Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (839499644, 'Nicole', 'Shannon', to_date('13-09-2062', 'dd-mm-yyyy'), 'nicoles@freedommedic', '052-0552436', '551 Heiligenhaus Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (394740047, 'Karen', 'Kline', to_date('22-01-1984', 'dd-mm-yyyy'), 'karenk@telepoint.com', '050-5884112', '3 Danes Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (546417896, 'Bobby', 'Dayne', to_date('09-02-1988', 'dd-mm-yyyy'), 'bobby@astute.com', '052-7470800', '96 Courtney Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (301699460, 'Famke', 'Bentley', to_date('09-10-1997', 'dd-mm-yyyy'), 'famke.bentley@carboc', '050-1557316', '786 Pitt');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (658059050, 'Reese', 'Barkin', to_date('28-09-1972', 'dd-mm-yyyy'), 'reese.barkin@pscinfo', '055-5325487', '260 Candice Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (296010043, 'Terence', 'Orton', to_date('16-06-1983', 'dd-mm-yyyy'), 'terence.orton@prahs.', '054-4224042', '88 Bryan Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (856389979, 'Leon', 'Benoit', to_date('05-03-2063', 'dd-mm-yyyy'), 'leon.benoit@gillette', '054-8744888', '4 Bay Shore Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (750809663, 'Solomon', 'Cruise', to_date('30-09-1984', 'dd-mm-yyyy'), 'solomon.cruise@teams', '050-2133702', '88 Connery');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (276951800, 'Rowan', 'Presley', to_date('16-01-1976', 'dd-mm-yyyy'), 'rpresley@philipmorri', '054-4831497', '1 Curtis-Hall Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (797836909, 'Aaron', 'Loggins', to_date('29-03-2000', 'dd-mm-yyyy'), 'aaron.loggins@ipsadv', '050-5951228', '39 Carole Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (395040168, 'Kris', 'Rivers', to_date('08-09-2066', 'dd-mm-yyyy'), 'kris.rivers@advanced', '050-4654625', '21 Radney Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (82987119, 'Night', 'King', to_date('09-01-1998', 'dd-mm-yyyy'), 'night.king@3tsystems', '058-5440443', '19 Borgnine Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (723891580, 'Joanna', 'Love', to_date('26-09-1982', 'dd-mm-yyyy'), 'joanna.love@cendant.', '054-9723959', '66 Ceili Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (837145696, 'Vincent', 'England', to_date('12-06-2067', 'dd-mm-yyyy'), 'vincente@greene.com', '052-5884472', '95 Woking Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (819052449, 'Lindsey', 'Davis', to_date('09-09-1973', 'dd-mm-yyyy'), 'lindsey.davis@ceom.a', '054-2134767', '85 Lisbon Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (278058596, 'Sharon', 'Matarazzo', to_date('10-09-1981', 'dd-mm-yyyy'), 'sharon.matarazzo@tra', '055-7395049', '65 Richard Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (706605965, 'Bo', 'Shue', to_date('18-01-1983', 'dd-mm-yyyy'), 'bos@creditorsinterch', '050-3423512', '7 Maureen Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (12201281, 'Rosco', 'Unger', to_date('17-06-1979', 'dd-mm-yyyy'), 'rosco.unger@portagee', '058-1727397', '77 Barcelona Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (10832348, 'Carrie', 'Hedaya', to_date('17-05-2067', 'dd-mm-yyyy'), 'c.hedaya@venoco.za', '054-4157986', '8 Lydia Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (362301331, 'Kevin', 'Fonda', to_date('06-02-1998', 'dd-mm-yyyy'), 'kevin.fonda@dsp.mx', '055-4384764', '3 Dean Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (876127577, 'Lena', 'Margulies', to_date('28-04-2065', 'dd-mm-yyyy'), 'lena@signature.mx', '055-5531409', '274 Huntington Beach Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (920052863, 'Naomi', 'Furay', to_date('16-11-1975', 'dd-mm-yyyy'), 'naomi.furay@hotmail.', '050-8074980', '98 McNeice Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (512601079, 'Angelina', 'Rickman', to_date('17-04-1971', 'dd-mm-yyyy'), 'angelina.rickman@ult', '054-1094922', '71st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (701718066, 'Jude', 'McKennitt', to_date('30-05-1975', 'dd-mm-yyyy'), 'jude.mckennitt@seafo', '050-3866539', '99 Fishburne Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (760163678, 'Shawn', 'Cantrell', to_date('06-08-1983', 'dd-mm-yyyy'), 'shawn.cantrell@nha.c', '052-5285964', '24 Guamo Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (160968612, 'Glen', 'Branch', to_date('08-04-2000', 'dd-mm-yyyy'), 'glen.branch@comgloba', '055-6347705', '38 Vaughan Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (33891191, 'Trini', 'McCracken', to_date('24-02-1999', 'dd-mm-yyyy'), 'trini@componentgraph', '055-9766217', '3 Lecanto Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (622277269, 'Rod', 'Collins', to_date('21-08-2064', 'dd-mm-yyyy'), 'rcollins@nexxtworks.', '052-7216708', '43 Bobbi Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (450192106, 'Famke', 'Conners', to_date('03-02-1998', 'dd-mm-yyyy'), 'famke.conners@owm.uk', '055-5216053', '90 Nicky');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (515247128, 'Morris', 'Farris', to_date('06-03-1976', 'dd-mm-yyyy'), 'morris.f@tilsonhr.jp', '055-3239774', '61 Giovanni Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (855017180, 'Matthew', 'Waite', to_date('28-11-1995', 'dd-mm-yyyy'), 'matthew@contract.com', '058-8289580', '11 Charleston Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (177824082, 'Nora', 'Lowe', to_date('10-07-1979', 'dd-mm-yyyy'), 'nora.lowe@dbprofessi', '050-4208298', '704 San Ramon Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (859581193, 'Ann', 'Stallone', to_date('01-11-1981', 'dd-mm-yyyy'), 'ann.stallone@smg.de', '054-4392566', '601 Fiennes Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (282779947, 'Bryan', 'Bright', to_date('02-03-1983', 'dd-mm-yyyy'), 'bryan.bright@smg.de', '054-2614708', '82nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (371762124, 'Alana', 'Schreiber', to_date('09-03-1999', 'dd-mm-yyyy'), 'alana.s@visionarysys', '054-1385922', '681 Brittany Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (703376284, 'Anjelica', 'McCormack', to_date('15-06-1986', 'dd-mm-yyyy'), 'anjelica.mccormack@e', '055-9737475', '24 Chambery');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (237133097, 'Anna', 'Rickman', to_date('04-08-2061', 'dd-mm-yyyy'), 'anna.rickman@ivci.co', '054-8609230', '636 Woodard Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (228394464, 'Freddie', 'Stormare', to_date('28-05-1975', 'dd-mm-yyyy'), 'freddie.stormare@gna', '050-7721991', '43rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (360541590, 'Latin', 'Isaacs', to_date('31-12-2062', 'dd-mm-yyyy'), 'latin.isaacs@officed', '052-5736677', '533 Nik Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (625094196, 'Alan', 'Costner', to_date('20-08-1984', 'dd-mm-yyyy'), 'a.costner@reckittben', '055-5332976', '47 Connick Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (93305149, 'Donald', 'McCain', to_date('06-06-1971', 'dd-mm-yyyy'), 'donald.m@sunstream.d', '052-6892588', '65 Bobbi Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (95952156, 'Vince', 'Belushi', to_date('17-04-1973', 'dd-mm-yyyy'), 'vince.belushi@saksin', '055-2109707', '6 Juliette Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (165403124, 'Larnelle', 'Whitaker', to_date('21-11-1988', 'dd-mm-yyyy'), 'larnellew@mercantile', '054-1627626', '90 Bridget Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (963359768, 'Marc', 'Mahood', to_date('13-11-1972', 'dd-mm-yyyy'), 'marc.mahood@marsinc.', '055-6064697', '90 Tah');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (84355569, 'Mitchell', 'Charles', to_date('05-10-1980', 'dd-mm-yyyy'), 'mitchell.charles@mul', '052-3304164', '60 Shaye Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (506137742, 'Bob', 'Lane', to_date('10-01-2000', 'dd-mm-yyyy'), 'bobl@larkinenterpris', '058-4513746', '74 Santa Fe Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (905757212, 'Rich', 'Wayans', to_date('23-09-2060', 'dd-mm-yyyy'), 'rich.wayans@schering', '052-0783897', '61st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (820403856, 'Mena', 'Dayne', to_date('02-11-2066', 'dd-mm-yyyy'), 'menad@ois.com', '055-9602554', '29 Maguire Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (644631445, 'Forest', 'Gryner', to_date('09-10-1998', 'dd-mm-yyyy'), 'forest@accesssystems', '055-0599734', '831 Dunaway');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (615773373, 'Anna', 'Lindo', to_date('21-07-2001', 'dd-mm-yyyy'), 'annal@elmco.com', '058-7764859', '457 Dreyfuss Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (675574639, 'Mira', 'Benson', to_date('11-04-1974', 'dd-mm-yyyy'), 'mira@americanexpress', '050-1016174', '25 Bello Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (114054958, 'Anne', 'Krabbe', to_date('27-12-2060', 'dd-mm-yyyy'), 'anne.krabbe@solution', '052-2279888', '2 Vallauris Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (867905191, 'Lindsay', 'Teng', to_date('18-08-2067', 'dd-mm-yyyy'), 'lindsay.teng@painted', '050-9684363', '98 Archbold Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (874465815, 'Avenged', 'Burke', to_date('30-07-1991', 'dd-mm-yyyy'), 'avengedb@kellogg.br', '058-1431779', '80 Jonze Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (524951589, 'Taylor', 'McLachlan', to_date('15-04-2066', 'dd-mm-yyyy'), 'taylor@newmedia.uk', '054-2768189', '18 Nicholas Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (118610371, 'Hilary', 'Malkovich', to_date('07-10-2060', 'dd-mm-yyyy'), 'hilary.malkovich@glm', '058-9162280', '52 Rachel Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (999629006, 'Jake', 'Johansen', to_date('08-12-1977', 'dd-mm-yyyy'), 'jake.johansen@pharma', '052-2795233', '22 Nelson');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (614075272, 'Night', 'Wiest', to_date('18-12-1998', 'dd-mm-yyyy'), 'night.wiest@cyberthi', '058-3121840', '46 Appenzell Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (275066747, 'Albert', 'Stone', to_date('22-01-1986', 'dd-mm-yyyy'), 'albert.stone@inspira', '054-8863381', '95 Daejeon Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (930835073, 'Wayne', 'Belle', to_date('06-02-1982', 'dd-mm-yyyy'), 'wayne.belle@hondamot', '054-9406004', '85 Albright Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (324094304, 'Rip', 'Clark', to_date('16-08-2062', 'dd-mm-yyyy'), 'rip.clark@navigators', '052-0512213', '83 Rivers Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (238479998, 'Marisa', 'Hewett', to_date('06-04-1979', 'dd-mm-yyyy'), 'marisa.hewett@at.it', '054-2810441', '73rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (95656862, 'Joanna', 'Costello', to_date('03-06-1985', 'dd-mm-yyyy'), 'joanna.costello@sear', '058-7587290', '745 Highlands Ranch Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (73645628, 'Andy', 'Maxwell', to_date('07-09-1980', 'dd-mm-yyyy'), 'andy.maxwell@sprint.', '054-1902862', '74 Niigata Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (711170790, 'Tal', 'Keeslar', to_date('08-02-2069', 'dd-mm-yyyy'), 'tal.keeslar@american', '055-9642781', '62 Glen Cove Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (104180848, 'Petula', 'Def', to_date('06-10-2066', 'dd-mm-yyyy'), 'pdef@qestrel.com', '052-9329815', '993 Mira Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (996519672, 'Delbert', 'Slater', to_date('15-10-2068', 'dd-mm-yyyy'), 'delbert.slater@gci.u', '054-8932602', '25 Goldie Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (589424642, 'Martin', 'Belles', to_date('11-05-2061', 'dd-mm-yyyy'), 'm.belles@sprint.com', '050-9438680', '98 Jane Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (83555305, 'Danny', 'Badalucco', to_date('18-07-2000', 'dd-mm-yyyy'), 'dannyb@elite.ch', '050-3221792', '73 Olivette Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (414138437, 'Brad', 'Wine', to_date('23-01-1989', 'dd-mm-yyyy'), 'bwine@sourcegear.com', '052-1826648', '86 Hobson');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (356045392, 'Chely', 'Shaye', to_date('12-06-1986', 'dd-mm-yyyy'), 'cshaye@lloydgroup.ca', '058-6665492', '669 Patton Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (688205923, 'Rhett', 'Hall', to_date('26-02-1978', 'dd-mm-yyyy'), 'rhett.hall@grt.au', '050-6136960', '3 Hidalgo Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (299905638, 'Gina', 'McNarland', to_date('09-04-2066', 'dd-mm-yyyy'), 'g.mcnarland@accucode', '054-1253229', '13 Marina Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (930055330, 'Toshiro', 'Vince', to_date('07-08-1996', 'dd-mm-yyyy'), 'toshiro.vince@at.com', '054-0456805', '37 Rooker');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (856746403, 'Kelly', 'Hurley', to_date('23-07-2065', 'dd-mm-yyyy'), 'k.hurley@outsourcegr', '052-8330476', '32nd Street');
commit;
prompt 600 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (759861554, 'Judd', 'Banderas', to_date('26-11-1991', 'dd-mm-yyyy'), 'judd.banderas@aquasc', '050-5157250', '72 Presley Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (4463905, 'Hugh', 'McLean', to_date('14-10-1971', 'dd-mm-yyyy'), 'hugh.mclean@jsa.com', '050-9759752', '82nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (397502533, 'Nigel', 'DeLuise', to_date('28-01-1996', 'dd-mm-yyyy'), 'nigel.deluise@tastef', '055-8386327', '56 Holland Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (673471080, 'Rade', 'Jeffreys', to_date('26-12-2060', 'dd-mm-yyyy'), 'rade.jeffreys@painte', '052-8274291', '744 Colon Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (186484197, 'Coley', 'Barry', to_date('10-12-1974', 'dd-mm-yyyy'), 'coley.barry@printcaf', '055-8452039', '64 Van Der Beek Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (31591184, 'Willie', 'Kutcher', to_date('25-12-1991', 'dd-mm-yyyy'), 'willie.kutcher@kings', '052-3810447', '33 Cliff Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (895622563, 'Susan', 'Bracco', to_date('26-11-1991', 'dd-mm-yyyy'), 'susanb@cardinalcartr', '055-5435316', '27 Steve Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (176780935, 'Joe', 'Pitney', to_date('16-01-1976', 'dd-mm-yyyy'), 'joe.pitney@gha.com', '055-8533141', '484 Craddock Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (254981234, 'Tracy', 'Pierce', to_date('26-03-2068', 'dd-mm-yyyy'), 'tracy@zoneperfectnut', '054-9653501', '83 Rucker Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (626474566, 'Geggy', 'Chaplin', to_date('29-11-1983', 'dd-mm-yyyy'), 'geggy.chaplin@vesta.', '050-3848081', '74 Rob Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (773986024, 'Ricky', 'Moss', to_date('01-04-1979', 'dd-mm-yyyy'), 'ricky.moss@visainter', '055-6970389', '83rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (275116358, 'Maceo', 'Minogue', to_date('26-05-2068', 'dd-mm-yyyy'), 'maceo.minogue@waltdi', '050-1939853', '263 Donna Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (750799475, 'Eileen', 'Beals', to_date('10-10-1999', 'dd-mm-yyyy'), 'eileen@dvdt.com', '058-9183222', '43 Caviezel Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (325652149, 'Benjamin', 'O''Hara', to_date('12-07-2060', 'dd-mm-yyyy'), 'benjamin.ohara@volks', '058-6283370', '86 Manaus Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (801474130, 'Nigel', 'Eckhart', to_date('15-12-1980', 'dd-mm-yyyy'), 'nigel.eckhart@vivend', '054-3866369', '7 Tyson Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (155673933, 'Geoff', 'Burrows', to_date('22-01-1977', 'dd-mm-yyyy'), 'geoff.burrows@interf', '050-9481428', '472 Tony Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (868271465, 'Rhett', 'Hackman', to_date('11-07-1976', 'dd-mm-yyyy'), 'rhett.hackman@digita', '052-8212666', '601 Frederic Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (722659951, 'Deborah', 'Shepherd', to_date('01-05-1993', 'dd-mm-yyyy'), 'deborah.s@hardwoodwh', '058-9886307', '19 Chestnut Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (616885552, 'Candice', 'Lonsdale', to_date('16-03-1989', 'dd-mm-yyyy'), 'candice.lonsdale@trm', '050-2642147', '69 Charles Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (44766865, 'Julio', 'Aglukark', to_date('16-08-1998', 'dd-mm-yyyy'), 'jaglukark@microtek.u', '054-4105630', '65 Birmingham Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (466514829, 'Grant', 'Jones', to_date('18-01-2061', 'dd-mm-yyyy'), 'grant.jones@alternat', '050-4973000', '100 San Francisco Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (324099208, 'Eileen', 'Stone', to_date('01-07-1980', 'dd-mm-yyyy'), 'eileen.stone@infopro', '054-2251076', '59 Whitwam');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (605892392, 'Ben', 'Ricci', to_date('05-08-1975', 'dd-mm-yyyy'), 'ben.ricci@msdw.jp', '052-6723585', '828 Sobieski Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (195121074, 'Bryan', 'Driver', to_date('28-03-1978', 'dd-mm-yyyy'), 'bryan.driver@smi.com', '058-5915782', '82nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (6768992, 'Vern', 'Dalley', to_date('06-01-1973', 'dd-mm-yyyy'), 'vern@portageenvironm', '055-9984984', '37 Branagh Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (896698939, 'Caroline', 'Rooker', to_date('04-08-1972', 'dd-mm-yyyy'), 'caroline.rooker@seaf', '058-4574077', '69 Chinlund Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (995963282, 'Rebecca', 'Polley', to_date('28-05-1980', 'dd-mm-yyyy'), 'rebecca.polley@kmart', '052-8217397', '54 Ponty Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (699803678, 'Paula', 'Landau', to_date('12-02-2065', 'dd-mm-yyyy'), 'paula@glacierbancorp', '054-1172261', '895 Bryan Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (365550816, 'Antonio', 'Blanchett', to_date('02-02-1980', 'dd-mm-yyyy'), 'antonio.b@gapinc.jp', '058-8514223', '75 Farmington Hills');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (54381664, 'Mae', 'Dayne', to_date('17-04-1988', 'dd-mm-yyyy'), 'm.dayne@worldcom.de', '052-9859832', '37 Shand Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (189781802, 'Philip', 'Matthau', to_date('20-07-2000', 'dd-mm-yyyy'), 'philip.matthau@newho', '054-1116242', '9 Ben-Gurion Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (931744712, 'Bo', 'Hoskins', to_date('23-08-1976', 'dd-mm-yyyy'), 'bo.h@abs.jp', '050-9074125', '2 Sedgwick Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (243358248, 'Taylor', 'Stamp', to_date('05-08-1971', 'dd-mm-yyyy'), 'taylor.s@oss.jp', '058-3598899', '13 Alexander');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (946945507, 'Jet', 'Lonsdale', to_date('06-10-2067', 'dd-mm-yyyy'), 'jet.lonsdale@fra.uk', '054-8667386', '12 Crouse Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (252294662, 'Cledus', 'Emmerich', to_date('14-06-2064', 'dd-mm-yyyy'), 'cledus.e@gci.nl', '058-1209023', '14 Zipf Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (802594334, 'Jake', 'Davis', to_date('26-02-1975', 'dd-mm-yyyy'), 'jake.davis@cmi.com', '050-8647196', '87 McDonald Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (538804219, 'Angela', 'Crudup', to_date('17-09-1997', 'dd-mm-yyyy'), 'a.crudup@kingland.de', '050-8645318', '44 Farmington Hills Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (916586560, 'Herbie', 'Pfeiffer', to_date('24-02-2066', 'dd-mm-yyyy'), 'herbie.pfeiffer@sock', '055-4206426', '75 Kathleen Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (234411426, 'Isabella', 'Clinton', to_date('11-08-1998', 'dd-mm-yyyy'), 'isabella@kellogg.ca', '052-5482196', '90 Altamonte Springs Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (360707907, 'Ethan', 'Mahood', to_date('06-06-1978', 'dd-mm-yyyy'), 'ethan.mahood@yashtec', '055-7304502', '41 Marley Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (285889200, 'Nile', 'Posener', to_date('09-03-1989', 'dd-mm-yyyy'), 'nile.p@gci.br', '050-0222555', '14 Liam Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (311875130, 'Ossie', 'Jeffreys', to_date('23-06-1975', 'dd-mm-yyyy'), 'ossie.jeffreys@smart', '054-0857968', '420 Leto Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (760319692, 'Terrence', 'Van Shelton', to_date('16-04-2060', 'dd-mm-yyyy'), 'terrence.vanshelton@', '050-6655143', '14 Burrows Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (291013634, 'Eric', 'Sherman', to_date('01-04-2060', 'dd-mm-yyyy'), 'eric.sherman@surmodi', '054-8099251', '35 Kershaw Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (3001680, 'Kenneth', 'Rooker', to_date('15-06-1988', 'dd-mm-yyyy'), 'k.rooker@perfectorde', '050-7518738', '15 Saul Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (433882233, 'Andy', 'Tripplehorn', to_date('12-10-2067', 'dd-mm-yyyy'), 'andy.t@scjohnson.it', '054-9264553', '50 Streep Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (44251551, 'Annie', 'David', to_date('17-10-1987', 'dd-mm-yyyy'), 'annie.david@drinkmor', '050-5162174', '65 Whoopi Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (29899921, 'Andrea', 'Gatlin', to_date('08-08-2064', 'dd-mm-yyyy'), 'agatlin@kimberlyclar', '058-3141695', '62nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (195910567, 'Bret', 'McFadden', to_date('15-10-1973', 'dd-mm-yyyy'), 'bretm@greenmountain.', '055-4457377', '49 North Wales Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (841681583, 'Timothy', 'Stowe', to_date('20-11-1985', 'dd-mm-yyyy'), 'timothys@bioanalytic', '054-1342508', '151 Herrmann Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (703497016, 'Jean', 'Bragg', to_date('18-11-1991', 'dd-mm-yyyy'), 'jean.bragg@sears.br', '050-3708718', '38 Thora Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (837617630, 'Clint', 'Grant', to_date('11-01-1974', 'dd-mm-yyyy'), 'cgrant@unilever.com', '050-0526570', '89 Navarro Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (330178033, 'Maura', 'Miles', to_date('04-10-2064', 'dd-mm-yyyy'), 'maura.miles@parksite', '050-9497294', '10 Sorvino Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (69677028, 'Gino', 'Overstreet', to_date('20-04-2062', 'dd-mm-yyyy'), 'gino@portageenvironm', '058-5667427', '80 Strong Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (208040574, 'Nancy', 'Furtado', to_date('12-01-1982', 'dd-mm-yyyy'), 'n.furtado@ppr.fr', '054-2850061', '25 Carla Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (107742156, 'Mary-Louise', 'Norton', to_date('11-05-1974', 'dd-mm-yyyy'), 'marylouise.norton@af', '055-7285023', '51st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (737881505, 'Jesse', 'Tinsley', to_date('23-11-2061', 'dd-mm-yyyy'), 'j.tinsley@mai.ch', '054-8881892', '19 Colman Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (92002257, 'Neneh', 'Waite', to_date('16-07-1983', 'dd-mm-yyyy'), 'neneh.waite@unit.ca', '058-7117267', '64 Michael Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (522168358, 'Veruca', 'Crow', to_date('21-11-2065', 'dd-mm-yyyy'), 'veruca.crow@wrgservi', '054-4871402', '13 Wakeling');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (963810848, 'Dylan', 'Torn', to_date('11-12-2066', 'dd-mm-yyyy'), 'd.torn@bis.com', '050-2705787', '48 Wakeling');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (774569661, 'Miranda', 'Assante', to_date('05-11-2068', 'dd-mm-yyyy'), 'miranda.assante@yes.', '054-4830187', '29 Dickinson');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (467583345, 'Ann', 'LuPone', to_date('03-01-2063', 'dd-mm-yyyy'), 'a.lupone@globalwirel', '052-7565689', '80 Cherepovets Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (386092746, 'Betty', 'Janssen', to_date('30-09-1996', 'dd-mm-yyyy'), 'betty@tilsonhr.com', '054-1820284', '86 Heather Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (567102732, 'Jackson', 'Murray', to_date('04-03-2065', 'dd-mm-yyyy'), 'jackson.murray@execu', '052-9664913', '80 Halle');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (428521920, 'Stevie', 'Vassar', to_date('24-08-2069', 'dd-mm-yyyy'), 'stevie.vassar@apexsy', '055-4200993', '276 Parma Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (526955002, 'Jim', 'Kleinenberg', to_date('03-07-1994', 'dd-mm-yyyy'), 'jim.k@neogen.br', '058-9578745', '31 Jolie Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (307865837, 'Belinda', 'Winans', to_date('25-03-2063', 'dd-mm-yyyy'), 'bwinans@gentrasystem', '055-1940676', '77 Nicky Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (775376407, 'Roberta', 'Donovan', to_date('29-01-1974', 'dd-mm-yyyy'), 'rdonovan@abatix.de', '055-5946329', '50 Place Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (620357514, 'Shawn', 'Bailey', to_date('16-02-2064', 'dd-mm-yyyy'), 'shawn.bailey@tlsserv', '055-5131119', '1 Olympia');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (990516979, 'Jamie', 'Van Helden', to_date('13-12-1991', 'dd-mm-yyyy'), 'jamie.vanhelden@univ', '054-9670824', '55 Gin Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (223862179, 'Ani', 'Waits', to_date('30-04-2061', 'dd-mm-yyyy'), 'ani.waits@pearllawgr', '054-4809085', '87 Wendy Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (710004344, 'Molly', 'Stewart', to_date('19-02-1975', 'dd-mm-yyyy'), 'molly.s@trm.com', '052-4247345', '39 Whitehouse Station Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (393687210, 'Kyra', 'Crudup', to_date('05-11-1990', 'dd-mm-yyyy'), 'k.crudup@priorityexp', '055-6130816', '74 Cummings');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (486989189, 'Kimberly', 'Davidson', to_date('05-01-2065', 'dd-mm-yyyy'), 'kimberly@refinery.co', '055-4027562', '19 Underwood Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (304189365, 'Joey', 'Hudson', to_date('23-06-1977', 'dd-mm-yyyy'), 'joey.hudson@pra.br', '058-1606201', '742 Hannover Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (639693480, 'Carlene', 'Root', to_date('31-03-2065', 'dd-mm-yyyy'), 'carlene.root@acsis.c', '054-2735428', '82 Ashton Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (441477106, 'Davey', 'Pollak', to_date('04-04-1995', 'dd-mm-yyyy'), 'dpollak@shot.com', '054-9154131', '43 Marlon Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (790962536, 'Spencer', 'Campbell', to_date('07-02-1994', 'dd-mm-yyyy'), 'spencer.c@sci.com', '050-9313836', '26 Limeira Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (385262673, 'Claire', 'Feuerstein', to_date('03-11-1998', 'dd-mm-yyyy'), 'claire.feuerstein@he', '052-7143781', '27 Adrien Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (50306839, 'Harrison', 'Gandolfini', to_date('09-03-2070', 'dd-mm-yyyy'), 'harrison.g@americanl', '052-8837351', '98 Ricardson Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (186613824, 'Udo', 'Dunst', to_date('26-04-1978', 'dd-mm-yyyy'), 'udo.dunst@medsource.', '058-3828071', '41 Peterson');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (109362641, 'Joan', 'Lerner', to_date('02-07-1995', 'dd-mm-yyyy'), 'joan.lerner@capitolb', '050-3424756', '808 Patrick Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (950424235, 'Ramsey', 'Lowe', to_date('21-05-2066', 'dd-mm-yyyy'), 'ramsey@kramontrealty', '050-2114321', '54 Cooper Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (556145370, 'Lily', 'Renfro', to_date('03-08-2068', 'dd-mm-yyyy'), 'lilyr@dcgroup.com', '058-1039256', '96 Hector Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (515325860, 'Angela', 'Ford', to_date('18-01-1974', 'dd-mm-yyyy'), 'angela@swp.com', '054-6488649', '14 Mann Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (776584356, 'Nicholas', 'Reeves', to_date('14-11-1973', 'dd-mm-yyyy'), 'nicholas.r@cima.com', '058-3565653', '56 Telford Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (466228227, 'Tramaine', 'Stiers', to_date('05-07-2064', 'dd-mm-yyyy'), 'tstiers@aoe.nl', '055-5367428', '91st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (126000663, 'Danni', 'Walken', to_date('02-01-1991', 'dd-mm-yyyy'), 'danni.walken@drinkmo', '058-9971121', '71st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (64472868, 'Tia', 'Carnes', to_date('09-03-1985', 'dd-mm-yyyy'), 'tia.c@calence.ar', '052-3300084', '26 Meerbusch Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (250303374, 'Manu', 'Todd', to_date('28-01-1972', 'dd-mm-yyyy'), 'manu.todd@outsourceg', '052-3297764', '697 Ismaning Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (309705894, 'Natasha', 'Newman', to_date('15-09-2063', 'dd-mm-yyyy'), 'natasha.newman@als.b', '054-7876543', '789 O''Sullivan Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (897974918, 'Kate', 'Field', to_date('03-09-2068', 'dd-mm-yyyy'), 'kate.field@virbac.co', '054-7097039', '9 Randal Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (901511919, 'Bernard', 'Travers', to_date('10-10-2062', 'dd-mm-yyyy'), 'bernard.travers@oss.', '052-9210713', '45 Okayama');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (991932531, 'Dianne', 'Makowicz', to_date('29-05-2068', 'dd-mm-yyyy'), 'dianne.m@ams.com', '050-0828541', '58 Mira');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (938578584, 'Maura', 'Shannon', to_date('30-11-2060', 'dd-mm-yyyy'), 'maura.shannon@cardtr', '055-7461277', '64 Thomson Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (330353286, 'Forest', 'Redford', to_date('21-09-2062', 'dd-mm-yyyy'), 'forest.redford@morga', '052-3350768', '64 Day Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (192503977, 'Freda', 'McDonnell', to_date('14-04-1971', 'dd-mm-yyyy'), 'freda.mcdonnell@yash', '050-4121326', '100 Gin Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (751076881, 'Kasey', 'Sandler', to_date('08-04-1992', 'dd-mm-yyyy'), 'kasey.sandler@ccfhol', '052-6683046', '648 Hank Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (711195723, 'Ricardo', 'Boorem', to_date('23-05-1996', 'dd-mm-yyyy'), 'ricardob@appriss.ch', '054-9186902', '16 Trento Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (600936210, 'Freddie', 'Thewlis', to_date('10-03-1990', 'dd-mm-yyyy'), 'freddie.t@trusecure.', '050-7169506', '78 Jane Blvd');
commit;
prompt 700 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (755135766, 'Betty', 'Davidson', to_date('03-03-2066', 'dd-mm-yyyy'), 'b.davidson@gsat.it', '052-7795457', '77 Avril');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (10812948, 'Christian', 'Archer', to_date('28-11-2070', 'dd-mm-yyyy'), 'christian.archer@den', '054-8194287', '27 Rip Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (32393130, 'Marianne', 'Bugnon', to_date('27-01-1990', 'dd-mm-yyyy'), 'marianne.bugnon@kmar', '054-8213844', '45 Walken Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (661595363, 'William', 'Sartain', to_date('21-12-1975', 'dd-mm-yyyy'), 'w.sartain@cis.com', '054-5138886', '46 Vista Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (570923959, 'Vertical', 'Rea', to_date('07-08-1971', 'dd-mm-yyyy'), 'vertical.rea@bashen.', '054-1124260', '81st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (527952564, 'Breckin', 'Pesci', to_date('20-12-1998', 'dd-mm-yyyy'), 'breckin.pesci@spd.co', '055-4533450', '62 Gere Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (294377002, 'Ethan', 'Lowe', to_date('02-10-1971', 'dd-mm-yyyy'), 'ethan.lowe@powerligh', '058-2571461', '810 Gyllenhaal Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (760238951, 'Janice', 'Myles', to_date('02-10-2060', 'dd-mm-yyyy'), 'janice.myles@trainer', '050-9695994', '52nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (351656794, 'Selma', 'Connery', to_date('12-11-1993', 'dd-mm-yyyy'), 'selma.connery@zonepe', '050-0089053', '61st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (806958054, 'Harold', 'Krabbe', to_date('21-08-1980', 'dd-mm-yyyy'), 'harold.krabbe@progre', '054-3120025', '106 Napolitano');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (978806799, 'Kitty', 'LaSalle', to_date('21-02-1983', 'dd-mm-yyyy'), 'k.lasalle@valleyoaks', '054-9740754', '170 Fiennes Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (414782607, 'Miki', 'Spacey', to_date('23-04-1979', 'dd-mm-yyyy'), 'miki.spacey@ositisso', '054-6526812', '434 Azaria Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (802514517, 'Hank', 'Folds', to_date('26-06-2066', 'dd-mm-yyyy'), 'hank.folds@qls.com', '052-6866232', '63 Marley');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (471640670, 'Madeline', 'Black', to_date('08-02-1978', 'dd-mm-yyyy'), 'madeline.black@cenda', '050-1489333', '274 Paymer Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (892462211, 'Karon', 'Brown', to_date('01-03-1989', 'dd-mm-yyyy'), 'karon@kis.fi', '050-7987855', '34 Courtney Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (980433268, 'Daryl', 'Harrison', to_date('07-11-1978', 'dd-mm-yyyy'), 'dharrison@dps.uk', '054-1301266', '65 Archer Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (913585815, 'Jena', 'Burstyn', to_date('23-10-2060', 'dd-mm-yyyy'), 'j.burstyn@circuitcit', '058-2641513', '689 Theron Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (387629168, 'Laurence', 'Mason', to_date('22-12-1994', 'dd-mm-yyyy'), 'lmason@fetchlogistic', '055-3883526', '989 Dresden Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (935571506, 'Cheech', 'Ermey', to_date('17-10-2063', 'dd-mm-yyyy'), 'cheech.ermey@general', '052-4764079', '40 Cronin Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (553644389, 'Buffy', 'Rock', to_date('12-02-2066', 'dd-mm-yyyy'), 'buffy.rock@nuinfosys', '054-3630058', '32nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (700457779, 'Zooey', 'Moorer', to_date('09-06-1976', 'dd-mm-yyyy'), 'zmoorer@oneidafinanc', '058-4838182', '24 Nicole Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (337259625, 'April', 'Day-Lewis', to_date('17-01-1999', 'dd-mm-yyyy'), 'a.daylewis@yes.de', '050-2784874', '5 Suzy Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (676444609, 'Mira', 'Nicholson', to_date('12-11-2069', 'dd-mm-yyyy'), 'mira.nicholson@newvi', '055-6151091', '403 Curt Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (991523670, 'Trini', 'Rooker', to_date('06-02-2065', 'dd-mm-yyyy'), 'trini@cooktek.jp', '050-3145505', '100 Athens Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (765899734, 'Donna', 'Penn', to_date('25-09-1988', 'dd-mm-yyyy'), 'dpenn@seafoxboat.com', '055-1378965', '630 Sona Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (270540370, 'Marty', 'DiCaprio', to_date('27-07-1983', 'dd-mm-yyyy'), 'marty.dicaprio@gener', '054-2967414', '73 Morales Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (930497290, 'Vickie', 'Parsons', to_date('17-08-1995', 'dd-mm-yyyy'), 'vickie.p@advancedneu', '054-8822452', '977 Madonna Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (56375123, 'Annie', 'Brody', to_date('06-09-2070', 'dd-mm-yyyy'), 'annie@veritekinterna', '055-9483564', '613 Brossard Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (381105266, 'Neneh', 'Gayle', to_date('22-08-1977', 'dd-mm-yyyy'), 'ngayle@shufflemaster', '050-8650945', '93 Santorso Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (426786444, 'Jet', 'Valentin', to_date('17-06-1973', 'dd-mm-yyyy'), 'jet.valentin@taycorf', '055-5466098', '465 Pfeiffer Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (980693589, 'Deborah', 'Lunch', to_date('20-11-1972', 'dd-mm-yyyy'), 'deborah.lunch@unilev', '054-3118795', '83 Tours Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (64850093, 'Suzy', 'Porter', to_date('27-12-2060', 'dd-mm-yyyy'), 'suzy.porter@berkshir', '050-8477779', '12nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (585061682, 'Michael', 'Gore', to_date('04-07-1980', 'dd-mm-yyyy'), 'michael.gore@nhhc.ch', '054-0135259', '49 Wiedlin Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (396826582, 'Maxine', 'Evett', to_date('08-04-2000', 'dd-mm-yyyy'), 'maxine@gdatechnologi', '050-2617631', '809 Brosnan Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (427878826, 'Salma', 'Van Damme', to_date('29-10-1971', 'dd-mm-yyyy'), 'salma.vandamme@stmar', '050-3349089', '94 Gordon Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (329443829, 'Vin', 'Duschel', to_date('03-03-1988', 'dd-mm-yyyy'), 'vin@trinityhomecare.', '058-8186908', '96 Giessen Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (182366747, 'Roscoe', 'Jolie', to_date('15-08-1973', 'dd-mm-yyyy'), 'roscoe.j@hfg.de', '050-9255856', '61st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (524980034, 'Maggie', 'Paymer', to_date('22-01-2066', 'dd-mm-yyyy'), 'maggiep@solutionbuil', '052-0624853', '31 Lucien');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (75243245, 'Shawn', 'Buckingham', to_date('28-05-1972', 'dd-mm-yyyy'), 's.buckingham@safehom', '050-7933141', '21st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (399563403, 'Katie', 'Tate', to_date('13-08-1982', 'dd-mm-yyyy'), 'katie.t@jsa.il', '054-7498559', '55 Eschen');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (454486942, 'Mili', 'Bratt', to_date('16-09-1974', 'dd-mm-yyyy'), 'mili@linersdirect.cn', '052-5598535', '39 Princeton Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (669509928, 'Armin', 'Colman', to_date('23-06-2063', 'dd-mm-yyyy'), 'acolman@adolph.be', '055-3709900', '57 Wahlberg Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (389773042, 'Tanya', 'Polley', to_date('30-01-1980', 'dd-mm-yyyy'), 'tpolley@mwh.ca', '052-1159850', '16 Coward Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (474496931, 'Gene', 'Ford', to_date('06-05-1997', 'dd-mm-yyyy'), 'genef@ipsadvisory.co', '050-7987081', '30 Van Damme Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (871752058, 'Maceo', 'Russell', to_date('06-05-1996', 'dd-mm-yyyy'), 'maceo.russell@advanc', '052-6651905', '582 Mellencamp Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (452327594, 'Boz', 'Streep', to_date('11-12-1999', 'dd-mm-yyyy'), 'boz.streep@ceom.pt', '055-0675704', '94 Field Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (210119322, 'Alicia', 'Hornsby', to_date('30-11-1983', 'dd-mm-yyyy'), 'alicia.hornsby@acces', '052-5841351', '10 McDormand Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (382166120, 'Grant', 'Nightingale', to_date('21-09-2000', 'dd-mm-yyyy'), 'grant.nightingale@ca', '058-5680297', '215 Domingo Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (605047907, 'Raul', 'Van Der Beek', to_date('15-09-1973', 'dd-mm-yyyy'), 'raulv@labradanutriti', '052-9958838', '323 Spall Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (810053418, 'Lenny', 'DeGraw', to_date('01-08-2068', 'dd-mm-yyyy'), 'lennyd@jsa.com', '050-9460653', '45 Mellencamp Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (469836768, 'Benjamin', 'Gold', to_date('31-01-2067', 'dd-mm-yyyy'), 'benjamin.gold@gdatec', '050-6089165', '443 Heath Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (829392823, 'Tal', 'Fogerty', to_date('11-03-1983', 'dd-mm-yyyy'), 'tal.fogerty@anheuser', '058-8570388', '598 Bekescsaba Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (214608789, 'Chris', 'Donovan', to_date('04-01-1999', 'dd-mm-yyyy'), 'chris.d@nhr.com', '052-8083680', '99 Rydell Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (734904698, 'Hugo', 'Perry', to_date('25-05-1988', 'dd-mm-yyyy'), 'h.perry@pra.com', '052-0587606', '10 Spencer Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (258675598, 'Mickey', 'Albright', to_date('25-08-1994', 'dd-mm-yyyy'), 'mickey.albright@conq', '050-3713724', '76 Koteas Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (981589830, 'Brad', 'McCormack', to_date('10-08-1979', 'dd-mm-yyyy'), 'brad.mccormack@hfn.c', '050-8456019', '864 Johnny Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (409872027, 'Mindy', 'Manning', to_date('06-11-2001', 'dd-mm-yyyy'), 'mindy.manning@aquick', '055-2208851', '97 Broadbent');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (197141041, 'Spencer', 'Coverdale', to_date('09-10-2060', 'dd-mm-yyyy'), 'spencer.coverdale@sp', '050-1411739', '34 Latifah Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (701339475, 'Ali', 'Luongo', to_date('01-01-1990', 'dd-mm-yyyy'), 'ali.luongo@healthscr', '054-5799941', '81 Zappacosta Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (961254707, 'Chet', 'Ermey', to_date('14-07-2068', 'dd-mm-yyyy'), 'cermey@vms.de', '050-1315798', '81 Steenburgen Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (169750641, 'Deborah', 'Carr', to_date('16-11-2065', 'dd-mm-yyyy'), 'deborahc@chipssoluti', '058-8771662', '72 Shelton');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (344649439, 'Carolyn', 'Pitney', to_date('10-12-1992', 'dd-mm-yyyy'), 'cpitney@3tsystems.dk', '055-0164043', '46 Dalmine Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (383995668, 'Marty', 'Goldwyn', to_date('12-09-1990', 'dd-mm-yyyy'), 'martyg@usdairyproduc', '058-7727576', '21 Deborah Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (313895868, 'Chad', 'Stone', to_date('14-02-1977', 'dd-mm-yyyy'), 'chad.stone@irissoftw', '050-4556515', '346 Damon Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (639900224, 'Christina', 'Downey', to_date('18-02-1982', 'dd-mm-yyyy'), 'christina.d@tarragon', '052-5079879', '3 Carrie-Anne Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (541606677, 'Teri', 'Rockwell', to_date('20-09-1983', 'dd-mm-yyyy'), 'teri.rockwell@afs.uk', '055-4046340', '46 Bartlesville Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (899665600, 'Doug', 'Anderson', to_date('07-03-1993', 'dd-mm-yyyy'), 'doug.anderson@scjohn', '055-3549557', '52 Benoit Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (812245546, 'Patty', 'Utada', to_date('03-01-1989', 'dd-mm-yyyy'), 'patty.u@monitronicsi', '055-8225551', '71 Holiday Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (271544007, 'Bobby', 'Black', to_date('23-04-1974', 'dd-mm-yyyy'), 'bobby.black@sysconme', '052-8250802', '28 Adler Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (836933803, 'Nina', 'Dafoe', to_date('14-01-1997', 'dd-mm-yyyy'), 'ninad@nat.nl', '055-5985345', '50 Jeanne Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (174236549, 'Garland', 'Franklin', to_date('13-01-1973', 'dd-mm-yyyy'), 'gfranklin@microsoft.', '054-9526999', '14 Firth Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (504881359, 'Marc', 'Haggard', to_date('06-03-2064', 'dd-mm-yyyy'), 'marc@scriptsave.at', '055-9187405', '76 Fisher Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (786604761, 'Dan', 'Reiner', to_date('09-12-1984', 'dd-mm-yyyy'), 'danr@mms.de', '058-4380764', '59 Forster Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (906089273, 'Marley', 'Burns', to_date('03-09-2067', 'dd-mm-yyyy'), 'marley.burns@dbprofe', '050-6893705', '820 Mendoza Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (803682518, 'Neneh', 'Rossellini', to_date('31-12-2060', 'dd-mm-yyyy'), 'neneh.rossellini@chh', '055-7436414', '44 Krabbe Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (671033701, 'Holland', 'Osmond', to_date('16-02-1993', 'dd-mm-yyyy'), 'holland@qestrel.com', '058-3043924', '52 Child');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (380835596, 'Bonnie', 'Polito', to_date('18-12-1975', 'dd-mm-yyyy'), 'bpolito@serentec.com', '052-5336209', '20 Phoenix Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (981309953, 'Jean-Luc', 'Curtis-Hall', to_date('05-05-1989', 'dd-mm-yyyy'), 'jcurtishall@ecopy.co', '054-1043623', '23 Osment Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (184014344, 'Jaime', 'King', to_date('19-08-1999', 'dd-mm-yyyy'), 'jaime.king@kimberlyc', '055-1907657', '29 Spacek');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (747284996, 'Dennis', 'Benoit', to_date('14-06-2070', 'dd-mm-yyyy'), 'dennis.b@ams.is', '058-6273684', '855 Luedenscheid Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (796458442, 'Spencer', 'Kingsley', to_date('10-09-2066', 'dd-mm-yyyy'), 's.kingsley@career.co', '058-1787777', '58 Hunter Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (39324673, 'Patti', 'Palmer', to_date('06-03-1977', 'dd-mm-yyyy'), 'patti.palmer@berkshi', '052-5640487', '73 Lunch Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (725439064, 'Jean-Claude', 'Polito', to_date('01-10-1996', 'dd-mm-yyyy'), 'jeanclaude.polito@in', '058-1858475', '800 Moriarty Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (604235995, 'Vince', 'Borgnine', to_date('09-06-1989', 'dd-mm-yyyy'), 'vince@ach.fr', '052-9208329', '91st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (123092853, 'Alannah', 'Bratt', to_date('15-04-1992', 'dd-mm-yyyy'), 'alannahb@ogiointerna', '054-4367239', '19 Flower mound Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (47817047, 'Rory', 'Ramis', to_date('09-09-2061', 'dd-mm-yyyy'), 'roryr@solutionbuilde', '052-1586138', '43rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (833436319, 'Avenged', 'Williams', to_date('13-02-1977', 'dd-mm-yyyy'), 'avenged.williams@net', '050-2119780', '99 Estevez Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (682523646, 'Lee', 'Ferry', to_date('27-12-1978', 'dd-mm-yyyy'), 'lee.ferry@authoria.a', '050-5218025', '69 Nancy Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (854400111, 'Paula', 'Downey', to_date('06-12-2067', 'dd-mm-yyyy'), 'paula.downey@visaint', '058-8721523', '82nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (821873346, 'Chely', 'Singletary', to_date('17-06-1978', 'dd-mm-yyyy'), 'chely@intel.de', '050-0534056', '7 Griffin Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (899078844, 'Ramsey', 'Lennox', to_date('13-01-2001', 'dd-mm-yyyy'), 'ramsey.lennox@fmi.pl', '054-4946378', '25 Arnold Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (6471843, 'Ellen', 'Birch', to_date('03-05-2069', 'dd-mm-yyyy'), 'ellen.birch@appriss.', '055-6109845', '97 Busta Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (276224548, 'Nik', 'Hart', to_date('12-08-2001', 'dd-mm-yyyy'), 'n.hart@infovision.co', '052-2919682', '33 Tippe Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (821577482, 'Shannon', 'Sweet', to_date('10-05-2063', 'dd-mm-yyyy'), 'shannon.sweet@career', '054-9862922', '9 Shandling Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (189864344, 'Hugo', 'Tempest', to_date('27-08-1984', 'dd-mm-yyyy'), 'hugo.tempest@keith.a', '058-9668208', '53 May Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (820426241, 'Tea', 'Rosas', to_date('30-10-2066', 'dd-mm-yyyy'), 'tea.rosas@naturescur', '052-0446590', '42 Harrisburg Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (623184282, 'Garland', 'Lindo', to_date('26-09-1991', 'dd-mm-yyyy'), 'garland.lindo@gapinc', '054-1951618', '963 Jacksonville Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (692839733, 'Breckin', 'Browne', to_date('21-01-1994', 'dd-mm-yyyy'), 'b.browne@glacierbanc', '050-9173373', '64 Moody Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (167630836, 'Grace', 'Day-Lewis', to_date('02-04-1978', 'dd-mm-yyyy'), 'grace.daylewis@lms.c', '050-8474346', '54 Hilary Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (348355881, 'Meryl', 'Hawkins', to_date('08-08-1987', 'dd-mm-yyyy'), 'mhawkins@printingfor', '052-6768181', '22nd Street');
commit;
prompt 800 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (773084912, 'Balthazar', 'Johansson', to_date('09-10-1981', 'dd-mm-yyyy'), 'balthazar@egroup.com', '052-9899010', '974 Braugher Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (892840907, 'Naomi', 'Dolenz', to_date('01-03-1997', 'dd-mm-yyyy'), 'naomi.dolenz@printin', '054-1131542', '22nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (351317493, 'Willem', 'McGinley', to_date('12-06-1974', 'dd-mm-yyyy'), 'willem.mcginley@wav.', '058-8769562', '23 Karyo');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (947808748, 'Albertina', 'Luongo', to_date('12-04-2067', 'dd-mm-yyyy'), 'albertina@shirtfacto', '052-9030753', '278 Bedfordshire Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (91738594, 'Timothy', 'Sevenfold', to_date('24-10-1998', 'dd-mm-yyyy'), 'timothy.sevenfold@ac', '052-2749906', '64 Robby');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (92964164, 'John', 'Clarkson', to_date('03-02-1973', 'dd-mm-yyyy'), 'john@saralee.cr', '058-2385186', '9 Bozeman Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (946513848, 'Sona', 'Dayne', to_date('19-02-1973', 'dd-mm-yyyy'), 'sonad@sci.com', '052-5611120', '75 Lillard Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (221141315, 'Anthony', 'Wright', to_date('04-04-2065', 'dd-mm-yyyy'), 'anthony.wright@owm.u', '052-5276741', '34 Market Harborough Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (317709906, 'Hilary', 'Jolie', to_date('02-03-2061', 'dd-mm-yyyy'), 'h.jolie@ivci.at', '054-5616428', '21 Nielsen Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (990714357, 'Ricardo', 'Farris', to_date('29-05-1977', 'dd-mm-yyyy'), 'ricardo.f@nissanmoto', '055-5076136', '7 Fariq Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (370386400, 'Julie', 'Stormare', to_date('16-09-1976', 'dd-mm-yyyy'), 'julie.s@sears.de', '055-1013057', '73 McFadden Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (806251174, 'Millie', 'Womack', to_date('06-04-1999', 'dd-mm-yyyy'), 'millie@gentrasystems', '050-6866078', '56 Holly Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (373933602, 'Howard', 'Gibson', to_date('20-09-2063', 'dd-mm-yyyy'), 'howard.gibson@asa.co', '052-2242591', '27 Rea Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (62876121, 'Kylie', 'McDonald', to_date('23-02-1987', 'dd-mm-yyyy'), 'kylie.mcdonald@calib', '058-9453969', '66 Irvine Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (376888087, 'Connie', 'Benson', to_date('06-07-1976', 'dd-mm-yyyy'), 'connie.b@sci.com', '052-7078332', '73 Nikka Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (650686042, 'Joaquin', 'Stiers', to_date('13-09-2066', 'dd-mm-yyyy'), 'jstiers@marketbased.', '054-9218142', '21 Mint Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (602539596, 'Ned', 'Cross', to_date('16-04-1983', 'dd-mm-yyyy'), 'ncross@signature.fr', '058-8851383', '32nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (784208433, 'Heather', 'Carrere', to_date('07-04-2065', 'dd-mm-yyyy'), 'h.carrere@stiknowled', '054-1631189', '31 Ferry Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (625380222, 'Courtney', 'Loring', to_date('22-04-1971', 'dd-mm-yyyy'), 'courtney@curagroup.f', '058-2370496', '38 Den Haag Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (695257433, 'Jill', 'Rebhorn', to_date('07-09-1995', 'dd-mm-yyyy'), 'jill@unicru.tr', '055-4230778', '25 Juneau Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (741401481, 'Natasha', 'Stevens', to_date('24-11-2063', 'dd-mm-yyyy'), 'natashas@marlabs.uk', '058-3681375', '37 Conners Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (613003091, 'Kelli', 'Scott', to_date('03-01-2060', 'dd-mm-yyyy'), 'kelli.scott@montpeli', '055-3492489', '89 Kyoto Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (613222035, 'Jesus', 'Mohr', to_date('14-02-1991', 'dd-mm-yyyy'), 'jesusm@usphysicalthe', '058-3607203', '17 Sale Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (974114255, 'Benjamin', 'Murray', to_date('11-07-1972', 'dd-mm-yyyy'), 'benjamin.murray@oper', '052-5745454', '54 Secada Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (388169721, 'Emmylou', 'Wen', to_date('18-09-2060', 'dd-mm-yyyy'), 'emmylou.wen@scjohnso', '055-9593320', '17 Walsh Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (893918445, 'Garth', 'Mathis', to_date('13-11-1973', 'dd-mm-yyyy'), 'garth.mathis@innovat', '050-1079255', '100 Coward Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (502846201, 'Hookah', 'Matthau', to_date('10-10-1979', 'dd-mm-yyyy'), 'hookah.matthau@ceo.c', '054-5865370', '52 Freddie Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (387541507, 'Taylor', 'Kennedy', to_date('05-09-1980', 'dd-mm-yyyy'), 'taylork@solipsys.se', '058-2329632', '81 Crewson Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (397450864, 'Maggie', 'Lillard', to_date('23-12-1987', 'dd-mm-yyyy'), 'maggie.lillard@ahl.a', '052-9780291', '293 Andre Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (419607597, 'Desmond', 'Goldberg', to_date('25-06-2067', 'dd-mm-yyyy'), 'desmond.goldberg@fam', '058-7663528', '90 Bassett');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (644443233, 'Milla', 'Dunst', to_date('04-01-1992', 'dd-mm-yyyy'), 'milla.dunst@dearborn', '052-2732606', '984 Bischofshofen Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (869444643, 'Denzel', 'Alexander', to_date('24-05-1992', 'dd-mm-yyyy'), 'dalexander@acsis.de', '052-5921937', '83 Echirolles Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (697538426, 'Whoopi', 'Connick', to_date('30-12-1993', 'dd-mm-yyyy'), 'whoopi.connick@idlab', '050-5398935', '32 Buffalo');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (992821212, 'Wayne', 'Nicks', to_date('24-04-1997', 'dd-mm-yyyy'), 'wayne.nicks@tripwire', '058-6267722', '87 Londrina Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (463286716, 'Laurence', 'Chaplin', to_date('09-05-1994', 'dd-mm-yyyy'), 'laurence.chaplin@pro', '050-7183322', '34 Bridget Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (302809016, 'Jena', 'Reilly', to_date('19-02-1990', 'dd-mm-yyyy'), 'jreilly@epiqsystems.', '050-0384594', '59 Angela Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (535157009, 'Catherine', 'Rhames', to_date('20-02-2068', 'dd-mm-yyyy'), 'catherine.r@sis.de', '058-2826299', '10 Clint Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (80806245, 'Alfred', 'Douglas', to_date('18-07-1992', 'dd-mm-yyyy'), 'adouglas@netnumina.a', '052-3236514', '2 Wells Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (188343406, 'Benjamin', 'Crouse', to_date('19-11-1997', 'dd-mm-yyyy'), 'b.crouse@staffforce.', '054-1073481', '14 McDormand Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (240734827, 'Irene', 'Close', to_date('20-01-1999', 'dd-mm-yyyy'), 'irenec@accurateautob', '058-2106198', '5 Edmunds Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (848730907, 'Frances', 'Mann', to_date('20-08-1981', 'dd-mm-yyyy'), 'frances.mann@navigat', '050-7272353', '735 Bracco Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (158776783, 'Burton', 'Clinton', to_date('10-10-1999', 'dd-mm-yyyy'), 'bclinton@eastmankoda', '052-6357906', '757 McGill');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (189706487, 'Lily', 'Mathis', to_date('12-01-1991', 'dd-mm-yyyy'), 'lily.mathis@cis.ch', '050-1328776', '79 Gaby Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (536953648, 'Jean-Claude', 'Masur', to_date('12-07-1983', 'dd-mm-yyyy'), 'jeanclaude.masur@new', '055-4255558', '85 Esposito Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (96547017, 'Ving', 'Dooley', to_date('06-08-1971', 'dd-mm-yyyy'), 'v.dooley@gcd.uk', '054-7711152', '50 Altstätten Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (102816805, 'Johnnie', 'Mac', to_date('27-09-1977', 'dd-mm-yyyy'), 'johnnie.mac@american', '052-1937707', '71 Sarsgaard Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (901526763, 'Saffron', 'Reeve', to_date('18-02-2070', 'dd-mm-yyyy'), 'sreeve@ois.ch', '050-9246181', '20 Recife Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (456784055, 'Hazel', 'Polito', to_date('19-10-1975', 'dd-mm-yyyy'), 'hazel.polito@mds.ar', '054-7201620', '85 St-laurent');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (376615780, 'Veruca', 'Ingram', to_date('19-02-2070', 'dd-mm-yyyy'), 'veruca.ingram@genera', '052-2407472', '84 Pasadena Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (349186485, 'Trace', 'Rodriguez', to_date('11-10-2067', 'dd-mm-yyyy'), 'trace.r@gra.com', '058-9517806', '85 Brittany Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (491924622, 'Trick', 'Berkley', to_date('04-12-1990', 'dd-mm-yyyy'), 'tberkley@printtech.s', '055-9640970', '28 Sedaka');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (666975561, 'Gordon', 'Hudson', to_date('24-02-2068', 'dd-mm-yyyy'), 'gordon@actechnologie', '050-6597592', '28 Loring Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (648381914, 'Marianne', 'Bragg', to_date('11-07-1979', 'dd-mm-yyyy'), 'marianne.bragg@cmi.c', '055-5881064', '50 Roberts');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (534772979, 'Roy', 'Shaw', to_date('20-05-1988', 'dd-mm-yyyy'), 'roy.shaw@nobrainerbl', '054-2642543', '77 Wong Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (634585028, 'Marianne', 'Rispoli', to_date('02-06-1986', 'dd-mm-yyyy'), 'marianner@techrx.sg', '055-8012282', '34 Emerson Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (417182486, 'Alec', 'Napolitano', to_date('14-11-1978', 'dd-mm-yyyy'), 'alec.napolitano@sfgo', '058-6085414', '83 Dillane Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (643273666, 'Dar', 'Dushku', to_date('24-03-2061', 'dd-mm-yyyy'), 'dar@providenceservic', '058-5197301', '2 Zahn Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (334037523, 'Miles', 'Hoffman', to_date('18-12-1996', 'dd-mm-yyyy'), 'milesh@americanexpre', '058-5770753', '55 Bush Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (126915430, 'Ben', 'Neeson', to_date('13-01-1972', 'dd-mm-yyyy'), 'ben.neeson@hitechpha', '052-1362891', '28 Dench Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (6802597, 'Minnie', 'Davidtz', to_date('25-02-1975', 'dd-mm-yyyy'), 'minnie.davidtz@unger', '058-5078216', '85 Kramer Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (321388053, 'Mekhi', 'Studi', to_date('18-06-1990', 'dd-mm-yyyy'), 'mekhi@fiberlink.com', '058-7762568', '84 Katie Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (738222863, 'Ned', 'Edmunds', to_date('14-09-2069', 'dd-mm-yyyy'), 'ned.edmunds@myricom.', '058-8363189', '42 New Fairfield Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (936673659, 'Toshiro', 'Holbrook', to_date('15-03-1999', 'dd-mm-yyyy'), 'toshiro.h@printcafes', '050-3485795', '32 Wilder Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (915347869, 'Billy', 'Cube', to_date('23-12-1989', 'dd-mm-yyyy'), 'billy.cube@anworthmo', '054-3628369', '802 Hart Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (563368458, 'Mia', 'Walken', to_date('07-04-1990', 'dd-mm-yyyy'), 'mia@jcpenney.jp', '055-2827258', '99 Cledus Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (772222106, 'Tramaine', 'Haslam', to_date('07-08-2070', 'dd-mm-yyyy'), 't.haslam@y2marketing', '050-8407880', '59 Turturro Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (447143093, 'Colleen', 'Zane', to_date('30-10-1994', 'dd-mm-yyyy'), 'colleen@uem.ca', '058-1208997', '16 Briscoe Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (759978602, 'Red', 'Slater', to_date('19-02-1973', 'dd-mm-yyyy'), 'red.slater@education', '058-9227908', '323 Kilmer Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (590348105, 'Dabney', 'Atkins', to_date('30-10-2063', 'dd-mm-yyyy'), 'dabney.atkins@genghi', '055-6736448', '23 Lyonne');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (615932565, 'Chad', 'Coolidge', to_date('24-09-2064', 'dd-mm-yyyy'), 'ccoolidge@cmi.dk', '052-9039780', '55 Bernex');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (811272692, 'Elvis', 'Spine', to_date('19-06-1986', 'dd-mm-yyyy'), 'elvis.spine@priority', '050-9007653', '83rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (766299119, 'Carole', 'Coburn', to_date('07-02-2001', 'dd-mm-yyyy'), 'carolec@afs.dk', '052-5904691', '59 Rotterdam Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (292350926, 'Harriet', 'Randal', to_date('12-03-1995', 'dd-mm-yyyy'), 'harriet.r@saltgroup.', '054-6999409', '197 Holderbank Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (871531742, 'Michelle', 'Lithgow', to_date('04-03-1978', 'dd-mm-yyyy'), 'michelle.lithgow@jma', '052-7504598', '35 Lloyd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (387837544, 'Regina', 'Hong', to_date('30-01-2068', 'dd-mm-yyyy'), 'regina@clubone.br', '052-7748327', '21 Rosario Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (15283856, 'Jet', 'Morrison', to_date('06-12-2068', 'dd-mm-yyyy'), 'jmorrison@staffone.e', '058-7354536', '480 Murray Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (346920765, 'Albertina', 'Farris', to_date('05-04-1974', 'dd-mm-yyyy'), 'albertina.farris@hit', '052-4326631', '61 São paulo');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (196542001, 'Cathy', 'Sylvian', to_date('29-08-1982', 'dd-mm-yyyy'), 'csylvian@younginnova', '055-8830494', '95 Ron Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (609394985, 'Joaquin', 'Santa Rosa', to_date('09-12-1978', 'dd-mm-yyyy'), 'joaquin.santarosa@en', '058-1785414', '446 Detmer Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (218327171, 'Laurence', 'Saucedo', to_date('20-06-1995', 'dd-mm-yyyy'), 'laurence.saucedo@inv', '058-5868604', '49 Rochester Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (546518298, 'Reese', 'Peterson', to_date('24-04-1983', 'dd-mm-yyyy'), 'reese.p@pinnaclestaf', '050-1974158', '697 Sonny Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (713992086, 'Elijah', 'Sutherland', to_date('07-03-2063', 'dd-mm-yyyy'), 'elijah@vspan.uk', '058-4240646', '10 Spencer Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (476624502, 'Kyra', 'McCormack', to_date('18-12-1975', 'dd-mm-yyyy'), 'k.mccormack@hencie.d', '055-6107761', '5 Miles Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (667490625, 'Larenz', 'Whitwam', to_date('12-01-1981', 'dd-mm-yyyy'), 'larenz.whitwam@nike.', '055-7779574', '446 Connery Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (483627531, 'Bret', 'Downey', to_date('22-03-1975', 'dd-mm-yyyy'), 'bret.downey@investme', '050-0933232', '610 Matthew');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (294995706, 'Emmylou', 'Cox', to_date('27-04-2066', 'dd-mm-yyyy'), 'emmylou.cox@cimalabs', '054-5274452', '84 Daniels Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (785522154, 'CeCe', 'Martin', to_date('18-02-1974', 'dd-mm-yyyy'), 'cece.m@base.com', '055-2068086', '86 Josh Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (253760950, 'Randall', 'Winter', to_date('02-10-2066', 'dd-mm-yyyy'), 'randall@glmt.com', '052-5192517', '16 Arnold Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (520485448, 'Yaphet', 'Garner', to_date('18-03-2064', 'dd-mm-yyyy'), 'yaphet.garner@multim', '054-1623492', '56 Zeta-Jones Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (974100054, 'Morris', 'Pryce', to_date('09-06-1971', 'dd-mm-yyyy'), 'morris.p@invisioncom', '058-4968211', '441 Sinead Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (398484063, 'Gordon', 'Busey', to_date('11-11-1972', 'dd-mm-yyyy'), 'gordon.busey@ams.com', '054-3370538', '346 Mandy Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (298198113, 'Sona', 'Ceasar', to_date('29-05-1997', 'dd-mm-yyyy'), 'sceasar@sfgo.de', '054-6080809', '89 Steagall Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (644113101, 'Oliver', 'Hunt', to_date('25-07-1991', 'dd-mm-yyyy'), 'oliver.hunt@ntas.za', '050-3557050', '68 Jovovich Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (161867465, 'Maura', 'Crosby', to_date('16-04-2062', 'dd-mm-yyyy'), 'maura.crosby@multime', '050-0499549', '83rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (784854008, 'Albert', 'McAnally', to_date('28-02-1973', 'dd-mm-yyyy'), 'a.mcanally@marathonh', '055-9207679', '66 Pantoliano Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (222450951, 'Betty', 'Twilley', to_date('17-02-2061', 'dd-mm-yyyy'), 'betty.t@nsd.com', '052-2474887', '67 Gunton Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (239933625, 'Pelvic', 'Evanswood', to_date('09-01-1980', 'dd-mm-yyyy'), 'pelvic@afs.fi', '052-5796735', '655 Gyllenhaal Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (816304026, 'Sinead', 'Gershon', to_date('21-07-1993', 'dd-mm-yyyy'), 'sinead@tastefullysim', '058-2937068', '12 Eric Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (152075798, 'Adam', 'O''Keefe', to_date('27-05-2068', 'dd-mm-yyyy'), 'adam.okeefe@signalpe', '055-6190211', '67 Watson Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (895407822, 'Joanna', 'Zevon', to_date('10-02-2060', 'dd-mm-yyyy'), 'jzevon@pfizer.de', '054-7955838', '72nd Street');
commit;
prompt 900 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (466876355, 'Rade', 'Finney', to_date('08-09-2067', 'dd-mm-yyyy'), 'r.finney@kingland.co', '050-7452467', '25 Wageningen Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (322831163, 'Brent', 'Dukakis', to_date('21-02-1985', 'dd-mm-yyyy'), 'brent.dukakis@ipsadv', '052-8198649', '69 Shepard');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (972648599, 'Fiona', 'Leguizamo', to_date('17-02-1983', 'dd-mm-yyyy'), 'f.leguizamo@biorelia', '052-7443855', '46 Crewson');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (827727216, 'Harry', 'Harrison', to_date('13-11-2068', 'dd-mm-yyyy'), 'harry.harrison@elmco', '055-7146561', '319 Clinton Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (937626202, 'Boyd', 'Boyle', to_date('11-10-1999', 'dd-mm-yyyy'), 'b.boyle@ois.com', '050-7138474', '94 Daniels Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (186632311, 'Dave', 'Condition', to_date('18-09-1984', 'dd-mm-yyyy'), 'dave.c@nexxtworks.ca', '055-1784880', '51 Quaid Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (118062783, 'Spike', 'Fariq', to_date('28-02-1999', 'dd-mm-yyyy'), 'sfariq@jlphor.com', '055-1886590', '9 Pitstone Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (131784250, 'Cloris', 'Bonham', to_date('04-05-2065', 'dd-mm-yyyy'), 'cloris.bonham@fetchl', '050-6020520', '92 Hanley Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (433778924, 'Cliff', 'Porter', to_date('16-06-1979', 'dd-mm-yyyy'), 'cliff@trm.in', '052-9323913', '35 Brugherio Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (440521887, 'Owen', 'Rebhorn', to_date('10-05-1987', 'dd-mm-yyyy'), 'o.rebhorn@prosperity', '052-4066707', '41st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (711720591, 'Lea', 'Humphrey', to_date('04-10-1975', 'dd-mm-yyyy'), 'l.humphrey@maverickt', '052-2756880', '32 LaPaglia');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (333685399, 'Lily', 'Azaria', to_date('09-08-2066', 'dd-mm-yyyy'), 'lilya@evinco.uk', '050-3953072', '8 Stiers Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (553841409, 'Rascal', 'Giannini', to_date('25-02-1996', 'dd-mm-yyyy'), 'rascal.giannini@comp', '058-8799137', '62 Ruth Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (413251924, 'Geoff', 'Paymer', to_date('17-07-1971', 'dd-mm-yyyy'), 'geoff.paymer@3tsyste', '058-1299659', '23 Chuck Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (971705002, 'Victor', 'Gosdin', to_date('25-12-1971', 'dd-mm-yyyy'), 'victor.gosdin@proces', '054-9235937', '7 Melrose Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (951578747, 'Franz', 'Aglukark', to_date('02-06-2062', 'dd-mm-yyyy'), 'franz@nhhc.com', '058-3824875', '30 Kapanka Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (721720661, 'Julianne', 'Mahood', to_date('02-08-2063', 'dd-mm-yyyy'), 'jmahood@career.de', '055-1820138', '41st Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (388238376, 'Natalie', 'Biehn', to_date('06-07-2068', 'dd-mm-yyyy'), 'nbiehn@ipsadvisory.d', '052-4547711', '82 Zurich Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (705250303, 'Kiefer', 'Shelton', to_date('03-03-1971', 'dd-mm-yyyy'), 'kiefer.shelton@fetch', '052-0555682', '841 Rawls');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (14710899, 'Seann', 'Makeba', to_date('27-03-1991', 'dd-mm-yyyy'), 'seann.m@teamstudio.c', '050-1497088', '24 Hershey Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (455134208, 'Winona', 'Joli', to_date('04-09-1977', 'dd-mm-yyyy'), 'winona.joli@catamoun', '055-9268250', '54 Gandolfini Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (144828453, 'Denise', 'Carlisle', to_date('21-11-2063', 'dd-mm-yyyy'), 'denise.c@bps.com', '055-3083175', '10 Diffie');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (205638079, 'Natalie', 'Shue', to_date('27-11-1980', 'dd-mm-yyyy'), 'natalies@trainersoft', '050-4440241', '51 Spine Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (737963727, 'Zooey', 'Sylvian', to_date('11-01-1976', 'dd-mm-yyyy'), 'z.sylvian@progressiv', '054-0950073', '18 Olga Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (761863597, 'Cuba', 'Popper', to_date('16-04-1986', 'dd-mm-yyyy'), 'cuba.popper@fam.au', '050-1289165', '505 Taylor Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (37944316, 'Clint', 'Flanagan', to_date('12-01-1980', 'dd-mm-yyyy'), 'cflanagan@mathis.com', '054-1950867', '25 James Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (789371791, 'Devon', 'Palmer', to_date('19-01-2068', 'dd-mm-yyyy'), 'devon.p@dcgroup.jp', '054-6400177', '980 Neill Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (515505366, 'Mitchell', 'Anderson', to_date('01-08-1987', 'dd-mm-yyyy'), 'mitchell.anderson@op', '055-7366216', '12 Diggs Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (575714585, 'Lauren', 'Trevino', to_date('25-09-2061', 'dd-mm-yyyy'), 'l.trevino@zoneperfec', '058-0974743', '23rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (40606863, 'Trick', 'Pollack', to_date('18-11-2070', 'dd-mm-yyyy'), 'trick@cooktek.za', '050-1888162', '93 Lynn Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (937753279, 'Billy', 'Sweet', to_date('11-01-2060', 'dd-mm-yyyy'), 'billy.sweet@waltdisn', '054-8868969', '66 de Lancie Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (99557501, 'Spike', 'Atlas', to_date('01-05-2062', 'dd-mm-yyyy'), 'spike.atlas@computer', '050-7066979', '65 Laura');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (651238494, 'Ruth', 'Janssen', to_date('01-03-1977', 'dd-mm-yyyy'), 'ruth.janssen@ivci.co', '054-6544138', '17 Murray Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (600985133, 'Rita', 'Ness', to_date('05-04-1974', 'dd-mm-yyyy'), 'rita.ness@chhc.com', '055-7652942', '15 Mekhi Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (679731691, 'Bobby', 'Mandrell', to_date('27-08-1978', 'dd-mm-yyyy'), 'bobby.m@socketintern', '054-1770860', '48 Bielefeld Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (276809375, 'Alessandro', 'Rock', to_date('12-07-1986', 'dd-mm-yyyy'), 'alessandro.rock@unit', '052-8140924', '13 Goldie Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (416555110, 'Kelly', 'Biel', to_date('21-02-1998', 'dd-mm-yyyy'), 'kelly.biel@nrae.au', '058-5161338', '23rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (477594896, 'Robert', 'Cumming', to_date('14-12-1993', 'dd-mm-yyyy'), 'robert.cumming@gentr', '055-1393393', '5 Alexandria Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (65713927, 'Matthew', 'MacDowell', to_date('10-03-1993', 'dd-mm-yyyy'), 'matthew.macdowell@al', '058-9478122', '62 Plymouth Meeting Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (906131128, 'Mickey', 'Moreno', to_date('05-09-2064', 'dd-mm-yyyy'), 'm.moreno@credopetrol', '058-9353691', '54 Fariq Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (258034768, 'Stockard', 'Rosas', to_date('14-06-2066', 'dd-mm-yyyy'), 'stockard.rosas@abs.c', '050-5780639', '676 Hercules Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (328023978, 'Geggy', 'Briscoe', to_date('18-04-2061', 'dd-mm-yyyy'), 'geggy.briscoe@cardin', '055-8683345', '17 MacLachlan Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (385087447, 'Vincent', 'Foster', to_date('07-11-1978', 'dd-mm-yyyy'), 'vincent@cima.com', '052-1322728', '36 Anchorage Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (311531816, 'Julie', 'Marshall', to_date('10-08-1976', 'dd-mm-yyyy'), 'julie.m@mindworks.co', '058-3056621', '42 Ramis Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (437500701, 'Penelope', 'McPherson', to_date('05-03-2070', 'dd-mm-yyyy'), 'penelopem@stonetechp', '058-2765873', '7 Matthew Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (643404021, 'Neve', 'Isaacs', to_date('21-04-1979', 'dd-mm-yyyy'), 'n.isaacs@tilsonhr.il', '050-8448850', '14 Pomona Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (385603344, 'Nelly', 'Slater', to_date('19-12-1987', 'dd-mm-yyyy'), 'nelly@biosite.com', '058-5977740', '82 Greg Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (627065172, 'Marisa', 'Broza', to_date('01-10-1978', 'dd-mm-yyyy'), 'marisa.broza@ssi.jp', '058-4379450', '97 Heatherly Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (198656426, 'Taye', 'Himmelman', to_date('17-10-1998', 'dd-mm-yyyy'), 'taye.himmelman@sfgo.', '054-1741518', '22 Leeds Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (664569568, 'Greg', 'Damon', to_date('23-12-1979', 'dd-mm-yyyy'), 'greg.damon@jsa.uk', '054-8878209', '26 Ward Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (887728212, 'Andy', 'Quinlan', to_date('01-04-1988', 'dd-mm-yyyy'), 'andy@accucode.com', '050-0158084', '98 Narrows Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (748238243, 'Marley', 'Roundtree', to_date('02-02-1991', 'dd-mm-yyyy'), 'marley.roundtree@com', '050-5874479', '78 Tennison Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (296732629, 'Ving', 'Pearce', to_date('25-06-2060', 'dd-mm-yyyy'), 'ving.pearce@pis.uk', '054-3024264', '913 Singh Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (685470818, 'Tim', 'Chaplin', to_date('24-09-1971', 'dd-mm-yyyy'), 'tim@dell.it', '050-6319134', '54 Alan Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (944788607, 'Etta', 'Dzundza', to_date('04-02-1980', 'dd-mm-yyyy'), 'etta.d@cardtronics.c', '050-7482055', '86 Melrose Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (25969008, 'Daryle', 'Caviezel', to_date('01-11-1980', 'dd-mm-yyyy'), 'd.caviezel@mse.com', '054-8023273', '26 Blair Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (608049079, 'Gena', 'Mraz', to_date('05-01-1982', 'dd-mm-yyyy'), 'gena.mraz@larkinente', '058-5412402', '40 Ermey Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (788754335, 'Night', 'Raybon', to_date('31-12-1997', 'dd-mm-yyyy'), 'night.raybon@coadvan', '055-1814648', '61 Dabney Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (487025649, 'Kris', 'Joli', to_date('02-06-2001', 'dd-mm-yyyy'), 'kjoli@typhoon.de', '055-9987723', '29 Robbie Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (601470947, 'Adina', 'Fisher', to_date('02-03-2063', 'dd-mm-yyyy'), 'afisher@swp.no', '054-8268534', '12nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (688091880, 'Emerson', 'Carnes', to_date('15-09-1986', 'dd-mm-yyyy'), 'emerson@networkdispl', '052-3919841', '50 Vaughan Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (529091276, 'Chubby', 'Laws', to_date('06-07-1972', 'dd-mm-yyyy'), 'c.laws@career.de', '055-7246795', '320 Bruneck Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (378151267, 'Miguel', 'Tanon', to_date('21-08-1985', 'dd-mm-yyyy'), 'miguel.tanon@outsour', '052-7333780', '743 Hilton Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (288156577, 'Oro', 'Winstone', to_date('13-06-1981', 'dd-mm-yyyy'), 'orow@mms.fr', '058-8592375', '43 Rio Rancho Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (853751297, 'Morgan', 'Playboys', to_date('12-07-1986', 'dd-mm-yyyy'), 'morgan@faef.it', '054-2862156', '35 Chely Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (785501945, 'Jonatha', 'Pepper', to_date('08-09-1994', 'dd-mm-yyyy'), 'jonatha.pepper@ksj.s', '054-8502044', '22 Cleary Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (80087312, 'Gloria', 'Pride', to_date('02-09-1980', 'dd-mm-yyyy'), 'gloria.pride@toyotam', '050-6898973', '66 Wainwright Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (130171758, 'Suzy', 'McFerrin', to_date('07-02-2064', 'dd-mm-yyyy'), 'suzy.mcferrin@asa.au', '058-0256497', '30 Smith');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (124935877, 'Lizzy', 'Rush', to_date('14-05-1987', 'dd-mm-yyyy'), 'lizzy.rush@wrgservic', '052-6049785', '80 Mitra Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (587654586, 'Tramaine', 'Patrick', to_date('19-04-1985', 'dd-mm-yyyy'), 'tramaine.patrick@com', '050-5072070', '14 Redmond Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (74642085, 'Veruca', 'Raitt', to_date('24-12-1977', 'dd-mm-yyyy'), 'veruca.r@kroger.com', '054-3981976', '650 Mos Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (440918737, 'Benjamin', 'Addy', to_date('19-04-2064', 'dd-mm-yyyy'), 'benjamin.addy@bmm.co', '052-3396562', '24 Dafoe Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (251237932, 'Ivan', 'Laurie', to_date('22-01-2064', 'dd-mm-yyyy'), 'ivan.laurie@pragmate', '055-0919413', '30 Irving Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (158357167, 'Charlton', 'Perry', to_date('27-09-2062', 'dd-mm-yyyy'), 'charlton@larkinenter', '050-6875288', '80 Olympia Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (488928092, 'Robert', 'Evett', to_date('16-08-1983', 'dd-mm-yyyy'), 'robert.e@ait.be', '054-3285677', '86 Tripplehorn');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (661062124, 'Dabney', 'Craig', to_date('11-10-1974', 'dd-mm-yyyy'), 'dabney.craig@youngin', '052-9949401', '33rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (73530654, 'Jesus', 'McCann', to_date('09-03-1998', 'dd-mm-yyyy'), 'jesus.mccann@credito', '058-0467019', '42nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (891918487, 'Katrin', 'Silverman', to_date('01-05-1974', 'dd-mm-yyyy'), 'katrin.silverman@mre', '050-6709308', '70 Carlton Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (442649973, 'CeCe', 'Applegate', to_date('22-05-1991', 'dd-mm-yyyy'), 'cece.applegate@anheu', '050-6272705', '79 Easton Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (65704806, 'Jimmie', 'Elwes', to_date('20-10-2070', 'dd-mm-yyyy'), 'jimmie.elwes@aldensy', '058-5155539', '93 Turturro Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (599340836, 'Trick', 'Harper', to_date('28-03-2062', 'dd-mm-yyyy'), 'trick.harper@bedford', '058-6090381', '74 Abraham Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (936536739, 'Barry', 'Wood', to_date('22-08-1982', 'dd-mm-yyyy'), 'bwood@entelligence.i', '052-4167879', '93 Cathy Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (605611950, 'Mae', 'Osborne', to_date('20-02-1995', 'dd-mm-yyyy'), 'mae@philipmorris.com', '054-3227136', '70 Nicholas Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (14335370, 'Garth', 'Yankovic', to_date('03-11-1988', 'dd-mm-yyyy'), 'garth.yankovic@valle', '055-1235960', '19 Kiefer Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (512134027, 'Freddy', 'Deejay', to_date('30-03-2000', 'dd-mm-yyyy'), 'freddy.deejay@powerl', '054-9237339', '73rd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (432886067, 'Jim', 'Emmerich', to_date('28-03-2063', 'dd-mm-yyyy'), 'jim.e@gdatechnologie', '050-6716731', '98 Chaka Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (405228286, 'Curt', 'Bachman', to_date('16-06-1971', 'dd-mm-yyyy'), 'curt.bachman@curagro', '055-5854986', '84 Burstyn Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (628383532, 'Rip', 'Judd', to_date('25-06-1984', 'dd-mm-yyyy'), 'rip@otbd.br', '054-0141165', '13 Suzy Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (91528468, 'Jack', 'Lavigne', to_date('05-05-2070', 'dd-mm-yyyy'), 'j.lavigne@sunstream.', '055-0954000', '100 Dorn Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (462031518, 'Matt', 'Kier', to_date('03-08-2062', 'dd-mm-yyyy'), 'matt.kier@prahs.uk', '052-2286519', '3 DeGraw Blvd');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (750433491, 'Red', 'Archer', to_date('21-10-1994', 'dd-mm-yyyy'), 'red.a@ksj.com', '050-8200904', '80 Budapest Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (377946227, 'Marty', 'Short', to_date('29-12-1974', 'dd-mm-yyyy'), 'marty.short@outsourc', '055-4545223', '65 McFadden Road');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (46523928, 'Jann', 'Bergen', to_date('28-05-1986', 'dd-mm-yyyy'), 'jann.b@innovativelig', '050-1515038', '23 League city Ave');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (561378821, 'George', 'Turner', to_date('15-04-1972', 'dd-mm-yyyy'), 'george@walmartstores', '054-0269589', '87 Mount Olive Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (800854130, 'Quentin', 'Presley', to_date('31-10-1993', 'dd-mm-yyyy'), 'quentin@glaxosmithkl', '052-0769442', '41 Tempest');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (55609489, 'Adam', 'Mollard', to_date('12-05-2000', 'dd-mm-yyyy'), 'adam.m@fetchlogistic', '054-4945838', '72nd Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (52729621, 'Jason', 'Stamp', to_date('08-10-2000', 'dd-mm-yyyy'), 'jason.stamp@fflcbanc', '050-4319414', '99 Sweet Street');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (751957500, 'Juliet', 'Gellar', to_date('21-07-1989', 'dd-mm-yyyy'), 'juliet.gellar@wav.pe', '054-1634635', '54 Raye Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (636850331, 'Nicky', 'Spiner', to_date('19-10-1982', 'dd-mm-yyyy'), 'nspiner@bestever.at', '052-0745712', '16 Thewlis Drive');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (101509289, 'Natasha', 'Kotto', to_date('15-03-2064', 'dd-mm-yyyy'), 'natasha@privatebanco', '050-6807755', '8 Quatro Road');
commit;
prompt 1000 records committed...
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (1, 'Adi', 'Cohen', to_date('05-01-2076', 'dd-mm-yyyy'), 'Adi@gmail.com', '546077668', 'Hgalil 15 Tel-Aviv');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (2, 'Chani', 'Cohen', to_date('22-12-2069', 'dd-mm-yyyy'), 'Chani@gmail.com', '506676554', 'Hazait 15 Tel-Aviv');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (3, 'Yossi', 'Levi', to_date('05-07-2080', 'dd-mm-yyyy'), 'Yossi@gmail.com', '545433223', 'Hgalil 23 Ramat-Gan');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (4, 'Dan', 'Shevach', to_date('05-09-2080', 'dd-mm-yyyy'), 'Dan@gmail.com', '544426557', 'Shelach 7 Netania');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (5, 'Moshe', 'Levi', to_date('02-06-2080', 'dd-mm-yyyy'), 'Moshe@gmail.com', '523465667', 'Hagalil 4 Hertzelia');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (6, 'Adi', 'Yaacovi', to_date('12-01-2067', 'dd-mm-yyyy'), 'Adi1@gmail.com', '556657557', 'Nili 1 Hifa');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (7, 'Rinat', 'Revach', to_date('18-03-2082', 'dd-mm-yyyy'), 'Rinat@gmail.com', '543244334', 'Hagalil 12 Hifa');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (8, 'Noam', 'Malol', to_date('02-01-2078', 'dd-mm-yyyy'), 'Noam@gmail.com', '546433223', 'Hertzel 13 Hifa');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (9, 'Shir', 'Cohen', to_date('24-09-2073', 'dd-mm-yyyy'), 'Shir@gmail.com', '546077666', 'Hyam 17 tel-aviv');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (10, 'Gili', 'Neman', to_date('05-04-2069', 'dd-mm-yyyy'), 'Gili@gmail.com', '546055446', 'hgalil 43 Tveria');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (11, 'Adi', 'Cohen', to_date('05-01-2098', 'dd-mm-yyyy'), 'Adi1@gmail.com', '546077668', 'Hgalil 16 Tel-Aviv');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (12, 'Chani', 'Cohen', to_date('22-12-2099', 'dd-mm-yyyy'), 'Chani1@gmail.com', '506676554', 'Hazait 17 Tel-Aviv');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (13, 'Yossi', 'Levi', to_date('05-07-2098', 'dd-mm-yyyy'), 'Yossi1@gmail.com', '545433223', 'Hgalil 26 Ramat-Gan');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (14, 'Dan', 'Shevach', to_date('05-09-2099', 'dd-mm-yyyy'), 'Dan1@gmail.com', '544426557', 'Shelach 9 Netania');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (15, 'Moshe', 'Levi', to_date('02-06-2097', 'dd-mm-yyyy'), 'Moshe1@gmail.com', '523465667', 'Hagalil 6 Hertzelia');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (16, 'Adi', 'Yaacovi', to_date('12-01-2099', 'dd-mm-yyyy'), 'Adi11@gmail.com', '556657557', 'Nili 9 Hifa');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (17, 'Rinat', 'Revach', to_date('18-03-2098', 'dd-mm-yyyy'), 'Rinat1@gmail.com', '543244334', 'Hagalil 11 Hifa');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (18, 'Noam', 'Malol', to_date('02-01-2099', 'dd-mm-yyyy'), 'Noam1@gmail.com', '546433223', 'Hertzel 15 Hifa');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (19, 'Shir', 'Cohen', to_date('24-09-2098', 'dd-mm-yyyy'), 'Shir1@gmail.com', '546077666', 'Hyam 17 tel-aviv');
insert into PERSON (personid, firstname, lastname, birthdate, email, phonenumber, address)
values (20, 'Gili', 'Neman', to_date('05-04-2097', 'dd-mm-yyyy'), 'Gili1@gmail.com', '546055446', 'hgalil 44 Tveria');
commit;
prompt 1020 records loaded
prompt Loading LECTURER...
insert into LECTURER (seniority, salary, personid)
values (25, 11461, 797836909);
insert into LECTURER (seniority, salary, personid)
values (17, 24849, 44766865);
insert into LECTURER (seniority, salary, personid)
values (4, 12528, 685470818);
insert into LECTURER (seniority, salary, personid)
values (6, 20190, 823103884);
insert into LECTURER (seniority, salary, personid)
values (1, 16465, 512134027);
insert into LECTURER (seniority, salary, personid)
values (10, 19744, 440941273);
insert into LECTURER (seniority, salary, personid)
values (7, 24803, 620357514);
insert into LECTURER (seniority, salary, personid)
values (15, 10325, 713992086);
insert into LECTURER (seniority, salary, personid)
values (19, 18814, 123092853);
insert into LECTURER (seniority, salary, personid)
values (39, 20893, 461446498);
insert into LECTURER (seniority, salary, personid)
values (2, 19130, 449497415);
insert into LECTURER (seniority, salary, personid)
values (40, 10455, 453899324);
insert into LECTURER (seniority, salary, personid)
values (35, 13026, 56375123);
insert into LECTURER (seniority, salary, personid)
values (11, 21683, 739085019);
insert into LECTURER (seniority, salary, personid)
values (22, 21370, 963810848);
insert into LECTURER (seniority, salary, personid)
values (33, 19196, 32186042);
insert into LECTURER (seniority, salary, personid)
values (29, 24345, 387541507);
insert into LECTURER (seniority, salary, personid)
values (19, 11607, 750969168);
insert into LECTURER (seniority, salary, personid)
values (38, 14388, 515505366);
insert into LECTURER (seniority, salary, personid)
values (16, 10402, 920052863);
insert into LECTURER (seniority, salary, personid)
values (12, 21959, 166294914);
insert into LECTURER (seniority, salary, personid)
values (27, 19019, 836933803);
insert into LECTURER (seniority, salary, personid)
values (28, 13329, 691138819);
insert into LECTURER (seniority, salary, personid)
values (22, 11680, 799133061);
insert into LECTURER (seniority, salary, personid)
values (38, 15463, 976639143);
insert into LECTURER (seniority, salary, personid)
values (22, 10758, 385354173);
insert into LECTURER (seniority, salary, personid)
values (38, 24661, 965019165);
insert into LECTURER (seniority, salary, personid)
values (9, 23478, 285889200);
insert into LECTURER (seniority, salary, personid)
values (39, 23957, 751076881);
insert into LECTURER (seniority, salary, personid)
values (5, 10772, 819052449);
insert into LECTURER (seniority, salary, personid)
values (29, 17647, 765899734);
insert into LECTURER (seniority, salary, personid)
values (3, 22736, 524980034);
insert into LECTURER (seniority, salary, personid)
values (12, 10819, 883389167);
insert into LECTURER (seniority, salary, personid)
values (40, 23553, 717053350);
insert into LECTURER (seniority, salary, personid)
values (3, 10687, 616885552);
insert into LECTURER (seniority, salary, personid)
values (20, 13848, 947808748);
insert into LECTURER (seniority, salary, personid)
values (5, 15959, 607695244);
insert into LECTURER (seniority, salary, personid)
values (3, 12036, 382166120);
insert into LECTURER (seniority, salary, personid)
values (28, 18678, 440918737);
insert into LECTURER (seniority, salary, personid)
values (3, 18401, 644113101);
insert into LECTURER (seniority, salary, personid)
values (10, 16087, 903405045);
insert into LECTURER (seniority, salary, personid)
values (25, 18309, 436042421);
insert into LECTURER (seniority, salary, personid)
values (39, 16331, 524951589);
insert into LECTURER (seniority, salary, personid)
values (19, 18927, 205638079);
insert into LECTURER (seniority, salary, personid)
values (8, 22313, 247202049);
insert into LECTURER (seniority, salary, personid)
values (22, 10672, 360541590);
insert into LECTURER (seniority, salary, personid)
values (39, 13095, 416556986);
insert into LECTURER (seniority, salary, personid)
values (5, 22818, 807344480);
insert into LECTURER (seniority, salary, personid)
values (21, 18258, 467583345);
insert into LECTURER (seniority, salary, personid)
values (32, 24373, 739358534);
insert into LECTURER (seniority, salary, personid)
values (16, 10050, 385603344);
insert into LECTURER (seniority, salary, personid)
values (25, 13912, 929112309);
insert into LECTURER (seniority, salary, personid)
values (3, 19564, 741401481);
insert into LECTURER (seniority, salary, personid)
values (4, 17390, 148510955);
insert into LECTURER (seniority, salary, personid)
values (40, 15381, 761863597);
insert into LECTURER (seniority, salary, personid)
values (13, 16546, 93113901);
insert into LECTURER (seniority, salary, personid)
values (25, 14581, 827727216);
insert into LECTURER (seniority, salary, personid)
values (25, 18539, 633132847);
insert into LECTURER (seniority, salary, personid)
values (36, 23125, 446290911);
insert into LECTURER (seniority, salary, personid)
values (8, 10072, 777479275);
insert into LECTURER (seniority, salary, personid)
values (3, 17354, 879632809);
insert into LECTURER (seniority, salary, personid)
values (35, 24249, 321388053);
insert into LECTURER (seniority, salary, personid)
values (25, 15553, 115028698);
insert into LECTURER (seniority, salary, personid)
values (30, 21248, 326672648);
insert into LECTURER (seniority, salary, personid)
values (9, 22731, 760319692);
insert into LECTURER (seniority, salary, personid)
values (27, 12318, 632389430);
insert into LECTURER (seniority, salary, personid)
values (12, 20023, 330353286);
insert into LECTURER (seniority, salary, personid)
values (19, 23118, 549249344);
insert into LECTURER (seniority, salary, personid)
values (9, 14552, 541606677);
insert into LECTURER (seniority, salary, personid)
values (6, 24872, 184014344);
insert into LECTURER (seniority, salary, personid)
values (23, 16299, 399231677);
insert into LECTURER (seniority, salary, personid)
values (38, 20760, 269329659);
insert into LECTURER (seniority, salary, personid)
values (3, 10504, 578275155);
insert into LECTURER (seniority, salary, personid)
values (3, 10875, 821873346);
insert into LECTURER (seniority, salary, personid)
values (30, 20496, 717566283);
insert into LECTURER (seniority, salary, personid)
values (4, 15370, 711195723);
insert into LECTURER (seniority, salary, personid)
values (22, 20815, 466514829);
insert into LECTURER (seniority, salary, personid)
values (6, 24728, 488765611);
insert into LECTURER (seniority, salary, personid)
values (14, 23377, 365747882);
insert into LECTURER (seniority, salary, personid)
values (9, 14538, 136164997);
insert into LECTURER (seniority, salary, personid)
values (37, 22816, 232043794);
insert into LECTURER (seniority, salary, personid)
values (38, 11348, 795121722);
insert into LECTURER (seniority, salary, personid)
values (9, 11252, 594235102);
insert into LECTURER (seniority, salary, personid)
values (19, 22727, 613003091);
insert into LECTURER (seniority, salary, personid)
values (11, 24662, 466228227);
insert into LECTURER (seniority, salary, personid)
values (11, 16091, 627799076);
insert into LECTURER (seniority, salary, personid)
values (23, 20808, 95656862);
insert into LECTURER (seniority, salary, personid)
values (7, 14013, 678905172);
insert into LECTURER (seniority, salary, personid)
values (18, 18380, 398581585);
insert into LECTURER (seniority, salary, personid)
values (18, 21770, 129704999);
insert into LECTURER (seniority, salary, personid)
values (11, 24810, 258675598);
insert into LECTURER (seniority, salary, personid)
values (33, 12650, 610951728);
insert into LECTURER (seniority, salary, personid)
values (3, 17283, 928352880);
insert into LECTURER (seniority, salary, personid)
values (15, 18195, 385262673);
insert into LECTURER (seniority, salary, personid)
values (26, 21194, 441477106);
insert into LECTURER (seniority, salary, personid)
values (32, 23803, 632546513);
insert into LECTURER (seniority, salary, personid)
values (18, 23066, 848397906);
insert into LECTURER (seniority, salary, personid)
values (7, 11966, 399563403);
insert into LECTURER (seniority, salary, personid)
values (14, 10288, 39324673);
insert into LECTURER (seniority, salary, personid)
values (4, 17169, 980664568);
commit;
prompt 100 records committed...
insert into LECTURER (seniority, salary, personid)
values (31, 11462, 729309899);
insert into LECTURER (seniority, salary, personid)
values (8, 15164, 192503977);
insert into LECTURER (seniority, salary, personid)
values (23, 11957, 65704806);
insert into LECTURER (seniority, salary, personid)
values (32, 22466, 17862847);
insert into LECTURER (seniority, salary, personid)
values (28, 16024, 602539596);
insert into LECTURER (seniority, salary, personid)
values (17, 23081, 344997269);
insert into LECTURER (seniority, salary, personid)
values (10, 19445, 95804382);
insert into LECTURER (seniority, salary, personid)
values (3, 21256, 469836768);
insert into LECTURER (seniority, salary, personid)
values (39, 15954, 688205923);
insert into LECTURER (seniority, salary, personid)
values (31, 23659, 538219352);
insert into LECTURER (seniority, salary, personid)
values (9, 15070, 1982472);
insert into LECTURER (seniority, salary, personid)
values (23, 17998, 321726505);
insert into LECTURER (seniority, salary, personid)
values (19, 14620, 964685021);
insert into LECTURER (seniority, salary, personid)
values (11, 19584, 887728212);
insert into LECTURER (seniority, salary, personid)
values (40, 14719, 643273666);
insert into LECTURER (seniority, salary, personid)
values (40, 14283, 295939328);
insert into LECTURER (seniority, salary, personid)
values (38, 14989, 54381664);
insert into LECTURER (seniority, salary, personid)
values (23, 19083, 243883061);
insert into LECTURER (seniority, salary, personid)
values (6, 13573, 991523670);
insert into LECTURER (seniority, salary, personid)
values (32, 10569, 773986024);
insert into LECTURER (seniority, salary, personid)
values (2, 23768, 732696916);
insert into LECTURER (seniority, salary, personid)
values (16, 11594, 863863106);
insert into LECTURER (seniority, salary, personid)
values (40, 14338, 90157560);
insert into LECTURER (seniority, salary, personid)
values (15, 22040, 55609489);
insert into LECTURER (seniority, salary, personid)
values (5, 13836, 832765018);
insert into LECTURER (seniority, salary, personid)
values (35, 16066, 899665600);
insert into LECTURER (seniority, salary, personid)
values (24, 14893, 292350926);
insert into LECTURER (seniority, salary, personid)
values (32, 24291, 961175624);
insert into LECTURER (seniority, salary, personid)
values (2, 23820, 992821212);
insert into LECTURER (seniority, salary, personid)
values (8, 13124, 414138437);
insert into LECTURER (seniority, salary, personid)
values (33, 11077, 679731691);
insert into LECTURER (seniority, salary, personid)
values (33, 10722, 72369375);
insert into LECTURER (seniority, salary, personid)
values (36, 16580, 477594896);
insert into LECTURER (seniority, salary, personid)
values (8, 14783, 546518298);
insert into LECTURER (seniority, salary, personid)
values (28, 11305, 471640670);
insert into LECTURER (seniority, salary, personid)
values (10, 24154, 330178033);
insert into LECTURER (seniority, salary, personid)
values (26, 13136, 944788607);
insert into LECTURER (seniority, salary, personid)
values (20, 16770, 946945507);
insert into LECTURER (seniority, salary, personid)
values (35, 15109, 220114163);
insert into LECTURER (seniority, salary, personid)
values (6, 14066, 872282547);
insert into LECTURER (seniority, salary, personid)
values (5, 15035, 8687147);
insert into LECTURER (seniority, salary, personid)
values (22, 24656, 304724063);
insert into LECTURER (seniority, salary, personid)
values (16, 21088, 416555110);
insert into LECTURER (seniority, salary, personid)
values (11, 22014, 718081417);
insert into LECTURER (seniority, salary, personid)
values (18, 18886, 107742156);
insert into LECTURER (seniority, salary, personid)
values (1, 24045, 91738594);
insert into LECTURER (seniority, salary, personid)
values (22, 15325, 6768992);
insert into LECTURER (seniority, salary, personid)
values (32, 12934, 938733161);
insert into LECTURER (seniority, salary, personid)
values (6, 13939, 567102732);
insert into LECTURER (seniority, salary, personid)
values (29, 22038, 447416891);
insert into LECTURER (seniority, salary, personid)
values (27, 24719, 960835490);
insert into LECTURER (seniority, salary, personid)
values (37, 15509, 624574126);
insert into LECTURER (seniority, salary, personid)
values (16, 11904, 386198992);
insert into LECTURER (seniority, salary, personid)
values (21, 10916, 82987119);
insert into LECTURER (seniority, salary, personid)
values (13, 22647, 385087447);
insert into LECTURER (seniority, salary, personid)
values (21, 19873, 301699460);
insert into LECTURER (seniority, salary, personid)
values (38, 15759, 760238951);
insert into LECTURER (seniority, salary, personid)
values (16, 13781, 80806245);
insert into LECTURER (seniority, salary, personid)
values (3, 15955, 433335843);
insert into LECTURER (seniority, salary, personid)
values (19, 23612, 315762216);
insert into LECTURER (seniority, salary, personid)
values (35, 17491, 106140833);
insert into LECTURER (seniority, salary, personid)
values (22, 16829, 627065172);
insert into LECTURER (seniority, salary, personid)
values (10, 13776, 743832416);
insert into LECTURER (seniority, salary, personid)
values (35, 10975, 838747878);
insert into LECTURER (seniority, salary, personid)
values (9, 20544, 721720661);
insert into LECTURER (seniority, salary, personid)
values (9, 13341, 802594334);
insert into LECTURER (seniority, salary, personid)
values (1, 11541, 636850331);
insert into LECTURER (seniority, salary, personid)
values (22, 24365, 784677078);
insert into LECTURER (seniority, salary, personid)
values (18, 11147, 113032438);
insert into LECTURER (seniority, salary, personid)
values (36, 11133, 283079742);
insert into LECTURER (seniority, salary, personid)
values (34, 14741, 376615780);
insert into LECTURER (seniority, salary, personid)
values (22, 15310, 291013634);
insert into LECTURER (seniority, salary, personid)
values (12, 19624, 802148688);
insert into LECTURER (seniority, salary, personid)
values (30, 10595, 766299119);
insert into LECTURER (seniority, salary, personid)
values (26, 13368, 1418985);
insert into LECTURER (seniority, salary, personid)
values (12, 11505, 118062783);
insert into LECTURER (seniority, salary, personid)
values (7, 17557, 750799475);
insert into LECTURER (seniority, salary, personid)
values (40, 12770, 202719706);
insert into LECTURER (seniority, salary, personid)
values (8, 23546, 823895037);
insert into LECTURER (seniority, salary, personid)
values (20, 19958, 870999361);
insert into LECTURER (seniority, salary, personid)
values (27, 13317, 14710899);
insert into LECTURER (seniority, salary, personid)
values (6, 19838, 711368713);
insert into LECTURER (seniority, salary, personid)
values (37, 12660, 798586087);
insert into LECTURER (seniority, salary, personid)
values (39, 11018, 671033701);
insert into LECTURER (seniority, salary, personid)
values (31, 22269, 701339475);
insert into LECTURER (seniority, salary, personid)
values (3, 12035, 457536747);
insert into LECTURER (seniority, salary, personid)
values (8, 14367, 527952564);
insert into LECTURER (seniority, salary, personid)
values (28, 10173, 150668055);
insert into LECTURER (seniority, salary, personid)
values (13, 20556, 337483564);
insert into LECTURER (seniority, salary, personid)
values (32, 11923, 828434655);
insert into LECTURER (seniority, salary, personid)
values (1, 15924, 972613162);
insert into LECTURER (seniority, salary, personid)
values (37, 22715, 186632311);
insert into LECTURER (seniority, salary, personid)
values (7, 14583, 14573086);
insert into LECTURER (seniority, salary, personid)
values (38, 21278, 323894716);
insert into LECTURER (seniority, salary, personid)
values (19, 15970, 937753279);
insert into LECTURER (seniority, salary, personid)
values (22, 12579, 758519887);
insert into LECTURER (seniority, salary, personid)
values (30, 12648, 80087312);
insert into LECTURER (seniority, salary, personid)
values (37, 19423, 245074638);
insert into LECTURER (seniority, salary, personid)
values (15, 21368, 466876355);
insert into LECTURER (seniority, salary, personid)
values (6, 20901, 856746403);
commit;
prompt 200 records committed...
insert into LECTURER (seniority, salary, personid)
values (3, 15426, 648381914);
insert into LECTURER (seniority, salary, personid)
values (29, 22403, 848499731);
insert into LECTURER (seniority, salary, personid)
values (10, 24996, 871752058);
insert into LECTURER (seniority, salary, personid)
values (37, 12814, 447981658);
insert into LECTURER (seniority, salary, personid)
values (16, 19265, 732374485);
insert into LECTURER (seniority, salary, personid)
values (23, 17610, 333685399);
insert into LECTURER (seniority, salary, personid)
values (23, 14820, 281132015);
insert into LECTURER (seniority, salary, personid)
values (13, 11915, 913585815);
insert into LECTURER (seniority, salary, personid)
values (33, 20464, 387629168);
insert into LECTURER (seniority, salary, personid)
values (9, 10569, 516760318);
insert into LECTURER (seniority, salary, personid)
values (28, 24207, 360541635);
insert into LECTURER (seniority, salary, personid)
values (27, 24754, 207783091);
insert into LECTURER (seniority, salary, personid)
values (10, 24496, 747284996);
insert into LECTURER (seniority, salary, personid)
values (9, 11980, 488928092);
insert into LECTURER (seniority, salary, personid)
values (7, 16469, 936536739);
insert into LECTURER (seniority, salary, personid)
values (16, 24807, 323472847);
insert into LECTURER (seniority, salary, personid)
values (30, 11458, 329528702);
insert into LECTURER (seniority, salary, personid)
values (22, 20644, 626474566);
insert into LECTURER (seniority, salary, personid)
values (7, 11254, 759861554);
insert into LECTURER (seniority, salary, personid)
values (14, 22066, 655899083);
insert into LECTURER (seniority, salary, personid)
values (2, 15119, 626016075);
insert into LECTURER (seniority, salary, personid)
values (15, 19062, 304189365);
insert into LECTURER (seniority, salary, personid)
values (19, 21302, 136849513);
insert into LECTURER (seniority, salary, personid)
values (3, 15072, 579225577);
insert into LECTURER (seniority, salary, personid)
values (25, 13757, 942787577);
insert into LECTURER (seniority, salary, personid)
values (11, 14805, 484642804);
insert into LECTURER (seniority, salary, personid)
values (36, 22446, 161131792);
insert into LECTURER (seniority, salary, personid)
values (22, 18760, 892064530);
insert into LECTURER (seniority, salary, personid)
values (20, 22305, 665730745);
insert into LECTURER (seniority, salary, personid)
values (40, 12505, 518996574);
insert into LECTURER (seniority, salary, personid)
values (38, 12772, 42835570);
insert into LECTURER (seniority, salary, personid)
values (9, 14751, 703497016);
insert into LECTURER (seniority, salary, personid)
values (3, 11825, 693982166);
insert into LECTURER (seniority, salary, personid)
values (1, 17834, 94028487);
insert into LECTURER (seniority, salary, personid)
values (37, 20915, 698761583);
insert into LECTURER (seniority, salary, personid)
values (11, 13927, 404357409);
insert into LECTURER (seniority, salary, personid)
values (19, 14185, 362301331);
insert into LECTURER (seniority, salary, personid)
values (5, 19890, 853751297);
insert into LECTURER (seniority, salary, personid)
values (25, 17324, 103592706);
insert into LECTURER (seniority, salary, personid)
values (2, 10171, 329328663);
insert into LECTURER (seniority, salary, personid)
values (12, 14883, 936673659);
insert into LECTURER (seniority, salary, personid)
values (20, 12342, 4463905);
insert into LECTURER (seniority, salary, personid)
values (19, 10248, 40606863);
insert into LECTURER (seniority, salary, personid)
values (3, 21145, 784854008);
insert into LECTURER (seniority, salary, personid)
values (18, 15236, 806251174);
insert into LECTURER (seniority, salary, personid)
values (30, 22455, 114054958);
insert into LECTURER (seniority, salary, personid)
values (16, 19246, 334607657);
insert into LECTURER (seniority, salary, personid)
values (12, 18802, 421858774);
insert into LECTURER (seniority, salary, personid)
values (22, 15513, 373933602);
insert into LECTURER (seniority, salary, personid)
values (33, 23599, 203659659);
insert into LECTURER (seniority, salary, personid)
values (36, 13556, 785522154);
insert into LECTURER (seniority, salary, personid)
values (1, 23923, 647480529);
insert into LECTURER (seniority, salary, personid)
values (4, 14001, 275116358);
insert into LECTURER (seniority, salary, personid)
values (17, 11355, 317550319);
insert into LECTURER (seniority, salary, personid)
values (36, 18292, 864758241);
insert into LECTURER (seniority, salary, personid)
values (4, 16355, 67569364);
insert into LECTURER (seniority, salary, personid)
values (10, 17558, 1);
insert into LECTURER (seniority, salary, personid)
values (7, 14558, 2);
insert into LECTURER (seniority, salary, personid)
values (6, 13779, 3);
insert into LECTURER (seniority, salary, personid)
values (6, 13558, 4);
insert into LECTURER (seniority, salary, personid)
values (10, 17558, 5);
insert into LECTURER (seniority, salary, personid)
values (12, 18980, 6);
insert into LECTURER (seniority, salary, personid)
values (8, 16558, 7);
insert into LECTURER (seniority, salary, personid)
values (2, 10558, 8);
insert into LECTURER (seniority, salary, personid)
values (4, 12443, 9);
insert into LECTURER (seniority, salary, personid)
values (23, 20558, 10);
commit;
prompt 266 records loaded
prompt Loading LECTURERTEACHCOURSE...
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 1, 1);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 1, 2);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 1, 3);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 2, 4);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 2, 5);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 2, 6);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 3, 1);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 3, 4);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 4, 10);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 3, 5);
insert into LECTURERTEACHCOURSE (semester, currentyear, courseid, personid)
values ('A', 2020, 4, 2);
commit;
prompt 11 records loaded
prompt Loading STUDENT...
insert into STUDENT (gpa, studingyear, personid)
values (78, 4, 737963727);
insert into STUDENT (gpa, studingyear, personid)
values (76, 4, 213233951);
insert into STUDENT (gpa, studingyear, personid)
values (90, 1, 138594233);
insert into STUDENT (gpa, studingyear, personid)
values (73, 2, 207783091);
insert into STUDENT (gpa, studingyear, personid)
values (65, 1, 118568790);
insert into STUDENT (gpa, studingyear, personid)
values (78, 4, 979434066);
insert into STUDENT (gpa, studingyear, personid)
values (93, 1, 77424916);
insert into STUDENT (gpa, studingyear, personid)
values (89, 2, 245535783);
insert into STUDENT (gpa, studingyear, personid)
values (71, 2, 993262551);
insert into STUDENT (gpa, studingyear, personid)
values (94, 3, 455134208);
insert into STUDENT (gpa, studingyear, personid)
values (60, 1, 825472490);
insert into STUDENT (gpa, studingyear, personid)
values (80, 4, 399231677);
insert into STUDENT (gpa, studingyear, personid)
values (62, 4, 732696916);
insert into STUDENT (gpa, studingyear, personid)
values (70, 4, 609394985);
insert into STUDENT (gpa, studingyear, personid)
values (89, 1, 167630836);
insert into STUDENT (gpa, studingyear, personid)
values (62, 4, 738222863);
insert into STUDENT (gpa, studingyear, personid)
values (85, 1, 294934486);
insert into STUDENT (gpa, studingyear, personid)
values (83, 1, 189706487);
insert into STUDENT (gpa, studingyear, personid)
values (75, 2, 784208433);
insert into STUDENT (gpa, studingyear, personid)
values (68, 3, 718416532);
insert into STUDENT (gpa, studingyear, personid)
values (60, 1, 883389167);
insert into STUDENT (gpa, studingyear, personid)
values (92, 1, 786604761);
insert into STUDENT (gpa, studingyear, personid)
values (86, 3, 931053125);
insert into STUDENT (gpa, studingyear, personid)
values (67, 3, 4463905);
insert into STUDENT (gpa, studingyear, personid)
values (60, 1, 516915528);
insert into STUDENT (gpa, studingyear, personid)
values (98, 1, 556145370);
insert into STUDENT (gpa, studingyear, personid)
values (94, 1, 268569712);
insert into STUDENT (gpa, studingyear, personid)
values (98, 1, 62415092);
insert into STUDENT (gpa, studingyear, personid)
values (76, 3, 436042421);
insert into STUDENT (gpa, studingyear, personid)
values (75, 4, 557447136);
insert into STUDENT (gpa, studingyear, personid)
values (64, 2, 186613824);
insert into STUDENT (gpa, studingyear, personid)
values (80, 3, 747284996);
insert into STUDENT (gpa, studingyear, personid)
values (65, 2, 457536747);
insert into STUDENT (gpa, studingyear, personid)
values (83, 2, 946513848);
insert into STUDENT (gpa, studingyear, personid)
values (93, 4, 307865837);
insert into STUDENT (gpa, studingyear, personid)
values (64, 4, 60357300);
insert into STUDENT (gpa, studingyear, personid)
values (70, 2, 524980034);
insert into STUDENT (gpa, studingyear, personid)
values (87, 2, 862019747);
insert into STUDENT (gpa, studingyear, personid)
values (74, 4, 332140938);
insert into STUDENT (gpa, studingyear, personid)
values (92, 2, 466514829);
insert into STUDENT (gpa, studingyear, personid)
values (90, 3, 324094304);
insert into STUDENT (gpa, studingyear, personid)
values (80, 1, 121375281);
insert into STUDENT (gpa, studingyear, personid)
values (71, 4, 416216676);
insert into STUDENT (gpa, studingyear, personid)
values (61, 1, 593492279);
insert into STUDENT (gpa, studingyear, personid)
values (67, 2, 895407822);
insert into STUDENT (gpa, studingyear, personid)
values (95, 1, 118950297);
insert into STUDENT (gpa, studingyear, personid)
values (67, 3, 760163678);
insert into STUDENT (gpa, studingyear, personid)
values (97, 4, 706605965);
insert into STUDENT (gpa, studingyear, personid)
values (72, 2, 480845033);
insert into STUDENT (gpa, studingyear, personid)
values (72, 2, 73645628);
insert into STUDENT (gpa, studingyear, personid)
values (65, 4, 277280966);
insert into STUDENT (gpa, studingyear, personid)
values (67, 1, 349186485);
insert into STUDENT (gpa, studingyear, personid)
values (79, 2, 488563122);
insert into STUDENT (gpa, studingyear, personid)
values (91, 3, 752916919);
insert into STUDENT (gpa, studingyear, personid)
values (87, 2, 297553286);
insert into STUDENT (gpa, studingyear, personid)
values (86, 3, 744567912);
insert into STUDENT (gpa, studingyear, personid)
values (74, 1, 727539312);
insert into STUDENT (gpa, studingyear, personid)
values (85, 2, 910141667);
insert into STUDENT (gpa, studingyear, personid)
values (91, 2, 654372709);
insert into STUDENT (gpa, studingyear, personid)
values (96, 3, 150789473);
insert into STUDENT (gpa, studingyear, personid)
values (74, 4, 624574126);
insert into STUDENT (gpa, studingyear, personid)
values (95, 4, 541606677);
insert into STUDENT (gpa, studingyear, personid)
values (64, 2, 107742156);
insert into STUDENT (gpa, studingyear, personid)
values (92, 3, 561545378);
insert into STUDENT (gpa, studingyear, personid)
values (62, 3, 12201281);
insert into STUDENT (gpa, studingyear, personid)
values (70, 1, 467583345);
insert into STUDENT (gpa, studingyear, personid)
values (87, 1, 44251551);
insert into STUDENT (gpa, studingyear, personid)
values (62, 4, 856071544);
insert into STUDENT (gpa, studingyear, personid)
values (62, 2, 497737675);
insert into STUDENT (gpa, studingyear, personid)
values (86, 2, 269329659);
insert into STUDENT (gpa, studingyear, personid)
values (95, 3, 707081977);
insert into STUDENT (gpa, studingyear, personid)
values (72, 3, 177824082);
insert into STUDENT (gpa, studingyear, personid)
values (60, 2, 102748297);
insert into STUDENT (gpa, studingyear, personid)
values (97, 1, 743832416);
insert into STUDENT (gpa, studingyear, personid)
values (72, 4, 149410895);
insert into STUDENT (gpa, studingyear, personid)
values (94, 3, 647480529);
insert into STUDENT (gpa, studingyear, personid)
values (62, 1, 691718518);
insert into STUDENT (gpa, studingyear, personid)
values (71, 3, 665730745);
insert into STUDENT (gpa, studingyear, personid)
values (72, 4, 80087312);
insert into STUDENT (gpa, studingyear, personid)
values (77, 1, 701694775);
insert into STUDENT (gpa, studingyear, personid)
values (60, 4, 803682518);
insert into STUDENT (gpa, studingyear, personid)
values (96, 1, 819052449);
insert into STUDENT (gpa, studingyear, personid)
values (93, 3, 458802088);
insert into STUDENT (gpa, studingyear, personid)
values (77, 1, 790323367);
insert into STUDENT (gpa, studingyear, personid)
values (60, 1, 502846201);
insert into STUDENT (gpa, studingyear, personid)
values (62, 3, 188671176);
insert into STUDENT (gpa, studingyear, personid)
values (90, 2, 466876355);
insert into STUDENT (gpa, studingyear, personid)
values (79, 4, 854400111);
insert into STUDENT (gpa, studingyear, personid)
values (95, 4, 639900224);
insert into STUDENT (gpa, studingyear, personid)
values (74, 3, 772651087);
insert into STUDENT (gpa, studingyear, personid)
values (64, 1, 703376284);
insert into STUDENT (gpa, studingyear, personid)
values (96, 4, 114054958);
insert into STUDENT (gpa, studingyear, personid)
values (67, 2, 614075272);
insert into STUDENT (gpa, studingyear, personid)
values (92, 1, 449497415);
insert into STUDENT (gpa, studingyear, personid)
values (70, 3, 880249718);
insert into STUDENT (gpa, studingyear, personid)
values (93, 1, 103592706);
insert into STUDENT (gpa, studingyear, personid)
values (73, 2, 486989189);
insert into STUDENT (gpa, studingyear, personid)
values (94, 1, 644443233);
insert into STUDENT (gpa, studingyear, personid)
values (64, 4, 124141581);
insert into STUDENT (gpa, studingyear, personid)
values (87, 2, 807344480);
commit;
prompt 100 records committed...
insert into STUDENT (gpa, studingyear, personid)
values (64, 2, 800854130);
insert into STUDENT (gpa, studingyear, personid)
values (68, 3, 755135766);
insert into STUDENT (gpa, studingyear, personid)
values (81, 3, 373001770);
insert into STUDENT (gpa, studingyear, personid)
values (62, 1, 785501945);
insert into STUDENT (gpa, studingyear, personid)
values (84, 4, 879632809);
insert into STUDENT (gpa, studingyear, personid)
values (75, 4, 646825246);
insert into STUDENT (gpa, studingyear, personid)
values (90, 1, 160968612);
insert into STUDENT (gpa, studingyear, personid)
values (73, 2, 736021178);
insert into STUDENT (gpa, studingyear, personid)
values (96, 3, 218327171);
insert into STUDENT (gpa, studingyear, personid)
values (60, 1, 447923226);
insert into STUDENT (gpa, studingyear, personid)
values (81, 3, 167738387);
insert into STUDENT (gpa, studingyear, personid)
values (69, 1, 118062783);
insert into STUDENT (gpa, studingyear, personid)
values (85, 1, 644113101);
insert into STUDENT (gpa, studingyear, personid)
values (62, 1, 304724063);
insert into STUDENT (gpa, studingyear, personid)
values (63, 3, 366128640);
insert into STUDENT (gpa, studingyear, personid)
values (61, 3, 324099208);
insert into STUDENT (gpa, studingyear, personid)
values (77, 4, 10832348);
insert into STUDENT (gpa, studingyear, personid)
values (72, 4, 211851761);
insert into STUDENT (gpa, studingyear, personid)
values (93, 1, 186484197);
insert into STUDENT (gpa, studingyear, personid)
values (88, 1, 463286716);
insert into STUDENT (gpa, studingyear, personid)
values (84, 3, 131638598);
insert into STUDENT (gpa, studingyear, personid)
values (80, 3, 484642804);
insert into STUDENT (gpa, studingyear, personid)
values (75, 3, 50306839);
insert into STUDENT (gpa, studingyear, personid)
values (97, 1, 309389994);
insert into STUDENT (gpa, studingyear, personid)
values (75, 3, 691138819);
insert into STUDENT (gpa, studingyear, personid)
values (70, 3, 974100054);
insert into STUDENT (gpa, studingyear, personid)
values (85, 2, 839499644);
insert into STUDENT (gpa, studingyear, personid)
values (87, 1, 94028487);
insert into STUDENT (gpa, studingyear, personid)
values (87, 2, 483627531);
insert into STUDENT (gpa, studingyear, personid)
values (93, 1, 433266048);
insert into STUDENT (gpa, studingyear, personid)
values (61, 3, 951578747);
insert into STUDENT (gpa, studingyear, personid)
values (74, 2, 643273666);
insert into STUDENT (gpa, studingyear, personid)
values (97, 1, 546344529);
insert into STUDENT (gpa, studingyear, personid)
values (91, 4, 980433268);
insert into STUDENT (gpa, studingyear, personid)
values (86, 4, 717566283);
insert into STUDENT (gpa, studingyear, personid)
values (70, 4, 155673933);
insert into STUDENT (gpa, studingyear, personid)
values (67, 2, 416556986);
insert into STUDENT (gpa, studingyear, personid)
values (72, 2, 47817047);
insert into STUDENT (gpa, studingyear, personid)
values (95, 2, 93904798);
insert into STUDENT (gpa, studingyear, personid)
values (80, 1, 245074638);
insert into STUDENT (gpa, studingyear, personid)
values (87, 2, 739962065);
insert into STUDENT (gpa, studingyear, personid)
values (89, 3, 6768992);
insert into STUDENT (gpa, studingyear, personid)
values (96, 1, 978806799);
insert into STUDENT (gpa, studingyear, personid)
values (95, 3, 117427949);
insert into STUDENT (gpa, studingyear, personid)
values (78, 3, 380835596);
insert into STUDENT (gpa, studingyear, personid)
values (60, 3, 208040574);
insert into STUDENT (gpa, studingyear, personid)
values (72, 1, 91738594);
insert into STUDENT (gpa, studingyear, personid)
values (81, 2, 695257433);
insert into STUDENT (gpa, studingyear, personid)
values (96, 2, 850567949);
insert into STUDENT (gpa, studingyear, personid)
values (70, 1, 650686042);
insert into STUDENT (gpa, studingyear, personid)
values (71, 1, 632546513);
insert into STUDENT (gpa, studingyear, personid)
values (93, 3, 52729621);
insert into STUDENT (gpa, studingyear, personid)
values (67, 2, 737881505);
insert into STUDENT (gpa, studingyear, personid)
values (64, 1, 379334764);
insert into STUDENT (gpa, studingyear, personid)
values (73, 3, 963810848);
insert into STUDENT (gpa, studingyear, personid)
values (61, 1, 980664568);
insert into STUDENT (gpa, studingyear, personid)
values (65, 1, 325652149);
insert into STUDENT (gpa, studingyear, personid)
values (66, 4, 729070842);
insert into STUDENT (gpa, studingyear, personid)
values (64, 3, 247033005);
insert into STUDENT (gpa, studingyear, personid)
values (76, 3, 600936210);
insert into STUDENT (gpa, studingyear, personid)
values (84, 4, 666975561);
insert into STUDENT (gpa, studingyear, personid)
values (91, 4, 949432805);
insert into STUDENT (gpa, studingyear, personid)
values (94, 1, 605892392);
insert into STUDENT (gpa, studingyear, personid)
values (96, 1, 701718066);
insert into STUDENT (gpa, studingyear, personid)
values (69, 2, 579225577);
insert into STUDENT (gpa, studingyear, personid)
values (84, 2, 240843810);
insert into STUDENT (gpa, studingyear, personid)
values (69, 3, 239933625);
insert into STUDENT (gpa, studingyear, personid)
values (78, 4, 837171156);
insert into STUDENT (gpa, studingyear, personid)
values (66, 2, 477594896);
insert into STUDENT (gpa, studingyear, personid)
values (62, 4, 758299525);
insert into STUDENT (gpa, studingyear, personid)
values (66, 4, 31591184);
insert into STUDENT (gpa, studingyear, personid)
values (86, 4, 627799076);
insert into STUDENT (gpa, studingyear, personid)
values (71, 3, 830042921);
insert into STUDENT (gpa, studingyear, personid)
values (65, 3, 607937673);
insert into STUDENT (gpa, studingyear, personid)
values (95, 1, 3001680);
insert into STUDENT (gpa, studingyear, personid)
values (79, 3, 605611950);
insert into STUDENT (gpa, studingyear, personid)
values (64, 3, 93181652);
insert into STUDENT (gpa, studingyear, personid)
values (70, 3, 620357514);
insert into STUDENT (gpa, studingyear, personid)
values (73, 1, 837145696);
insert into STUDENT (gpa, studingyear, personid)
values (95, 2, 28301254);
insert into STUDENT (gpa, studingyear, personid)
values (61, 1, 64144850);
insert into STUDENT (gpa, studingyear, personid)
values (64, 2, 136849513);
insert into STUDENT (gpa, studingyear, personid)
values (78, 4, 14710899);
insert into STUDENT (gpa, studingyear, personid)
values (70, 3, 158776783);
insert into STUDENT (gpa, studingyear, personid)
values (91, 3, 398581585);
insert into STUDENT (gpa, studingyear, personid)
values (87, 4, 515325860);
insert into STUDENT (gpa, studingyear, personid)
values (65, 3, 427878826);
insert into STUDENT (gpa, studingyear, personid)
values (72, 2, 900326314);
insert into STUDENT (gpa, studingyear, personid)
values (61, 2, 602539596);
insert into STUDENT (gpa, studingyear, personid)
values (76, 1, 190149862);
insert into STUDENT (gpa, studingyear, personid)
values (98, 4, 124935877);
insert into STUDENT (gpa, studingyear, personid)
values (86, 1, 872282547);
insert into STUDENT (gpa, studingyear, personid)
values (83, 2, 82987119);
insert into STUDENT (gpa, studingyear, personid)
values (70, 4, 166294914);
insert into STUDENT (gpa, studingyear, personid)
values (63, 4, 93305149);
insert into STUDENT (gpa, studingyear, personid)
values (78, 4, 901526763);
insert into STUDENT (gpa, studingyear, personid)
values (87, 3, 906131128);
insert into STUDENT (gpa, studingyear, personid)
values (62, 3, 930055330);
insert into STUDENT (gpa, studingyear, personid)
values (96, 1, 317122187);
insert into STUDENT (gpa, studingyear, personid)
values (96, 1, 892462211);
commit;
prompt 200 records committed...
insert into STUDENT (gpa, studingyear, personid)
values (60, 1, 964685021);
insert into STUDENT (gpa, studingyear, personid)
values (76, 4, 396826582);
insert into STUDENT (gpa, studingyear, personid)
values (83, 2, 748238243);
insert into STUDENT (gpa, studingyear, personid)
values (89, 4, 447981658);
insert into STUDENT (gpa, studingyear, personid)
values (97, 3, 751848618);
insert into STUDENT (gpa, studingyear, personid)
values (61, 2, 85160278);
insert into STUDENT (gpa, studingyear, personid)
values (83, 2, 605047907);
insert into STUDENT (gpa, studingyear, personid)
values (79, 2, 729309899);
insert into STUDENT (gpa, studingyear, personid)
values (90, 1, 627065172);
insert into STUDENT (gpa, studingyear, personid)
values (72, 3, 333685399);
insert into STUDENT (gpa, studingyear, personid)
values (81, 3, 326491118);
insert into STUDENT (gpa, studingyear, personid)
values (67, 2, 658059050);
insert into STUDENT (gpa, studingyear, personid)
values (64, 2, 861697940);
insert into STUDENT (gpa, studingyear, personid)
values (67, 2, 607695244);
insert into STUDENT (gpa, studingyear, personid)
values (79, 4, 93837744);
insert into STUDENT (gpa, studingyear, personid)
values (87, 4, 149143552);
insert into STUDENT (gpa, studingyear, personid)
values (96, 2, 416036705);
insert into STUDENT (gpa, studingyear, personid)
values (80, 1, 258034768);
insert into STUDENT (gpa, studingyear, personid)
values (69, 2, 106234632);
insert into STUDENT (gpa, studingyear, personid)
values (87, 3, 799133061);
insert into STUDENT (gpa, studingyear, personid)
values (71, 3, 74642085);
insert into STUDENT (gpa, studingyear, personid)
values (86, 3, 365747882);
insert into STUDENT (gpa, studingyear, personid)
values (84, 1, 841681583);
insert into STUDENT (gpa, studingyear, personid)
values (84, 3, 413251924);
insert into STUDENT (gpa, studingyear, personid)
values (79, 4, 878161920);
insert into STUDENT (gpa, studingyear, personid)
values (78, 3, 773084912);
insert into STUDENT (gpa, studingyear, personid)
values (90, 3, 360541590);
insert into STUDENT (gpa, studingyear, personid)
values (88, 3, 76966053);
insert into STUDENT (gpa, studingyear, personid)
values (91, 4, 69560250);
insert into STUDENT (gpa, studingyear, personid)
values (63, 2, 330178033);
insert into STUDENT (gpa, studingyear, personid)
values (64, 4, 432886067);
insert into STUDENT (gpa, studingyear, personid)
values (88, 4, 955908228);
insert into STUDENT (gpa, studingyear, personid)
values (81, 2, 398484063);
insert into STUDENT (gpa, studingyear, personid)
values (70, 1, 65721218);
insert into STUDENT (gpa, studingyear, personid)
values (88, 2, 692839733);
insert into STUDENT (gpa, studingyear, personid)
values (82, 1, 425333127);
insert into STUDENT (gpa, studingyear, personid)
values (88, 3, 510523506);
insert into STUDENT (gpa, studingyear, personid)
values (83, 4, 40267213);
insert into STUDENT (gpa, studingyear, personid)
values (64, 1, 234411426);
insert into STUDENT (gpa, studingyear, personid)
values (97, 4, 828434655);
insert into STUDENT (gpa, studingyear, personid)
values (79, 4, 357266312);
insert into STUDENT (gpa, studingyear, personid)
values (84, 3, 711170790);
insert into STUDENT (gpa, studingyear, personid)
values (76, 1, 600985133);
insert into STUDENT (gpa, studingyear, personid)
values (81, 2, 198557947);
insert into STUDENT (gpa, studingyear, personid)
values (68, 1, 326672648);
insert into STUDENT (gpa, studingyear, personid)
values (88, 2, 317550319);
insert into STUDENT (gpa, studingyear, personid)
values (83, 1, 140572763);
insert into STUDENT (gpa, studingyear, personid)
values (80, 4, 177458194);
insert into STUDENT (gpa, studingyear, personid)
values (93, 2, 378151267);
insert into STUDENT (gpa, studingyear, personid)
values (77, 1, 459535362);
insert into STUDENT (gpa, studingyear, personid)
values (64, 3, 646104398);
insert into STUDENT (gpa, studingyear, personid)
values (68, 2, 923499812);
insert into STUDENT (gpa, studingyear, personid)
values (74, 4, 479937328);
insert into STUDENT (gpa, studingyear, personid)
values (83, 2, 562061915);
insert into STUDENT (gpa, studingyear, personid)
values (74, 1, 524951589);
insert into STUDENT (gpa, studingyear, personid)
values (80, 4, 937626202);
insert into STUDENT (gpa, studingyear, personid)
values (87, 3, 291013634);
insert into STUDENT (gpa, studingyear, personid)
values (80, 4, 670826383);
insert into STUDENT (gpa, studingyear, personid)
values (96, 2, 433335843);
insert into STUDENT (gpa, studingyear, personid)
values (62, 3, 971575897);
insert into STUDENT (gpa, studingyear, personid)
values (73, 1, 202719706);
insert into STUDENT (gpa, studingyear, personid)
values (91, 1, 341785016);
insert into STUDENT (gpa, studingyear, personid)
values (78, 3, 247202049);
insert into STUDENT (gpa, studingyear, personid)
values (63, 4, 10812948);
insert into STUDENT (gpa, studingyear, personid)
values (82, 3, 892064530);
insert into STUDENT (gpa, studingyear, personid)
values (73, 3, 863863106);
insert into STUDENT (gpa, studingyear, personid)
values (87, 3, 65713927);
insert into STUDENT (gpa, studingyear, personid)
values (64, 4, 567102732);
insert into STUDENT (gpa, studingyear, personid)
values (66, 2, 613003091);
insert into STUDENT (gpa, studingyear, personid)
values (72, 2, 14335370);
insert into STUDENT (gpa, studingyear, personid)
values (77, 1, 323472847);
insert into STUDENT (gpa, studingyear, personid)
values (95, 4, 195121074);
insert into STUDENT (gpa, studingyear, personid)
values (83, 1, 798586087);
insert into STUDENT (gpa, studingyear, personid)
values (87, 2, 601509435);
insert into STUDENT (gpa, studingyear, personid)
values (87, 1, 639693480);
insert into STUDENT (gpa, studingyear, personid)
values (62, 3, 802594334);
insert into STUDENT (gpa, studingyear, personid)
values (64, 1, 573664497);
insert into STUDENT (gpa, studingyear, personid)
values (80, 3, 144840904);
insert into STUDENT (gpa, studingyear, personid)
values (96, 1, 136164997);
insert into STUDENT (gpa, studingyear, personid)
values (92, 1, 73530654);
insert into STUDENT (gpa, studingyear, personid)
values (92, 4, 788754335);
insert into STUDENT (gpa, studingyear, personid)
values (67, 4, 275116358);
insert into STUDENT (gpa, studingyear, personid)
values (60, 1, 292924108);
insert into STUDENT (gpa, studingyear, personid)
values (96, 4, 461446498);
insert into STUDENT (gpa, studingyear, personid)
values (78, 4, 980693589);
insert into STUDENT (gpa, studingyear, personid)
values (62, 1, 585061682);
insert into STUDENT (gpa, studingyear, personid)
values (65, 2, 525140854);
insert into STUDENT (gpa, studingyear, personid)
values (68, 4, 515247128);
insert into STUDENT (gpa, studingyear, personid)
values (85, 4, 248507079);
insert into STUDENT (gpa, studingyear, personid)
values (65, 1, 893918445);
insert into STUDENT (gpa, studingyear, personid)
values (88, 4, 232043794);
insert into STUDENT (gpa, studingyear, personid)
values (89, 4, 447143093);
insert into STUDENT (gpa, studingyear, personid)
values (81, 2, 158830196);
insert into STUDENT (gpa, studingyear, personid)
values (92, 4, 95879199);
insert into STUDENT (gpa, studingyear, personid)
values (64, 4, 331245991);
insert into STUDENT (gpa, studingyear, personid)
values (88.7, 2, 11);
insert into STUDENT (gpa, studingyear, personid)
values (95, 1, 12);
insert into STUDENT (gpa, studingyear, personid)
values (87.4, 2, 13);
insert into STUDENT (gpa, studingyear, personid)
values (90, 2, 14);
insert into STUDENT (gpa, studingyear, personid)
values (79.6, 3, 15);
commit;
prompt 300 records committed...
insert into STUDENT (gpa, studingyear, personid)
values (83.5, 3, 16);
insert into STUDENT (gpa, studingyear, personid)
values (84.3, 3, 17);
insert into STUDENT (gpa, studingyear, personid)
values (89.2, 4, 18);
insert into STUDENT (gpa, studingyear, personid)
values (85, 4, 19);
insert into STUDENT (gpa, studingyear, personid)
values (92.4, 3, 20);
commit;
prompt 305 records loaded
prompt Loading STUDENTTAKECOURSE...
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (80, 96, 11, 'A', 2020, 1);
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (92, 99, 11, 'A', 2020, 3);
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (78, 96, 12, 'A', 2020, 1);
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (90, 96, 12, 'A', 2020, 3);
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (97, 91, 13, 'A', 2020, 1);
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (87, 92, 13, 'A', 2020, 3);
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (78, 95, 14, 'A', 2020, 1);
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (69, 97, 14, 'A', 2020, 3);
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (90, 90, 15, 'A', 2020, 1);
insert into STUDENTTAKECOURSE (examgrade, assignmentsgrade, personid, semester, currentyear, courseid)
values (89, 97, 15, 'A', 2020, 3);
commit;
prompt 10 records loaded
prompt Enabling foreign key constraints for COURSEINSEMESTER...
alter table COURSEINSEMESTER enable constraint SYS_C009598;
prompt Enabling foreign key constraints for COURSEQUESTIONS...
alter table COURSEQUESTIONS enable constraint SYS_C009628;
alter table COURSEQUESTIONS enable constraint SYS_C009629;
prompt Enabling foreign key constraints for EXAM...
alter table EXAM enable constraint SYS_C009639;
prompt Enabling foreign key constraints for LECTURER...
alter table LECTURER enable constraint SYS_C009603;
prompt Enabling foreign key constraints for LECTURERTEACHCOURSE...
alter table LECTURERTEACHCOURSE enable constraint SYS_C009623;
alter table LECTURERTEACHCOURSE enable constraint SYS_C009624;
prompt Enabling foreign key constraints for STUDENT...
alter table STUDENT enable constraint SYS_C009588;
prompt Enabling foreign key constraints for STUDENTTAKECOURSE...
alter table STUDENTTAKECOURSE enable constraint SYS_C009616;
alter table STUDENTTAKECOURSE enable constraint SYS_C009617;
prompt Enabling triggers for COURSE...
alter table COURSE enable all triggers;
prompt Enabling triggers for COURSEINSEMESTER...
alter table COURSEINSEMESTER enable all triggers;
prompt Enabling triggers for QUESTION...
alter table QUESTION enable all triggers;
prompt Enabling triggers for COURSEQUESTIONS...
alter table COURSEQUESTIONS enable all triggers;
prompt Enabling triggers for EXAM...
alter table EXAM enable all triggers;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for LECTURER...
alter table LECTURER enable all triggers;
prompt Enabling triggers for LECTURERTEACHCOURSE...
alter table LECTURERTEACHCOURSE enable all triggers;
prompt Enabling triggers for STUDENT...
alter table STUDENT enable all triggers;
prompt Enabling triggers for STUDENTTAKECOURSE...
alter table STUDENTTAKECOURSE enable all triggers;

set feedback on
set define on
prompt Done
