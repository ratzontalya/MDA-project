/***********ALTER TABLE*****************/
/*
add status column to callhelp table and make it not null.
*/
alter table CALLHELP add status varchar2(10);
UPDATE CALLHELP
SET STATUS = 'DONE';
alter table CALLHELP modify status not null;
/*
rename numofworkers in warehouse to storekeeperscapacity
*/
alter table WAREHOUSE rename column numofworkers to storekeeperscapacity;
/*
rename workerid in ordering to storekeeperid
*/
alter table ORDERING rename column workerid to storekeeperid;
/*
delete email address from donor
*/
ALTER TABLE Donor
DROP COLUMN emailAddress;
/*
delete amount from item
*/
ALTER TABLE Item DROP COLUMN amount;
/*
add email address and birthdate to person
rename phonenumber and paddress
*/
alter table PERSON rename column paddress to ADDRESS;
alter table PERSON rename column phonenumber to PHONE;
alter table PERSON add mail varchar2(100);
alter table PERSON add birthdate date;

/*
add to item the attribute orderId with foreign key to order
*/
alter table ITEM add orderid INTEGER;

ALTER TABLE ITEM
ADD CONSTRAINT fk_item
    FOREIGN KEY (orderid) REFERENCES ordering(orderid);
/*
add to item warehouseId
add to item the attribute warehouseId with foreign key to warehouse
*/

alter table ITEM add warehouseId INTEGER;
ALTER TABLE ITEM
ADD CONSTRAINT fk_item2
    FOREIGN KEY (warehouseId) REFERENCES warehouse(warehouseId);

/*
add table - ItemType, with itemName as id
*/

create table ITEMTYPE
(
  itemName varchar2(20) not null,
  PRIMARY KEY (itemName)
);

/*
add constraint to item -  foreign key to ItemType(itemName)
*/
alter table ITEM rename column iname to ITEMNAME;
INSERT INTO itemType 
SELECT DISTINCT(itemName)
FROM item;
ALTER TABLE ITEM
ADD CONSTRAINT fk_item3
    FOREIGN KEY (itemName) REFERENCES itemtype(itemName);
    
/*
move ambulance table to item
*/  
INSERT INTO ITEM
SELECT ambulanceid + 13,'Ambulance',0, 'UNKNOWN',0,NULL,NULL
FROM AMBULANCE
WHERE ambulanceid + 13 NOT IN (SELECT itemid FROM ITEM);  

/*
move person1 data to the table person
*/ 
alter table PERSON modify address VARCHAR2(100);
alter table PERSON modify firstname VARCHAR2(20);
alter table PERSON modify lastname VARCHAR2(20);
INSERT INTO PERSON
SELECT LASTNAME, FIRSTNAME, PERSONID,ADDRESS,PHONE,MAIL,BIRTHDATE
FROM PERSON1
WHERE personId NOT IN (select personId FROM PERSON);
/*
insert for every item which order he is in.
*/
UPDATE ITEM
SET orderid = (SELECT orid
               FROM ORDERITEM
               WHERE ORDERITEM.itid = ITEM.itemid);
select * from  item;
/*
update warehouseid in item to be the warehouseid of the storekeeper which ordered the item
*/
UPDATE ITEM
SET WAREHOUSEID = (SELECT WAREHOUSEID
                   FROM ORDERITEM NATURAL JOIN ORDERING NATURAL JOIN STOREKEEPER
                   WHERE ITEM.ITEMID = ITEMID);
/*
delete orderitem table
*/
DROP TABLE orderitem;
/*
changing the foreign key that is inside of team - to item instead of ambulance
*/
alter table TEAM
  drop constraint SYS_C0015737;
  
UPDATE TEAM
SET AMBULANCEID = AMBULANCEID + 13;

alter table TEAM
  add foreign key (AMBULANCEID)
  references item (ITEMID) on delete cascade;
/*
delete ambulance table
*/
DROP TABLE ambulance;
/*
changing the foreign key that is inside of dispatcher, driver, volunteer and paramedic
- to person instead of person1
*/
alter table DISPATCHER
  drop constraint SYS_C0015719;
alter table DISPATCHER
  add foreign key (DISPATCHERID)
  references PERSON (PERSONID) on delete cascade;
  
alter table DRIVER
  drop constraint SYS_C0015727;
alter table DRIVER
  add foreign key (DRIVERID)
  references PERSON (PERSONID) on delete cascade;

alter table PARAMEDIC
  drop constraint SYS_C0015731;
alter table PARAMEDIC
  add foreign key (PARAMEDICID)
  references PERSON (PERSONID) on delete cascade;
  
alter table VOLUNTEER
  drop constraint SYS_C0015745;
alter table VOLUNTEER
  add foreign key (VOLUNTEERID)
  references PERSON (PERSONID) on delete cascade;
/*
delete person1 table
*/
DROP TABLE person1;
/*
rename columns did & itid
change the constraint in donationitem - primary key is only itemid
*/
alter table DONATIONITEM rename column did to DonationID;
alter table DONATIONITEM rename column iid to ItemID;
-- Create/Recreate primary, unique and foreign key constraints 
alter table DONATIONITEM
  drop constraint SYS_C0015780 cascade;
alter table DONATIONITEM
  add primary key (ITEMID)
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
alter table DONATIONITEM
  drop constraint SYS_C0015781;
alter table DONATIONITEM
  add foreign key (DONATIONID)
  references DONATION (DONATIONID);
alter table DONATIONITEM
  drop constraint SYS_C0015782;
alter table DONATIONITEM
  add foreign key (ITEMID)
  references ITEM (ITEMID);
/*
rename did in donation to donorid
*/
alter table DONATION rename column did to donorid;
/*
rename wid in storekeeper to warehouseid
*/
alter table STOREKEEPER rename column wid to warehouseid;
/*
rename waddress in warehouse to address
*/
alter table WAREHOUSE rename column waddress to address;


