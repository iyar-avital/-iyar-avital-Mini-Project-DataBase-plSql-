/* system */
alter session set "_ORACLE_SCRIPT"=true;  
create user efrat --user name
IDENTIFIED BY efrat    --passward
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;
grant create session to efrat; 
grant create table to efrat; 
grant unlimited tablespace to efrat;
grant create view , create procedure , create sequence to efrat;
ALTER USER efrat quota unlimited on SYSTEM;

/* iyar */
grant select on person to efrat;
grant select, update, insert on person to efrat;
revoke update, insert on person from efrat;

/* efrat */
select * from iyar.person;
update iyar.person
set email = 'i_am_a_cool_student@gmail.com'
where personid = 323075499;
select email from iyar.person where personid = 323075499;
update iyar.person
set email = 'lol@gmail.com'
where personid = 207781733;
insert into iyar.person 
values ('488377696', 'Robin', 'Rockwell', 'robin@ams.com',
        to_date('27-09-2828', 'dd-mm-yyyy'), 1180, '0283740018');
