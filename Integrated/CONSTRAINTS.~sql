/*********** THREE CONSTRAINTS***********/

/*
constraint - each phone needs to start with zero.
*/
UPDATE PERSON SET PHONE = '0' || regexp_replace( PHONE, '[^[:digit:]]', null ) WHERE phone NOT LIKE '0%';
ALTER TABLE PERSON
      ADD CONSTRAINT check_phone_number
      CHECK (phone LIKE '0%');

INSERT INTO PERSON VALUES('HII','BII',1,'HII','908890','HII',to_date('11-05-2000', 'dd-mm-yyyy'));
/*
mail needs to be with @ and .com.
*/
ALTER TABLE PERSON
      ADD CONSTRAINT check_mail
      CHECK (mail LIKE '%@%');
UPDATE PERSON SET MAIL = mail || '@' where mail NOT LIKE '%@%';
INSERT INTO PERSON VALUES('HII','BII',1,'HII','0908890','HII', to_date('11-05-2000', 'dd-mm-yyyy'));
/*
paramedic in MDA needs to have atleast one year of experience.
*/
ALTER TABLE PARAMEDIC
      ADD CONSTRAINT check_experience
      CHECK (yearsofexperience >= 1);
INSERT INTO PARAMEDIC VALUES(0,754541818);
/*
status of call can only be one of this statuses: 'DONE','CANCELLED','IN_OPERATION','RECIEVED'
*/
ALTER TABLE CALLHELP
      ADD CONSTRAINT check_status
      CHECK (status IN ('DONE','CANCELLED','IN_OPERATION','RECIEVED'));
insert into CALLHELP values (2000, to_date('16-01-1949', 'dd-mm-yyyy'), 540114031,'hjb');
