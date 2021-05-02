--יצירת משתמש
alter session set "_ORACLE_SCRIPT"=true;  

create user MORIYA --user name
IDENTIFIED BY aaa    --passward
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;

grant create session to MORIYA; 
grant create table to MORIYA; 

ALTER USER MORIYA quota unlimited on SYSTEM

--מחקת משתמש
--DROP USER moriya 

-- GRANT
grant select on PERSON to moriya;
GRANT UPDATE,SELECT ON TEAM TO moriya;
grant all on CALLHELP to moriya;

select * from TALYARATZON.PERSON;
update TALYARATZON.PERSON set mail = mail || '@';
select * from TALYARATZON.TEAM;
delete from TALYARATZON.TEAM where teamid = 100;

select * from TALYARATZON.CALLHELP;
select * from TALYARATZON.CALLHELP for update;
--REVOKE
revoke UPDATE,SELECT on TEAM from moriya;
revoke select on PERSON from moriya;
revoke all on CALLHELP from moriya;

