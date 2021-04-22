prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by user on יום רביעי 07 אפריל 2021
set feedback off
set define off

prompt Creating PERSON...
create table PERSON
(
  lastname    VARCHAR2(10) not null,
  firstname   VARCHAR2(10) not null,
  personid    INTEGER not null,
  paddress    VARCHAR2(20) not null,
  phonenumber VARCHAR2(10) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PERSON
  add primary key (PERSONID)
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

prompt Creating DONOR...
create table DONOR
(
  emailaddress VARCHAR2(10),
  donorid      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONOR
  add primary key (DONORID)
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
alter table DONOR
  add foreign key (DONORID)
  references PERSON (PERSONID);

prompt Creating DONATION...
create table DONATION
(
  donationdate   DATE not null,
  donationid     INTEGER not null,
  donationstatus VARCHAR2(10) not null,
  did            INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONATION
  add primary key (DONATIONID)
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
alter table DONATION
  add foreign key (DID)
  references DONOR (DONORID);

prompt Creating ITEM...
create table ITEM
(
  itemid       INTEGER not null,
  iname        VARCHAR2(10) not null,
  price        INTEGER not null,
  companyname  VARCHAR2(10) not null,
  amount       INTEGER not null,
  warrantyears INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ITEM
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

prompt Creating DONATIONITEM...
create table DONATIONITEM
(
  did INTEGER not null,
  iid INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONATIONITEM
  add primary key (DID, IID)
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
  add foreign key (DID)
  references DONATION (DONATIONID);
alter table DONATIONITEM
  add foreign key (IID)
  references ITEM (ITEMID);

prompt Creating WAREHOUSE...
create table WAREHOUSE
(
  warehouseid   INTEGER not null,
  waddress      VARCHAR2(10) not null,
  itemscapacity INTEGER not null,
  numofworkers  INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WAREHOUSE
  add primary key (WAREHOUSEID)
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

prompt Creating STOREKEEPER...
create table STOREKEEPER
(
  experience    VARCHAR2(10),
  storekeeperid INTEGER not null,
  wid           INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STOREKEEPER
  add primary key (STOREKEEPERID)
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
alter table STOREKEEPER
  add foreign key (WID)
  references WAREHOUSE (WAREHOUSEID);
alter table STOREKEEPER
  add foreign key (STOREKEEPERID)
  references PERSON (PERSONID);

prompt Creating ORDERING...
create table ORDERING
(
  orderid       INTEGER not null,
  orderdate     DATE not null,
  shippingprice INTEGER not null,
  orderstatus   VARCHAR2(10) not null,
  workerid      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERING
  add primary key (ORDERID)
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
alter table ORDERING
  add foreign key (WORKERID)
  references STOREKEEPER (STOREKEEPERID);

prompt Creating ORDERITEM...
create table ORDERITEM
(
  orid INTEGER not null,
  itid INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERITEM
  add primary key (ORID, ITID)
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
alter table ORDERITEM
  add foreign key (ORID)
  references ORDERING (ORDERID);
alter table ORDERITEM
  add foreign key (ITID)
  references ITEM (ITEMID);

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for DONOR...
alter table DONOR disable all triggers;
prompt Disabling triggers for DONATION...
alter table DONATION disable all triggers;
prompt Disabling triggers for ITEM...
alter table ITEM disable all triggers;
prompt Disabling triggers for DONATIONITEM...
alter table DONATIONITEM disable all triggers;
prompt Disabling triggers for WAREHOUSE...
alter table WAREHOUSE disable all triggers;
prompt Disabling triggers for STOREKEEPER...
alter table STOREKEEPER disable all triggers;
prompt Disabling triggers for ORDERING...
alter table ORDERING disable all triggers;
prompt Disabling triggers for ORDERITEM...
alter table ORDERITEM disable all triggers;
prompt Disabling foreign key constraints for DONOR...
alter table DONOR disable constraint SYS_C0010083;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C0010101;
prompt Disabling foreign key constraints for DONATIONITEM...
alter table DONATIONITEM disable constraint SYS_C0010122;
alter table DONATIONITEM disable constraint SYS_C0010123;
prompt Disabling foreign key constraints for STOREKEEPER...
alter table STOREKEEPER disable constraint SYS_C0010105;
alter table STOREKEEPER disable constraint SYS_C0010106;
prompt Disabling foreign key constraints for ORDERING...
alter table ORDERING disable constraint SYS_C0010113;
prompt Disabling foreign key constraints for ORDERITEM...
alter table ORDERITEM disable constraint SYS_C0010117;
alter table ORDERITEM disable constraint SYS_C0010118;
prompt Deleting ORDERITEM...
delete from ORDERITEM;
commit;
prompt Deleting ORDERING...
delete from ORDERING;
commit;
prompt Deleting STOREKEEPER...
delete from STOREKEEPER;
commit;
prompt Deleting WAREHOUSE...
delete from WAREHOUSE;
commit;
prompt Deleting DONATIONITEM...
delete from DONATIONITEM;
commit;
prompt Deleting ITEM...
delete from ITEM;
commit;
prompt Deleting DONATION...
delete from DONATION;
commit;
prompt Deleting DONOR...
delete from DONOR;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Richards', 'Avril', 39526248, '35 Steyr Road', '-5738296');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Cervine', 'Terri', 754541818, '752 Diggs Ave', '-5200610');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Fiennes', 'Spike', 648494766, '888 Allison Road', '-4143934');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Horton', 'Liev', 103990446, '13 Webb Drive', '-7685359');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Cromwell', 'Ivan', 199676039, '100 Bandy Drive', '-6626899');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Burke', 'Marina', 352960943, '86 Eisenh', '-6174004');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Mraz', 'Ewan', 265523841, '46 Limeira Drive', '-9744615');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Beckham', 'Catherine', 914939769, '981 Batavia Ave', '-9807688');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('LuPone', 'Terrence', 359395919, '8 Paderborn Street', '-923420');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Dorn', 'Lesley', 961425965, '83 Keanu Blvd', '-7799991');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Ellis', 'Merillee', 291123858, '31 Charleston Drive', '-9617978');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Horton', 'Lizzy', 237354523, '66 Kadison Road', '-5135124');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Holden', 'Heath', 715003184, '32 Khan Street', '-4006782');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Spacek', 'Warren', 928526683, '78 Leo Street', '-6336569');
insert into PERSON (lastname, firstname, personid, paddress, phonenumber)
values ('Cage', 'Rascal', 22355118, '873 Nicolas Blvd', '-5214326');
commit;
prompt 15 records loaded
prompt Loading DONOR...
insert into DONOR (emailaddress, donorid)
values ('king.venor', 754541818);
insert into DONOR (emailaddress, donorid)
values ('lila@vitac', 648494766);
insert into DONOR (emailaddress, donorid)
values ('arturor@ac', 103990446);
commit;
prompt 3 records loaded
prompt Loading DONATION...
insert into DONATION (donationdate, donationid, donationstatus, did)
values (to_date('06-05-2019', 'dd-mm-yyyy'), 1, 'Canceled', 103990446);
insert into DONATION (donationdate, donationid, donationstatus, did)
values (to_date('26-01-2015', 'dd-mm-yyyy'), 2, 'Canceled', 103990446);
insert into DONATION (donationdate, donationid, donationstatus, did)
values (to_date('07-07-2018', 'dd-mm-yyyy'), 3, 'Canceled', 754541818);
insert into DONATION (donationdate, donationid, donationstatus, did)
values (to_date('20-02-2019', 'dd-mm-yyyy'), 4, 'Canceled', 754541818);
insert into DONATION (donationdate, donationid, donationstatus, did)
values (to_date('28-09-2019', 'dd-mm-yyyy'), 5, 'Canceled', 648494766);
commit;
prompt 5 records loaded
prompt Loading ITEM...
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (1, 'Stretcher', 45, 'Flake-Wilk', 20, 1);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (2, 'Wheelchair', 199, 'Myricom', 38, 0);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (3, 'Clothes', 289, 'National H', 32, 3);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (4, 'Medicine', 34, 'Southern F', 31, 1);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (5, 'Ambulance', 215, 'CREDO Petr', 28, 1);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (6, 'Blanket', 20, 'SourceGear', 38, 1);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (7, 'Wheelchair', 179, 'Air Method', 20, 1);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (8, 'Medicine', 3, 'Momentum M', 32, 5);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (9, ' weelchair', 100, ' weel', 156, 5);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (10, ' ambulance', 100000, ' h&v', 29, 6);
insert into ITEM (itemid, iname, price, companyname, amount, warrantyears)
values (13, ' stretcher', 7000, ' health', 38, 5);
commit;
prompt 11 records loaded
prompt Loading DONATIONITEM...
insert into DONATIONITEM (did, iid)
values (4, 6);
insert into DONATIONITEM (did, iid)
values (2, 7);
insert into DONATIONITEM (did, iid)
values (1, 5);
insert into DONATIONITEM (did, iid)
values (4, 1);
insert into DONATIONITEM (did, iid)
values (5, 4);
commit;
prompt 5 records loaded
prompt Loading WAREHOUSE...
insert into WAREHOUSE (warehouseid, waddress, itemscapacity, numofworkers)
values (1, '838 Dennis', 108, 67);
insert into WAREHOUSE (warehouseid, waddress, itemscapacity, numofworkers)
values (2, '415 Heche', 193, 30);
insert into WAREHOUSE (warehouseid, waddress, itemscapacity, numofworkers)
values (3, '81 Park Ri', 358, 46);
insert into WAREHOUSE (warehouseid, waddress, itemscapacity, numofworkers)
values (4, '89 Gordon ', 173, 58);
insert into WAREHOUSE (warehouseid, waddress, itemscapacity, numofworkers)
values (5, '93 Oak Par', 291, 35);
insert into WAREHOUSE (warehouseid, waddress, itemscapacity, numofworkers)
values (6, '358 Leguiz', 505, 49);
insert into WAREHOUSE (warehouseid, waddress, itemscapacity, numofworkers)
values (7, '877 Rita D', 510, 54);
commit;
prompt 7 records loaded
prompt Loading STOREKEEPER...
insert into STOREKEEPER (experience, storekeeperid, wid)
values ('Manager', 199676039, 6);
insert into STOREKEEPER (experience, storekeeperid, wid)
values ('Manager', 39526248, 7);
insert into STOREKEEPER (experience, storekeeperid, wid)
values ('Manager', 352960943, 2);
commit;
prompt 3 records loaded
prompt Loading ORDERING...
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, workerid)
values (1, to_date('01-09-2012', 'dd-mm-yyyy'), 145, 'Canceled', 352960943);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, workerid)
values (2, to_date('27-07-2011', 'dd-mm-yyyy'), 119, 'Canceled', 352960943);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, workerid)
values (3, to_date('31-01-2010', 'dd-mm-yyyy'), 189, 'Canceled', 39526248);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, workerid)
values (4, to_date('14-10-2019', 'dd-mm-yyyy'), 179, 'Done', 39526248);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, workerid)
values (5, to_date('03-09-2017', 'dd-mm-yyyy'), 8, 'Canceled', 199676039);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, workerid)
values (6, to_date('13-11-2012', 'dd-mm-yyyy'), 659, 'Done', 199676039);
commit;
prompt 6 records loaded
prompt Loading ORDERITEM...
insert into ORDERITEM (orid, itid)
values (3, 6);
insert into ORDERITEM (orid, itid)
values (6, 8);
insert into ORDERITEM (orid, itid)
values (3, 3);
insert into ORDERITEM (orid, itid)
values (5, 2);
commit;
prompt 4 records loaded
prompt Enabling foreign key constraints for DONOR...
alter table DONOR enable constraint SYS_C0010083;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C0010101;
prompt Enabling foreign key constraints for DONATIONITEM...
alter table DONATIONITEM enable constraint SYS_C0010122;
alter table DONATIONITEM enable constraint SYS_C0010123;
prompt Enabling foreign key constraints for STOREKEEPER...
alter table STOREKEEPER enable constraint SYS_C0010105;
alter table STOREKEEPER enable constraint SYS_C0010106;
prompt Enabling foreign key constraints for ORDERING...
alter table ORDERING enable constraint SYS_C0010113;
prompt Enabling foreign key constraints for ORDERITEM...
alter table ORDERITEM enable constraint SYS_C0010117;
alter table ORDERITEM enable constraint SYS_C0010118;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for DONOR...
alter table DONOR enable all triggers;
prompt Enabling triggers for DONATION...
alter table DONATION enable all triggers;
prompt Enabling triggers for ITEM...
alter table ITEM enable all triggers;
prompt Enabling triggers for DONATIONITEM...
alter table DONATIONITEM enable all triggers;
prompt Enabling triggers for WAREHOUSE...
alter table WAREHOUSE enable all triggers;
prompt Enabling triggers for STOREKEEPER...
alter table STOREKEEPER enable all triggers;
prompt Enabling triggers for ORDERING...
alter table ORDERING enable all triggers;
prompt Enabling triggers for ORDERITEM...
alter table ORDERITEM enable all triggers;

set feedback on
set define on
prompt Done
