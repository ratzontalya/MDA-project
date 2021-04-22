alter session set "_ORACLE_SCRIPT"=true;  

create user TALYARATZON --user name
IDENTIFIED BY tratzon1    --passward
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;

grant create session to TALYARATZON; 
grant create table to TALYARATZON; 
grant unlimited tablespace to TALYARATZON;
grant create view , create procedure , create sequence to TALYARATZON;
ALTER USER TALYARATZON quota unlimited on SYSTEM;
