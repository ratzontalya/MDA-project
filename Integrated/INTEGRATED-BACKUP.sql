prompt PL/SQL Developer Export Tables for user TALYARATZON@XE
prompt Created by User on Sunday, April 25, 2021
set feedback off
set define off

prompt Creating PERSON...
create table PERSON
(
  lastname  VARCHAR2(20) not null,
  firstname VARCHAR2(20) not null,
  personid  INTEGER not null,
  address   VARCHAR2(100) not null,
  phone     VARCHAR2(10) not null,
  mail      VARCHAR2(100),
  birthdate DATE
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

prompt Creating DISPATCHER...
create table DISPATCHER
(
  dispatcherid INTEGER not null
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
alter table DISPATCHER
  add primary key (DISPATCHERID)
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
alter table DISPATCHER
  add foreign key (DISPATCHERID)
  references PERSON (PERSONID) on delete cascade;

prompt Creating CALLHELP...
create table CALLHELP
(
  callid       INTEGER not null,
  calldate     DATE not null,
  dispatcherid INTEGER not null,
  status       VARCHAR2(10) not null
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
alter table CALLHELP
  add primary key (CALLID)
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
alter table CALLHELP
  add foreign key (DISPATCHERID)
  references DISPATCHER (DISPATCHERID) on delete cascade;
alter table CALLHELP
  add constraint CHECK_STATUS
  check (status IN ('DONE','CANCELLED','IN_OPERATION','RECIEVED'));

prompt Creating DONOR...
create table DONOR
(
  donorid INTEGER not null
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
  donorid        INTEGER not null
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
  add foreign key (DONORID)
  references DONOR (DONORID);

prompt Creating ITEMTYPE...
create table ITEMTYPE
(
  itemname VARCHAR2(20) not null
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
alter table ITEMTYPE
  add primary key (ITEMNAME)
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

prompt Creating WAREHOUSE...
create table WAREHOUSE
(
  warehouseid          INTEGER not null,
  address              VARCHAR2(10) not null,
  itemscapacity        INTEGER not null,
  storekeeperscapacity INTEGER not null
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
  warehouseid   INTEGER not null
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
  add foreign key (WAREHOUSEID)
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
  storekeeperid INTEGER not null
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
  add foreign key (STOREKEEPERID)
  references STOREKEEPER (STOREKEEPERID);

prompt Creating ITEM...
create table ITEM
(
  itemid       INTEGER not null,
  itemname     VARCHAR2(10) not null,
  price        INTEGER not null,
  companyname  VARCHAR2(10) not null,
  warrantyears INTEGER not null,
  orderid      INTEGER,
  warehouseid  INTEGER
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
alter table ITEM
  add constraint FK_ITEM foreign key (ORDERID)
  references ORDERING (ORDERID);
alter table ITEM
  add constraint FK_ITEM2 foreign key (WAREHOUSEID)
  references WAREHOUSE (WAREHOUSEID);
alter table ITEM
  add constraint FK_ITEM3 foreign key (ITEMNAME)
  references ITEMTYPE (ITEMNAME);

prompt Creating DONATEITEM...
create table DONATEITEM
(
  donationid INTEGER not null,
  itemid     INTEGER not null
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
alter table DONATEITEM
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
alter table DONATEITEM
  add foreign key (DONATIONID)
  references DONATION (DONATIONID);
alter table DONATEITEM
  add foreign key (ITEMID)
  references ITEM (ITEMID);

prompt Creating DRIVER...
create table DRIVER
(
  driverid INTEGER not null
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
alter table DRIVER
  add primary key (DRIVERID)
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
alter table DRIVER
  add foreign key (DRIVERID)
  references PERSON (PERSONID) on delete cascade;

prompt Creating PARAMEDIC...
create table PARAMEDIC
(
  yearsofexperience INTEGER not null,
  paramedicid       INTEGER not null
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
alter table PARAMEDIC
  add primary key (PARAMEDICID)
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
alter table PARAMEDIC
  add foreign key (PARAMEDICID)
  references PERSON (PERSONID) on delete cascade;

prompt Creating TEAM...
create table TEAM
(
  teamid      INTEGER not null,
  driverid    INTEGER not null,
  ambulanceid INTEGER not null
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
alter table TEAM
  add primary key (TEAMID)
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
alter table TEAM
  add foreign key (DRIVERID)
  references DRIVER (DRIVERID) on delete cascade;
alter table TEAM
  add foreign key (AMBULANCEID)
  references ITEM (ITEMID) on delete cascade;

prompt Creating PARTICIPANTPARAMEDIC...
create table PARTICIPANTPARAMEDIC
(
  teamid      INTEGER not null,
  paramedicid INTEGER not null
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
alter table PARTICIPANTPARAMEDIC
  add primary key (TEAMID, PARAMEDICID)
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
alter table PARTICIPANTPARAMEDIC
  add foreign key (TEAMID)
  references TEAM (TEAMID) on delete cascade;
alter table PARTICIPANTPARAMEDIC
  add foreign key (PARAMEDICID)
  references PARAMEDIC (PARAMEDICID) on delete cascade;

prompt Creating VOLUNTEER...
create table VOLUNTEER
(
  volunteerid INTEGER not null
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
alter table VOLUNTEER
  add primary key (VOLUNTEERID)
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
alter table VOLUNTEER
  add foreign key (VOLUNTEERID)
  references PERSON (PERSONID) on delete cascade;

prompt Creating PARTICIPANTVOLUNTEER...
create table PARTICIPANTVOLUNTEER
(
  teamid      INTEGER not null,
  volunteerid INTEGER not null
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
alter table PARTICIPANTVOLUNTEER
  add primary key (TEAMID, VOLUNTEERID)
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
alter table PARTICIPANTVOLUNTEER
  add foreign key (TEAMID)
  references TEAM (TEAMID) on delete cascade;
alter table PARTICIPANTVOLUNTEER
  add foreign key (VOLUNTEERID)
  references VOLUNTEER (VOLUNTEERID) on delete cascade;

prompt Creating SENDTEAM...
create table SENDTEAM
(
  callid INTEGER not null,
  teamid INTEGER not null
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
alter table SENDTEAM
  add primary key (CALLID, TEAMID)
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
alter table SENDTEAM
  add foreign key (CALLID)
  references CALLHELP (CALLID) on delete cascade;
alter table SENDTEAM
  add foreign key (TEAMID)
  references TEAM (TEAMID) on delete cascade;

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for DISPATCHER...
alter table DISPATCHER disable all triggers;
prompt Disabling triggers for CALLHELP...
alter table CALLHELP disable all triggers;
prompt Disabling triggers for DONOR...
alter table DONOR disable all triggers;
prompt Disabling triggers for DONATION...
alter table DONATION disable all triggers;
prompt Disabling triggers for ITEMTYPE...
alter table ITEMTYPE disable all triggers;
prompt Disabling triggers for WAREHOUSE...
alter table WAREHOUSE disable all triggers;
prompt Disabling triggers for STOREKEEPER...
alter table STOREKEEPER disable all triggers;
prompt Disabling triggers for ORDERING...
alter table ORDERING disable all triggers;
prompt Disabling triggers for ITEM...
alter table ITEM disable all triggers;
prompt Disabling triggers for DONATEITEM...
alter table DONATEITEM disable all triggers;
prompt Disabling triggers for DRIVER...
alter table DRIVER disable all triggers;
prompt Disabling triggers for PARAMEDIC...
alter table PARAMEDIC disable all triggers;
prompt Disabling triggers for TEAM...
alter table TEAM disable all triggers;
prompt Disabling triggers for PARTICIPANTPARAMEDIC...
alter table PARTICIPANTPARAMEDIC disable all triggers;
prompt Disabling triggers for VOLUNTEER...
alter table VOLUNTEER disable all triggers;
prompt Disabling triggers for PARTICIPANTVOLUNTEER...
alter table PARTICIPANTVOLUNTEER disable all triggers;
prompt Disabling triggers for SENDTEAM...
alter table SENDTEAM disable all triggers;
prompt Disabling foreign key constraints for DISPATCHER...
alter table DISPATCHER disable constraint SYS_C0015811;
prompt Disabling foreign key constraints for CALLHELP...
alter table CALLHELP disable constraint SYS_C0015724;
prompt Disabling foreign key constraints for DONOR...
alter table DONOR disable constraint SYS_C0015764;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C0015770;
prompt Disabling foreign key constraints for STOREKEEPER...
alter table STOREKEEPER disable constraint SYS_C0015791;
alter table STOREKEEPER disable constraint SYS_C0015792;
prompt Disabling foreign key constraints for ORDERING...
alter table ORDERING disable constraint SYS_C0015799;
prompt Disabling foreign key constraints for ITEM...
alter table ITEM disable constraint FK_ITEM;
alter table ITEM disable constraint FK_ITEM2;
alter table ITEM disable constraint FK_ITEM3;
prompt Disabling foreign key constraints for DONATEITEM...
alter table DONATEITEM disable constraint SYS_C0015816;
alter table DONATEITEM disable constraint SYS_C0015817;
prompt Disabling foreign key constraints for DRIVER...
alter table DRIVER disable constraint SYS_C0015812;
prompt Disabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC disable constraint SYS_C0015813;
prompt Disabling foreign key constraints for TEAM...
alter table TEAM disable constraint SYS_C0015736;
alter table TEAM disable constraint SYS_C0015810;
prompt Disabling foreign key constraints for PARTICIPANTPARAMEDIC...
alter table PARTICIPANTPARAMEDIC disable constraint SYS_C0015741;
alter table PARTICIPANTPARAMEDIC disable constraint SYS_C0015742;
prompt Disabling foreign key constraints for VOLUNTEER...
alter table VOLUNTEER disable constraint SYS_C0015814;
prompt Disabling foreign key constraints for PARTICIPANTVOLUNTEER...
alter table PARTICIPANTVOLUNTEER disable constraint SYS_C0015749;
alter table PARTICIPANTVOLUNTEER disable constraint SYS_C0015750;
prompt Disabling foreign key constraints for SENDTEAM...
alter table SENDTEAM disable constraint SYS_C0015754;
alter table SENDTEAM disable constraint SYS_C0015755;
prompt Deleting SENDTEAM...
delete from SENDTEAM;
commit;
prompt Deleting PARTICIPANTVOLUNTEER...
delete from PARTICIPANTVOLUNTEER;
commit;
prompt Deleting VOLUNTEER...
delete from VOLUNTEER;
commit;
prompt Deleting PARTICIPANTPARAMEDIC...
delete from PARTICIPANTPARAMEDIC;
commit;
prompt Deleting TEAM...
delete from TEAM;
commit;
prompt Deleting PARAMEDIC...
delete from PARAMEDIC;
commit;
prompt Deleting DRIVER...
delete from DRIVER;
commit;
prompt Deleting DONATEITEM...
delete from DONATEITEM;
commit;
prompt Deleting ITEM...
delete from ITEM;
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
prompt Deleting ITEMTYPE...
delete from ITEMTYPE;
commit;
prompt Deleting DONATION...
delete from DONATION;
commit;
prompt Deleting DONOR...
delete from DONOR;
commit;
prompt Deleting CALLHELP...
delete from CALLHELP;
commit;
prompt Deleting DISPATCHER...
delete from DISPATCHER;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Richards', 'Avril', 39526248, '35 Steyr Road', '-5738296', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cervine', 'Terri', 754541818, '752 Diggs Ave', '-5200610', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fiennes', 'Spike', 648494766, '888 Allison Road', '-4143934', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Horton', 'Liev', 103990446, '13 Webb Drive', '-7685359', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cromwell', 'Ivan', 199676039, '100 Bandy Drive', '-6626899', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Burke', 'Marina', 352960943, '86 Eisenh', '-6174004', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mraz', 'Ewan', 265523841, '46 Limeira Drive', '-9744615', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Beckham', 'Catherine', 914939769, '981 Batavia Ave', '-9807688', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('LuPone', 'Terrence', 359395919, '8 Paderborn Street', '-923420', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dorn', 'Lesley', 961425965, '83 Keanu Blvd', '-7799991', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ellis', 'Merillee', 291123858, '31 Charleston Drive', '-9617978', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Horton', 'Lizzy', 237354523, '66 Kadison Road', '-5135124', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Holden', 'Heath', 715003184, '32 Khan Street', '-4006782', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Spacek', 'Warren', 928526683, '78 Leo Street', '-6336569', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cage', 'Rascal', 22355118, '873 Nicolas Blvd', '-5214326', null, null);
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Leoni', 'Naomi', 245675893, '36 Amherst DriveMayf', '0582504080', 'naomi.leoni@bmm.com', to_date('11-05-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fichtner', 'Jon', 568594044, '25 Diddley StreetBel', '0597829934', 'jon@coldstonecreamer', to_date('10-12-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tillis', 'Red', 418151081, '542 Omar BlvdMaccles', '0528980536', 'red.tillis@digitalmo', to_date('13-04-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kirshner', 'Mandy', 328925588, '69 Burlington Street', '0568709637', 'mandy.kirshner@techb', to_date('28-07-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Irons', 'Randall', 442065013, '29 Lunch BlvdHunting', '0597225096', 'randall@bioreliance.', to_date('20-11-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Byrd', 'Norm', 963532017, '44 LenexaGaza', '0568152725', 'norm.b@powerlight.co', to_date('12-05-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Campbell', 'Bret', 809037820, '40 Kline DriveHiller', '0572005320', 'bret.campbell@mai.dk', to_date('27-12-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Uggams', 'Joanna', 103617623, '68 Saucedo RoadRoma', '0521995386', 'joanna.uggams@als.it', to_date('29-05-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carr', 'Jeffery', 338261690, '28 Taye StreetMelbou', '0524390028', 'jeffery@colgatepalmo', to_date('25-03-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Craddock', 'Lorraine', 971790932, '63rd StreetBelmont', '0537202489', 'l.craddock@ipsadviso', to_date('18-05-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Woodward', 'Nile', 738448453, '729 Karlstad RoadHac', '0547146533', 'nile.woodward@lloydg', to_date('31-08-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dalton', 'Chely', 502131885, '9 Suwon-city BlvdNew', '0529386833', 'c.dalton@dillards.co', to_date('25-11-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rivers', 'Lara', 645615690, '54 Larnelle DrivePai', '0556099222', 'lara.rivers@cooktek.', to_date('22-10-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Collins', 'Giancarlo', 602857670, '30 Platt AveWaco', '0597368709', 'giancarlo.collins@vi', to_date('24-08-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Warburton', 'Tzi', 648807300, '59 Holmes DriveGliwi', '0537300343', 'tzi.warburton@vesta.', to_date('01-02-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Magnuson', 'Wes', 178457229, '46 Horton DriveMaser', '0553986603', 'wes@solutionbuilders', to_date('11-03-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dawson', 'Rupert', 743929062, '378 Paraju RoadPompe', '0567290157', 'rupert.dawson@americ', to_date('22-12-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rains', 'Nickel', 388211214, '92nd StreetAmericana', '0590725237', 'nickel@diamondgroup.', to_date('09-07-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Vai', 'Wallace', 237257128, '13 Jena StreetStream', '0588721097', 'wallace@neogen.com', to_date('15-02-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pleasence', 'Alec', 671249248, '197 Lynne DriveTrevi', '0549894653', 'alec@hfn.it', to_date('27-04-1958', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Astin', 'Terrence', 352391765, '97 Drive AveBoucherv', '0552633841', 'terrence@trx.ca', to_date('02-02-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Harper', 'Trace', 985985506, '49 Osaka DriveBurlin', '0570964982', 'traceh@supplycorecom', to_date('27-04-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Watley', 'Lari', 974874812, '35 Briscoe BlvdCrete', '0582507395', 'lari.w@alternativete', to_date('26-08-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jane', 'Rosanna', 671157768, '14 Charleston DriveL', '0543034608', 'rjane@coridiantechno', to_date('15-08-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McNarland', 'Wally', 966618858, '951 Olivette RoadMec', '0599825457', 'wallym@conquestsyste', to_date('15-04-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Marley', 'Molly', 430928405, '692 Ford DriveElche', '0557491489', 'molly.m@credopetrole', to_date('20-11-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Place', 'Maxine', 717450469, '84 Ewan StreetTadley', '0536088541', 'maxine.place@dell.uk', to_date('12-11-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bragg', 'Albertina', 191836287, '16 Tucci RoadTokyo', '0523013440', 'albertina@stonetechp', to_date('06-06-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jamal', 'Caroline', 968039045, '32nd StreetBedford', '0569345842', 'caroline.jamal@doral', to_date('24-09-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chandler', 'Bernie', 118221793, '33 Keaton StreetInge', '0525358433', 'bernie.chandler@iss.', to_date('30-12-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Everett', 'Robin', 811724593, '872 Jude RoadGerstho', '0563401458', 'r.everett@doctorsass', to_date('04-11-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Quatro', 'Mac', 703777997, '16 Flanagan RoadLeip', '0592389386', 'mquatro@drinkmorewat', to_date('02-11-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Shorter', 'Vanessa', 475197916, '52 Bellevue RoadLumm', '0583586372', 'vanessa.shorter@bat.', to_date('26-10-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Minogue', 'Latin', 843530209, '64 Boyle DriveN. ft.', '0575748455', 'latin.minogue@abatix', to_date('31-07-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kingsley', 'Corey', 386411368, '58 Perrineau StreetN', '0570893692', 'corey@hcoa.dk', to_date('06-05-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Plummer', 'Earl', 328064068, '76 Hagerty DriveItha', '0529697270', 'earl.plummer@spas.co', to_date('15-08-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stevenson', 'Moe', 795860414, '45 Sainte-foy Street', '0541893983', 'moe.stevenson@unicru', to_date('26-11-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cohn', 'Lily', 938031275, '861 Daniel StreetIrv', '0586550592', 'lily.cohn@onesourcep', to_date('22-03-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('De Niro', 'Arnold', 320357348, '92 Bryson DriveBillu', '0579982314', 'arnold.deniro@afs.dk', to_date('25-01-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('DiBiasio', 'Cole', 749551047, '74 Kimball StreetChu', '0595152815', 'coled@gna.ch', to_date('24-03-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Downey', 'Wayne', 841009827, '36 Viterelli AveGaza', '0572781093', 'wayne.downey@wendysi', to_date('29-12-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Holiday', 'Irene', 989796718, '6 SaulMito', '0587382657', 'irene.holiday@cima.j', to_date('31-08-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Numan', 'Pierce', 973541440, '63 Evett BlvdKuopio', '0545548796', 'pierce.numan@kmart.f', to_date('18-04-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carnes', 'Garry', 647078378, '39 Jeter RoadThalwil', '0551930526', 'garry@americanland.c', to_date('25-06-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Heron', 'Rory', 347639660, '35 Witherspoon RoadD', '0598903847', 'r.heron@kelmooreinve', to_date('29-06-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Zappacosta', 'Kay', 500576999, '332 Baldwin RoadOulu', '0542855461', 'kzappacosta@gdatechn', to_date('05-06-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Van Helden', 'Derek', 660284942, '17 Loreena AveHartfo', '0574485881', 'd.vanhelden@wyeth.co', to_date('16-09-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Winter', 'Jeffrey', 790968789, '66 Yorn RoadOr-yehud', '0553324666', 'jeffrey.w@younginnov', to_date('19-04-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Broza', 'Ving', 107457083, '43rd StreetRoyston', '0532193011', 'ving@hewlettpackard.', to_date('27-07-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gallant', 'Don', 259790830, '84 Vondie RoadChirig', '0558813432', 'don.gallant@cascadeb', to_date('16-10-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Neill', 'Morris', 765898451, '54 Almaty AveFleet', '0557454202', 'morris.neill@portosa', to_date('01-12-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McDormand', 'Matt', 452532294, '52nd StreetHerdecke', '0554705420', 'matt.mcdormand@telwa', to_date('19-10-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pressly', 'Jude', 180924389, '63 Arjona AveRoma', '0599113043', 'jude.pressly@smartdr', to_date('27-02-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Warren', 'Sonny', 158008357, '12 Dylan DriveGennev', '0564852090', 'sonny.warren@ssi.fr', to_date('29-09-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carrack', 'Alex', 802477498, '57 BetteEschborn', '0557193493', 'alex.carrack@pinnacl', to_date('20-12-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Easton', 'Alannah', 421059732, '49 Mathis StreetPomp', '0545918354', 'alannah.easton@harri', to_date('29-12-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rubinek', 'Domingo', 583494240, '88 KÃ¶ln RoadOklahoma', '0592072205', 'domingo.rubinek@atxf', to_date('28-02-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ponty', 'Suzanne', 139811004, '22 ImbrugliaRichards', '0521776735', 'sponty@hencie.com', to_date('07-07-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('O''Sullivan', 'Ike', 619496468, '497 Grapevine DriveW', '0559125234', 'ikeo@contract.pl', to_date('29-10-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rain', 'Lionel', 151656920, '53rd StreetKerava', '0570456763', 'lionel.rain@career.f', to_date('21-03-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ledger', 'Gino', 439204233, '99 Garofalo StreetSe', '0562864091', 'gledger@apexsystems.', to_date('01-08-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Krumholtz', 'LeVar', 150507078, '31st StreetMapo-gu', '0572012396', 'levar.krumholtz@ssi.', to_date('25-09-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Huston', 'Vondie', 687248103, '18 Kitty RoadDeerfie', '0591668934', 'v.huston@qls.com', to_date('28-08-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Neeson', 'Jeffery', 524232756, '21 Dennis StreetBlac', '0566783246', 'jeffery.neeson@power', to_date('19-04-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Huston', 'Jessica', 729472826, '76 Camp DriveIngelhe', '0565085285', 'jessica.huston@berks', to_date('06-08-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wilkinson', 'Julio', 533216515, '42 Pigott-Smith Stre', '0564298773', 'julio.wilkinson@conq', to_date('14-10-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Burke', 'Harvey', 766713817, '44 Hynde RoadLake Fo', '0522595379', 'harvey.burke@bayer.c', to_date('18-02-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McDonnell', 'Mekhi', 306104563, '82nd StreetHeiligenh', '0573889899', 'mekhi.mcdonnell@capi', to_date('15-06-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Baez', 'Rosie', 373176861, '80 Wilkinson RoadCar', '0574295943', 'rosie.baez@mls.com', to_date('20-03-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kahn', 'Merrilee', 699763110, '71st StreetFountain ', '0599322633', 'mkahn@wyeth.com', to_date('21-05-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Northam', 'Mark', 414668590, '692 Clarence RoadSeo', '0554048667', 'mark.n@cis.com', to_date('18-08-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Goldwyn', 'Christina', 101584298, '89 Kagoshima AveBedf', '0562850264', 'c.goldwyn@epiqsystem', to_date('29-11-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Balk', 'Maura', 188901791, '63 Kevin RoadLincoln', '0595193145', 'maurab@netnumina.com', to_date('28-11-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rippy', 'Kurt', 238035478, '5 Jonatha AveNew Hav', '0525892356', 'kurt.rippy@bashen.co', to_date('14-08-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hanks', 'Sylvester', 157497482, '810 Hyde StreetSanto', '0579687749', 'shanks@vms.it', to_date('26-07-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kadison', 'Andrae', 303739378, '16 Karon DriveSydney', '0535358687', 'andrae@visionarysyst', to_date('11-05-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Clooney', 'Alessandro', 579654282, '118 Madison StreetAd', '0566764380', 'alessandro.clooney@m', to_date('27-04-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Emmett', 'Taylor', 425944003, '870 Klein StreetOden', '0553201369', 'taylor.emmett@conque', to_date('15-06-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Robards', 'Liam', 215197325, '99 Karyo StreetChere', '0541762353', 'l.robards@heartlab.c', to_date('23-07-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cattrall', 'Marina', 318789542, '12 ZahnHappy Valley', '0523913102', 'mcattrall@pis.com', to_date('14-02-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Balaban', 'Cary', 176289951, '22nd StreetRedwood C', '0597544094', 'cary@marlabs.com', to_date('28-07-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McCready', 'Sonny', 543846356, '519 Bette RoadBollen', '0573082944', 'smccready@universals', to_date('17-04-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wells', 'Mac', 259028206, '92nd StreetJuneau', '0566146563', 'mac@linksys.com', to_date('15-08-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pride', 'Lynn', 172099662, '63 George RoadKyoto', '0542287992', 'lynnp@qls.jp', to_date('12-04-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Liu', 'Cary', 853365493, '97 Spacek StreetBeke', '0524264364', 'c.liu@otbd.hu', to_date('31-10-1985', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gough', 'Gailard', 884051499, '320 Biella RoadNorth', '0535548151', 'gailard.g@seafoxboat', to_date('14-05-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Whitmore', 'Garland', 296941138, '43 ZellwegerSan Fran', '0577310642', 'garland.whitmore@aol', to_date('13-03-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cheadle', 'Madeline', 567796300, '73rd StreetYomgok-do', '0592076427', 'mcheadle@linacsystem', to_date('11-07-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Saucedo', 'Herbie', 470121309, '793 Ojeda RoadFort w', '0568918188', 'h.saucedo@progressiv', to_date('22-03-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kennedy', 'Henry', 510149735, '133 Gaby RoadEdinbur', '0522976901', 'hkennedy@signalperfe', to_date('20-09-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chaplin', 'Jamie', 953369172, '60 Eastwood BlvdTemp', '0526773281', 'jamie.chaplin@sarale', to_date('29-12-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pantoliano', 'Pablo', 939300043, '16 PowersHamburg', '0582045396', 'pablo.pantoliano@cns', to_date('05-09-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Borden', 'Nicole', 627355134, '24 Puckett AveHolts ', '0563139948', 'nicoleb@officedepot.', to_date('01-06-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Viterelli', 'Jaime', 556809614, '46 SalisburyAnnandal', '0535683001', 'jaimev@asapstaffing.', to_date('03-01-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Forrest', 'Gino', 465753415, '26 McNarland RoadLÃ¼b', '0541658104', 'gino.forrest@seafoxb', to_date('22-08-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Avital', 'Stanley', 421810164, '5 Ulm DriveBaltimore', '0587759200', 's.avital@capstone.co', to_date('30-10-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chandler', 'Phoebe', 789685574, '16 Vista RoadMatsue', '0533861848', 'phoebe.chandler@hori', to_date('14-09-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Barkin', 'Liam', 309234614, '62 StuartCopenhagen', '0554938382', 'l.barkin@cascadebanc', to_date('21-04-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Michaels', 'Lauren', 811696605, '46 Guilfoyle DriveGu', '0580354901', 'lauren.michaels@demo', to_date('23-01-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McGregor', 'Robert', 339593939, '10 Purefoy StreetVan', '0560955328', 'r.mcgregor@kiamotors', to_date('01-12-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Macht', 'Sharon', 762566292, '72 Patrick DriveGliw', '0543512985', 'sharon.macht@ecopy.p', to_date('23-11-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Feore', 'April', 501767159, '210 Tal StreetTooele', '0556830098', 'afeore@hondamotor.co', to_date('30-04-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kinnear', 'Brothers', 261539527, '33 von Sydow StreetV', '0575961592', 'b.kinnear@officedepo', to_date('17-03-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Taylor', 'Wendy', 289276888, '16 GianniniMilton Ke', '0580871431', 'wendy.taylor@benecon', to_date('31-10-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Love', 'Kyra', 825072524, '12 Chennai RoadVirgi', '0564158854', 'kyra.love@ufs.com', to_date('25-09-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Weller', 'Natacha', 741127642, '51 Pantoliano RoadSt', '0531686952', 'natacha.weller@marla', to_date('10-02-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pleasence', 'Patty', 858875113, '472 Belp StreetPoint', '0583709525', 'patty.pleasence@sear', to_date('20-04-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lauper', 'Giovanni', 767198829, '48 Mifune BlvdThessa', '0590520659', 'giovanni.lauper@cima', to_date('27-01-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Crouse', 'Teri', 621121189, '46 Roger StreetSt-la', '0559212207', 'teri.crouse@captechv', to_date('08-04-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gooding', 'Alan', 652011695, '302 MoodyOppenheim', '0566930211', 'alan.gooding@vitacos', to_date('18-07-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Parish', 'Carlos', 399467282, '169 Karlstad DriveCh', '0596751851', 'carlos.parish@usener', to_date('09-02-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Margolyes', 'Rod', 854063610, '51 Stocksbridge Driv', '0595121560', 'rod@tilsonlandscape.', to_date('02-05-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Damon', 'Loreena', 675278483, '1 Sample StreetEllic', '0548694501', 'loreena.damon@bristo', to_date('25-06-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rain', 'Tom', 159353604, '49 Hugo StreetMendoz', '0546220567', 'tom.rain@learningvoy', to_date('15-03-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Evanswood', 'Garry', 821929263, '88 Vaduz RoadBrossar', '0564449164', 'garrye@paintedword.c', to_date('12-03-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Aaron', 'Lionel', 784892920, '9 Leslie StreetSaras', '0562419168', 'lionel.aaron@balchem', to_date('16-05-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Holly', 'Merrill', 650502773, '15 Blackmore DriveVa', '0594639781', 'merrill@viacell.com', to_date('04-02-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Streep', 'Neil', 593572359, '52 New Castle DriveJ', '0566661589', 'neil.s@bmm.com', to_date('04-03-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sweet', 'Jennifer', 820500484, '42 Eder StreetMelbou', '0551722670', 'jennifer.sweet@kroge', to_date('12-01-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Perlman', 'Pelvic', 305336709, '2 Laurie RoadPaderbo', '0529131224', 'pperlman@yashtechnol', to_date('08-12-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Donovan', 'Alfie', 577311698, '15 Dunn StreetMclean', '0556528445', 'alfie.d@bestbuy.com', to_date('29-11-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gray', 'Chazz', 286609319, '42 Raye StreetSainte', '0543782093', 'chazz.gray@curagroup', to_date('18-10-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Moffat', 'Busta', 238992471, '45 Gibbons StreetKej', '0565872365', 'busta.moffat@axis.co', to_date('05-02-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Spacey', 'Nicolas', 755117221, '11 Fonda BlvdHorsham', '0559808426', 'nicolas.spacey@codyk', to_date('02-10-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Thewlis', 'Clint', 351243974, '5 Eric RoadUnionvill', '0577087028', 'clint.thewlis@yashte', to_date('20-06-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Zahn', 'Ray', 852113698, '503 Harahan RoadLake', '0566678550', 'ray@marlabs.com', to_date('12-02-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Merchant', 'Mos', 865060464, '52nd StreetEhningen', '0533349232', 'mos.merchant@spinnak', to_date('29-06-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Murdock', 'Jane', 689549835, '33 Loggins RoadMaria', '0593745027', 'janem@meritagetechno', to_date('12-01-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hagerty', 'Meg', 184755960, '85 Chris StreetKrist', '0555394793', 'meg.hagerty@fmb.no', to_date('05-09-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Boone', 'Darren', 165333583, '94 Liotta StreetHilv', '0566152557', 'darren@businessplus.', to_date('17-04-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Payne', 'Fisher', 223579296, '454 Harrison RoadSpr', '0587563440', 'fisher.payne@comglob', to_date('11-10-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Valentin', 'Ian', 188224358, '445 Peniston BlvdSan', '0523520163', 'ian@limitedbrands.co', to_date('19-01-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Crowe', 'Sophie', 964640072, '16 Hershey RoadRockf', '0559093401', 'sophie.crowe@dcgroup', to_date('17-06-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McDowall', 'Edwin', 795738202, '40 Julie DriveKobe', '0575219983', 'emcdowall@mms.jp', to_date('29-05-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Potter', 'Lindsey', 608055389, '18 Fierstein DriveSe', '0575061776', 'lindsey.potter@csi.c', to_date('09-12-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Baldwin', 'Stephen', 992127225, '81 Mykelti StreetBlo', '0554222476', 'stephen.baldwin@amer', to_date('23-04-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dukakis', 'Mika', 104169328, '63 Darren AveMount L', '0579123987', 'm.dukakis@yumbrands.', to_date('19-01-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Loring', 'Elvis', 125500395, '35 Todd RoadVaduz', '0526228488', 'elvisl@floorgraphics', to_date('09-01-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Greenwood', 'Chubby', 870619025, '438 Morse RoadKoeln', '0587952948', 'chubbyg@ibm.de', to_date('20-03-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gordon', 'Burton', 935141213, '4 CannockValencia', '0572089068', 'burton.gordon@kingla', to_date('25-07-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lipnicki', 'Kiefer', 186311936, '10 VinceMonterey', '0594090491', 'kiefer.lipnicki@adve', to_date('24-11-1958', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Short', 'Alex', 714905606, '222 Leinfelden-Echte', '0568428009', 'alex.short@tastefull', to_date('02-02-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Weisz', 'Carl', 831093867, '904 GenÃ¨ve StreetEdw', '0543329876', 'carl.weisz@entellige', to_date('09-08-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Duke', 'Derek', 373541122, '145 Nelly AveSalem', '0583358451', 'derek.d@verizon.com', to_date('14-12-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lonsdale', 'Alec', 284435188, '96 Giovanni RoadKais', '0521712080', 'alec.lonsdale@bmm.de', to_date('09-10-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Redgrave', 'Molly', 843519385, '52 Edie DriveSeatle', '0561499334', 'molly@hotmail.com', to_date('19-11-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McLachlan', 'Avril', 265119104, '14 HÃ¤ssleholm RoadKo', '0561234610', 'avril.mclachlan@digi', to_date('24-02-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Potter', 'Mickey', 689097358, '63rd StreetYamaguchi', '0529282658', 'mickey.potter@shirtf', to_date('15-07-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Matthau', 'Wallace', 456149036, '55 Nanci StreetFamba', '0579671637', 'wallace@chhc.de', to_date('01-11-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Irons', 'Carolyn', 538652540, '612 Butner DriveChaa', '0546134348', 'carolyn.irons@aquick', to_date('11-06-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Posey', 'Ewan', 746963718, '22 Paisley StreetDre', '0553345935', 'ewan.p@benecongroup.', to_date('23-08-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ripley', 'Jonny Lee', 507339068, '334 MantovaPordenone', '0528365711', 'jonnylee.ripley@dell', to_date('06-03-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Young', 'Clive', 159482460, '40 Ponta grossa Road', '0561277040', 'clive.young@evinco.c', to_date('28-08-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wincott', 'Jean', 543533587, '81 Baker RoadAurora', '0599154546', 'jean.wincott@hotmail', to_date('08-12-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Westerberg', 'Rolando', 255087016, '38 Waltham BlvdBolto', '0594827714', 'r.westerberg@mds.ca', to_date('10-06-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Utada', 'Ernest', 555636906, '81 Dysart BlvdSoest', '0589790170', 'ernest@logisticare.n', to_date('22-01-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Strathairn', 'Earl', 653072371, '58 Piacenza AveLeawo', '0520016678', 'earl.s@hudsonriverba', to_date('21-02-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kleinenberg', 'Carole', 707509224, '40 Rollins DriveLime', '0581193000', 'ckleinenberg@medsour', to_date('21-04-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Begley', 'Merle', 994265828, '16 Macau AveMt. Laur', '0591458779', 'merle.begley@comglob', to_date('18-05-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gaines', 'Mae', 165090409, '32 Rosanne BlvdTorin', '0599435153', 'mae.gaines@pioneerda', to_date('14-07-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Allan', 'Ivan', 244240688, '48 Flanery StreetUdi', '0532963338', 'ivan.allan@tama.it', to_date('25-07-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Damon', 'Elle', 339897673, '14 Lynn AveAllen', '0573669370', 'elle.damon@smg.com', to_date('17-07-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Coltrane', 'Elisabeth', 932729135, '7 Warren RoadNoumea', '0574844858', 'elisabeth.coltrane@t', to_date('31-01-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('LaBelle', 'Laurence', 256239435, '36 Tomlin BlvdReadin', '0522669215', 'laurence.labelle@car', to_date('05-04-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pfeiffer', 'Owen', 834241599, '56 Zellweger DriveMe', '0588739181', 'owen.pfeiffer@techrx', to_date('04-12-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sevenfold', 'Robert', 235345052, '98 Domino RoadSaint ', '0566935947', 'rsevenfold@usgovernm', to_date('30-09-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Belushi', 'Udo', 274340804, '37 Boyle StreetLowel', '0568891538', 'udo.belushi@abatix.c', to_date('18-01-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Deschanel', 'Swoosie', 205862893, '286 Shearer StreetCo', '0561847822', 'swoosie.deschanel@fa', to_date('26-12-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Strathairn', 'Phoebe', 817163899, '65 durham DriveLinz', '0575182602', 'phoebe.s@atlanticcre', to_date('28-12-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cruz', 'Kirk', 644336833, '49 Crimson RoadArlin', '0579390308', 'kirk.cruz@pharmafab.', to_date('10-06-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wainwright', 'Bruce', 839552387, '18 Monk StreetPitsto', '0551462580', 'bruce.w@lydiantrust.', to_date('22-10-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bailey', 'Buddy', 562834464, '92 BouchervilleKings', '0531239611', 'buddy.bailey@capston', to_date('29-09-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Newman', 'Carol', 271266299, '59 Bryan StreetNagoy', '0540638713', 'carol.newman@spectru', to_date('08-01-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sheen', 'Devon', 257468741, '19 Kyra StreetBudape', '0566163663', 'devon.sheen@restaura', to_date('31-05-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hingle', 'Jill', 353002056, '88 Dempsey StreetPur', '0531513863', 'jill.h@owm.uk', to_date('21-04-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dayne', 'Peter', 134778927, '2 Ticotin BlvdRosari', '0563508444', 'peter.dayne@lynksyst', to_date('21-02-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dunst', 'Eileen', 526367693, '23rd StreetNatal', '0569780688', 'eileend@procurementc', to_date('21-09-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Whitwam', 'Ani', 165847242, '44 Sao roque AveKans', '0544733066', 'ani@advertisingventu', to_date('24-11-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Weaving', 'Albert', 385114707, '38 Mos RoadRedondo b', '0596812655', 'a.weaving@businesspl', to_date('06-07-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fisher', 'William', 652843443, '55 Nicholas DriveSwa', '0532926251', 'william@magnet.com', to_date('18-09-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Burstyn', 'Kelly', 611710332, '70 Van Damme StreetL', '0577299960', 'kelly.burstyn@max.co', to_date('30-05-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sedaka', 'Bobby', 670578902, '3 Danni RoadBristol', '0555870588', 'bobby.sedaka@columbi', to_date('08-02-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lorenz', 'Gino', 853385648, '92 Summer RoadPark R', '0573884002', 'gino.lorenz@palmbeac', to_date('15-07-1958', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tolkan', 'Barry', 449431408, '52 Lorraine StreetWa', '0531133751', 'b.tolkan@msdw.com', to_date('08-07-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bandy', 'Doug', 660496533, '62 Koblenz RoadBekes', '0558956611', 'doug.bandy@sweetprod', to_date('30-10-1983', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Biehn', 'Cesar', 553099150, '56 Wilkinson RoadMil', '0579361138', 'cbiehn@bradleypharma', to_date('06-12-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lorenz', 'Vince', 477812004, '61 Greenwood RoadMic', '0599423994', 'vince.lorenz@csi.de', to_date('14-06-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Humphrey', 'Dabney', 982544367, '40 Dale DriveManches', '0595916153', 'dabney.humphrey@seaf', to_date('13-06-1958', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sandler', 'Ellen', 918208321, '44 Curfman AveBad Oe', '0588468970', 'ellens@ach.de', to_date('28-11-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Payton', 'Joanna', 599890817, '58 Prowse StreetNaga', '0557617961', 'joanna.payton@teoco.', to_date('17-03-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Loveless', 'Sander', 838212407, '732 Van Damme Street', '0578286080', 'sander.l@qestrel.ve', to_date('07-11-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gibson', 'Patti', 186511957, '61 Slidel AveRothenb', '0544598499', 'patti.gibson@cynergy', to_date('20-10-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Perez', 'Lindsay', 837749329, '88 Brookfield RoadTa', '0583498212', 'lindsay.perez@securi', to_date('03-10-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Singh', 'Sean', 373788557, '6 Lavigne BlvdMelbou', '0553175638', 'sean.singh@netnumina', to_date('17-03-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wagner', 'Rosanne', 356009760, '62nd StreetNorthampt', '0524779253', 'rosanne.wagner@sis.u', to_date('15-07-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Salt', 'Thomas', 386348949, '6 Del Toro StreetSyr', '0598791344', 'tsalt@northhighland.', to_date('06-10-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Harry', 'Harry', 777883031, '97 OwenRozenburg', '0522798439', 'hharry@3tsystems.nl', to_date('26-01-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bright', 'Alex', 791364724, '641 Jodie RoadSant C', '0535319575', 'abright@ceb.es', to_date('18-03-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Yulin', 'Josh', 928952772, '96 Kaiserslautern Ro', '0550714838', 'josh.y@sensortechnol', to_date('04-04-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Brickell', 'Trini', 949319984, '54 Ronny BlvdAvon', '0551985232', 'trini.brickell@safew', to_date('06-11-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Nunn', 'Lauren', 302430936, '15 Sirtis RoadBartle', '0535424698', 'lauren.nunn@palmbeac', to_date('01-11-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Elizabeth', 'Luke', 112428503, '94 MacNeil RoadNiles', '0564810542', 'luke.elizabeth@yasht', to_date('18-12-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Young', 'Howard', 595345749, '22 Silverdale AveChi', '0546296548', 'howard.y@portosan.uk', to_date('07-12-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Woodard', 'France', 209821870, '755 Anna RoadHarahan', '0557408208', 'france.woodard@signa', to_date('01-11-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bruce', 'Katrin', 631854631, '37 Scaggs StreetMaid', '0594030703', 'katrin.bruce@dell.uk', to_date('20-05-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Nivola', 'Red', 205827981, '6 Chesnutt BlvdSt-la', '0585457618', 'red.nivola@uem.ca', to_date('18-01-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Marshall', 'Ray', 900618507, '35 Brooke RoadOhtsu', '0551215243', 'ray.marshall@linacsy', to_date('07-01-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dafoe', 'Kathy', 939111048, '42 Clinton StreetBet', '0555482347', 'kathy.dafoe@paintedw', to_date('10-07-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Reed', 'Gino', 927802033, '76 Martin BlvdMt. La', '0575478789', 'gino@cimalabs.com', to_date('29-12-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Crow', 'Laurie', 295925780, '75 Santa Rosa RoadRi', '0588244635', 'l.crow@sbc.com', to_date('25-06-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sewell', 'Bernard', 281402679, '434 Gordie StreetBay', '0563014180', 'bernard.sewell@green', to_date('03-03-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wills', 'Karen', 603787067, '22 Fukui BlvdNepean', '0524176846', 'karen.wills@softworl', to_date('23-09-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McConaughey', 'Queen', 744817517, '244 Mantova AveSan R', '0573284925', 'q.mcconaughey@united', to_date('25-11-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hackman', 'Rowan', 483475435, '55 South Weber RoadB', '0575017017', 'rowan.hackman@totale', to_date('06-03-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Milsap', 'Buddy', 173430676, '22 Rosanne StreetSt-', '0581417682', 'bmilsap@hiltonhotels', to_date('19-05-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Clark', 'Leonardo', 903363912, '91 Lattimore StreetB', '0578721765', 'leonardoc@fam.com', to_date('21-10-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Damon', 'Gladys', 504967455, '517 Stevens RoadMaid', '0583729853', 'gladys@homedepot.uk', to_date('23-08-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jay', 'Seth', 901324333, '54 Douala RoadPasade', '0565875057', 'seth.j@paintedword.c', to_date('10-12-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stamp', 'Katrin', 766242929, '4 Brentwood BlvdOmah', '0559866573', 'katrins@solipsys.com', to_date('08-03-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Griggs', 'Peabo', 654307339, '948 Sedgwick BlvdNeu', '0578190786', 'pgriggs@taycorfinanc', to_date('23-03-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Haysbert', 'Randall', 536210702, '965 CaineSaint Paul', '0567907202', 'randall.h@johnson.co', to_date('08-09-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bright', 'Janice', 135445939, '453 Visnjic StreetSa', '0574969182', 'janice.bright@saltgr', to_date('28-01-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Howard', 'Carrie', 870561709, '74 Evett StreetSuffe', '0590446908', 'carrie.h@newviewgift', to_date('23-02-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Robinson', 'Dom', 170255524, '74 Randal DriveThe W', '0569884764', 'd.robinson@pfizer.co', to_date('02-09-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stiers', 'Alice', 171255463, '75 Carmen DriveOyten', '0587409936', 'alice.stiers@integra', to_date('25-10-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Withers', 'Terry', 203883392, '74 Ronstadt StreetMa', '0580340739', 't.withers@cardtronic', to_date('09-12-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lindley', 'Nathan', 751304730, '44 McCoy BlvdPalo Al', '0566241377', 'nathan.lindley@viace', to_date('31-08-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ferry', 'Marianne', 762139241, '98 LÃ¼beckPecs', '0574023827', 'marianne.ferry@anwor', to_date('11-04-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('urban', 'Deborah', 640265997, '26 Mandrell BlvdSali', '0574136219', 'deborah.urban@lifeli', to_date('05-01-1958', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Aiken', 'Freddy', 161160901, '52 Cherepovets RoadV', '0557702136', 'freddy.aiken@ibm.ca', to_date('31-10-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bloch', 'Boyd', 997173813, '81 Dianne StreetLeed', '0522529131', 'boyd@primussoftware.', to_date('02-03-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wahlberg', 'Fisher', 521421326, '96 Meyer StreetForna', '0557908667', 'fisher.wahlberg@mse.', to_date('09-07-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lennox', 'David', 808220490, '476 Sevigny DriveBaa', '0537490719', 'david.lennox@extreme', to_date('06-09-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Grier', 'Julianne', 753588281, '43 Leslie StreetHilv', '0590265649', 'julianneg@tmt.nl', to_date('29-05-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Eat World', 'Ed', 482409207, '74 Getty AveLisbon', '0551615801', 'ed.eatworld@bayer.pt', to_date('29-03-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Craig', 'Cloris', 898420707, '19 Haggard BlvdLodi', '0599526409', 'cloris.craig@horizon', to_date('24-02-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wopat', 'Tony', 116412822, '728 Rush RoadBischof', '0578981607', 'tony.wopat@adolph.at', to_date('07-07-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Webb', 'Clay', 843512931, '65 Joan StreetSursee', '0545424510', 'clay.webb@bradleypha', to_date('17-04-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tinsley', 'Jeffrey', 386906499, '259 Ratzenberger Str', '0552519658', 'jeffrey.t@waltdisney', to_date('20-03-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Liu', 'Javon', 441023695, '26 Lynn DriveBischof', '0573233705', 'javon.liu@fmb.at', to_date('28-05-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Milsap', 'Beth', 422239445, '2 Sendai AveBkk', '0524355769', 'bethm@aco.th', to_date('17-07-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cohn', 'Martha', 481161391, '12nd StreetMainz-kas', '0566265197', 'martha.cohn@cima.de', to_date('25-03-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bragg', 'Nik', 464750472, '53 Loretta StreetFre', '0587341741', 'nik.bragg@portosan.d', to_date('12-08-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Morrison', 'Elvis', 998232373, '32 TurnerHelsingborg', '0568066897', 'elvis.morrison@sps.s', to_date('09-05-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lawrence', 'Darren', 377167998, '93 McKean AveRichard', '0571220341', 'darren.lawrence@gree', to_date('11-06-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Liu', 'Powers', 341328372, '63rd StreetDen Haag', '0598023325', 'powers.liu@mwh.nl', to_date('29-09-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Oates', 'Yolanda', 546922138, '469 Valentin RoadAny', '0599904344', 'yolanda@ghrsystems.c', to_date('23-09-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fiorentino', 'Vienna', 173111638, '768 Midler StreetOld', '0559237911', 'vienna@walmartstores', to_date('20-06-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stills', 'Donald', 420933524, '78 OmarSan Francisco', '0551910758', 'donald.stills@saksin', to_date('22-04-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Nunn', 'Bebe', 247602929, '42 Bale StreetBiella', '0524691233', 'bebe.nunn@safehomese', to_date('17-04-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Oldman', 'Omar', 711979218, '99 Atkinson DriveBie', '0551995213', 'omar.oldman@onesourc', to_date('02-05-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hatchet', 'Liquid', 977594162, '80 DeVito RoadGreenw', '0545273410', 'liquid.hatchet@healt', to_date('18-02-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stevenson', 'Hank', 844372994, '73 Molly DriveWarsaw', '0557722845', 'hank.stevenson@venoc', to_date('21-01-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Loring', 'Cevin', 150275483, '22 JordanBristol', '0561452106', 'cevinl@sbc.com', to_date('15-10-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Farrow', 'Tea', 402522020, '73 Annie RoadOlympia', '0591485125', 't.farrow@gtp.com', to_date('02-12-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hopper', 'Howard', 820186449, '55 Burt DriveRicards', '0534646087', 'howard.hopper@fetchl', to_date('07-04-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tomlin', 'Nicholas', 676848037, '39 LÃ¼beck BlvdMonter', '0527923711', 'nicholas.tomlin@netw', to_date('16-03-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Shandling', 'Seth', 521050607, '51st StreetCoppell', '0548287138', 'seth.shandling@secur', to_date('18-07-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Skerritt', 'Rebeka', 513160497, '61 Summer DriveHjall', '0596909439', 'rebeka.skerritt@infi', to_date('25-05-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rivers', 'Lonnie', 334089930, '48 Spiner RoadSt-bru', '0548056267', 'lonnie@networkdispla', to_date('14-03-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Harry', 'Willie', 362590582, '81st StreetVaduz', '0553468241', 'willie.h@virbac.li', to_date('20-05-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sledge', 'Bebe', 823114910, '21 Karen DriveNarrow', '0558913821', 'bebe@scriptsave.com', to_date('22-08-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Oates', 'Scott', 713148353, '49 Fisher BlvdFort S', '0594883510', 's.oates@capellaeduca', to_date('30-12-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Redford', 'Breckin', 194400947, '747 Parsippany Drive', '0536680097', 'bredford@ois.uk', to_date('07-11-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('DiCaprio', 'Tramaine', 628551248, '167 Schreiber Street', '0576111411', 'tramaine.dicaprio@gc', to_date('01-07-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kleinenberg', 'Ryan', 649997008, '65 Ben-Gurion RoadSa', '0523749742', 'r.kleinenberg@ubp.cr', to_date('03-10-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Botti', 'Sheena', 208550790, '96 Tripplehorn RoadG', '0577024259', 'sheena.botti@dynacqi', to_date('16-10-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Elliott', 'Meg', 873043554, '501 Ming-Na DriveRed', '0521401773', 'meg.elliott@lfg.com', to_date('20-04-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Duke', 'Chloe', 369101756, '18 New Haven BlvdLak', '0591070278', 'chloe.duke@yes.com', to_date('18-10-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Harrison', 'Ronny', 494281887, '2 Slidel RoadWavre', '0590068968', 'rharrison@proclarity', to_date('05-06-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rundgren', 'Nastassja', 273750148, '38 Natacha StreetHer', '0530293171', 'nastassja.rundgren@e', to_date('09-08-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fariq', 'Connie', 464821399, '81st StreetVarzea gr', '0580932866', 'connie.fariq@general', to_date('31-08-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Allison', 'Gloria', 924210502, '76 KretschmannGaza', '0559820957', 'gloriaa@capellaeduca', to_date('10-12-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Haynes', 'Pamela', 540114031, '13rd StreetBolzano', '0529920611', 'pamela@baesch.it', to_date('19-08-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lindo', 'Gladys', 763139821, '87 MoorestownPomona', '0544059285', 'gladys.lindo@lynksys', to_date('06-10-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kershaw', 'Lennie', 435524483, '763 Smurfit DriveNae', '0589289998', 'lennie.kershaw@trini', to_date('10-01-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Macht', 'Kylie', 809377988, '55 Payton DriveDurha', '0550506947', 'kylie.macht@greenmou', to_date('08-05-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Richards', 'Maceo', 461888285, '89 Conroy StreetSton', '0549045464', 'maceo.richards@abati', to_date('01-11-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cox', 'Dylan', 364782364, '61 Cromwell RoadPara', '0598122101', 'dylan.cox@prometheus', to_date('18-04-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Preston', 'Lisa', 330509872, '38 Bean DriveJackson', '0550094035', 'lisa.preston@nuinfos', to_date('15-06-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Winger', 'Hank', 305993110, '13rd StreetFt. Leave', '0551459071', 'hank.winger@proclari', to_date('13-04-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Englund', 'Alec', 435639070, '86 Gordon RoadToyama', '0579233514', 'alece@gbas.jp', to_date('23-07-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Busey', 'Jena', 547214894, '18 Love RoadMelrose ', '0594290590', 'jena.b@gentrasystems', to_date('07-11-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tucci', 'Stellan', 498875242, '78 Hector StreetFort', '0577360061', 's.tucci@alternativet', to_date('25-01-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Weir', 'Fionnula', 165980859, '555 Berwyn DriveWaln', '0583902921', 'fionnula.weir@dell.c', to_date('01-05-1990', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tempest', 'Rhett', 239803816, '78 Bonneville DriveW', '0586935765', 'rhett.tempest@tama.j', to_date('05-09-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Piven', 'Matthew', 239697932, '74 Lonnie DriveSprin', '0586531071', 'matthew.piven@horizo', to_date('26-05-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jackman', 'Fisher', 327599490, '29 Petach-Tikva Road', '0585094604', 'fisher.jackman@anwor', to_date('14-09-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Orton', 'First', 802698033, '119 Edie StreetNorth', '0562902452', 'forton@creditorsinte', to_date('13-03-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Newton', 'Cyndi', 193473233, '23 GoodingAberdeen', '0576252009', 'cyndin@meritagetechn', to_date('24-10-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Coe', 'Kenny', 440414604, '831 Theron StreetEss', '0588915122', 'kennyc@taycorfinanci', to_date('21-09-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Goldwyn', 'Darren', 714675205, '73rd StreetPasadena', '0558105963', 'd.goldwyn@chhc.com', to_date('15-09-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carmen', 'Timothy', 926145059, '33 Dench StreetPurle', '0522793480', 'timothy.carmen@benec', to_date('10-01-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Diehl', 'Kiefer', 688591424, '990 Niigata StreetMe', '0569054555', 'kiefer@canterburypar', to_date('29-11-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tillis', 'Jeremy', 177157307, '36 Jay DrivePetach-T', '0558284381', 'jeremyt@harrison.il', to_date('02-02-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Puckett', 'Ike', 706306682, '6 Woodard RoadEiksma', '0529439491', 'ike@pearllawgroup.no', to_date('23-09-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sledge', 'Pamela', 746463143, '767 Slater StreetSuf', '0595931135', 'pamela.sledge@extrem', to_date('08-09-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Whitman', 'Neve', 467624110, '91 Turner StreetAust', '0578396235', 'nwhitman@oss.com', to_date('09-08-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Uggams', 'Linda', 477000955, '49 Margolyes StreetG', '0570548956', 'luggams@peerlessmanu', to_date('14-03-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Arkin', 'Gene', 339111948, '7 Avalon RoadGoiania', '0564919625', 'genea@timevision.br', to_date('04-11-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Reno', 'Jesse', 883025897, '31st StreetLake Oswe', '0559221558', 'jesse.reno@calence.c', to_date('16-08-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Blades', 'Sydney', 644722756, '52nd StreetFuchstal-', '0556855645', 'sydney.blades@usphys', to_date('26-03-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Davison', 'Jude', 136649431, '448 Feliciano Street', '0562035528', 'jude.davison@scherin', to_date('29-10-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mazar', 'Cole', 152977912, '74 Tucker StreetGree', '0569636490', 'cole.mazar@lms.com', to_date('22-06-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Giannini', 'Stellan', 199474377, '83 AlanaSeoul', '0526089628', 's.giannini@heritagem', to_date('03-02-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gibson', 'Solomon', 554200371, '58 Bernard AveWest C', '0591030894', 's.gibson@spas.com', to_date('28-06-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Peet', 'Holly', 612714265, '72nd StreetRancho Pa', '0563577929', 'holly@sprint.com', to_date('14-09-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Popper', 'Oded', 504234848, '26 Blades BlvdRichmo', '0576875915', 'odedp@hitechpharmaca', to_date('26-12-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bell', 'Petula', 543820399, '50 Sinead StreetBerk', '0520673958', 'petula@staffforce.co', to_date('27-06-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cruz', 'Emily', 945977436, '59 Leonardo DriveDin', '0576221746', 'emily.cruz@nsd.de', to_date('02-09-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Phoenix', 'Angela', 872367234, '68 Whitmore DriveSch', '0572733899', 'angela@studiobproduc', to_date('30-05-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Midler', 'Hector', 432595819, '91 AdamHighlands Ran', '0567455228', 'hector.midler@abs.co', to_date('31-07-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('O''Neill', 'Curt', 277703343, '76 Graz StreetReiste', '0586033794', 'curt@gha.com', to_date('23-08-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Russo', 'Andie', 759479781, '88 RookerAustin', '0584934988', 'andier@tilsonlandsca', to_date('26-05-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Russell', 'Denzel', 351332054, '417 Nepean DriveElch', '0554764799', 'denzel@simplycertifi', to_date('29-06-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Shand', 'Maureen', 422988413, '13 Scarlett StreetSw', '0568546389', 'maureen.shand@its.co', to_date('23-10-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Idol', 'Roberta', 534443040, '61 Quinlan RoadBrune', '0544216050', 'roberta.idol@wav.it', to_date('09-09-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Randal', 'Gary', 185946154, '859 Avalon StreetBen', '0570275803', 'gary@americanmegacom', to_date('11-11-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Thomson', 'Jonathan', 702864573, '66 Curtis-Hall Stree', '0532721240', 'jonathan.thomson@fla', to_date('17-01-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rhodes', 'Judge', 559464664, '42 Dick DriveHarrisb', '0531367977', 'judge.rhodes@hudsonr', to_date('21-07-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Roy Parnell', 'Moe', 268543916, '91 Steenburgen Stree', '0599304531', 'mroyparnell@vms.com', to_date('19-12-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Blackwell', 'Milla', 476784202, '7 Ramat Gan StreetTh', '0590444365', 'milla.blackwell@fnb.', to_date('15-05-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ford', 'Buffy', 240495059, '95 TamborAltamonte S', '0554550673', 'buffy.ford@summitene', to_date('29-09-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ruffalo', 'Lou', 126868783, '138 Fierstein RoadRo', '0594973808', 'lou.ruffalo@activese', to_date('27-01-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lemmon', 'Bernard', 520066928, '26 IdleKopavogur', '0522541128', 'bernardl@vesta.is', to_date('12-03-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Arnold', 'Herbie', 152135020, '658 Snipes BlvdDortm', '0520458786', 'herbie@aventis.de', to_date('13-08-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Marley', 'Meg', 688431907, '79 Penders RoadMalmÃ¶', '0521900268', 'meg.m@irissoftware.s', to_date('14-10-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sayer', 'Jeanne', 649977206, '50 Wong RoadNeuquen', '0538065621', 'jeanne.sayer@nsd.ar', to_date('23-04-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Keeslar', 'Helen', 524151934, '58 Sossamon AveWarre', '0563963654', 'hkeeslar@employerser', to_date('31-05-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McCain', 'Janice', 211688357, '91 Appenzell StreetM', '0567051315', 'jmccain@signature.co', to_date('12-05-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lewin', 'Azucar', 663404655, '95 TommyCary', '0542394254', 'azucar.lewin@flavorx', to_date('07-01-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Furay', 'Kieran', 718428613, '11 BarryNew orleans', '0595359989', 'kieran.f@prioritylea', to_date('21-01-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rhys-Davies', 'Stanley', 447390845, '56 Isabella RoadOak ', '0582067832', 'stanley.rhysdavies@a', to_date('27-08-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Landau', 'Geggy', 395234141, '554 Giamatti RoadKur', '0535184911', 'geggy.landau@tmt.au', to_date('04-05-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bullock', 'Nicholas', 662996368, '73rd StreetMagstadt', '0587784451', 'nicholas.b@solipsys.', to_date('18-12-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kershaw', 'Freddy', 713264703, '13rd StreetMendoza', '0529859412', 'freddy@mss.ar', to_date('16-11-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Zevon', 'Rickie', 109338019, '44 Stoneham RoadKago', '0569739731', 'rzevon@carteretmortg', to_date('13-12-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tobolowsky', 'Alex', 922656620, '14 Palmieri StreetCh', '0568542780', 'alex.tobolowsky@wlt.', to_date('24-11-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kane', 'Derek', 364957248, '92 New orleans RoadC', '0531522065', 'derek@thinktanksyste', to_date('07-03-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Clark', 'Wang', 950522575, '44 Spike AveBoulder', '0569904502', 'wclark@granitesystem', to_date('28-10-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Suvari', 'Gilbert', 138192266, '66 Flower moundBiell', '0556560164', 'gsuvari@httprint.it', to_date('25-02-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chinlund', 'Gin', 508491962, '40 Kevn BlvdDarmstad', '0556541032', 'gin.chinlund@mms.de', to_date('28-04-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Brothers', 'Adina', 356102475, '86 CreekAltamonte Sp', '0558365307', 'adina.brothers@emplo', to_date('08-06-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cumming', 'Gilbert', 613658145, '20 Towson RoadClaymo', '0544550853', 'g.cumming@qssgroup.c', to_date('26-07-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hawthorne', 'Manu', 908754150, '87 Cattrall RoadSuwo', '0597848855', 'manu.hawthorne@newho', to_date('26-06-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bachman', 'Faye', 347481888, '87 Trieste DriveWint', '0521683560', 'faye.bachman@telepoi', to_date('01-09-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('MacNeil', 'Owen', 568530914, '16 Manchester Street', '0560146356', 'owen@elmco.se', to_date('06-06-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Schiff', 'Ozzy', 902674875, '17 EdwinAnn Arbor', '0532728288', 'ozzys@fflcbancorp.co', to_date('09-04-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Schneider', 'Marisa', 595470885, '762 TorresBarksdale ', '0597883405', 'marisa.schneider@gcd', to_date('07-12-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ruiz', 'Terrence', 580488974, '31 Colleen RoadHaywa', '0522610660', 'terrence@mcdonalds.c', to_date('15-06-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Marx', 'Nicholas', 242585762, '82 Chaplin RoadRicha', '0571368786', 'nicholas.marx@author', to_date('09-11-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hong', 'Lionel', 615613414, '61st StreetChinnor', '0567935967', 'lionel@sprint.uk', to_date('07-12-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Shaye', 'Red', 111598232, '58 Lou StreetAdamsto', '0528498117', 'red.shaye@bashen.au', to_date('12-01-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chilton', 'Tracy', 699124064, '76 Wheel RoadHercule', '0582035469', 'tracy.chilton@bat.co', to_date('10-08-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kelly', 'Patty', 481548013, '42 Chilton DriveEdin', '0546568773', 'patty.kelly@spenser.', to_date('01-08-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Belle', 'Wally', 719059544, '63 Presley RoadRoche', '0570323460', 'wally@pds.com', to_date('30-04-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wong', 'Frankie', 266759777, '78 Collective Street', '0599588591', 'frankie.wong@avs.pl', to_date('28-04-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Aiken', 'Paul', 156186136, '897 Geoff RoadNiles', '0587100887', 'paul.aiken@horizon.c', to_date('15-09-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Adams', 'Hex', 626327405, '9 Sugar Hill StreetL', '0597070261', 'hex.adams@fmt.com', to_date('27-08-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lennix', 'Kitty', 952156579, '174 WÃ¶rthWageningen', '0559196231', 'kitty.lennix@america', to_date('25-06-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Thorton', 'Jonatha', 988686001, '70 Place StreetSt-br', '0580843316', 'jonatha.thorton@mag.', to_date('07-04-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Luongo', 'Carlene', 942896799, '90 Boorem RoadHong K', '0552084839', 'carlene.luongo@gentr', to_date('12-10-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dafoe', 'Loren', 248542834, '59 Colon StreetSprin', '0539332345', 'lorend@career.com', to_date('30-05-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('DiFranco', 'Kurtwood', 605661788, '20 LithgowTaoyuan', '0598767351', 'kurtwood.d@lloydgrou', to_date('07-10-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Thorton', 'Cesar', 944853689, '70 Albany RoadHerfor', '0530424854', 'cesar@kingland.de', to_date('30-06-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Doucette', 'Ellen', 517094574, '66 Joe RoadErlangen', '0540609192', 'ellen.d@northhighlan', to_date('21-01-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mann', 'Morgan', 803721923, '72nd StreetBoston', '0564298018', 'mmann@nha.com', to_date('06-03-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Franklin', 'Marianne', 237642726, '1 VillataHeubach', '0534188894', 'marianne.franklin@pa', to_date('11-09-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Secada', 'Brittany', 901297210, '22nd StreetBretzfeld', '0543198007', 'bsecada@harrison.de', to_date('02-12-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Abraham', 'Donald', 404883551, '7 Malkovich RoadFort', '0523875268', 'donald.abraham@gatew', to_date('21-07-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carlisle', 'Giancarlo', 817135362, '13 Clooney BlvdBoise', '0581569685', 'giancarlo.carlisle@p', to_date('18-04-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pryce', 'Neneh', 641650573, '24 Branch BlvdKuraby', '0568363759', 'n.pryce@linersdirect', to_date('06-12-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Drive', 'Carl', 223886311, '88 Nick BlvdKwun Ton', '0577545651', 'carl@cima.hk', to_date('30-09-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Holmes', 'Alec', 564278748, '72 Sharp RoadNuernbe', '0574385872', 'alec@hencie.de', to_date('11-05-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McDonnell', 'Ice', 729089904, '36 Crosby BlvdLaurel', '0539926942', 'ice@adeasolutions.co', to_date('01-11-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Paquin', 'Clive', 764799376, '63 Hazel RoadCalcutt', '0567238926', 'clive.paquin@saltgro', to_date('09-05-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Westerberg', 'Rowan', 466419010, '71 Morales StreetMar', '0597698778', 'rwesterberg@montpeli', to_date('22-07-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stoltz', 'Denny', 961191521, '58 Williamstown Driv', '0583688516', 'denny.stoltz@kingsto', to_date('30-11-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Turner', 'Morris', 200440687, '44 MenaNynÃ¤shamn', '0583503366', 'morris.turner@diamon', to_date('05-12-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Irving', 'Vienna', 708442139, '7 Gough BlvdBrampton', '0530516717', 'vienna@dearbornbanco', to_date('31-12-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Crow', 'Joseph', 992508462, '1 Lara StreetLodi', '0529065171', 'joseph.crow@north.it', to_date('15-10-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cherry', 'Bette', 560734429, '44 McAnally StreetJa', '0557083181', 'bette.c@lydiantrust.', to_date('06-11-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stiers', 'Kirk', 337884271, '76 Cross AveGranada ', '0552671072', 'k.stiers@cis.com', to_date('03-10-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Vaughan', 'Leslie', 100263721, '51 Neville DriveAlco', '0553127804', 'leslie.vaughan@jma.e', to_date('25-04-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Murdock', 'Judd', 513296641, '98 Parish RoadCincin', '0546633268', 'judd.m@americanmegac', to_date('28-02-1982', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Warburton', 'Melba', 516978043, '69 Krumholtz BlvdVee', '0544261836', 'melba.warburton@ecop', to_date('12-03-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Summer', 'Rebeka', 176473026, '10 Mifune DriveBurwo', '0598694090', 'rebeka@webgroup.au', to_date('19-01-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Winstone', 'Avril', 535677385, '23 Redhill RoadWest ', '0546946057', 'avril.winstone@clubo', to_date('10-11-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Payne', 'Lari', 346456880, '28 Biehn RoadRaleigh', '0541540490', 'lari.payne@johnson.c', to_date('21-06-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rhames', 'Sheena', 622724191, '51 Tucker StreetSton', '0544503996', 'sheena.rhames@advert', to_date('26-11-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Purefoy', 'Remy', 368489397, '82 RobbinsNew hartfo', '0588839515', 'remyp@interfacesoftw', to_date('08-11-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sedaka', 'Morris', 723363449, '80 Tyne & Wear AveAs', '0591885856', 'morriss@quicksilverr', to_date('08-03-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hayes', 'Warren', 116256616, '21 Mellencamp RoadPo', '0578195065', 'w.hayes@chipssolutio', to_date('29-03-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Patillo', 'Zooey', 142820189, '41st StreetMiddletow', '0536532538', 'zooey.patillo@johnke', to_date('05-11-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Weller', 'Kyra', 616795784, '98 Derek StreetLagun', '0596939251', 'kyra.weller@marriott', to_date('11-10-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Boorem', 'Richie', 596859064, '20 SnipesDes Plaines', '0593505455', 'richie.boorem@its.co', to_date('02-08-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rhodes', 'Gates', 813563203, '64 Teng RoadBangalor', '0538298518', 'gates.rhodes@zoneper', to_date('30-06-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lipnicki', 'Mos', 179630502, '60 Hatosy DriveZueri', '0534285982', 'mos.lipnicki@primuss', to_date('30-12-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lucas', 'Nickel', 650174181, '2 Collin AveWetzlar', '0531198071', 'nickell@americanland', to_date('27-06-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lloyd', 'Rolando', 774685438, '38 Arlington StreetW', '0582791317', 'rolando@mqsoftware.c', to_date('25-10-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Janney', 'Janice', 578289418, '53 Getty StreetHampt', '0542180434', 'janice.janney@lloydg', to_date('24-08-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McFerrin', 'Geraldine', 359947996, '73 Demi StreetSantan', '0531376070', 'geraldine.mcferrin@v', to_date('02-04-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Duchovny', 'Debby', 624946704, '130 Peterborough Blv', '0599681413', 'debby.duchovny@scher', to_date('15-11-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Irons', 'Mika', 870772763, '82 Luke StreetPortla', '0572449068', 'mirons@americanexpre', to_date('14-02-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gibson', 'Thora', 833368610, '92nd StreetGainesvil', '0596515411', 'thora@computersource', to_date('14-11-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Torino', 'Marlon', 213078687, '56 JuliaWarszawa', '0547192840', 'marlon@usgovernment.', to_date('25-11-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Glover', 'Peabo', 617803626, '55 Shelton BlvdBreme', '0551671886', 'peabog@ipsadvisory.d', to_date('13-05-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Conroy', 'Rawlins', 886541617, '71 Pat AveHamburg', '0577389582', 'rawlins@medsource.de', to_date('15-04-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Flack', 'Joey', 899703325, '43 Balthazar DriveTa', '0536902306', 'joey@usdairyproducer', to_date('15-06-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chilton', 'Jody', 239068973, '24 Sylvian RoadAiken', '0597232019', 'jchilton@egroup.com', to_date('13-04-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('May', 'Laura', 692067497, '31st StreetValencia', '0560076171', 'laura.m@streetglow.e', to_date('19-07-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sedaka', 'Mary-Louise', 140899169, '978 Chaka BlvdTualat', '0548154360', 'marylouise.sedaka@co', to_date('27-12-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Patillo', 'Graham', 519251336, '70 Rita StreetSwarth', '0539701733', 'graham@linacsystems.', to_date('27-10-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Roy Parnell', 'Mykelti', 607515527, '67 GordieKoeln', '0545372279', 'mykelti.royparnell@u', to_date('29-07-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rippy', 'Leslie', 284698328, '33 Norderstedt RoadC', '0560386674', 'leslie.rippy@profitl', to_date('14-01-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bush', 'Adina', 835782579, '59 Sinise StreetCamb', '0567545704', 'abush@esoftsolutions', to_date('30-09-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cazale', 'Louise', 706752831, '301 Hal StreetVenice', '0573354735', 'louisec@shufflemaste', to_date('27-08-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Malone', 'Bette', 394178853, '145 Karon AveHelsink', '0597398322', 'bette.malone@progres', to_date('08-02-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Roth', 'Gailard', 865234658, '78 Carlos StreetMend', '0573427950', 'gailard.roth@tropica', to_date('29-09-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Miles', 'Sinead', 122924782, '73 Remy RoadThessalo', '0598300813', 'sinead.m@conquest.gr', to_date('07-05-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hornsby', 'Humberto', 145927171, '19 Dern StreetShenzh', '0574533319', 'humbertoh@providence', to_date('08-03-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Geldof', 'Loretta', 251000829, '38 Anjelica StreetNa', '0588587335', 'lorettag@als.br', to_date('19-12-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Coe', 'Parker', 228186196, '364 Giessen DriveHor', '0520385071', 'parker.coe@larkinent', to_date('26-09-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rosas', 'Salma', 420590479, '44 Travolta RoadChib', '0524823038', 'salma.rosas@generalm', to_date('01-11-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Schwarzenegger', 'Cledus', 747171108, '93 Zappacosta RoadKa', '0587012634', 'cledus.schwarzenegge', to_date('19-11-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Guinness', 'Elizabeth', 582785824, '14 Meppel BlvdCharle', '0522755868', 'elizabeth.g@pfizer.c', to_date('27-04-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Harary', 'Kelly', 383331309, '18 Holland AveOyten', '0567841922', 'kelly.harary@tilsonl', to_date('21-05-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Goldblum', 'Buffy', 134024937, '42 Phillips DriveMen', '0558567651', 'buffy.goldblum@novar', to_date('06-09-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('O''Neal', 'Joshua', 517027671, '10 Thomas StreetYama', '0584870440', 'joshua.oneal@viacom.', to_date('29-05-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hopkins', 'Goran', 961635098, '55 Norton DrivePecs', '0551981222', 'goran.hopkins@fflcba', to_date('11-03-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('England', 'Busta', 124475793, '302 McKean StreetOrl', '0586025693', 'busta.england@newmed', to_date('08-04-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rhys-Davies', 'Ryan', 875005373, '455 Lynch BlvdWest S', '0596580234', 'ryan@sourcegear.uk', to_date('18-03-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dourif', 'Henry', 686936415, '81st StreetNorth Poi', '0587710469', 'hdourif@servicelink.', to_date('11-12-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Choice', 'Ali', 895069447, '33 Keeslar DriveCobh', '0555965308', 'ali.choice@target.uk', to_date('07-12-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Liu', 'Edie', 434134560, '412 Bend StreetSan D', '0522314747', 'edie.liu@parker.com', to_date('19-06-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lattimore', 'Tracy', 553053573, '71 Dawson AveLahr', '0579252485', 'tracy.lattimore@lina', to_date('29-12-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Skerritt', 'Steve', 504376224, '9 SurseeSchenectady', '0529949748', 'steve@tropicaloasis.', to_date('18-06-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Graham', 'Hector', 152851236, '56 Fornacette DriveP', '0551586068', 'hgraham@northhighlan', to_date('06-06-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lloyd', 'Kimberly', 590266488, '68 Wills BlvdHerndon', '0520191892', 'kimberly.lloyd@alleg', to_date('31-08-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chesnutt', 'Rosanna', 116564125, '314 Rosie StreetBiel', '0542190280', 'rosanna.chesnutt@you', to_date('29-03-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Clooney', 'Simon', 662412459, '4 Hagerty DriveDubai', '0576900674', 's.clooney@entelligen', to_date('26-02-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Saucedo', 'Rick', 359685316, '48 Swoosie BlvdKyunn', '0575098507', 'rick@diamondgroup.co', to_date('08-01-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Zevon', 'Kelli', 423830430, '52 Kretschmann RoadC', '0547837595', 'kelli.z@egroup.uk', to_date('12-09-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cobbs', 'Sheena', 384875242, '73 Wills StreetRanch', '0587434877', 'sheena.cobbs@investm', to_date('21-01-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bean', 'Robbie', 360945723, '30 Reed StreetSlmea', '0556892216', 'robbie.bean@kroger.c', to_date('13-06-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carrack', 'Natacha', 211506203, '314 Metcalf StreetLi', '0568727580', 'natacha.carrack@info', to_date('23-03-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Geldof', 'Sammy', 560895976, '19 Llewelyn StreetMo', '0556294240', 'sammy.geldof@captech', to_date('18-06-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wong', 'Morris', 606989493, '524 Byrne RoadLowell', '0523336094', 'mwong@infovision.com', to_date('26-01-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Collette', 'Howard', 988611196, '43 Saudarkrokur AveD', '0584510100', 'howard.collette@nrae', to_date('06-02-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tah', 'Whoopi', 898255498, '79 Lennox RoadToledo', '0523238086', 'whoopi.tah@ccb.es', to_date('05-02-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hector', 'Carolyn', 801292271, '28 Presley RoadSprin', '0569896300', 'carolyn.h@uem.com', to_date('29-04-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Downey', 'Ted', 449039583, '224 Armatrading Road', '0559966747', 'tdowney@datawarehous', to_date('07-03-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Weiss', 'Cuba', 305199304, '51 Mary-Louise RoadZ', '0552001606', 'cuba.w@ksj.nl', to_date('31-05-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carlton', 'Harrison', 375096553, '93 Moraz StreetDroge', '0566681586', 'harrison.carlton@ves', to_date('05-09-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Connelly', 'Alan', 988206602, '33rd StreetPasadena', '0588754535', 'alan.connelly@qssgro', to_date('16-02-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Taylor', 'Mos', 378936331, '76 Albert DriveSappo', '0589198755', 'm.taylor@at.jp', to_date('02-02-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Noseworthy', 'Rade', 258710627, '21st StreetColumbia', '0547293823', 'rade.noseworthy@msdw', to_date('03-05-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Estevez', 'Nicole', 409477082, '72nd StreetFort gord', '0529472819', 'nicole.e@prosperityb', to_date('07-03-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McAnally', 'Max', 504850343, '97 Hannover StreetMa', '0527167963', 'max.mcanally@astute.', to_date('23-09-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Devine', 'Miko', 352958905, '72 Prague RoadSt Kil', '0554433864', 'miko.devine@onesourc', to_date('01-10-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sledge', 'Mike', 179865058, '59 Pirapora bom Jesu', '0589794897', 'mikes@ataservices.de', to_date('01-03-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jackson', 'Wayman', 416400715, '91st StreetSulzbach', '0567324715', 'wayman.jackson@balch', to_date('21-01-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Reilly', 'Coley', 508135001, '501 Preston StreetBa', '0599534070', 'creilly@generalelect', to_date('18-06-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mirren', 'Vin', 605815385, '99 BirminghamSouth H', '0569798984', 'vin.mirren@telwares.', to_date('28-09-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stuermer', 'Jonatha', 632915045, '43 LaPaglia BlvdRoth', '0579222181', 'jonatha.stuermer@fds', to_date('16-11-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Logue', 'Madeline', 967108709, '96 Snoqualmie RoadWe', '0588548657', 'mlogue@speakeasy.com', to_date('11-05-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Olin', 'Katie', 855566871, '50 Paltrow RoadTries', '0582022729', 'katie.olin@provident', to_date('25-03-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Springfield', 'Laurence', 617187928, '51 Brothers BlvdSt. ', '0555071000', 'laurences@mitsubishi', to_date('09-02-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Marx', 'Darren', 862384357, '153 Davison RoadSnoq', '0542284541', 'darren.marx@campbell', to_date('24-05-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Reid', 'Gord', 712253430, '98 Pam DriveGrand-me', '0529522328', 'gord.reid@hewlettpac', to_date('29-11-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gayle', 'Todd', 327572937, '18 Shenzhen BlvdNort', '0587211697', 'tgayle@monarchcasino', to_date('24-12-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wagner', 'Cheech', 997042482, '3 Farnham RoadMilfor', '0545600843', 'cheech.w@lemproducts', to_date('31-10-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Eat World', 'Jeremy', 947447478, '42nd StreetLehi', '0580661953', 'jeremye@accuship.com', to_date('11-12-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Khan', 'Kid', 302883694, '18 Frances RoadDen H', '0548783841', 'kid.khan@ufs.nl', to_date('11-12-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Yorn', 'Dan', 359020902, '431 Fender RoadPhoen', '0536553086', 'dan.yorn@ultimus.com', to_date('29-09-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McGoohan', 'Taye', 162788221, '43 Jackie RoadForest', '0530704425', 'taye.mcgoohan@fsffin', to_date('14-05-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dzundza', 'Raymond', 811616794, '44 Elvis DriveCape t', '0539789099', 'r.dzundza@sfgo.za', to_date('12-12-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Peebles', 'Julie', 558414787, '66 Wright RoadHanove', '0570431650', 'julie.peebles@execus', to_date('05-09-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kleinenberg', 'Radney', 512089472, '1 Wade StreetHappy V', '0542585070', 'radney.kleinenberg@a', to_date('21-07-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Buffalo', 'Mia', 481955115, '746 Ciudad del Este ', '0551876527', 'mia.buffalo@max.jp', to_date('13-10-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Curtis-Hall', 'Angie', 776213891, '63 LaMond RoadHiller', '0599966885', 'angie.curtishall@acc', to_date('17-06-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Noseworthy', 'Rose', 691546607, '141 TurturroBismarck', '0585898061', 'rose@perfectorder.co', to_date('23-09-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kapanka', 'Michael', 724567455, '3 Baker AveCedar Rap', '0586644391', 'michael.kapanka@tmar', to_date('27-11-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Deejay', 'Jon', 579846464, '58 Zappacosta RoadBa', '0595425674', 'jon@epiqsystems.ch', to_date('06-06-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Numan', 'Sandra', 689909495, '8 Heather StreetPhoe', '0547805624', 'sandra.numan@hondamo', to_date('28-08-2003', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fariq', 'Alex', 237202063, '50 Rhona RoadGranada', '0570582452', 'afariq@cws.com', to_date('05-09-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sawa', 'Jet', 722837047, '83 HecheRichmond', '0562073966', 'jet@priorityleasing.', to_date('16-11-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Nelson', 'Gord', 549493698, '30 Perrineau StreetB', '0532138269', 'gord.nelson@stiknowl', to_date('24-10-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Scheider', 'Owen', 106135727, '94 Lynette BlvdMilfo', '0564366976', 'o.scheider@dillards.', to_date('28-05-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Vance', 'Garth', 560287870, '781 Columbia AveTrar', '0586227067', 'garth@americanexpres', to_date('23-09-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Phillippe', 'Rawlins', 883352788, '978 Hounslow StreetN', '0527088231', 'rawlins.phillippe@ro', to_date('01-08-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Theron', 'Robin', 801444708, '87 Shawnee RoadAuckl', '0535692664', 'robin.theron@doralde', to_date('01-01-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('urban', 'Andrae', 649642534, '24 Elizabeth StreetM', '0536712387', 'andrae.urban@advance', to_date('28-08-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Branch', 'Chaka', 130649999, '61st StreetSao jose ', '0530515937', 'chakab@faef.br', to_date('10-07-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Preston', 'Sean', 647853816, '82 Cesena RoadTowson', '0521577120', 'sean.preston@prahs.c', to_date('03-07-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cumming', 'Cliff', 510550199, '23 LauraKuraby', '0548321978', 'cliffc@entelligence.', to_date('14-03-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Geldof', 'Tea', 387684814, '128 Silverman BlvdHi', '0543429745', 'tea.geldof@tropicalo', to_date('26-04-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sanders', 'Omar', 373231071, '15 Edison StreetMaid', '0528904674', 'omar@capitalautomoti', to_date('26-02-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Piven', 'Tilda', 869062772, '72 BloemfonteinCerri', '0538070672', 't.piven@technica.com', to_date('10-09-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Folds', 'Lucinda', 980157606, '12 Stavanger StreetK', '0593215843', 'lucinda.folds@cardin', to_date('13-09-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bush', 'Cheryl', 213824396, '16 Trace StreetMiddl', '0550310874', 'cheryl.bush@trafficm', to_date('13-08-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Donelly', 'Juice', 589087677, '98 Gin RoadFramingah', '0590901554', 'j.donelly@cendant.co', to_date('31-05-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Paige', 'Moe', 610500243, '709 Donovan StreetBa', '0529436103', 'moe.paige@kingland.c', to_date('06-06-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Presley', 'Graham', 579447207, '83 Bates RoadBay Sho', '0533610429', 'graham.presley@cyner', to_date('08-09-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Uggams', 'Alfie', 205404893, '31st StreetSaint Oue', '0568299082', 'alfie.uggams@employe', to_date('25-04-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tucci', 'Scott', 730131503, '73 Warren DriveRtp', '0590847307', 'scott.tucci@maverick', to_date('29-11-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Penders', 'Benjamin', 315723206, '80 BalkUdine', '0572569527', 'benjamin.penders@afs', to_date('19-06-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Perez', 'Charles', 606192787, '52 Nils DrivePompton', '0564451755', 'charles@mre.com', to_date('03-09-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Crow', 'Geoff', 261453365, '66 Diddley AveSao pa', '0576685283', 'geoff.crow@gna.br', to_date('16-01-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Keener', 'Balthazar', 515076394, '810 Lahr RoadRaleigh', '0524334724', 'balthazark@connected', to_date('22-06-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hopkins', 'Yaphet', 652775670, '40 Busta DriveMissis', '0575720796', 'yaphet.hopkins@montp', to_date('22-11-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Horton', 'Marie', 882458516, '1 Blue bell RoadGold', '0576431728', 'm.horton@nuinfosyste', to_date('15-01-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Navarro', 'Shannyn', 264250868, '25 Zooey DriveVallau', '0563607229', 'shannyn.navarro@tele', to_date('25-08-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gaynor', 'Kevn', 749309034, '74 Johansson RoadSac', '0557606279', 'kevn.gaynor@biosite.', to_date('23-10-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Page', 'Tom', 479816079, '14 Bruce RoadSt. Pet', '0596858572', 'tom.page@scheringplo', to_date('09-05-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Theron', 'Bret', 906935306, '982 Lavigne StreetEi', '0549148745', 'bret.theron@tropical', to_date('24-08-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('DeGraw', 'Marty', 918376496, '16 Mason RoadTulsa', '0588835314', 'marty.degraw@pfizer.', to_date('13-05-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lewis', 'Mira', 590142450, '72 Oszajca DriveSpar', '0544382956', 'mira.lewis@newmedia.', to_date('03-06-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ammons', 'Jose', 302128747, '5 Takapuna RoadBelmo', '0559561816', 'jose.ammons@carteret', to_date('31-12-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Evanswood', 'ChantÃ©', 136082895, '13 Gugino StreetWate', '0556645621', 'chante@captechventur', to_date('21-01-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Langella', 'Tori', 591691784, '100 HowieNorth bethe', '0565954380', 'tori.langella@telech', to_date('04-03-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stigers', 'Alfred', 563119002, '90 Sulzbach DrivePra', '0537196046', 'alfred.stigers@cimal', to_date('23-09-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Springfield', 'Lloyd', 233778896, '52 Allan DriveGuamo', '0558308212', 'lloyds@nlx.it', to_date('23-05-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Balin', 'Roscoe', 933741466, '64 Irati RoadFraming', '0583601493', 'rbalin@gtp.com', to_date('18-08-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bracco', 'Naomi', 226930564, '44 Morioka DriveLibe', '0576705934', 'naomi.bracco@unileve', to_date('08-02-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Colon', 'Micky', 227798879, '748 Springville Road', '0580308252', 'micky.colon@neogen.d', to_date('10-05-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Austin', 'Gary', 152434577, '89 Saucedo RoadFlowe', '0524467778', 'gaustin@ezecastlesof', to_date('19-03-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Perrineau', 'Harrison', 897245844, '86 Santiago StreetSh', '0575339505', 'harrison.perrineau@b', to_date('14-07-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Palminteri', 'Rita', 668108605, '35 Pryce RoadWarring', '0584102064', 'rita@gsat.uk', to_date('20-01-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Domino', 'Gailard', 129559122, '35 Carlene AveRoches', '0522373886', 'gailard.domino@sbc.c', to_date('14-11-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cockburn', 'Bonnie', 464691516, '54 Pete RoadMainteno', '0523169416', 'bonnie.cockburn@cale', to_date('30-04-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Weisberg', 'Jann', 428981116, '58 Luongo AveGliwice', '0526030576', 'jann.weisberg@floorg', to_date('17-02-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Katt', 'Dick', 902680441, '59 Stallone BlvdNord', '0595625025', 'd.katt@vivendiuniver', to_date('19-03-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Smith', 'Rupert', 995102445, '77 NicksCromwell', '0520029715', 'r.smith@scripnet.com', to_date('15-07-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McCain', 'Angela', 596687100, '91st StreetKarlstad', '0545888949', 'angela.mccain@kramon', to_date('22-06-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Boorem', 'Luis', 304631430, '51 Alannah StreetPan', '0573779571', 'luis@cns.dk', to_date('03-08-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Crow', 'Allison', 253660155, '69 Loggins StreetNew', '0556567081', 'allison.c@gci.uk', to_date('08-05-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Klein', 'Collin', 825589019, '68 Schiavelli BlvdDr', '0596095888', 'collin.klein@america', to_date('06-04-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Posey', 'Mika', 293395846, '78 Gilbert RoadCarac', '0553854332', 'mika.p@hitechpharmac', to_date('14-05-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Griffiths', 'Kieran', 672173613, '86 Rhames RoadEindho', '0589822625', 'kgriffiths@spectrum.', to_date('02-07-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Richter', 'Alana', 800947932, '30 Stephanie BlvdLex', '0520399818', 'alana@pra.com', to_date('13-11-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rosas', 'Ernie', 971253183, '12 Basinger RoadDarm', '0565222697', 'ernier@sht.de', to_date('06-02-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jolie', 'Roberta', 571964290, '53 Parker StreetElki', '0525548810', 'roberta.jolie@sms.co', to_date('11-04-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wright', 'Bridget', 237550382, '76 Guadalajara RoadR', '0570894943', 'bridgetw@calence.com', to_date('26-03-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lang', 'Holland', 196774196, '75 WainwrightSan Mat', '0592788442', 'holland.lang@daimler', to_date('05-05-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Quinones', 'Nicole', 243336161, '89 Shearer DriveTerr', '0538206658', 'nicole.quinones@mind', to_date('03-01-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Atkinson', 'Shannyn', 815079157, '77 Rupert RoadOr-yeh', '0551684509', 'satkinson@ubp.il', to_date('19-04-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Branch', 'Carol', 439108826, '95 Al BlvdNorth Wale', '0557805795', 'carol.branch@tropica', to_date('31-08-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McGinley', 'Franz', 555439745, '28 Cathy DriveAniÃ¨re', '0550802068', 'franz.mcginley@bashe', to_date('05-09-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mohr', 'Shawn', 187932356, '221 Adrien RoadLubbo', '0595848113', 'shawn@bluffcitysteel', to_date('16-10-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Johansson', 'Nathan', 380693543, '30 Horton AveSchaumb', '0567513687', 'njohansson@fab.com', to_date('21-10-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bridges', 'Rowan', 519115066, '7 JuliaPottendorf', '0596418005', 'r.bridges@formatech.', to_date('22-11-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wells', 'Derrick', 886763148, '72nd StreetJuazeiro', '0554738141', 'derrickw@dcgroup.br', to_date('08-12-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McKennitt', 'Vanessa', 909692263, '67 Berlin DriveBrook', '0553551803', 'vanessa.mckennitt@ci', to_date('17-05-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Apple', 'Eliza', 345166422, '88 Brothers StreetAi', '0571059680', 'eliza@ungertechnolog', to_date('09-10-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Thornton', 'Kurtwood', 727135472, '88 Eastwood DriveZÃ¼r', '0550328156', 'kurtwood@daimlerchry', to_date('16-10-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lange', 'Alfie', 141282302, '37 Elias StreetGatti', '0588589935', 'alfie@gillette.it', to_date('06-08-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Witherspoon', 'Edgar', 555266510, '71st StreetVejle', '0578940181', 'edgar.witherspoon@cw', to_date('02-08-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chestnut', 'Joey', 252534268, '69 Cummings RoadNaes', '0559703305', 'joey.chestnut@epamsy', to_date('04-03-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tomlin', 'Rita', 314279440, '64 Emma StreetVelizy', '0525535250', 'rita.tomlin@tps.fr', to_date('12-06-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Aniston', 'Pablo', 281928156, '960 MifuneKerava', '0576225212', 'pablo.aniston@americ', to_date('12-08-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ali', 'Arnold', 720802953, '56 Jay RoadLongueuil', '0543632660', 'arnold.ali@commworks', to_date('11-08-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Minogue', 'Maura', 449889052, '55 Dunn DriveNagasak', '0583585377', 'maura.minogue@sci.jp', to_date('15-08-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ronstadt', 'Marc', 934146705, '74 Freddie DriveFost', '0594383741', 'marc.ronstadt@sm.com', to_date('12-04-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Place', 'Albertina', 180260530, '78 Pryce StreetMagst', '0538134576', 'aplace@smartdrawcom.', to_date('17-04-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Costello', 'Maury', 791571885, '16 Warden DriveNew o', '0572707257', 'maury.costello@sandy', to_date('01-01-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pfeiffer', 'Rik', 765141502, '153 Middletown RoadB', '0540790783', 'rik.pfeiffer@scjohns', to_date('20-07-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Holland', 'Alana', 741630052, '66 Branch StreetMain', '0525785881', 'alana@monitronicsint', to_date('21-08-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mould', 'Samantha', 408887477, '36 Copenhagen RoadPo', '0581035210', 'samantha.mould@mwp.c', to_date('07-12-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dean', 'Demi', 447025734, '82 Tripplehorn RoadS', '0579863006', 'demi.dean@envisionte', to_date('17-08-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gyllenhaal', 'Geena', 919668566, '50 Malkovich DriveSp', '0539399232', 'geena.gyllenhaal@ser', to_date('04-04-1958', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Boothe', 'Harvey', 777766872, '50 Wine RoadVenice', '0569420585', 'hboothe@employerserv', to_date('14-02-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Serbedzija', 'Helen', 137303403, '7 Kennedy DriveWest ', '0528108723', 'h.serbedzija@traffic', to_date('28-03-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lynne', 'Anjelica', 609721920, '89 Ramsey BlvdSeatle', '0567589823', 'anjelica.lynne@progr', to_date('19-04-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('White', 'Fionnula', 207311408, '413 McCracken RoadCh', '0593639491', 'fionnulaw@printingfo', to_date('04-07-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Whitman', 'Gilbert', 299400522, '787 Alana StreetChar', '0548079918', 'gilbert.w@electrical', to_date('27-06-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Moorer', 'Isaac', 235740365, '62 Forrest BlvdSloug', '0552067554', 'isaac.moorer@denaliv', to_date('20-01-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Keitel', 'Giovanni', 429375037, '201 Arlington BlvdKo', '0575873300', 'giovanni.keitel@gene', to_date('23-09-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bancroft', 'Peter', 582653293, '59 Owen AveNorth Poi', '0578588741', 'peter.bancroft@cws.h', to_date('09-12-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cantrell', 'Caroline', 942497422, '26 Connick StreetBat', '0596387690', 'caroline.c@allegiant', to_date('12-09-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Avital', 'Kyle', 409406958, '1 Masur BlvdUniversi', '0570729450', 'kyle.avital@yumbrand', to_date('05-06-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('LaSalle', 'Shannyn', 384200842, '2 Longview AveNara', '0570394463', 'shannyn.lasalle@gtp.', to_date('27-02-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jamal', 'Daryle', 842479128, '78 Roddy StreetPader', '0551830893', 'daryle.jamal@morganr', to_date('16-01-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Presley', 'Vertical', 210362659, '39 Dinslaken DriveLe', '0527634162', 'verticalp@atlanticne', to_date('01-03-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pleasence', 'Kid', 378235774, '66 Cole StreetDuesse', '0532021316', 'kidp@coldstonecreame', to_date('04-04-1951', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rawls', 'King', 831143606, '63rd StreetObfelden', '0530271191', 'king.rawls@integrate', to_date('08-10-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Visnjic', 'Hilary', 349204048, '9 Gleeson RoadSt. Lo', '0568724599', 'hilary@businessplus.', to_date('12-03-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hackman', 'Johnny', 250846779, '21 Parker RoadBruxel', '0562707864', 'johnnyh@bashen.be', to_date('15-06-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wood', 'Jonathan', 994736896, '83 Gary DriveLucca', '0584300840', 'jonathan.wood@nexxtw', to_date('21-02-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Swinton', 'Clay', 673666777, '655 VisselhÃ¶vedeEhni', '0597250891', 'clays@coadvantageres', to_date('12-03-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Orlando', 'Josh', 966318049, '238 Coburg DriveLein', '0568637270', 'josh.orlando@saltgro', to_date('23-09-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tate', 'Alice', 182751848, '59 Caroline DriveDou', '0599892245', 'alice.tate@sears.com', to_date('06-02-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lynskey', 'Gailard', 340151288, '97 MÃ¶nchengladbach B', '0554278202', 'gailard.lynskey@proc', to_date('14-01-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hampton', 'Ming-Na', 504560822, '59 Russell DriveSulz', '0526400523', 'mingna.hampton@natur', to_date('01-02-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Akins', 'Curt', 497473243, '81 Miller DriveMecha', '0576279093', 'curt.akins@unit.com', to_date('11-05-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ceasar', 'Gabriel', 944938337, '885 Ammons BlvdSanta', '0593207776', 'gabriel.c@limitedbra', to_date('01-07-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kramer', 'Julio', 405450694, '82 Klugh RoadZuerich', '0562836888', 'juliok@tropicaloasis', to_date('07-04-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Driver', 'Queen', 947288590, '13 Michelle BlvdLima', '0555952362', 'queen.driver@mms.pe', to_date('31-05-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dillane', 'Tommy', 834919245, '63 NicholasGuadalaja', '0582141392', 'tommy.dillane@americ', to_date('20-01-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Shand', 'Vivica', 750927412, '78 Hamilton StreetPa', '0538660739', 'vivica.shand@atg.com', to_date('02-09-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Blaine', 'Maxine', 755938204, '6 San Antonio AveRic', '0589205899', 'mblaine@monarchcasin', to_date('21-01-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tyler', 'Jet', 951651032, '99 Nelligan BlvdMelb', '0585777818', 'jtyler@oss.au', to_date('18-12-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McNarland', 'Forest', 802083312, '80 Amos StreetChapec', '0582294182', 'fmcnarland@accessus.', to_date('25-06-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cross', 'Todd', 674918060, '27 Los Angeles AveSc', '0580370515', 'todd.cross@spinnaker', to_date('25-12-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Duncan', 'Debbie', 313155436, '35 Chet AveJuazeiro', '0529553564', 'debbie.duncan@typhoo', to_date('26-04-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Milsap', 'Gordie', 419288079, '954 Zuerich StreetFo', '0588668203', 'gordie.milsap@lempro', to_date('24-11-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Holland', 'Johnette', 366343244, '40 Galecki StreetRed', '0572976466', 'j.holland@gcd.com', to_date('20-04-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Easton', 'Brad', 778303327, '11 CerritosSantiago', '0548282013', 'b.easton@conquestsys', to_date('11-02-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cube', 'Denzel', 413831858, '64 Ohtsu RoadSalem', '0532693023', 'denzel@adolph.com', to_date('11-09-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Garza', 'Hal', 515300589, '3 Sledge BlvdEl Paso', '0571927148', 'hal.garza@millersyst', to_date('06-07-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Weisz', 'Nicolas', 905681181, '18 Sydney DriveUtrec', '0522285000', 'nicolas.weisz@gra.nl', to_date('14-11-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pastore', 'Brian', 329900476, '86 Cook DriveShrevep', '0573360495', 'bpastore@biosite.com', to_date('30-03-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hauser', 'Cate', 214158330, '51 Firth DriveManche', '0563435299', 'chauser@credopetrole', to_date('15-08-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hoffman', 'Juan', 769300586, '94 Miki StreetPorto ', '0573060707', 'juan.h@elitemedical.', to_date('21-05-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Astin', 'Rosco', 272359299, '86 Chapman StreetSor', '0526717061', 'rosco.astin@nsd.dk', to_date('30-08-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gellar', 'Jared', 571147818, '79 Tcheky AveBradent', '0537080521', 'jaredg@avr.com', to_date('30-06-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Guest', 'Lili', 617650844, '53 PaulMobile', '0549489198', 'lguest@acsis.com', to_date('03-11-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Potter', 'Miguel', 748086158, '197 DiddleyRotterdam', '0533442476', 'miguel.potter@simply', to_date('21-06-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carnes', 'Anthony', 135572787, '51st StreetRichardso', '0599519265', 'anthony@ubp.com', to_date('04-01-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Piven', 'Drew', 115840139, '23rd StreetSt. Louis', '0589061228', 'drew.p@allstar.com', to_date('17-03-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Coburn', 'Daryl', 949047821, '24 Tempest StreetSto', '0589484474', 'darylc@trainersoft.c', to_date('21-12-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pantoliano', 'Bernie', 496484333, '476 Overstreet RoadT', '0576473477', 'b.pantoliano@ultimus', to_date('12-12-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Berkeley', 'Meg', 604417034, '46 Anna RoadOxon', '0522503690', 'meg@teamstudio.uk', to_date('25-08-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Brock', 'Anna', 482161968, '35 Nanci DriveZurich', '0583074656', 'annab@netnumina.ch', to_date('22-04-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lynne', 'Gavin', 514054546, '133 Cockburn StreetR', '0565061521', 'gavin.lynne@idlabel.', to_date('29-09-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Spacek', 'Sam', 356886576, '14 DerrickBerkshire', '0578934154', 'sam.spacek@gha.uk', to_date('31-08-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Palmieri', 'Jeff', 116737317, '36 Milano RoadAkron', '0592919201', 'jeffp@hcoa.com', to_date('25-02-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cook', 'Ted', 758098653, '13 Bragg DriveBuffal', '0584087683', 'ted.cook@sandyspring', to_date('12-10-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Neuwirth', 'Night', 207347544, '47 CaanWaalwijk', '0561335314', 'night.neuwirth@glmt.', to_date('01-01-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Nelligan', 'Joely', 919497083, '25 Wolf DriveRiverda', '0527858941', 'joely.nelligan@base.', to_date('05-10-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Burns', 'Nicholas', 270363284, '88 Peter AveResearch', '0529149421', 'nicholas.burns@jsa.c', to_date('02-02-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Caan', 'Collin', 275351971, '13rd StreetChangwon-', '0560606105', 'collin@glacierbancor', to_date('14-08-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Allen', 'Joseph', 793697568, '7 Dorry StreetSingap', '0591115321', 'joseph.allen@tigris.', to_date('11-06-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Posener', 'Kevin', 171117624, '21st StreetDerwood', '0532498666', 'kevin@tmt.com', to_date('29-08-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chandler', 'Bernard', 178211795, '690 CarreyEnglewood', '0582320411', 'bernard.chandler@trx', to_date('20-09-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Adkins', 'Nile', 784497084, '64 Timonium RoadMayf', '0594723580', 'nile.adkins@ssi.com', to_date('14-11-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fishburne', 'Victor', 851533997, '19 Holliston StreetS', '0551631599', 'victor.fishburne@emt', to_date('09-08-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('O''Hara', 'Shirley', 952094084, '704 Samrand RoadTori', '0588990145', 'shirley.ohara@fnb.it', to_date('12-10-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carrey', 'Mac', 179950333, '72nd StreetSt. Peter', '0532506117', 'mac.carrey@jewettcam', to_date('08-11-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McLachlan', 'Vondie', 595024753, '66 von Sydow RoadGra', '0527098748', 'vondie.m@tilsonhr.co', to_date('03-01-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Schock', 'Larnelle', 869296845, '93 Tustin AveShrevep', '0547664374', 'larnelle@ois.com', to_date('25-09-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Li', 'Temuera', 535975740, '51 O''Connor RoadBerg', '0546554613', 'temuera@knightsbridg', to_date('06-09-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Finn', 'Jackie', 869810116, '77 Carrington Street', '0541402993', 'jackie.finn@scripnet', to_date('20-02-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Love', 'Geoffrey', 825149858, '68 Santana RoadRtp', '0556949442', 'geoffrey@elmco.com', to_date('24-02-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gooding', 'Ernie', 214482676, '44 IsaacsMorioka', '0563681813', 'ernie@ciwservices.jp', to_date('01-03-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Diehl', 'Sal', 905792119, '527 Brussel AveMonum', '0585765441', 'sald@newtoninteracti', to_date('12-07-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stiles', 'Aida', 403208661, '1 CarlingfordWetzlar', '0525517324', 'astiles@ibfh.de', to_date('23-03-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hingle', 'Cheech', 991207433, '4 Apple StreetNew Yo', '0588068037', 'chingle@avr.com', to_date('23-11-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fisher', 'Chi', 953237471, '56 Campbell AveOyten', '0540101488', 'c.fisher@ezecastleso', to_date('05-01-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Yorn', 'Barbara', 115714750, '96 Terrence AveVilni', '0597128575', 'barbara.yorn@sprint.', to_date('03-06-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ojeda', 'Dom', 330470584, '88 ReaDuluth', '0557819339', 'domo@veritekinternat', to_date('15-09-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cornell', 'Mel', 294298351, '97 West Sussex BlvdD', '0567490433', 'melc@clorox.de', to_date('16-08-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Supernaw', 'Julie', 996027713, '83 Mahoney BlvdIrvin', '0558395163', 'julie.supernaw@beste', to_date('04-02-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kilmer', 'Saffron', 474737518, '92 Berlin DriveOak P', '0520914755', 'saffron.kilmer@woron', to_date('26-02-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('DiBiasio', 'Hank', 217280363, '45 Heather RoadMorio', '0539846412', 'hank.dibiasio@seafox', to_date('20-08-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fariq', 'Amanda', 276658821, '16 MurphyGreenville', '0532168373', 'amanda@afs.com', to_date('09-11-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Monk', 'Gino', 751880443, '25 Nikka RoadLaurel', '0552213525', 'gino.monk@telwares.c', to_date('22-09-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chapman', 'Milla', 751921020, '38 Cary StreetEchiro', '0578477188', 'milla@aquascapedesig', to_date('21-06-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Swinton', 'Mira', 411522632, '23 Isaiah AveDublin', '0541769539', 'mira.swinton@pds.com', to_date('06-12-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Greene', 'Kyra', 501774140, '29 Larter StreetNico', '0543888700', 'k.greene@trafficmana', to_date('05-04-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Travolta', 'Carla', 723010786, '92nd StreetKoppl', '0541401448', 'carla.travolta@procl', to_date('25-04-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pearce', 'Bryan', 286048247, '23 Margulies DriveBr', '0549828004', 'bryan.pearce@airmeth', to_date('17-11-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bonneville', 'Rufus', 340355003, '56 Eliza DriveOmaha', '0576866448', 'rufusb@enterprise.co', to_date('05-11-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rhames', 'Lydia', 921153447, '35 Sinise BlvdTsu', '0539101340', 'lydia.rhames@painted', to_date('29-06-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Field', 'Terri', 605351268, '190 Ball StreetMiche', '0545625550', 'terri.f@usdairyprodu', to_date('03-06-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Nash', 'Walter', 311783430, '8 Hal RoadBrisbane', '0599509145', 'wnash@networkdisplay', to_date('27-01-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mollard', 'Bernie', 667498153, '78 Brickell StreetCh', '0579497571', 'bmollard@infinity.co', to_date('17-08-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ferrer', 'Jerry', 847052090, '394 Walken StreetMac', '0598351538', 'jerryf@seafoxboat.mo', to_date('03-09-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dalton', 'Neve', 121670912, '68 Rizzo DriveGlenda', '0570363663', 'neve@seafoxboat.com', to_date('02-04-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Griggs', 'Patty', 812565282, '96 Emilio DriveWaldb', '0597409728', 'p.griggs@fordmotor.d', to_date('30-12-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Minogue', 'Hugo', 384551100, '93 Niven RoadBirmens', '0588690999', 'h.minogue@providence', to_date('19-09-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Branch', 'Dave', 144935536, '71 Sugar LandIlmenau', '0551639489', 'dave.branch@tmt.de', to_date('17-04-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cusack', 'Curt', 128514981, '309 Mainz-kastel Dri', '0540994960', 'curtc@at.pt', to_date('02-05-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Brooke', 'Matt', 872176788, '162 Nepean BlvdSant ', '0566457413', 'mbrooke@kellogg.es', to_date('30-01-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fiennes', 'Darius', 796808759, '6 HuntingtonSarasota', '0578178927', 'darius@coadvantagere', to_date('08-07-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Brooks', 'Debbie', 642240490, '31 Jimmy StreetHiros', '0585507319', 'debbie.brooks@johnso', to_date('04-02-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Leachman', 'Rebecca', 850686802, '392 Chilton StreetLi', '0552866346', 'rebecca.leachman@mul', to_date('01-12-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Harmon', 'Cuba', 951414878, '565 Sedgwick AveBroo', '0595445184', 'cuba.harmon@outsourc', to_date('15-11-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cocker', 'Lauren', 390685535, '62nd StreetJacksonvi', '0571055735', 'lcocker@gha.com', to_date('17-10-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carmen', 'Carl', 596597833, '81st StreetKagoshima', '0583715331', 'carl@keith.jp', to_date('27-03-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kinney', 'Rickie', 659837175, '68 Johnnie StreetNeu', '0560099935', 'rickie.kinney@servic', to_date('31-08-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Richards', 'Mena', 554527112, '67 Imbruglia StreetO', '0593948288', 'mena.richards@coridi', to_date('13-02-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Myers', 'Oliver', 463485464, '89 Callow StreetMats', '0550546122', 'oliver.myers@aoltime', to_date('13-03-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Posener', 'Viggo', 288148854, '72 Brampton StreetHa', '0531294975', 'viggo.posener@base.c', to_date('05-12-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Coverdale', 'Michael', 662961970, '13 Fehr RoadFair Law', '0595699433', 'michael.coverdale@ba', to_date('27-05-1953', 'dd-mm-yyyy'));
commit;
prompt 700 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Osbourne', 'Fionnula', 464273123, '33 Armatrading RoadN', '0586892316', 'fionnula.o@fiberlink', to_date('14-11-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bracco', 'Julia', 597172182, '30 Munich RoadMarian', '0539562573', 'j.bracco@carteretmor', to_date('20-03-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Assante', 'Val', 112371177, '20 Kinski DriveMinne', '0533851910', 'val@novartis.com', to_date('13-01-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Duncan', 'Naomi', 413997128, '370 Recife RoadSappo', '0589148297', 'naomi.duncan@berkshi', to_date('20-09-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Penn', 'Anne', 573372169, '31 Marie RoadJun-nam', '0586103664', 'anne.penn@globalwire', to_date('16-12-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pullman', 'Terence', 244487381, '87 Green RoadStockho', '0553454521', 'terence@prosperityba', to_date('26-08-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bell', 'Mili', 563475632, '33 Hawn StreetGreen ', '0579140472', 'milib@woronocobancor', to_date('03-08-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kleinenberg', 'King', 417582361, '533 Swinton RoadGote', '0596745580', 'king.kleinenberg@asa', to_date('09-10-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fonda', 'Emma', 382284930, '74 Uma StreetMt. Lau', '0568419390', 'emma.fonda@printcafe', to_date('22-02-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Costner', 'Ricardo', 888906304, '332 Mykelti DriveBad', '0550100993', 'ricardo.costner@fibe', to_date('06-08-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Connelly', 'Colm', 714477015, '63 Sobieski StreetFu', '0552475286', 'colm.connelly@cmi.jp', to_date('04-12-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Huston', 'Rick', 538544311, '33 Fukushima DriveCa', '0538514934', 'rick.huston@signalpe', to_date('23-08-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Shepard', 'Seann', 314514324, '93 Stockholm RoadDal', '0593590302', 'seann.shepard@bluffc', to_date('21-10-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Smurfit', 'Tanya', 279754521, '80 HackmanLos Angele', '0534071601', 'tsmurfit@ecopy.com', to_date('05-12-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Oates', 'Kazem', 703394240, '40 AltstÃ¤tten Street', '0566670713', 'koates@kwraf.za', to_date('22-08-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cleese', 'Gil', 231388652, '9 Clooney StreetVill', '0532030895', 'gil.cleese@ris.it', to_date('09-05-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Amos', 'Lance', 361855385, '786 Macy DriveSnoqua', '0546602979', 'lance.amos@topicsent', to_date('18-12-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Redford', 'Juliana', 705868228, '98 Garry StreetOlszt', '0571390078', 'juliana.redford@chip', to_date('01-12-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McClinton', 'Kiefer', 537470693, '21 Ferrer DriveAnnan', '0581662844', 'kiefer.m@faef.com', to_date('14-07-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Eldard', 'Seth', 625507880, '90 Fort Saskatchewan', '0572967619', 'seth.eldard@bis.it', to_date('11-12-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rhames', 'Miriam', 912035052, '100 Angelina StreetE', '0592612974', 'miriam.rhames@valley', to_date('30-12-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gary', 'Bret', 234659034, '53 BlanchettHounslow', '0584960849', 'bret.gary@idas.uk', to_date('29-07-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Morse', 'Kathy', 259072853, '59 Cruz StreetWashin', '0561234561', 'kathy.morse@volkswag', to_date('09-03-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Robards', 'Tara', 752621705, '72 Montreal BlvdKobl', '0527795324', 'tara.robards@infopro', to_date('07-12-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sarandon', 'Trey', 861892572, '228 Thornton RoadGra', '0525964893', 'tsarandon@dsp.com', to_date('23-08-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Moore', 'Sara', 332990580, '30 Chrissie RoadKago', '0575944812', 'sara.moore@voicelog.', to_date('23-02-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cassidy', 'Sally', 219529975, '93 Gertner RoadMosco', '0568279299', 's.cassidy@lms.com', to_date('07-05-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hayes', 'Hilary', 548455601, '64 Ness DriveNewcast', '0591151495', 'hilary.hayes@shar.uk', to_date('18-09-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jenkins', 'Ming-Na', 609056245, '100 McElhone DrivePa', '0556283812', 'm.jenkins@dbprofessi', to_date('03-04-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Costa', 'Harrison', 254279826, '20 Joey RoadTempe', '0593596381', 'harrison.costa@parke', to_date('17-06-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Aiken', 'Maceo', 844176169, '23rd StreetRochester', '0554894475', 'maceo.aiken@simplyce', to_date('29-06-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Craven', 'Rip', 128080684, '70 Rochester StreetM', '0528681013', 'ripc@campbellsoup.co', to_date('04-10-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tanon', 'Richard', 792078922, '55 Newton-le-willows', '0542487876', 'richard.tanon@kingla', to_date('23-08-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lorenz', 'Micky', 711765883, '72 Sapporo StreetEde', '0550816482', 'micky@ctg.uk', to_date('10-06-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gleeson', 'Jude', 243894587, '27 Grand-mere RoadHa', '0542370069', 'jude.gleeson@wrgserv', to_date('19-04-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Folds', 'James', 302976561, '29 Dar StreetMason', '0523932173', 'jamesf@balchem.com', to_date('22-03-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kutcher', 'Collective', 724170292, '13 Keeslar BlvdAlcob', '0574214467', 'collectivek@avs.es', to_date('09-08-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Balin', 'Jonny', 319239141, '19 Wayans DriveWoodb', '0594434579', 'jonny.balin@fsffinan', to_date('25-05-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Quinlan', 'Toni', 613728092, '651 Gandolfini Stree', '0561052164', 'toni.quinlan@refiner', to_date('22-10-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mathis', 'Tilda', 845781590, '35 MylesWaldorf', '0541569124', 'tilda.mathis@uniteda', to_date('09-07-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wright', 'Woody', 190698424, '31st StreetWoodland ', '0557601466', 'w.wright@jlphor.com', to_date('25-08-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Forrest', 'Teena', 970290021, '23rd StreetAvon', '0575226235', 'teena.forrest@kramon', to_date('27-11-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Negbaur', 'Praga', 520075641, '91st StreetPark Ridg', '0594274342', 'praga.negbaur@priori', to_date('22-06-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('urban', 'Mili', 799073463, '53rd StreetLake wort', '0540251712', 'miliu@scjohnson.com', to_date('09-04-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Aglukark', 'Samantha', 103777251, '34 Levert AveHorsham', '0540837184', 'samantha.aglukark@wc', to_date('08-02-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pleasure', 'Toni', 621758975, '191 Jarvis AveBarben', '0525706581', 'toni.pleasure@cardin', to_date('06-05-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Salonga', 'Liquid', 769195766, '976 Judd StreetChiri', '0594850160', 'liquid.salonga@wendy', to_date('27-05-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('LaBelle', 'Gene', 566541568, '73rd StreetMount Lau', '0558963568', 'gene.labelle@volkswa', to_date('18-06-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Barrymore', 'Remy', 433663895, '95 Molly RoadBraintr', '0590832162', 'remyb@mai.uk', to_date('31-08-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kinski', 'Tramaine', 246462174, '78 Vantaa DriveAracr', '0572756379', 'tramaine.kinski@wend', to_date('24-12-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Armatrading', 'Catherine', 707084605, '70 Marin StreetEnsch', '0572442692', 'catherinea@sbc.nl', to_date('21-01-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Burmester', 'Jean-Luc', 153049726, '42 Almond StreetBelg', '0565147504', 'jeanluc.burmester@te', to_date('08-08-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Van Damme', 'Terry', 738015436, '30 Yamaguchi StreetG', '0566627160', 'tvandamme@perfectord', to_date('03-08-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pleasence', 'Leelee', 746566968, '42 Withers RoadErlan', '0524469881', 'leeleep@dell.de', to_date('30-01-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stowe', 'Jake', 800709158, '65 Dempsey RoadGlend', '0595601486', 'jake.stowe@venoco.co', to_date('31-07-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Quinlan', 'Rueben', 944746756, '32 Blaine BlvdCopenh', '0578440201', 'r.quinlan@perfectord', to_date('17-11-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rio', 'Maxine', 245270380, '24 Dawson StreetIrat', '0562503052', 'maxine@infinity.br', to_date('17-09-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Laurie', 'Shawn', 216501493, '29 Herzogenrath Road', '0573337170', 'slaurie@ads.uk', to_date('12-01-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Whitley', 'Brothers', 210204404, '21 Maria BlvdPittsbu', '0591821263', 'brothers.whitley@tec', to_date('26-06-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cantrell', 'Gord', 996740789, '73 Shorter RoadMorio', '0522331764', 'gord@ach.jp', to_date('10-03-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jay', 'King', 984544484, '51 Knutsford AveStey', '0578730305', 'kingj@ams.at', to_date('15-08-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gandolfini', 'Sylvester', 783469465, '476 Dwight RoadBozem', '0520341404', 'sylvester.g@mosaic.c', to_date('29-07-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Leguizamo', 'Robin', 961261795, '80 Burstyn RoadN. ft', '0530768165', 'robin.leguizamo@adva', to_date('01-02-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cervine', 'Bobbi', 477520608, '33 Diggs RoadLongueu', '0566742858', 'bobbic@firstsouthban', to_date('09-04-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Isaacs', 'Isaac', 833029470, '84 O''Donnell StreetN', '0555365960', 'isaac.isaacs@credito', to_date('26-10-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Vaughn', 'Elvis', 572152065, '6 Dushku RoadVeenend', '0545290438', 'elvis.v@grayhawksyst', to_date('22-03-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lennix', 'Minnie', 859974578, '81 Keeslar DriveMumb', '0568605688', 'minnie.lennix@gsat.i', to_date('14-01-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Quatro', 'Miguel', 115385560, '64 CarmenHearst', '0556954744', 'miguel@stonetechprof', to_date('23-03-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Oates', 'Simon', 771900720, '28 Macau StreetOppen', '0589652919', 'simon.oates@vivendiu', to_date('30-03-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Del Toro', 'Andie', 846551850, '12 Kattan StreetPari', '0542451270', 'adeltoro@marketbased', to_date('26-09-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Duke', 'Jamie', 685378695, '91 RikLeeds', '0584984170', 'jduke@ipsadvisory.uk', to_date('04-02-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Saxon', 'Collin', 219988479, '21st StreetNarrows', '0592680635', 'collin.saxon@wendysi', to_date('12-10-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sylvian', 'Colleen', 670043861, '254 Briscoe DriveHor', '0524558025', 'colleen.sylvian@daim', to_date('17-04-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fox', 'Victor', 568666955, '75 Sanders RoadRueil', '0559828468', 'victor.fox@apexsyste', to_date('31-01-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gaynor', 'Trey', 611970814, '95 Rio DriveEdinburg', '0534150485', 'tgaynor@hersheyfoods', to_date('07-05-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Li', 'Rufus', 562129084, '5 Rosas DriveGennevi', '0526394839', 'rli@pulaskifinancial', to_date('03-06-1965', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Farris', 'Hugo', 196863311, '892 Kirsten BlvdHapp', '0529464183', 'hugo.farris@floorgra', to_date('03-01-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Krabbe', 'Neneh', 576082588, '78 Slater BlvdBlue b', '0566987440', 'nenehk@usgovernment.', to_date('30-09-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Li', 'Parker', 681488617, '91st StreetTampa', '0580248535', 'parker.li@mre.com', to_date('04-04-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Collie', 'Kris', 840387216, '5 Kristofferson Blvd', '0536289150', 'krisc@staffforce.es', to_date('08-07-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Warden', 'Isaiah', 274342049, '22nd StreetWaite Par', '0599779739', 'isaiah.warden@mitsub', to_date('19-05-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Weaving', 'Mint', 456283050, '72 Mathis DriveBirke', '0527845574', 'mint.weaving@topicse', to_date('10-10-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('DeLuise', 'Debbie', 306141435, '63rd StreetBerlin-Ad', '0551233732', 'debbie.deluise@socke', to_date('04-08-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cozier', 'Trace', 910230564, '874 Shirley DriveCha', '0520582152', 'trace.cozier@america', to_date('20-06-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Owen', 'Rascal', 116827917, '97 Kirk StreetNew or', '0590214752', 'rascal@viacom.com', to_date('27-09-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Krieger', 'Sander', 798134438, '67 Winwood RoadEast ', '0558562095', 'sander.krieger@beste', to_date('12-08-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rodgers', 'Carl', 767092023, '11 Plimpton RoadGenÃ¨', '0530676704', 'carl.rodgers@accurat', to_date('30-07-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Benson', 'Ritchie', 389446619, '24 Giamatti DriveTar', '0580455593', 'ritchie.benson@provi', to_date('23-12-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Paul', 'Robby', 123863694, '51 Scaggs RoadCape t', '0520431721', 'robbyp@bioanalytical', to_date('04-12-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McDonnell', 'Molly', 167822567, '61 Duncan StreetWald', '0521470698', 'molly.mcdonnell@mqso', to_date('12-08-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Quinn', 'Rosanne', 443807373, '106 Viggo RoadEnglew', '0568244737', 'rosanne@msdw.com', to_date('18-03-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hagerty', 'Ewan', 349631451, '46 Schaumburg DriveM', '0545536275', 'ewan@vitacostcom.com', to_date('17-06-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hawke', 'Donna', 961886608, '64 Daryl DriveSoutha', '0531719941', 'donna.hawke@hatworld', to_date('31-01-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wolf', 'Leelee', 135021415, '88 Aurora BlvdFlower', '0541388798', 'leelee.w@bps.com', to_date('04-06-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Franklin', 'Hookah', 439929751, '30 San Ramon DriveSa', '0566165714', 'hookah.franklin@fds.', to_date('13-05-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gibbons', 'Toshiro', 555880862, '82nd StreetTallahass', '0549804947', 'toshiro.gibbons@gree', to_date('04-04-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ferrell', 'Omar', 342067673, '32 Arkenstone AveSto', '0543361097', 'omar.ferrell@gci.com', to_date('29-03-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ramirez', 'Mary', 410475086, '84 Bern RoadMechanic', '0568143343', 'mary.ramirez@uniteda', to_date('20-11-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Feore', 'Roger', 112698927, '9 Sizemore RoadStanf', '0575087495', 'roger.feore@studiobp', to_date('18-10-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Arkin', 'Merrill', 417588505, '24 Kenny StreetVarze', '0550017853', 'merrill.arkin@lfg.br', to_date('12-12-1998', 'dd-mm-yyyy'));
commit;
prompt 800 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Forrest', 'Emilio', 475497389, '779 Maintenon Street', '0563910231', 'eforrest@sfmai.de', to_date('04-12-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Griffiths', 'Coley', 468133232, '65 Dench StreetGosla', '0570012982', 'coley@trx.de', to_date('24-03-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ferry', 'Ozzy', 714192146, '26 Downie StreetBad ', '0524133716', 'ozzy.f@fmb.de', to_date('08-10-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Torino', 'Crispin', 754870922, '86 Phifer RoadSalt L', '0545804928', 'crispin.t@pinnaclest', to_date('02-04-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bosco', 'Vienna', 602061618, '581 Street RoadChesh', '0583576645', 'vienna@sunstream.uk', to_date('04-03-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fierstein', 'Charlton', 280808740, '18 Lincoln BlvdTerni', '0593921647', 'charlton.fierstein@e', to_date('23-05-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('O''Keefe', 'Gabriel', 660112269, '590 Hirsch DriveSeat', '0574514144', 'gabriel.okeefe@gulfm', to_date('25-12-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('English', 'Shannyn', 135006846, '60 Holliston RoadBre', '0537635480', 'senglish@spotfirehol', to_date('04-01-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('MacDowell', 'Dylan', 593204826, '3 Brooke BlvdBurwood', '0527880106', 'd.macdowell@oss.au', to_date('22-02-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Penn', 'Lizzy', 649553663, '30 Belushi RoadMarke', '0590865450', 'lizzyp@jcpenney.uk', to_date('10-04-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rollins', 'Rolando', 278373086, '62 HarrisonWinterthu', '0585615542', 'rolandor@procter.ch', to_date('14-12-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Def', 'Alex', 442932469, '42nd StreetPaÃ§o de A', '0523522903', 'adef@marlabs.pt', to_date('23-04-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stevens', 'Jann', 431113150, '32 Zipf RoadMagstadt', '0559762147', 'j.stevens@ris.de', to_date('21-06-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Whitaker', 'Chad', 813358702, '9 Schock StreetNepea', '0535960903', 'chad.whitaker@dell.c', to_date('20-09-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cooper', 'Helen', 429436272, '23 Lexington RoadCol', '0549931797', 'helen@vms.com', to_date('21-03-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carradine', 'Colin', 223053783, '70 Hunter StreetNort', '0540220037', 'colinc@mastercardint', to_date('18-02-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hidalgo', 'Jerry', 604813385, '143 Winnipeg DriveHe', '0525214066', 'j.hidalgo@glmt.de', to_date('29-05-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Klugh', 'Ernie', 351922829, '92 Manning RoadSydne', '0565277270', 'eklugh@bat.au', to_date('01-08-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stampley', 'Mae', 243238131, '22 Hiroshima RoadVar', '0534198466', 'mae.stampley@studiob', to_date('02-01-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Burrows', 'Candice', 899207934, '50 Rickman DriveKwun', '0591316950', 'cburrows@paisley.hk', to_date('19-09-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Myles', 'Cathy', 488422806, '57 Arnold AveL''union', '0529464833', 'cathy.m@procter.fr', to_date('04-09-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('DiFranco', 'Clay', 496069738, '84 Rossellini BlvdSe', '0531608731', 'clay.d@mindworks.com', to_date('07-08-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lerner', 'Desmond', 293713016, '43 Alessandro AveEas', '0598992200', 'desmond.lerner@staff', to_date('29-10-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Street', 'Holly', 431116476, '21 EppsMonterrey', '0542098880', 'holly.street@efcbanc', to_date('25-06-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hart', 'Dermot', 592090896, '83 Nancy DriveSpresi', '0598562741', 'd.hart@actechnologie', to_date('12-12-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stone', 'Jaime', 609870937, '54 Oldham RoadRecife', '0544621329', 'jaime@savela.br', to_date('20-10-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Paul', 'Vivica', 504738753, '17 Snipes DriveWarsa', '0585047244', 'vivica.paul@sony.pl', to_date('07-07-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Flanery', 'Nicolas', 661994210, '28 Gordon DriveMilpi', '0585894858', 'nicolasf@codykrameri', to_date('27-05-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Greene', 'Vincent', 169997654, '95 Sartain RoadCobha', '0549241144', 'vgreene@envisiontele', to_date('09-02-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cozier', 'Mekhi', 452544001, '73rd StreetBeaverton', '0584422433', 'mekhi.cozier@palmbea', to_date('29-12-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Alexander', 'Jared', 367301148, '36 Stills StreetRome', '0556975345', 'jared.alexander@kimb', to_date('02-04-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Moraz', 'Lili', 262177876, '88 Loreena StreetLea', '0547572113', 'l.moraz@aop.com', to_date('15-03-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sweeney', 'Chloe', 614843052, '43rd StreetFair Lawn', '0593625103', 'c.sweeney@gcd.com', to_date('28-12-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jackson', 'Humberto', 648358497, '87 Marie StreetFt. L', '0587303427', 'humberto.jackson@gla', to_date('03-12-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hauser', 'Neneh', 336899163, '28 Butler DriveShrev', '0559471608', 'nenehh@telecheminter', to_date('27-02-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Shawn', 'Jimmy', 910148391, '95 Lara RoadOshawa', '0579671045', 'jimmy.shawn@stonetec', to_date('03-10-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Short', 'Angie', 127560381, '1 Paul StreetNew Del', '0579750232', 'angie.short@marsinc.', to_date('09-12-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Schiavelli', 'Denny', 942996913, '97 Brad DriveWaldbro', '0544703160', 'denny.schiavelli@ves', to_date('05-08-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McGriff', 'Kid', 184263508, '5 Hunter StreetAiken', '0558562479', 'kid@aventis.com', to_date('22-11-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rea', 'Melanie', 521500586, '67 Brisbane StreetGe', '0582004710', 'melanie.rea@floorgra', to_date('08-11-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Himmelman', 'Philip', 326512074, '282 Evanswood Street', '0557011379', 'philiph@printtech.be', to_date('06-05-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hedaya', 'Laurence', 520138751, '23rd StreetLublin', '0543633535', 'laurence.hedaya@camp', to_date('23-08-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Meniketti', 'Gerald', 867309670, '763 Lipnicki StreetR', '0570583644', 'geraldm@flavorx.au', to_date('12-12-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Giamatti', 'Sander', 896623821, '597 Palo Alto RoadBi', '0536772291', 'sgiamatti@dearbornba', to_date('14-03-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Duke', 'Gordon', 884150938, '70 Avenged RoadMontr', '0522072414', 'gordon@whitewave.ca', to_date('18-10-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Zahn', 'Sam', 726500787, '90 Driver DriveClaym', '0556343496', 'sam.zahn@nat.com', to_date('11-05-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kinski', 'Mae', 763693930, '77 Ljubljana DriveUl', '0580698358', 'maek@cis.no', to_date('10-10-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Balin', 'Ty', 670092006, '33rd StreetSomerset', '0563127619', 'tbalin@computersourc', to_date('13-09-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Barkin', 'Praga', 906401671, '63 Carmichael DriveT', '0572481055', 'praga@educationaldev', to_date('31-07-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Driver', 'Norm', 164756215, '38 Bruce StreetVienn', '0546286936', 'norm.driver@timberla', to_date('02-02-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Baez', 'Steven', 598059031, '64 Lapointe RoadCuia', '0557829629', 's.baez@cooktek.br', to_date('06-04-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Garfunkel', 'Claude', 422520960, '507 Issaquah DriveGl', '0585196629', 'claude.g@newhorizons', to_date('16-10-2000', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Puckett', 'Sona', 668105400, '601 New DelhiPompton', '0552260233', 'sona.puckett@allegia', to_date('11-11-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Monk', 'Lily', 817433719, '938 New York RoadCiu', '0589049439', 'lily@saksinc.py', to_date('13-11-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Seagal', 'Hugo', 518821776, '69 Ceasar AveNovara', '0556724787', 'hugo.seagal@otbd.it', to_date('08-05-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mitra', 'Morris', 134370308, '95 Zappacosta Street', '0529900506', 'morrism@quicksilverr', to_date('26-09-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jessee', 'Jeroen', 151662302, '75 Chao RoadGettysbu', '0562143048', 'jeroen.jessee@genera', to_date('12-03-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cartlidge', 'Tamala', 257629966, '80 Lillard BlvdWest ', '0599829180', 'tamala@telepoint.au', to_date('18-03-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Bale', 'LeVar', 792734549, '74 CoxTartu', '0569777144', 'levar.b@csi.ee', to_date('25-12-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McDormand', 'Cole', 631365623, '75 Schneider DriveFo', '0578771827', 'colem@integramedamer', to_date('28-04-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fraser', 'Ned', 798302209, '89 Sugar Hill AveBea', '0520955963', 'ned.fraser@biorefere', to_date('22-12-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hirsch', 'Holly', 307344200, '59 Brody AveFt. Leav', '0528878662', 'holly.h@mwp.com', to_date('24-07-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ribisi', 'Penelope', 951437232, '92nd StreetBrugherio', '0595750059', 'peneloper@asapstaffi', to_date('26-07-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gershon', 'Wally', 216505200, '89 Steve RoadWashing', '0550128198', 'wally.gershon@telwar', to_date('18-05-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Schwimmer', 'Tobey', 802374700, '82 Berenger StreetSa', '0562071325', 'tobey.schwimmer@idla', to_date('20-05-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carmen', 'Henry', 768911980, '71 Ned AveHayward', '0571672321', 'henry.carmen@yashtec', to_date('02-11-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Davison', 'Bryan', 761247130, '93rd StreetMendoza', '0588661991', 'bryan.davison@invest', to_date('11-06-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Greene', 'Andie', 592339013, '30 Chilton StreetMcl', '0570764982', 'agreene@merck.com', to_date('25-11-1954', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rhymes', 'Rosco', 812843652, '78 Vassar AveMatsuya', '0546027110', 'rosco.rhymes@at.jp', to_date('11-06-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Nash', 'Gary', 467610759, '45 WarsawWhittier', '0598947941', 'gary.nash@dataprise.', to_date('05-02-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Holliday', 'Neil', 458589694, '71 Joshua AveAurora', '0598984329', 'neil.h@bowman.com', to_date('04-02-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Basinger', 'Cledus', 181436117, '28 Shenzhen StreetCo', '0587258700', 'cledus.basinger@pion', to_date('21-05-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Prinze', 'Courtney', 513331858, '100 Uggams RoadGuelp', '0542761028', 'courtney.prinze@emt.', to_date('26-10-1989', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gryner', 'Carrie', 159003417, '22 Hart DriveNorth P', '0592253173', 'cgryner@investorstit', to_date('18-05-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Fonda', 'Cornell', 908312414, '76 Holliday DriveSom', '0525918274', 'cornell.fonda@ams.co', to_date('12-09-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rifkin', 'Walter', 397901915, '98 Drive DriveNewcas', '0523067283', 'walter@bristolmyers.', to_date('15-06-1973', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dukakis', 'Praga', 517978732, '15 Recife DriveCharl', '0536694406', 'praga@ams.com', to_date('11-09-1970', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Grant', 'Ryan', 812798570, '86 Studi BlvdDelafie', '0523867060', 'ryan.grant@sprint.co', to_date('26-06-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Spacek', 'Tea', 525386822, '23 Kaunas AveAppenze', '0532227226', 'tea.spacek@greenmoun', to_date('08-03-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McCready', 'Julia', 637575251, '1 Eileen AveSalzburg', '0571602068', 'julia.mccready@mathi', to_date('25-09-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Santana', 'Natalie', 980238247, '70 Sweet RoadWaalwij', '0565922178', 'natalie.santana@spri', to_date('12-07-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('LuPone', 'Joseph', 516915284, '950 Tea StreetSt. Lo', '0574902560', 'josephl@pioneerdatas', to_date('06-03-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Milsap', 'Carl', 715193578, '56 Cloris DriveSalzb', '0522505291', 'carl.m@zoneperfectnu', to_date('15-03-1963', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Makeba', 'Christine', 140846666, '32 Kirsten DriveTaka', '0599508261', 'c.makeba@generalmill', to_date('02-07-1968', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cheadle', 'Blair', 942644760, '59 Tea DriveNew Hope', '0544749343', 'blair.c@newtonintera', to_date('23-07-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stiers', 'Parker', 883289730, '72 ProtvinoTerrasa', '0526411196', 'parker@marsinc.es', to_date('11-06-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wills', 'Herbie', 664324638, '15 De Niro StreetMob', '0599437141', 'hwills@spotfireholdi', to_date('03-03-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Remar', 'Gran', 690420273, '56 Patti StreetSunds', '0577251442', 'gran.r@gha.se', to_date('21-01-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hedaya', 'Darius', 649674822, '71 Patti StreetBarne', '0539507496', 'd.hedaya@hotmail.com', to_date('04-12-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Darren', 'Pablo', 907362420, '36 Jeffrey StreetCle', '0528095252', 'pablo@verizon.com', to_date('21-08-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Raitt', 'Harry', 954207230, '37 Begley AveRiverda', '0565540661', 'harry.r@conquestsyst', to_date('05-05-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Campbell', 'Mike', 300295049, '22 Melrose park Blvd', '0523017816', 'm.campbell@sht.au', to_date('26-02-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Dolenz', 'Cary', 801817196, '67 McDormand AveAlph', '0535379375', 'cary.d@blueoceansoft', to_date('12-07-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McCormack', 'Anna', 476171954, '42nd StreetErlangen', '0538481913', 'anna@unitedasset.de', to_date('11-02-1995', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Phifer', 'Wendy', 655270279, '67 Sao caetano do su', '0595521826', 'wendy@unilever.be', to_date('04-04-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Crimson', 'Rip', 414400325, '27 St. Louis RoadJak', '0530485582', 'rip.crimson@capitolb', to_date('12-01-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Negbaur', 'Kirsten', 858604549, '966 Kattan RoadLiver', '0534613284', 'kirsten.negbaur@vest', to_date('29-06-1986', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Watson', 'Phil', 764718405, '351 O''Neal BlvdVilla', '0523405654', 'pwatson@abatix.it', to_date('19-03-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Burton', 'Curt', 262435609, '799 Matheson StreetH', '0589945044', 'curt@infovision.com', to_date('04-09-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Boothe', 'Robert', 668397885, '15 Belp StreetMumbai', '0553170096', 'robert.boothe@teoco.', to_date('09-01-2003', 'dd-mm-yyyy'));
commit;
prompt 900 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('LaSalle', 'Kitty', 963980988, '43 Coquitlam RoadNor', '0592842506', 'kitty@vivendiunivers', to_date('08-05-1981', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wariner', 'Chely', 950772818, '3 Berwyn StreetStone', '0557204638', 'cwariner@shirtfactor', to_date('29-10-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Avalon', 'Andre', 801631026, '683 Gates AveMenlo P', '0526752460', 'andre.avalon@denaliv', to_date('26-08-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Askew', 'Glenn', 817184818, '98 AaronMenlo Park', '0535678628', 'glenn@hcoa.com', to_date('18-12-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Crow', 'Collin', 454262972, '95 Utsunomiya Street', '0596139229', 'collin.c@woronocoban', to_date('18-06-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Davidtz', 'Jeffrey', 909725649, '731 Santa Rosa BlvdS', '0577479632', 'jeffrey.davidtz@logi', to_date('16-12-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hurt', 'Regina', 304761100, '30 Cornell DriveBrat', '0524458992', 'rhurt@oss.com', to_date('20-08-2001', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lang', 'Juan', 720780759, '18 Oakland RoadDoual', '0537794057', 'juan.lang@sms.com', to_date('19-03-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Myers', 'Sona', 530131962, '82 Kingsley BlvdOhit', '0548093606', 'smyers@noodles.jp', to_date('22-05-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Farina', 'Mos', 714865250, '25 Emma StreetWaltha', '0538216769', 'mos.farina@whitewave', to_date('20-06-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Platt', 'Chaka', 431317000, '32 Ponce AveSanta Cl', '0578104684', 'cplatt@stonebrewing.', to_date('10-01-1959', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Torres', 'Paula', 793726925, '100 Jesus RoadBalmor', '0592706580', 'p.torres@benecongrou', to_date('20-06-1972', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sevigny', 'Marie', 381730004, '48 Kramer RoadLibert', '0586318372', 'marie.s@stm.com', to_date('28-07-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Broadbent', 'David', 847856992, '49 Don StreetEnsched', '0556792706', 'david.broadbent@trm.', to_date('08-05-2004', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Vincent', 'Ben', 368290195, '56 Irons RoadSursee', '0585761251', 'ben.vincent@sfb.ch', to_date('01-03-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Ruiz', 'Alfred', 232559981, '560 Kirkwood RoadExe', '0562539432', 'alfred.ruiz@tigris.c', to_date('02-05-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Isaacs', 'Jody', 145411869, '53 Lovitz StreetWint', '0544802328', 'jody@dillards.ch', to_date('24-12-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Coverdale', 'Latin', 512647397, '91 FlattsBoulogne', '0525734882', 'latin.c@alogent.fr', to_date('19-09-1998', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Curfman', 'Ivan', 755010715, '147 Bristol StreetSu', '0585927431', 'ivan@ezecastlesoftwa', to_date('22-10-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McAnally', 'Gino', 589112597, '55 Charlton RoadSao ', '0571086571', 'ginom@bis.br', to_date('19-02-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Reubens', 'Nile', 117249783, '47 Lonsdale StreetBi', '0545906666', 'nile.reubens@news.co', to_date('05-08-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Scheider', 'Dylan', 938086111, '49 Witt AveDrogenbos', '0528410221', 'dylan.scheider@walma', to_date('19-10-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Balaban', 'Michael', 446089916, '7 Ann Arbor RoadNeuq', '0583241217', 'm.balaban@canterbury', to_date('18-06-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Irving', 'Stellan', 762000433, '49 Carr AveGuadalaja', '0550120535', 'stellan.irving@bps.m', to_date('12-01-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tisdale', 'Elle', 290644641, '42 Irvine StreetPeac', '0556784460', 'elle.tisdale@smartdr', to_date('08-07-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kapanka', 'Angela', 305887245, '54 CosladaBergara', '0530088361', 'angela@hewlettpackar', to_date('09-03-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Feuerstein', 'Mary-Louise', 512333062, '724 Hookah StreetPia', '0557340540', 'marylouise.feuerstei', to_date('23-08-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Green', 'Demi', 375310901, '65 Aurora RoadWest M', '0567275705', 'demi.green@elitemedi', to_date('12-06-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pesci', 'Jay', 572928856, '83rd StreetNancy', '0536964147', 'jay.pesci@sysconmedi', to_date('31-08-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Carrere', 'Belinda', 295721056, '493 Tualatin DriveSa', '0556628598', 'b.carrere@shot.com', to_date('10-02-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hong', 'Maceo', 440096897, '44 Ned RoadTours', '0597921684', 'maceo@allstar.fr', to_date('19-10-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Allison', 'Natasha', 813323354, '31 Mexico City BlvdL', '0553917848', 'natasha.allison@hewl', to_date('19-05-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Estevez', 'Robbie', 776045496, '56 Hagerty BlvdMontr', '0525515917', 'robbie@ams.ca', to_date('07-09-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Conners', 'Jackie', 767142088, '90 Snoqualmie Street', '0526228558', 'jackie.conners@cowli', to_date('02-05-1980', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rush', 'Regina', 421100585, '47 Brooks RoadProtvi', '0585336395', 'regina@topicsenterta', to_date('07-12-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kretschmann', 'Louise', 610881195, '284 Boulogne StreetC', '0545543026', 'lkretschmann@wrgserv', to_date('14-09-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lineback', 'Vanessa', 642915008, '40 Cate AveAnnandale', '0599816638', 'vanessa.lineback@hot', to_date('01-01-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Byrne', 'Jean-Luc', 474692968, '50 Roy StreetUtsunom', '0588867879', 'j.byrne@stmaryland.j', to_date('12-02-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kilmer', 'Clint', 232982805, '36 Dourif StreetGran', '0578576980', 'clint@printtech.com', to_date('27-09-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Newton', 'Terrence', 111080540, '99 Detmer StreetKing', '0537193443', 'terrence.newton@gill', to_date('04-07-1951', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Travers', 'Davis', 408357513, '88 Singh DriveKuopio', '0521671376', 'davist@aventis.fi', to_date('05-06-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Winger', 'Delbert', 618140542, '51 Hart DriveHerne', '0538069321', 'delbert.winger@glmt.', to_date('07-04-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Brothers', 'Alfie', 950037229, '14 Gavin RoadWest Su', '0577077690', 'alfie@loreal.uk', to_date('11-04-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Streep', 'Dabney', 376286668, '51 Prinze StreetVill', '0573619860', 'dstreep@sfmai.it', to_date('04-01-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tillis', 'Matthew', 591988422, '3 Crystal RoadGuelph', '0576857313', 'matthew.tillis@fmb.c', to_date('26-03-1975', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Arkin', 'Cevin', 159508703, '51st StreetZÃ¼rich', '0549034796', 'cevin.arkin@promethe', to_date('29-08-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Wolf', 'Fisher', 896635944, '579 Fukuoka AveGdans', '0538462970', 'fisher.wolf@trekequi', to_date('01-11-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Merchant', 'Merle', 761354432, '90 Worrell RoadReno', '0548422348', 'm.merchant@gsat.com', to_date('23-03-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kinski', 'Maury', 183205839, '17 Lupe RoadTaoyuan', '0579428800', 'maury.kinski@dynacqi', to_date('05-08-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Blossoms', 'Jeffrey', 143811725, '807 Milton Keynes Dr', '0597804447', 'jeffrey.b@reckittben', to_date('31-03-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mulroney', 'Sydney', 513524850, '4 Merle StreetSalzbu', '0545948073', 'sydney.mulroney@ptg.', to_date('11-03-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Monk', 'Bernard', 982427445, '39 Burr Ridge Street', '0550242710', 'bernard.monk@hfg.com', to_date('09-01-1948', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Torino', 'Will', 953326244, '66 TomHerdecke', '0553616903', 'wtorino@banfeproduct', to_date('27-09-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Law', 'Nickel', 179815590, '73rd StreetLos Alamo', '0541684764', 'nickel.law@lms.com', to_date('17-05-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cherry', 'Kurtwood', 633097629, '34 Dempsey StreetNan', '0588875572', 'kurtwood.cherry@rest', to_date('29-12-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Langella', 'Nora', 260961871, '9 Newman RoadSlmea', '0566102000', 'nora@progressivemedi', to_date('17-11-1999', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Roth', 'Adina', 239950761, '60 Terence AveBrookf', '0587390533', 'adina@gha.com', to_date('24-01-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tah', 'Irene', 508823059, '675 Warszawa StreetS', '0594341132', 'irene@cns.com', to_date('25-12-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Curtis', 'Chloe', 806090432, '23rd StreetSidney', '0583198163', 'ccurtis@canterburypa', to_date('24-01-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Yulin', 'Liam', 452939991, '87 BredaCheshire', '0554228898', 'liam.yulin@pis.uk', to_date('26-03-1960', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McDonald', 'Latin', 442765602, '10 Emilio DriveIrati', '0590824710', 'latin.mcdonald@sis.b', to_date('06-09-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Witt', 'Adrien', 367622091, '91 Mortensen RoadEtt', '0545523188', 'adrien.witt@gdatechn', to_date('12-03-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Mueller-Stahl', 'Raul', 692760095, '62 ShalhoubLowell', '0555621592', 'raul.muellerstahl@sa', to_date('02-07-1958', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Yorn', 'Franco', 664633791, '4 Yorn StreetValenci', '0587260238', 'franco.yorn@business', to_date('09-05-1949', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('MacDowell', 'Judd', 904561233, '92nd StreetLongview', '0555223061', 'judd.macdowell@conqu', to_date('08-12-1964', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McNeice', 'Jonny Lee', 799542087, '68 Redford StreetMog', '0562289333', 'jonnylee.mcneice@all', to_date('11-10-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Sepulveda', 'Clay', 702072229, '546 Jodie RoadFramin', '0548397603', 'clay.s@timberlanewoo', to_date('02-11-1988', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Black', 'Hookah', 613449185, '79 Sinatra StreetNew', '0557288813', 'hookah.b@bioreferenc', to_date('06-04-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hawke', 'Dermot', 332185579, '219 SilvermanZurich', '0573913924', 'dermot.hawke@bashen.', to_date('05-03-1984', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Albright', 'Dennis', 843458495, '951 Swoosie DriveBer', '0545794961', 'dennis.albright@unit', to_date('29-01-1990', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kleinenberg', 'Kay', 685783715, '24 Brent BlvdVaduz', '0525617393', 'k.kleinenberg@usgove', to_date('08-09-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Coughlan', 'Mekhi', 343281461, '81 Billerica BlvdFar', '0546370187', 'mekhi@linacsystems.u', to_date('24-06-1979', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kennedy', 'Lynn', 108411178, '52nd StreetFukui', '0567939943', 'lynn@morganresearch.', to_date('05-02-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tierney', 'Johnette', 731895323, '43 StevensColombo', '0534670540', 'jtierney@teamstudio.', to_date('29-03-1952', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Davies', 'Rowan', 744119752, '622 Macy RoadDardill', '0591718047', 'rowan.davies@yes.fr', to_date('13-11-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Caine', 'Parker', 592183873, '48 Mountain View Dri', '0547366384', 'p.caine@ecopy.com', to_date('07-03-1977', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Gaines', 'Nils', 982468945, '58 Carrington AveKob', '0534526432', 'nils.g@ait.jp', to_date('15-03-1974', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Anderson', 'Jesus', 472589782, '89 MelanieFriedrichs', '0562809976', 'jesus.anderson@paint', to_date('30-05-1950', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Holliday', 'Ming-Na', 652617705, '1 MortensenSorocaba', '0536353864', 'mingna@usphysicalthe', to_date('18-02-1978', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lennix', 'Hugo', 531749344, '17 McPherson Avedurh', '0536089264', 'hugo.lennix@codykram', to_date('27-05-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Curry', 'Johnette', 506544368, '19 NightingaleCromwe', '0558019963', 'johnettec@mastercard', to_date('29-05-1958', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Henstridge', 'Isabella', 927539471, '42 Eliza DriveLehi', '0587179732', 'isabella.henstridge@', to_date('16-07-1961', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Shue', 'Sonny', 948139256, '53 McKellen RoadSche', '0542874231', 'sonny.shue@solipsys.', to_date('08-09-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Aglukark', 'Terence', 227596658, '81st StreetOhita', '0595179408', 'terence.aglukark@pri', to_date('21-07-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Moffat', 'Ike', 578363521, '84 Kansas City Stree', '0555126812', 'imoffat@scripnet.dk', to_date('20-12-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stamp', 'Isaiah', 948704091, '86 Germantown RoadOa', '0528753503', 'isaiah.s@oneidafinan', to_date('20-11-1966', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Diaz', 'Etta', 921590491, '499 Thorton DriveEng', '0588731284', 'ettad@bioreference.c', to_date('07-07-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Jeffreys', 'Lois', 625853599, '781 Canal Winchester', '0594461395', 'lois.jeffreys@maveri', to_date('12-08-1991', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Lillard', 'Tyrone', 523146802, '507 Trace RoadSummer', '0557769447', 'tlillard@sony.ca', to_date('14-01-1994', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Pacino', 'Garry', 775623212, '91 Sundsvall RoadCro', '0595882537', 'garry.p@mathis.com', to_date('08-11-1955', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('MacDowell', 'Sally', 969611634, '92nd StreetRosario', '0531078818', 'sally.macdowell@usda', to_date('28-04-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cara', 'Bernie', 947929576, '100 Lane BlvdMiami', '0567836569', 'bernie.cara@proclari', to_date('15-12-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Burmester', 'Talvin', 118361310, '48 AmarilloMonument', '0526971758', 'talvin.burmester@gcd', to_date('26-05-1967', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('McCann', 'Scott', 717308455, '91 Benjamin BlvdCove', '0531053019', 'scott.mccann@abatix.', to_date('18-06-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Kane', 'Jonatha', 693746050, '45 Meerbusch StreetR', '0534092177', 'jonathak@aventis.it', to_date('06-02-1992', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Goodall', 'Dylan', 557735985, '49 Rochester StreetP', '0560213966', 'dylan.goodall@mwp.co', to_date('28-02-1985', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('LuPone', 'Regina', 278028781, '931 Shreveport RoadW', '0562380233', 'regina.lupone@calibe', to_date('13-12-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Torn', 'Judy', 525253498, '3 Quinlan StreetKÃ¸be', '0582729336', 'judy.t@fmt.dk', to_date('06-10-1962', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Donovan', 'Fisher', 649982841, '77 Lorenz DriveBrain', '0577420303', 'fisher.donovan@credi', to_date('25-09-1953', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Peet', 'Isabella', 609034561, '14 Lowe RoadRosario', '0599008000', 'isabella.peet@esteel', to_date('15-01-1978', 'dd-mm-yyyy'));
commit;
prompt 1000 records committed...
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Finney', 'Geoffrey', 904064500, '97 Hynde RoadMenlo P', '0572321379', 'geoffrey.finney@exin', to_date('01-04-1957', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Biehn', 'Gabrielle', 494877713, '5 Krumholtz RoadSan ', '0599172989', 'gabrielle.biehn@dis.', to_date('13-10-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hidalgo', 'Robert', 193186555, '776 Parker StreetKao', '0564583491', 'rhidalgo@ositissoftw', to_date('30-03-1969', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Salonga', 'Tommy', 129525337, '500 Long Island City', '0579602978', 'tommy.s@servicesourc', to_date('23-04-2002', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Miller', 'Penelope', 403919727, '45 Rik Roaddurham', '0541785936', 'pmiller@networkdispl', to_date('28-02-1983', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Marin', 'Cate', 729224779, '33rd StreetMonterrey', '0598631389', 'cate.marin@contract.', to_date('12-02-1996', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Hartnett', 'Trini', 417752520, '83 Mohr RoadAlbany', '0540164533', 'trini.hartnett@everg', to_date('02-12-1982', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Waite', 'Denis', 798808640, '2 Akron BlvdBrisbane', '0543068267', 'denis.waite@abs.au', to_date('23-01-1971', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Stigers', 'Matthew', 742745195, '59 Kazem DrivePotten', '0570988474', 'matthew@totalenterta', to_date('31-05-1993', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Levert', 'Barbara', 195568866, '268 McConaughey Stre', '0531876369', 'b.levert@stm.de', to_date('13-05-1976', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Chestnut', 'Clive', 356852395, '852 Colman DriveMoun', '0543772163', 'clive.chestnut@teams', to_date('15-09-1997', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Rebhorn', 'Cheryl', 535163098, '82 Garza StreetEchir', '0575211252', 'cheryl.rebhorn@ads.f', to_date('09-10-1987', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Richards', 'Rupert', 959360057, '5 Tlalpan RoadHerfor', '0524090926', 'r.richards@cooktek.d', to_date('10-12-2003', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Cox', 'Rueben', 707410732, '219 Agoncillo AveBar', '0570852179', 'rueben@mitsubishimot', to_date('02-12-1956', 'dd-mm-yyyy'));
insert into PERSON (lastname, firstname, personid, address, phone, mail, birthdate)
values ('Tisdale', 'Ralph', 115916556, '10 Freddy DriveImmen', '0565477551', 'ralph.tisdale@sarale', to_date('24-06-1990', 'dd-mm-yyyy'));
commit;
prompt 1015 records loaded
prompt Loading DISPATCHER...
insert into DISPATCHER (dispatcherid)
values (101584298);
insert into DISPATCHER (dispatcherid)
values (115714750);
insert into DISPATCHER (dispatcherid)
values (116564125);
insert into DISPATCHER (dispatcherid)
values (122924782);
insert into DISPATCHER (dispatcherid)
values (128080684);
insert into DISPATCHER (dispatcherid)
values (136082895);
insert into DISPATCHER (dispatcherid)
values (162788221);
insert into DISPATCHER (dispatcherid)
values (165847242);
insert into DISPATCHER (dispatcherid)
values (181436117);
insert into DISPATCHER (dispatcherid)
values (184263508);
insert into DISPATCHER (dispatcherid)
values (193186555);
insert into DISPATCHER (dispatcherid)
values (205862893);
insert into DISPATCHER (dispatcherid)
values (207347544);
insert into DISPATCHER (dispatcherid)
values (214158330);
insert into DISPATCHER (dispatcherid)
values (242585762);
insert into DISPATCHER (dispatcherid)
values (243238131);
insert into DISPATCHER (dispatcherid)
values (243336161);
insert into DISPATCHER (dispatcherid)
values (264250868);
insert into DISPATCHER (dispatcherid)
values (275351971);
insert into DISPATCHER (dispatcherid)
values (314514324);
insert into DISPATCHER (dispatcherid)
values (349631451);
insert into DISPATCHER (dispatcherid)
values (351922829);
insert into DISPATCHER (dispatcherid)
values (366343244);
insert into DISPATCHER (dispatcherid)
values (376286668);
insert into DISPATCHER (dispatcherid)
values (385114707);
insert into DISPATCHER (dispatcherid)
values (395234141);
insert into DISPATCHER (dispatcherid)
values (399467282);
insert into DISPATCHER (dispatcherid)
values (404883551);
insert into DISPATCHER (dispatcherid)
values (414400325);
insert into DISPATCHER (dispatcherid)
values (431317000);
insert into DISPATCHER (dispatcherid)
values (439929751);
insert into DISPATCHER (dispatcherid)
values (440414604);
insert into DISPATCHER (dispatcherid)
values (441023695);
insert into DISPATCHER (dispatcherid)
values (477520608);
insert into DISPATCHER (dispatcherid)
values (481548013);
insert into DISPATCHER (dispatcherid)
values (483475435);
insert into DISPATCHER (dispatcherid)
values (496069738);
insert into DISPATCHER (dispatcherid)
values (498875242);
insert into DISPATCHER (dispatcherid)
values (502131885);
insert into DISPATCHER (dispatcherid)
values (504967455);
insert into DISPATCHER (dispatcherid)
values (507339068);
insert into DISPATCHER (dispatcherid)
values (513160497);
insert into DISPATCHER (dispatcherid)
values (525253498);
insert into DISPATCHER (dispatcherid)
values (525386822);
insert into DISPATCHER (dispatcherid)
values (535163098);
insert into DISPATCHER (dispatcherid)
values (540114031);
insert into DISPATCHER (dispatcherid)
values (549493698);
insert into DISPATCHER (dispatcherid)
values (553099150);
insert into DISPATCHER (dispatcherid)
values (558414787);
insert into DISPATCHER (dispatcherid)
values (563119002);
insert into DISPATCHER (dispatcherid)
values (567796300);
insert into DISPATCHER (dispatcherid)
values (580488974);
insert into DISPATCHER (dispatcherid)
values (590266488);
insert into DISPATCHER (dispatcherid)
values (599890817);
insert into DISPATCHER (dispatcherid)
values (602857670);
insert into DISPATCHER (dispatcherid)
values (603787067);
insert into DISPATCHER (dispatcherid)
values (609870937);
insert into DISPATCHER (dispatcherid)
values (633097629);
insert into DISPATCHER (dispatcherid)
values (637575251);
insert into DISPATCHER (dispatcherid)
values (675278483);
insert into DISPATCHER (dispatcherid)
values (681488617);
insert into DISPATCHER (dispatcherid)
values (707509224);
insert into DISPATCHER (dispatcherid)
values (708442139);
insert into DISPATCHER (dispatcherid)
values (718428613);
insert into DISPATCHER (dispatcherid)
values (719059544);
insert into DISPATCHER (dispatcherid)
values (727135472);
insert into DISPATCHER (dispatcherid)
values (747171108);
insert into DISPATCHER (dispatcherid)
values (766242929);
insert into DISPATCHER (dispatcherid)
values (789685574);
insert into DISPATCHER (dispatcherid)
values (792078922);
insert into DISPATCHER (dispatcherid)
values (800947932);
insert into DISPATCHER (dispatcherid)
values (801292271);
insert into DISPATCHER (dispatcherid)
values (802374700);
insert into DISPATCHER (dispatcherid)
values (825589019);
insert into DISPATCHER (dispatcherid)
values (834241599);
insert into DISPATCHER (dispatcherid)
values (839552387);
insert into DISPATCHER (dispatcherid)
values (843458495);
insert into DISPATCHER (dispatcherid)
values (843512931);
insert into DISPATCHER (dispatcherid)
values (869296845);
insert into DISPATCHER (dispatcherid)
values (872367234);
insert into DISPATCHER (dispatcherid)
values (884150938);
insert into DISPATCHER (dispatcherid)
values (906935306);
insert into DISPATCHER (dispatcherid)
values (918208321);
insert into DISPATCHER (dispatcherid)
values (926145059);
insert into DISPATCHER (dispatcherid)
values (942996913);
insert into DISPATCHER (dispatcherid)
values (944938337);
insert into DISPATCHER (dispatcherid)
values (947447478);
insert into DISPATCHER (dispatcherid)
values (951414878);
insert into DISPATCHER (dispatcherid)
values (952094084);
insert into DISPATCHER (dispatcherid)
values (961635098);
insert into DISPATCHER (dispatcherid)
values (963532017);
insert into DISPATCHER (dispatcherid)
values (967108709);
insert into DISPATCHER (dispatcherid)
values (971253183);
insert into DISPATCHER (dispatcherid)
values (980238247);
insert into DISPATCHER (dispatcherid)
values (988686001);
insert into DISPATCHER (dispatcherid)
values (995102445);
commit;
prompt 96 records loaded
prompt Loading CALLHELP...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (1, to_date('16-01-1949', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (2, to_date('15-08-2002', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (3, to_date('04-07-1959', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (4, to_date('03-11-1983', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (5, to_date('20-02-2007', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (6, to_date('20-07-1993', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (7, to_date('23-06-1975', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (8, to_date('21-04-1995', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (9, to_date('24-11-1988', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (10, to_date('30-12-1977', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (11, to_date('14-05-2014', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (12, to_date('01-09-1968', 'dd-mm-yyyy'), 376286668, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (13, to_date('05-10-1955', 'dd-mm-yyyy'), 567796300, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (14, to_date('22-10-2006', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (15, to_date('02-10-2010', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (16, to_date('30-07-1984', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (17, to_date('30-06-1979', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (18, to_date('03-05-1995', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (19, to_date('23-07-1976', 'dd-mm-yyyy'), 951414878, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (20, to_date('25-10-1978', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (21, to_date('16-06-1975', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (23, to_date('20-02-1953', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (24, to_date('27-06-1983', 'dd-mm-yyyy'), 718428613, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (25, to_date('14-11-1971', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (26, to_date('10-06-1985', 'dd-mm-yyyy'), 414400325, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (27, to_date('16-10-1985', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (28, to_date('02-09-1994', 'dd-mm-yyyy'), 801292271, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (29, to_date('18-08-1969', 'dd-mm-yyyy'), 747171108, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (30, to_date('26-12-1953', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (31, to_date('30-10-1976', 'dd-mm-yyyy'), 314514324, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (32, to_date('14-08-1970', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (33, to_date('06-08-1968', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (34, to_date('11-07-1992', 'dd-mm-yyyy'), 971253183, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (35, to_date('13-02-1993', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (36, to_date('27-05-1960', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (37, to_date('28-05-2016', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (38, to_date('16-09-1961', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (39, to_date('14-02-1948', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (40, to_date('09-02-2003', 'dd-mm-yyyy'), 477520608, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (41, to_date('28-09-1991', 'dd-mm-yyyy'), 947447478, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (42, to_date('18-09-1971', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (43, to_date('13-06-1954', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (44, to_date('25-06-2013', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (45, to_date('23-02-1986', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (46, to_date('28-02-1991', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (47, to_date('28-11-1978', 'dd-mm-yyyy'), 567796300, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (48, to_date('15-02-2014', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (49, to_date('28-04-1988', 'dd-mm-yyyy'), 944938337, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (50, to_date('18-07-2018', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (51, to_date('17-01-1952', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (52, to_date('27-02-1994', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (53, to_date('06-12-1950', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (54, to_date('24-02-1952', 'dd-mm-yyyy'), 843458495, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (55, to_date('10-03-1972', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (56, to_date('20-05-1970', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (57, to_date('11-11-1951', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (58, to_date('22-06-1950', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (59, to_date('06-01-1956', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (60, to_date('22-12-1962', 'dd-mm-yyyy'), 802374700, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (61, to_date('24-01-2018', 'dd-mm-yyyy'), 599890817, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (62, to_date('24-02-1987', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (63, to_date('26-07-1959', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (64, to_date('18-08-1957', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (65, to_date('01-11-1971', 'dd-mm-yyyy'), 944938337, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (66, to_date('15-05-1968', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (67, to_date('27-10-2017', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (68, to_date('06-04-1998', 'dd-mm-yyyy'), 718428613, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (69, to_date('04-08-2019', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (70, to_date('20-10-1980', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (71, to_date('26-09-2006', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (72, to_date('25-02-1978', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (73, to_date('15-03-1995', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (74, to_date('06-01-1950', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (75, to_date('14-10-1959', 'dd-mm-yyyy'), 314514324, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (76, to_date('22-08-1993', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (77, to_date('06-10-1993', 'dd-mm-yyyy'), 800947932, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (78, to_date('28-05-2005', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (79, to_date('03-01-1975', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (80, to_date('13-04-1964', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (81, to_date('27-11-2019', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (82, to_date('11-08-1967', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (83, to_date('25-07-2000', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (84, to_date('11-07-1959', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (85, to_date('31-07-2018', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (86, to_date('06-06-1974', 'dd-mm-yyyy'), 947447478, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (87, to_date('13-10-2002', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (88, to_date('18-11-2007', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (89, to_date('11-05-2000', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (90, to_date('05-04-2013', 'dd-mm-yyyy'), 792078922, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (91, to_date('07-09-2012', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (92, to_date('09-08-1964', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (93, to_date('31-03-1973', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (94, to_date('01-01-2016', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (95, to_date('24-01-1979', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (96, to_date('09-11-2013', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (97, to_date('14-12-1968', 'dd-mm-yyyy'), 802374700, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (98, to_date('28-06-2012', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (99, to_date('05-01-2004', 'dd-mm-yyyy'), 747171108, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (100, to_date('17-05-2005', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (101, to_date('17-09-2019', 'dd-mm-yyyy'), 918208321, 'DONE');
commit;
prompt 100 records committed...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (102, to_date('01-06-1982', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (103, to_date('19-12-1952', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (104, to_date('27-08-2001', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (105, to_date('23-07-2013', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (106, to_date('29-09-1981', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (107, to_date('08-04-1951', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (108, to_date('11-08-2019', 'dd-mm-yyyy'), 843458495, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (109, to_date('21-02-2004', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (110, to_date('20-08-1967', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (111, to_date('13-03-1967', 'dd-mm-yyyy'), 115714750, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (112, to_date('04-10-1974', 'dd-mm-yyyy'), 906935306, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (113, to_date('05-01-1967', 'dd-mm-yyyy'), 603787067, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (114, to_date('14-11-1969', 'dd-mm-yyyy'), 101584298, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (115, to_date('11-07-1993', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (116, to_date('16-11-1971', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (117, to_date('06-06-2010', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (118, to_date('10-10-1960', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (119, to_date('25-07-1963', 'dd-mm-yyyy'), 906935306, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (120, to_date('10-03-2006', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (121, to_date('22-08-1960', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (122, to_date('21-08-1999', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (123, to_date('15-09-1977', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (124, to_date('10-01-2011', 'dd-mm-yyyy'), 802374700, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (125, to_date('12-09-1977', 'dd-mm-yyyy'), 193186555, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (126, to_date('18-08-2003', 'dd-mm-yyyy'), 603787067, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (127, to_date('24-06-1976', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (128, to_date('03-01-1964', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (129, to_date('27-09-1969', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (130, to_date('23-03-2009', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (131, to_date('02-02-2012', 'dd-mm-yyyy'), 513160497, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (132, to_date('15-09-1979', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (133, to_date('17-10-1965', 'dd-mm-yyyy'), 376286668, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (134, to_date('21-02-1988', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (135, to_date('18-06-1966', 'dd-mm-yyyy'), 513160497, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (136, to_date('26-10-1956', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (137, to_date('30-01-2007', 'dd-mm-yyyy'), 513160497, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (138, to_date('24-09-2009', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (139, to_date('20-10-2011', 'dd-mm-yyyy'), 869296845, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (140, to_date('06-11-2003', 'dd-mm-yyyy'), 314514324, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (141, to_date('18-10-1988', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (142, to_date('05-12-1957', 'dd-mm-yyyy'), 193186555, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (143, to_date('16-08-2013', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (144, to_date('06-04-1987', 'dd-mm-yyyy'), 504967455, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (145, to_date('01-06-1956', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (146, to_date('30-08-1954', 'dd-mm-yyyy'), 498875242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (147, to_date('26-04-1964', 'dd-mm-yyyy'), 599890817, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (148, to_date('04-03-2002', 'dd-mm-yyyy'), 944938337, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (149, to_date('02-07-1992', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (150, to_date('09-10-1977', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (151, to_date('08-03-2007', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (152, to_date('06-07-1965', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (153, to_date('22-12-1981', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (154, to_date('10-06-1969', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (155, to_date('22-12-1978', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (156, to_date('11-09-1987', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (157, to_date('10-12-1975', 'dd-mm-yyyy'), 906935306, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (158, to_date('11-02-2003', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (159, to_date('16-12-1982', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (160, to_date('17-10-2010', 'dd-mm-yyyy'), 800947932, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (161, to_date('16-12-2001', 'dd-mm-yyyy'), 498875242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (162, to_date('28-11-2004', 'dd-mm-yyyy'), 800947932, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (163, to_date('13-06-1976', 'dd-mm-yyyy'), 944938337, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (164, to_date('18-03-2009', 'dd-mm-yyyy'), 193186555, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (165, to_date('11-11-1968', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (166, to_date('23-07-1965', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (167, to_date('13-11-1956', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (168, to_date('09-11-1960', 'dd-mm-yyyy'), 843458495, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (169, to_date('17-01-1954', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (170, to_date('24-10-1994', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (171, to_date('12-04-1954', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (172, to_date('24-10-1948', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (173, to_date('03-04-2009', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (175, to_date('09-06-1974', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (176, to_date('03-07-1961', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (177, to_date('23-11-1988', 'dd-mm-yyyy'), 971253183, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (179, to_date('06-05-1964', 'dd-mm-yyyy'), 399467282, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (180, to_date('19-05-1967', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (181, to_date('27-10-1976', 'dd-mm-yyyy'), 414400325, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (183, to_date('16-04-2016', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (184, to_date('26-01-1976', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (186, to_date('05-07-2000', 'dd-mm-yyyy'), 952094084, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (187, to_date('22-05-2018', 'dd-mm-yyyy'), 825589019, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (188, to_date('27-01-2014', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (190, to_date('18-07-2013', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (191, to_date('25-08-1975', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (193, to_date('22-05-1967', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (194, to_date('17-11-1991', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (195, to_date('30-06-1993', 'dd-mm-yyyy'), 115714750, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (198, to_date('03-04-1972', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (199, to_date('02-11-1995', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (200, to_date('25-12-2004', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (202, to_date('29-10-1987', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (203, to_date('08-08-1969', 'dd-mm-yyyy'), 747171108, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (205, to_date('15-01-2001', 'dd-mm-yyyy'), 115714750, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (206, to_date('23-01-2001', 'dd-mm-yyyy'), 314514324, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (207, to_date('16-10-2015', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (209, to_date('21-03-2011', 'dd-mm-yyyy'), 718428613, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (210, to_date('08-03-1967', 'dd-mm-yyyy'), 525253498, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (212, to_date('14-06-2018', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (213, to_date('31-05-1993', 'dd-mm-yyyy'), 376286668, 'DONE');
commit;
prompt 200 records committed...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (214, to_date('24-01-1956', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (216, to_date('24-01-2002', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (217, to_date('26-11-1958', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (218, to_date('05-09-1972', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (220, to_date('16-08-2011', 'dd-mm-yyyy'), 351922829, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (221, to_date('22-11-1965', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (223, to_date('11-09-1949', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (224, to_date('10-02-1999', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (225, to_date('18-10-2001', 'dd-mm-yyyy'), 136082895, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (227, to_date('15-08-1961', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (228, to_date('07-08-1955', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (230, to_date('26-10-2011', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (231, to_date('05-01-1957', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (232, to_date('29-05-1954', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (234, to_date('10-08-1985', 'dd-mm-yyyy'), 376286668, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (235, to_date('02-09-1978', 'dd-mm-yyyy'), 792078922, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (236, to_date('11-10-1964', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (238, to_date('28-01-2016', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (239, to_date('28-10-1961', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (241, to_date('28-02-1988', 'dd-mm-yyyy'), 947447478, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (242, to_date('01-08-2015', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (243, to_date('12-09-1987', 'dd-mm-yyyy'), 558414787, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (245, to_date('19-04-2018', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (246, to_date('12-07-1996', 'dd-mm-yyyy'), 800947932, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (248, to_date('19-09-1953', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (249, to_date('16-01-2015', 'dd-mm-yyyy'), 513160497, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (250, to_date('13-10-1999', 'dd-mm-yyyy'), 558414787, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (252, to_date('22-10-1991', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (253, to_date('26-08-2008', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (254, to_date('03-08-2009', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (256, to_date('25-01-2004', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (257, to_date('19-12-1970', 'dd-mm-yyyy'), 349631451, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (259, to_date('23-03-2013', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (260, to_date('27-05-1994', 'dd-mm-yyyy'), 115714750, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (261, to_date('20-03-1972', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (263, to_date('19-01-1948', 'dd-mm-yyyy'), 162788221, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (264, to_date('03-05-1980', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (266, to_date('28-12-2002', 'dd-mm-yyyy'), 395234141, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (267, to_date('19-05-1992', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (268, to_date('13-09-1986', 'dd-mm-yyyy'), 207347544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (270, to_date('01-07-1983', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (271, to_date('09-09-2014', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (272, to_date('15-10-1953', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (274, to_date('10-11-2015', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (275, to_date('26-10-1987', 'dd-mm-yyyy'), 988686001, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (277, to_date('01-07-1973', 'dd-mm-yyyy'), 718428613, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (278, to_date('27-12-2009', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (279, to_date('05-01-2013', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (281, to_date('01-05-1973', 'dd-mm-yyyy'), 162788221, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (282, to_date('27-08-1997', 'dd-mm-yyyy'), 944938337, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (284, to_date('30-01-1984', 'dd-mm-yyyy'), 439929751, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (285, to_date('18-04-2003', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (286, to_date('17-05-2011', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (288, to_date('02-07-2016', 'dd-mm-yyyy'), 477520608, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (289, to_date('30-08-1974', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (290, to_date('06-11-1949', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (292, to_date('23-03-1972', 'dd-mm-yyyy'), 525253498, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (293, to_date('17-06-2017', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (295, to_date('04-08-1950', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (296, to_date('27-12-1983', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (297, to_date('15-10-1975', 'dd-mm-yyyy'), 971253183, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (299, to_date('19-08-1967', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (300, to_date('12-03-2015', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (302, to_date('02-06-2001', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (303, to_date('16-07-1962', 'dd-mm-yyyy'), 136082895, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (304, to_date('08-02-1948', 'dd-mm-yyyy'), 952094084, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (306, to_date('06-05-1987', 'dd-mm-yyyy'), 513160497, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (307, to_date('07-10-1970', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (308, to_date('29-06-2018', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (309, to_date('15-01-2015', 'dd-mm-yyyy'), 349631451, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (310, to_date('11-01-2009', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (311, to_date('21-07-2006', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (312, to_date('26-10-2012', 'dd-mm-yyyy'), 603787067, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (313, to_date('15-01-2001', 'dd-mm-yyyy'), 590266488, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (314, to_date('20-02-1972', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (315, to_date('22-06-2001', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (316, to_date('29-11-1963', 'dd-mm-yyyy'), 376286668, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (317, to_date('07-05-1984', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (318, to_date('13-06-1984', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (319, to_date('26-06-1981', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (320, to_date('15-02-1969', 'dd-mm-yyyy'), 603787067, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (321, to_date('29-08-1986', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (322, to_date('25-04-1969', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (323, to_date('21-06-1978', 'dd-mm-yyyy'), 718428613, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (324, to_date('11-01-1995', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (325, to_date('21-10-2008', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (326, to_date('24-07-1985', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (327, to_date('15-04-1964', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (328, to_date('25-07-1956', 'dd-mm-yyyy'), 792078922, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (329, to_date('23-01-1994', 'dd-mm-yyyy'), 952094084, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (332, to_date('21-09-1998', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (334, to_date('02-12-1969', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (335, to_date('07-07-1971', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (336, to_date('18-09-1972', 'dd-mm-yyyy'), 351922829, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (337, to_date('08-06-1996', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (338, to_date('17-05-1967', 'dd-mm-yyyy'), 504967455, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (339, to_date('09-12-2005', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (340, to_date('25-08-1978', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (341, to_date('12-12-1956', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (342, to_date('28-03-1952', 'dd-mm-yyyy'), 947447478, 'DONE');
commit;
prompt 300 records committed...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (343, to_date('26-10-2008', 'dd-mm-yyyy'), 181436117, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (344, to_date('10-09-1958', 'dd-mm-yyyy'), 207347544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (345, to_date('12-06-1995', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (346, to_date('23-01-2019', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (347, to_date('04-02-1954', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (348, to_date('02-10-1996', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (349, to_date('02-05-2004', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (350, to_date('25-11-2017', 'dd-mm-yyyy'), 825589019, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (351, to_date('16-06-1976', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (352, to_date('25-08-1956', 'dd-mm-yyyy'), 101584298, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (353, to_date('25-09-1998', 'dd-mm-yyyy'), 115714750, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (354, to_date('01-10-1995', 'dd-mm-yyyy'), 988686001, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (355, to_date('27-11-1958', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (356, to_date('11-10-1970', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (357, to_date('12-04-1949', 'dd-mm-yyyy'), 792078922, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (358, to_date('12-06-1976', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (359, to_date('15-10-2006', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (360, to_date('15-04-1979', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (361, to_date('01-06-1997', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (362, to_date('14-02-2015', 'dd-mm-yyyy'), 101584298, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (364, to_date('30-09-1975', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (365, to_date('14-03-1973', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (366, to_date('02-02-1951', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (367, to_date('08-10-2009', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (368, to_date('02-05-1951', 'dd-mm-yyyy'), 504967455, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (369, to_date('03-08-2015', 'dd-mm-yyyy'), 504967455, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (370, to_date('16-04-2011', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (371, to_date('26-09-1964', 'dd-mm-yyyy'), 207347544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (372, to_date('23-06-1969', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (373, to_date('30-03-1991', 'dd-mm-yyyy'), 395234141, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (374, to_date('14-03-1960', 'dd-mm-yyyy'), 599890817, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (375, to_date('18-06-2010', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (376, to_date('23-01-2011', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (377, to_date('27-10-2015', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (378, to_date('06-04-1964', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (379, to_date('02-04-1974', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (380, to_date('27-01-1950', 'dd-mm-yyyy'), 952094084, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (381, to_date('10-10-1989', 'dd-mm-yyyy'), 869296845, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (382, to_date('24-10-2002', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (383, to_date('13-07-1982', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (384, to_date('15-10-2019', 'dd-mm-yyyy'), 525253498, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (385, to_date('28-08-1948', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (386, to_date('24-06-1985', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (387, to_date('01-06-2012', 'dd-mm-yyyy'), 414400325, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (388, to_date('06-06-1969', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (389, to_date('26-11-2003', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (390, to_date('17-02-2000', 'dd-mm-yyyy'), 792078922, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (391, to_date('27-09-1969', 'dd-mm-yyyy'), 395234141, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (392, to_date('11-05-2007', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (393, to_date('16-02-2018', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (394, to_date('12-04-1971', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (395, to_date('10-08-2005', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (397, to_date('10-12-1950', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (398, to_date('06-01-1953', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (399, to_date('14-06-1991', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (400, to_date('31-08-1969', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (401, to_date('24-03-2011', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (402, to_date('03-06-1976', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (403, to_date('22-07-1952', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (404, to_date('09-12-1961', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (405, to_date('12-12-1967', 'dd-mm-yyyy'), 952094084, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (406, to_date('02-07-1955', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (407, to_date('18-02-1948', 'dd-mm-yyyy'), 988686001, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (408, to_date('20-02-1954', 'dd-mm-yyyy'), 599890817, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (409, to_date('08-06-1995', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (410, to_date('01-08-2011', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (411, to_date('04-11-1973', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (412, to_date('30-04-1997', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (413, to_date('13-03-1957', 'dd-mm-yyyy'), 906935306, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (414, to_date('09-04-1992', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (415, to_date('09-11-1958', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (416, to_date('30-03-2001', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (417, to_date('16-03-2008', 'dd-mm-yyyy'), 825589019, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (418, to_date('05-11-1984', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (419, to_date('25-05-2001', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (420, to_date('11-12-2006', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (421, to_date('12-09-1995', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (422, to_date('11-03-1952', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (423, to_date('16-10-1978', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (424, to_date('28-12-2013', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (425, to_date('20-06-1962', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (426, to_date('21-03-2003', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (427, to_date('02-01-1972', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (428, to_date('15-02-2010', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (429, to_date('03-09-1952', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (430, to_date('12-10-2001', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (431, to_date('14-09-1992', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (432, to_date('05-06-1987', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (433, to_date('16-02-1984', 'dd-mm-yyyy'), 264250868, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (434, to_date('09-02-1954', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (435, to_date('19-10-1948', 'dd-mm-yyyy'), 351922829, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (436, to_date('30-12-2016', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (437, to_date('01-02-1971', 'dd-mm-yyyy'), 747171108, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (438, to_date('21-09-1950', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (439, to_date('23-06-1992', 'dd-mm-yyyy'), 264250868, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (440, to_date('18-02-1950', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (441, to_date('26-07-1957', 'dd-mm-yyyy'), 207347544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (442, to_date('07-11-1950', 'dd-mm-yyyy'), 843458495, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (443, to_date('08-10-1954', 'dd-mm-yyyy'), 477520608, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (444, to_date('25-12-1969', 'dd-mm-yyyy'), 385114707, 'DONE');
commit;
prompt 400 records committed...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (445, to_date('13-02-2013', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (446, to_date('13-05-1985', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (447, to_date('31-07-1954', 'dd-mm-yyyy'), 136082895, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (448, to_date('26-09-1977', 'dd-mm-yyyy'), 162788221, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (449, to_date('24-02-2007', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (450, to_date('10-03-1986', 'dd-mm-yyyy'), 193186555, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (451, to_date('01-04-1950', 'dd-mm-yyyy'), 162788221, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (452, to_date('14-04-1973', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (453, to_date('08-09-1981', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (454, to_date('23-03-1962', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (455, to_date('03-08-1961', 'dd-mm-yyyy'), 599890817, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (456, to_date('26-05-1990', 'dd-mm-yyyy'), 207347544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (458, to_date('10-10-2017', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (459, to_date('07-06-1954', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (460, to_date('26-05-2018', 'dd-mm-yyyy'), 376286668, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (461, to_date('02-12-1985', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (462, to_date('22-06-1997', 'dd-mm-yyyy'), 825589019, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (463, to_date('07-09-1963', 'dd-mm-yyyy'), 825589019, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (464, to_date('29-04-1982', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (465, to_date('21-01-1953', 'dd-mm-yyyy'), 944938337, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (466, to_date('08-09-1981', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (467, to_date('11-11-1950', 'dd-mm-yyyy'), 351922829, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (468, to_date('12-08-1997', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (469, to_date('07-09-1958', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (470, to_date('15-06-1976', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (471, to_date('22-02-1972', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (472, to_date('04-04-1963', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (473, to_date('27-06-2015', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (474, to_date('27-11-1949', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (475, to_date('04-12-2008', 'dd-mm-yyyy'), 439929751, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (476, to_date('30-06-2005', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (477, to_date('26-01-1994', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (478, to_date('06-03-1999', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (479, to_date('06-11-1964', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (480, to_date('22-12-1971', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (481, to_date('06-04-2009', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (482, to_date('02-11-1999', 'dd-mm-yyyy'), 603787067, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (483, to_date('15-05-1973', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (484, to_date('30-05-1992', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (485, to_date('23-11-1964', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (486, to_date('22-10-1961', 'dd-mm-yyyy'), 181436117, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (487, to_date('14-10-2007', 'dd-mm-yyyy'), 971253183, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (488, to_date('16-10-2017', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (489, to_date('15-02-1985', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (490, to_date('15-10-2011', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (491, to_date('17-10-2017', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (492, to_date('05-01-1994', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (493, to_date('15-03-2004', 'dd-mm-yyyy'), 314514324, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (494, to_date('06-03-2002', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (495, to_date('14-07-2016', 'dd-mm-yyyy'), 414400325, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (496, to_date('28-01-1950', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (497, to_date('18-10-1954', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (498, to_date('28-06-1970', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (499, to_date('21-02-1974', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (500, to_date('28-09-2000', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (501, to_date('06-10-1978', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (502, to_date('15-04-2009', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (504, to_date('21-09-1975', 'dd-mm-yyyy'), 951414878, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (505, to_date('20-06-2012', 'dd-mm-yyyy'), 590266488, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (507, to_date('19-03-1958', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (508, to_date('30-04-1971', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (509, to_date('28-07-1970', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (511, to_date('26-10-2002', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (512, to_date('30-08-1952', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (514, to_date('16-02-1982', 'dd-mm-yyyy'), 801292271, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (515, to_date('27-02-1987', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (516, to_date('15-04-1990', 'dd-mm-yyyy'), 747171108, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (518, to_date('12-07-1972', 'dd-mm-yyyy'), 115714750, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (519, to_date('10-01-2009', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (520, to_date('19-05-1979', 'dd-mm-yyyy'), 264250868, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (522, to_date('03-02-2000', 'dd-mm-yyyy'), 399467282, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (523, to_date('25-12-1956', 'dd-mm-yyyy'), 101584298, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (525, to_date('19-01-1979', 'dd-mm-yyyy'), 988686001, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (526, to_date('24-12-1951', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (527, to_date('28-05-1993', 'dd-mm-yyyy'), 747171108, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (529, to_date('11-02-1972', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (530, to_date('09-11-1993', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (532, to_date('08-05-1997', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (533, to_date('07-05-1953', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (534, to_date('19-10-1971', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (536, to_date('26-09-1987', 'dd-mm-yyyy'), 351922829, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (537, to_date('15-10-1953', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (538, to_date('21-09-1952', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (540, to_date('09-12-1968', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (541, to_date('22-02-1959', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (543, to_date('18-08-1955', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (544, to_date('09-07-1978', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (545, to_date('03-02-2008', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (547, to_date('05-01-1998', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (548, to_date('14-11-1982', 'dd-mm-yyyy'), 825589019, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (550, to_date('23-12-1961', 'dd-mm-yyyy'), 439929751, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (551, to_date('18-12-2018', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (552, to_date('17-05-1992', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (554, to_date('10-07-2015', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (555, to_date('24-11-2016', 'dd-mm-yyyy'), 349631451, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (556, to_date('07-02-2019', 'dd-mm-yyyy'), 801292271, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (558, to_date('19-12-2016', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (559, to_date('11-06-1970', 'dd-mm-yyyy'), 944938337, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (561, to_date('14-10-2005', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (562, to_date('14-02-1999', 'dd-mm-yyyy'), 496069738, 'DONE');
commit;
prompt 500 records committed...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (563, to_date('13-12-2019', 'dd-mm-yyyy'), 800947932, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (565, to_date('17-06-1966', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (566, to_date('30-07-1948', 'dd-mm-yyyy'), 801292271, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (568, to_date('06-07-2017', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (569, to_date('19-09-2006', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (570, to_date('26-02-1950', 'dd-mm-yyyy'), 590266488, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (572, to_date('17-10-1973', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (573, to_date('25-04-1994', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (575, to_date('06-06-2016', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (576, to_date('03-04-1982', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (577, to_date('10-05-2006', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (579, to_date('01-05-1958', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (580, to_date('14-02-2004', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (581, to_date('29-01-1982', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (583, to_date('29-03-1965', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (584, to_date('27-12-1975', 'dd-mm-yyyy'), 906935306, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (586, to_date('30-11-1964', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (587, to_date('11-06-1956', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (588, to_date('02-07-2019', 'dd-mm-yyyy'), 988686001, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (590, to_date('23-03-1953', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (591, to_date('18-10-1969', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (593, to_date('02-08-2002', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (594, to_date('14-08-1951', 'dd-mm-yyyy'), 414400325, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (595, to_date('10-04-2019', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (597, to_date('15-02-1976', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (598, to_date('20-03-1970', 'dd-mm-yyyy'), 792078922, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (599, to_date('03-01-1975', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (601, to_date('11-07-1996', 'dd-mm-yyyy'), 477520608, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (602, to_date('19-09-1994', 'dd-mm-yyyy'), 906935306, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (604, to_date('08-05-1979', 'dd-mm-yyyy'), 718428613, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (605, to_date('08-08-1984', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (606, to_date('04-05-2009', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (608, to_date('30-07-1986', 'dd-mm-yyyy'), 951414878, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (609, to_date('18-11-2010', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (611, to_date('07-07-1982', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (612, to_date('01-01-1962', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (613, to_date('27-05-1984', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (614, to_date('24-05-1981', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (615, to_date('05-07-2009', 'dd-mm-yyyy'), 558414787, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (616, to_date('05-06-2011', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (617, to_date('08-01-2012', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (618, to_date('07-02-1989', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (619, to_date('06-07-1984', 'dd-mm-yyyy'), 558414787, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (620, to_date('30-01-1961', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (621, to_date('11-03-1988', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (622, to_date('02-11-1966', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (623, to_date('14-08-1959', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (624, to_date('16-10-1949', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (625, to_date('14-04-1999', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (626, to_date('08-09-1978', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (627, to_date('30-05-1993', 'dd-mm-yyyy'), 162788221, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (628, to_date('26-08-1999', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (629, to_date('12-05-1958', 'dd-mm-yyyy'), 590266488, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (630, to_date('16-04-2013', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (631, to_date('05-01-1995', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (632, to_date('12-03-2005', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (633, to_date('29-06-1982', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (634, to_date('30-03-1984', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (635, to_date('20-08-1950', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (636, to_date('25-01-1997', 'dd-mm-yyyy'), 181436117, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (637, to_date('15-07-2000', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (638, to_date('14-01-2005', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (639, to_date('10-08-1956', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (640, to_date('14-03-1960', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (641, to_date('12-06-1959', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (642, to_date('18-06-2002', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (643, to_date('15-12-1986', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (644, to_date('23-06-1998', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (645, to_date('23-01-1981', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (646, to_date('14-07-1964', 'dd-mm-yyyy'), 504967455, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (647, to_date('01-06-1971', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (648, to_date('27-11-1981', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (649, to_date('01-06-1965', 'dd-mm-yyyy'), 513160497, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (650, to_date('06-12-1958', 'dd-mm-yyyy'), 567796300, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (651, to_date('02-01-1968', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (652, to_date('21-04-1972', 'dd-mm-yyyy'), 477520608, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (653, to_date('08-07-2008', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (654, to_date('22-11-1993', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (655, to_date('19-01-1998', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (656, to_date('15-06-1987', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (657, to_date('28-08-1978', 'dd-mm-yyyy'), 747171108, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (658, to_date('29-08-2009', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (659, to_date('04-10-1975', 'dd-mm-yyyy'), 162788221, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (660, to_date('12-10-1967', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (661, to_date('14-03-1979', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (662, to_date('22-05-2000', 'dd-mm-yyyy'), 599890817, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (663, to_date('26-03-1948', 'dd-mm-yyyy'), 162788221, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (664, to_date('10-07-2017', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (665, to_date('21-11-1969', 'dd-mm-yyyy'), 349631451, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (666, to_date('30-07-1978', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (667, to_date('18-01-1998', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (668, to_date('30-05-1984', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (669, to_date('21-08-1986', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (670, to_date('21-12-1997', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (671, to_date('12-04-1952', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (672, to_date('30-10-1961', 'dd-mm-yyyy'), 399467282, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (673, to_date('27-10-1951', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (674, to_date('06-01-2019', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (675, to_date('21-01-1978', 'dd-mm-yyyy'), 951414878, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (676, to_date('01-07-1985', 'dd-mm-yyyy'), 951414878, 'DONE');
commit;
prompt 600 records committed...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (677, to_date('31-01-2011', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (678, to_date('28-09-1976', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (679, to_date('11-08-1976', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (680, to_date('20-08-2004', 'dd-mm-yyyy'), 399467282, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (681, to_date('18-08-1956', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (682, to_date('24-03-1979', 'dd-mm-yyyy'), 414400325, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (683, to_date('26-10-2007', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (684, to_date('20-08-1983', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (685, to_date('08-01-1969', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (686, to_date('23-06-1988', 'dd-mm-yyyy'), 399467282, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (687, to_date('01-04-2017', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (688, to_date('26-03-1990', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (689, to_date('23-06-2013', 'dd-mm-yyyy'), 947447478, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (691, to_date('18-09-2017', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (692, to_date('11-03-1982', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (693, to_date('29-08-1978', 'dd-mm-yyyy'), 971253183, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (694, to_date('08-02-2016', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (695, to_date('25-04-2005', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (696, to_date('15-06-2012', 'dd-mm-yyyy'), 567796300, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (697, to_date('27-12-1981', 'dd-mm-yyyy'), 558414787, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (698, to_date('19-07-1983', 'dd-mm-yyyy'), 439929751, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (699, to_date('26-12-1969', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (700, to_date('02-11-1988', 'dd-mm-yyyy'), 477520608, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (701, to_date('05-06-1977', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (702, to_date('24-03-1987', 'dd-mm-yyyy'), 351922829, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (703, to_date('15-07-2000', 'dd-mm-yyyy'), 525253498, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (704, to_date('08-03-1996', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (705, to_date('11-10-1961', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (706, to_date('24-03-1976', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (707, to_date('20-03-1980', 'dd-mm-yyyy'), 800947932, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (708, to_date('13-01-1957', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (709, to_date('28-06-1987', 'dd-mm-yyyy'), 264250868, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (710, to_date('10-08-2003', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (711, to_date('27-09-1952', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (712, to_date('29-10-1998', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (713, to_date('07-12-1981', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (714, to_date('29-10-1956', 'dd-mm-yyyy'), 376286668, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (715, to_date('07-11-2006', 'dd-mm-yyyy'), 802374700, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (716, to_date('12-07-2015', 'dd-mm-yyyy'), 952094084, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (717, to_date('25-03-1949', 'dd-mm-yyyy'), 801292271, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (718, to_date('03-09-1994', 'dd-mm-yyyy'), 567796300, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (719, to_date('10-05-1967', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (720, to_date('02-11-2007', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (721, to_date('08-07-1978', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (722, to_date('02-09-1962', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (723, to_date('04-09-1972', 'dd-mm-yyyy'), 395234141, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (724, to_date('04-11-1977', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (725, to_date('06-10-1986', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (726, to_date('06-01-2019', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (727, to_date('28-11-1994', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (728, to_date('17-03-1954', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (729, to_date('24-01-1988', 'dd-mm-yyyy'), 439929751, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (730, to_date('28-12-1950', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (731, to_date('05-05-1958', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (732, to_date('25-10-2003', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (733, to_date('06-06-1953', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (734, to_date('20-11-1989', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (735, to_date('12-07-1952', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (736, to_date('19-12-2013', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (737, to_date('04-02-1981', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (738, to_date('08-06-1956', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (739, to_date('01-11-1963', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (740, to_date('17-01-1965', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (741, to_date('19-04-1985', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (742, to_date('17-09-1976', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (743, to_date('16-06-1989', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (744, to_date('08-09-1973', 'dd-mm-yyyy'), 843458495, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (745, to_date('08-08-1983', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (746, to_date('28-07-1960', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (747, to_date('01-01-1958', 'dd-mm-yyyy'), 101584298, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (748, to_date('12-06-1962', 'dd-mm-yyyy'), 513160497, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (749, to_date('30-08-1974', 'dd-mm-yyyy'), 504967455, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (750, to_date('27-07-2002', 'dd-mm-yyyy'), 906935306, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (751, to_date('09-07-1960', 'dd-mm-yyyy'), 747171108, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (752, to_date('24-12-1963', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (753, to_date('20-07-1982', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (754, to_date('18-05-1977', 'dd-mm-yyyy'), 988686001, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (755, to_date('18-01-2000', 'dd-mm-yyyy'), 825589019, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (756, to_date('14-09-1979', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (757, to_date('16-07-1979', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (758, to_date('16-09-1985', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (759, to_date('29-08-1979', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (760, to_date('25-12-1968', 'dd-mm-yyyy'), 513160497, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (761, to_date('23-05-1975', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (762, to_date('29-09-1994', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (763, to_date('05-01-2001', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (764, to_date('17-10-1968', 'dd-mm-yyyy'), 947447478, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (765, to_date('04-03-1985', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (766, to_date('15-01-1969', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (767, to_date('28-05-1965', 'dd-mm-yyyy'), 792078922, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (768, to_date('23-11-1983', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (769, to_date('17-07-2019', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (770, to_date('23-12-1987', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (771, to_date('21-04-1989', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (772, to_date('30-06-2007', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (773, to_date('17-07-1953', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (774, to_date('23-08-1989', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (775, to_date('28-05-1978', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (776, to_date('07-06-1956', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (777, to_date('26-11-1993', 'dd-mm-yyyy'), 558414787, 'DONE');
commit;
prompt 700 records committed...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (778, to_date('18-04-2005', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (779, to_date('04-03-2016', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (781, to_date('03-11-2016', 'dd-mm-yyyy'), 633097629, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (782, to_date('02-04-1948', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (784, to_date('14-05-2016', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (785, to_date('08-05-2008', 'dd-mm-yyyy'), 314514324, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (786, to_date('02-05-1965', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (788, to_date('23-09-1958', 'dd-mm-yyyy'), 800947932, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (789, to_date('01-01-1951', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (790, to_date('10-10-1982', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (792, to_date('31-12-1984', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (793, to_date('28-03-1949', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (795, to_date('26-11-2009', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (796, to_date('30-03-1985', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (797, to_date('05-03-2017', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (799, to_date('25-04-1998', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (800, to_date('03-09-1964', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (802, to_date('08-03-1973', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (803, to_date('11-01-1991', 'dd-mm-yyyy'), 477520608, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (804, to_date('02-05-1956', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (806, to_date('27-12-2009', 'dd-mm-yyyy'), 951414878, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (807, to_date('26-03-1973', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (808, to_date('09-04-1992', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (810, to_date('31-10-1979', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (811, to_date('04-04-1994', 'dd-mm-yyyy'), 971253183, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (813, to_date('18-04-1993', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (814, to_date('22-10-2001', 'dd-mm-yyyy'), 439929751, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (815, to_date('16-08-1966', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (817, to_date('10-09-1984', 'dd-mm-yyyy'), 162788221, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (818, to_date('16-11-2017', 'dd-mm-yyyy'), 971253183, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (820, to_date('17-11-1975', 'dd-mm-yyyy'), 801292271, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (821, to_date('08-03-1985', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (822, to_date('17-10-1950', 'dd-mm-yyyy'), 115714750, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (824, to_date('19-06-1948', 'dd-mm-yyyy'), 525253498, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (825, to_date('19-11-2004', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (826, to_date('11-07-1992', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (828, to_date('15-08-1956', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (829, to_date('17-12-2011', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (831, to_date('26-05-1956', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (832, to_date('07-01-1961', 'dd-mm-yyyy'), 952094084, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (833, to_date('02-12-1994', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (835, to_date('28-05-1993', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (836, to_date('14-07-1989', 'dd-mm-yyyy'), 207347544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (838, to_date('01-05-1951', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (839, to_date('04-08-1973', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (840, to_date('01-06-2000', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (842, to_date('07-01-2007', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (843, to_date('26-02-2011', 'dd-mm-yyyy'), 801292271, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (844, to_date('23-12-2019', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (846, to_date('27-04-1991', 'dd-mm-yyyy'), 590266488, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (847, to_date('08-11-2005', 'dd-mm-yyyy'), 802374700, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (849, to_date('09-05-2002', 'dd-mm-yyyy'), 242585762, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (850, to_date('04-05-1956', 'dd-mm-yyyy'), 952094084, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (851, to_date('28-07-2004', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (853, to_date('08-02-1968', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (854, to_date('10-05-1992', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (856, to_date('05-08-1967', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (857, to_date('08-08-1967', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (858, to_date('23-03-1976', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (860, to_date('23-05-1948', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (861, to_date('20-01-1950', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (862, to_date('28-04-1954', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (864, to_date('22-08-1995', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (865, to_date('26-05-1969', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (867, to_date('31-10-1966', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (868, to_date('18-01-2015', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (869, to_date('31-01-2017', 'dd-mm-yyyy'), 414400325, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (871, to_date('16-02-1997', 'dd-mm-yyyy'), 558414787, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (872, to_date('28-01-1990', 'dd-mm-yyyy'), 264250868, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (874, to_date('10-09-2011', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (875, to_date('07-10-1987', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (876, to_date('12-08-2011', 'dd-mm-yyyy'), 590266488, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (878, to_date('16-11-1978', 'dd-mm-yyyy'), 869296845, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (879, to_date('28-09-1996', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (880, to_date('19-02-2006', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (882, to_date('24-01-1980', 'dd-mm-yyyy'), 525253498, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (883, to_date('20-07-1971', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (885, to_date('15-10-2019', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (886, to_date('18-01-2012', 'dd-mm-yyyy'), 718428613, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (887, to_date('19-03-1953', 'dd-mm-yyyy'), 399467282, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (889, to_date('29-08-1968', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (890, to_date('31-07-1951', 'dd-mm-yyyy'), 843458495, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (892, to_date('04-01-1972', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (893, to_date('23-12-1973', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (894, to_date('22-04-1974', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (896, to_date('31-03-1965', 'dd-mm-yyyy'), 399467282, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (897, to_date('07-02-1966', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (899, to_date('16-09-1971', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (900, to_date('04-11-1958', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (901, to_date('13-04-2005', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (903, to_date('30-06-2007', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (904, to_date('18-06-1988', 'dd-mm-yyyy'), 349631451, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (905, to_date('13-12-1956', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (907, to_date('27-12-2006', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (908, to_date('30-07-1948', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (910, to_date('24-07-1972', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (911, to_date('06-06-1997', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (912, to_date('17-08-2004', 'dd-mm-yyyy'), 184263508, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (914, to_date('18-05-2018', 'dd-mm-yyyy'), 376286668, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (915, to_date('03-12-1997', 'dd-mm-yyyy'), 481548013, 'DONE');
commit;
prompt 800 records committed...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (916, to_date('10-09-1983', 'dd-mm-yyyy'), 525253498, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (917, to_date('04-04-1990', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (918, to_date('13-06-2004', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (919, to_date('26-06-1971', 'dd-mm-yyyy'), 439929751, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (920, to_date('01-09-1975', 'dd-mm-yyyy'), 477520608, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (921, to_date('03-05-2013', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (922, to_date('04-06-1978', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (923, to_date('05-08-2015', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (924, to_date('09-12-1984', 'dd-mm-yyyy'), 802374700, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (925, to_date('04-04-1956', 'dd-mm-yyyy'), 314514324, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (926, to_date('19-03-1984', 'dd-mm-yyyy'), 314514324, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (927, to_date('25-03-1999', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (928, to_date('20-07-2000', 'dd-mm-yyyy'), 947447478, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (929, to_date('21-10-2012', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (930, to_date('30-05-1999', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (931, to_date('06-06-2014', 'dd-mm-yyyy'), 567796300, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (848, to_date('26-09-1978', 'dd-mm-yyyy'), 747171108, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (933, to_date('11-01-1979', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (934, to_date('18-03-2003', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (935, to_date('01-05-1986', 'dd-mm-yyyy'), 101584298, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (936, to_date('15-10-1968', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (937, to_date('16-07-1972', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (938, to_date('02-11-1958', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (939, to_date('19-09-1953', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (940, to_date('04-05-1977', 'dd-mm-yyyy'), 843512931, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (941, to_date('21-04-1950', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (942, to_date('18-06-1998', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (943, to_date('25-01-2012', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (944, to_date('03-12-2005', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (945, to_date('10-12-1968', 'dd-mm-yyyy'), 906935306, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (946, to_date('16-08-2018', 'dd-mm-yyyy'), 766242929, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (947, to_date('03-02-1991', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (948, to_date('15-12-1970', 'dd-mm-yyyy'), 789685574, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (949, to_date('15-07-1963', 'dd-mm-yyyy'), 800947932, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (950, to_date('25-02-1982', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (951, to_date('21-10-2018', 'dd-mm-yyyy'), 498875242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (952, to_date('15-01-1983', 'dd-mm-yyyy'), 414400325, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (953, to_date('26-11-1980', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (954, to_date('05-08-1990', 'dd-mm-yyyy'), 869296845, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (955, to_date('15-01-1956', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (956, to_date('23-08-1962', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (957, to_date('01-06-2003', 'dd-mm-yyyy'), 980238247, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (958, to_date('17-02-1983', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (959, to_date('09-07-2005', 'dd-mm-yyyy'), 718428613, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (960, to_date('07-04-1962', 'dd-mm-yyyy'), 525253498, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (961, to_date('12-04-2011', 'dd-mm-yyyy'), 792078922, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (962, to_date('29-12-1997', 'dd-mm-yyyy'), 951414878, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (963, to_date('26-05-1975', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (964, to_date('10-02-1971', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (965, to_date('07-05-1995', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (966, to_date('29-05-1988', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (967, to_date('17-04-2005', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (968, to_date('06-04-1994', 'dd-mm-yyyy'), 951414878, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (969, to_date('27-05-1992', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (970, to_date('25-12-1984', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (971, to_date('09-11-2018', 'dd-mm-yyyy'), 136082895, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (973, to_date('20-12-1998', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (974, to_date('30-08-1956', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (975, to_date('20-10-1990', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (976, to_date('25-09-1987', 'dd-mm-yyyy'), 599890817, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (977, to_date('05-08-1979', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (978, to_date('18-02-2018', 'dd-mm-yyyy'), 995102445, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (979, to_date('16-06-1948', 'dd-mm-yyyy'), 101584298, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (980, to_date('24-02-1995', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (981, to_date('25-08-1969', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (982, to_date('28-09-1975', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (983, to_date('27-10-1995', 'dd-mm-yyyy'), 376286668, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (984, to_date('01-12-2010', 'dd-mm-yyyy'), 207347544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (985, to_date('20-08-1984', 'dd-mm-yyyy'), 944938337, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (986, to_date('04-12-2011', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (987, to_date('04-02-2000', 'dd-mm-yyyy'), 800947932, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (988, to_date('31-07-1970', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (989, to_date('22-12-1951', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (990, to_date('21-02-1988', 'dd-mm-yyyy'), 540114031, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (991, to_date('25-09-1948', 'dd-mm-yyyy'), 906935306, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (992, to_date('05-02-2017', 'dd-mm-yyyy'), 439929751, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (993, to_date('18-04-1953', 'dd-mm-yyyy'), 971253183, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (994, to_date('06-04-1958', 'dd-mm-yyyy'), 801292271, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (995, to_date('03-01-1969', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (996, to_date('04-07-1981', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (997, to_date('04-04-1985', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (998, to_date('13-07-1948', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (999, to_date('10-01-2010', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (1000, to_date('04-02-2002', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (174, to_date('18-05-2002', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (178, to_date('27-04-2013', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (182, to_date('03-01-1966', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (185, to_date('22-08-2015', 'dd-mm-yyyy'), 376286668, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (189, to_date('01-07-2002', 'dd-mm-yyyy'), 942996913, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (192, to_date('04-12-2014', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (196, to_date('09-11-1983', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (201, to_date('22-09-1994', 'dd-mm-yyyy'), 563119002, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (204, to_date('21-12-2018', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (208, to_date('15-03-2019', 'dd-mm-yyyy'), 971253183, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (211, to_date('03-01-1991', 'dd-mm-yyyy'), 404883551, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (215, to_date('14-07-1963', 'dd-mm-yyyy'), 207347544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (219, to_date('06-11-1971', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (222, to_date('04-01-1980', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (226, to_date('19-06-1980', 'dd-mm-yyyy'), 366343244, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (229, to_date('19-01-1960', 'dd-mm-yyyy'), 440414604, 'DONE');
commit;
prompt 900 records committed...
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (233, to_date('24-05-1999', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (237, to_date('05-09-1989', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (240, to_date('22-01-2012', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (244, to_date('09-05-1964', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (247, to_date('23-07-1983', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (251, to_date('01-04-1949', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (255, to_date('03-04-1990', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (258, to_date('05-01-1999', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (262, to_date('31-10-1961', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (265, to_date('28-04-2000', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (269, to_date('09-09-2018', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (273, to_date('30-06-1974', 'dd-mm-yyyy'), 947447478, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (276, to_date('18-01-1992', 'dd-mm-yyyy'), 349631451, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (280, to_date('26-03-1975', 'dd-mm-yyyy'), 502131885, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (283, to_date('29-06-2006', 'dd-mm-yyyy'), 349631451, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (287, to_date('19-06-1984', 'dd-mm-yyyy'), 385114707, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (291, to_date('16-09-2010', 'dd-mm-yyyy'), 602857670, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (294, to_date('19-11-2005', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (298, to_date('24-10-2000', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (301, to_date('06-08-2005', 'dd-mm-yyyy'), 243336161, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (305, to_date('30-12-1970', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (503, to_date('13-10-1949', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (506, to_date('02-08-1978', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (510, to_date('17-10-1996', 'dd-mm-yyyy'), 535163098, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (513, to_date('26-04-1952', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (517, to_date('08-05-1966', 'dd-mm-yyyy'), 193186555, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (521, to_date('28-12-1965', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (524, to_date('06-06-1993', 'dd-mm-yyyy'), 525386822, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (528, to_date('21-05-1976', 'dd-mm-yyyy'), 707509224, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (531, to_date('14-01-1980', 'dd-mm-yyyy'), 507339068, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (535, to_date('15-01-2006', 'dd-mm-yyyy'), 839552387, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (539, to_date('12-07-2002', 'dd-mm-yyyy'), 609870937, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (542, to_date('22-04-1959', 'dd-mm-yyyy'), 603787067, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (546, to_date('27-05-1979', 'dd-mm-yyyy'), 481548013, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (549, to_date('26-01-1953', 'dd-mm-yyyy'), 483475435, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (553, to_date('31-07-1963', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (557, to_date('25-12-1971', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (560, to_date('19-12-1948', 'dd-mm-yyyy'), 718428613, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (564, to_date('25-05-1976', 'dd-mm-yyyy'), 567796300, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (567, to_date('26-07-1951', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (571, to_date('09-10-1999', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (574, to_date('16-10-1957', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (578, to_date('29-12-1983', 'dd-mm-yyyy'), 116564125, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (582, to_date('27-09-1987', 'dd-mm-yyyy'), 440414604, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (585, to_date('02-03-1974', 'dd-mm-yyyy'), 708442139, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (589, to_date('09-07-1990', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (592, to_date('14-07-1989', 'dd-mm-yyyy'), 549493698, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (596, to_date('04-11-2016', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (600, to_date('06-04-1957', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (603, to_date('03-11-1969', 'dd-mm-yyyy'), 349631451, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (607, to_date('17-05-1964', 'dd-mm-yyyy'), 834241599, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (610, to_date('26-03-2006', 'dd-mm-yyyy'), 214158330, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (780, to_date('08-11-1952', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (783, to_date('23-11-1982', 'dd-mm-yyyy'), 580488974, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (787, to_date('21-03-1989', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (791, to_date('19-03-1968', 'dd-mm-yyyy'), 525253498, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (794, to_date('23-08-1958', 'dd-mm-yyyy'), 926145059, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (798, to_date('10-10-1977', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (801, to_date('21-11-1960', 'dd-mm-yyyy'), 122924782, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (805, to_date('28-03-2003', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (809, to_date('12-02-1991', 'dd-mm-yyyy'), 727135472, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (812, to_date('18-03-1989', 'dd-mm-yyyy'), 637575251, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (816, to_date('18-09-1980', 'dd-mm-yyyy'), 590266488, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (819, to_date('06-08-1991', 'dd-mm-yyyy'), 988686001, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (823, to_date('25-03-1987', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (827, to_date('28-11-1986', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (830, to_date('05-03-2015', 'dd-mm-yyyy'), 205862893, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (834, to_date('24-05-1976', 'dd-mm-yyyy'), 719059544, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (837, to_date('30-05-1975', 'dd-mm-yyyy'), 872367234, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (841, to_date('07-07-1971', 'dd-mm-yyyy'), 128080684, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (845, to_date('19-07-1983', 'dd-mm-yyyy'), 681488617, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (852, to_date('11-02-1966', 'dd-mm-yyyy'), 181436117, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (855, to_date('06-05-2009', 'dd-mm-yyyy'), 553099150, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (859, to_date('04-12-1951', 'dd-mm-yyyy'), 349631451, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (863, to_date('26-10-1978', 'dd-mm-yyyy'), 275351971, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (866, to_date('12-12-2007', 'dd-mm-yyyy'), 496069738, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (870, to_date('04-04-1961', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (873, to_date('14-05-1949', 'dd-mm-yyyy'), 792078922, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (877, to_date('11-02-2013', 'dd-mm-yyyy'), 963532017, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (881, to_date('05-02-1954', 'dd-mm-yyyy'), 165847242, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (884, to_date('26-05-1954', 'dd-mm-yyyy'), 967108709, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (888, to_date('03-08-1952', 'dd-mm-yyyy'), 441023695, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (891, to_date('08-11-2014', 'dd-mm-yyyy'), 431317000, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (895, to_date('17-09-2006', 'dd-mm-yyyy'), 243238131, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (898, to_date('04-03-1952', 'dd-mm-yyyy'), 918208321, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (902, to_date('10-05-1989', 'dd-mm-yyyy'), 513160497, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (906, to_date('07-09-2008', 'dd-mm-yyyy'), 675278483, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (909, to_date('11-07-1981', 'dd-mm-yyyy'), 884150938, 'DONE');
insert into CALLHELP (callid, calldate, dispatcherid, status)
values (913, to_date('14-09-1966', 'dd-mm-yyyy'), 395234141, 'DONE');
commit;
prompt 989 records loaded
prompt Loading DONOR...
insert into DONOR (donorid)
values (103990446);
insert into DONOR (donorid)
values (648494766);
insert into DONOR (donorid)
values (754541818);
commit;
prompt 3 records loaded
prompt Loading DONATION...
insert into DONATION (donationdate, donationid, donationstatus, donorid)
values (to_date('06-05-2019', 'dd-mm-yyyy'), 1, 'Canceled', 103990446);
insert into DONATION (donationdate, donationid, donationstatus, donorid)
values (to_date('26-01-2015', 'dd-mm-yyyy'), 2, 'Canceled', 103990446);
insert into DONATION (donationdate, donationid, donationstatus, donorid)
values (to_date('07-07-2018', 'dd-mm-yyyy'), 3, 'Canceled', 754541818);
insert into DONATION (donationdate, donationid, donationstatus, donorid)
values (to_date('20-02-2019', 'dd-mm-yyyy'), 4, 'Canceled', 754541818);
insert into DONATION (donationdate, donationid, donationstatus, donorid)
values (to_date('28-09-2019', 'dd-mm-yyyy'), 5, 'Canceled', 648494766);
commit;
prompt 5 records loaded
prompt Loading ITEMTYPE...
insert into ITEMTYPE (itemname)
values (' ambulance');
insert into ITEMTYPE (itemname)
values (' stretcher');
insert into ITEMTYPE (itemname)
values (' weelchair');
insert into ITEMTYPE (itemname)
values ('Ambulance');
insert into ITEMTYPE (itemname)
values ('Blanket');
insert into ITEMTYPE (itemname)
values ('Clothes');
insert into ITEMTYPE (itemname)
values ('Medicine');
insert into ITEMTYPE (itemname)
values ('Stretcher');
insert into ITEMTYPE (itemname)
values ('Wheelchair');
commit;
prompt 9 records loaded
prompt Loading WAREHOUSE...
insert into WAREHOUSE (warehouseid, address, itemscapacity, storekeeperscapacity)
values (1, '838 Dennis', 216, 69);
insert into WAREHOUSE (warehouseid, address, itemscapacity, storekeeperscapacity)
values (2, '415 Heche', 193, 30);
insert into WAREHOUSE (warehouseid, address, itemscapacity, storekeeperscapacity)
values (3, '81 Park Ri', 358, 46);
insert into WAREHOUSE (warehouseid, address, itemscapacity, storekeeperscapacity)
values (4, '89 Gordon ', 173, 58);
insert into WAREHOUSE (warehouseid, address, itemscapacity, storekeeperscapacity)
values (5, '93 Oak Par', 291, 35);
insert into WAREHOUSE (warehouseid, address, itemscapacity, storekeeperscapacity)
values (6, '358 Leguiz', 505, 49);
insert into WAREHOUSE (warehouseid, address, itemscapacity, storekeeperscapacity)
values (7, '877 Rita D', 510, 54);
commit;
prompt 7 records loaded
prompt Loading STOREKEEPER...
insert into STOREKEEPER (experience, storekeeperid, warehouseid)
values ('Manager', 199676039, 6);
insert into STOREKEEPER (experience, storekeeperid, warehouseid)
values ('Manager', 39526248, 7);
insert into STOREKEEPER (experience, storekeeperid, warehouseid)
values ('Manager', 352960943, 2);
commit;
prompt 3 records loaded
prompt Loading ORDERING...
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, storekeeperid)
values (1, to_date('01-09-2012', 'dd-mm-yyyy'), 145, 'Canceled', 352960943);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, storekeeperid)
values (2, to_date('27-07-2011', 'dd-mm-yyyy'), 119, 'Canceled', 352960943);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, storekeeperid)
values (3, to_date('31-01-2010', 'dd-mm-yyyy'), 0, 'Canceled', 39526248);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, storekeeperid)
values (4, to_date('14-10-2019', 'dd-mm-yyyy'), 179, 'Done', 39526248);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, storekeeperid)
values (5, to_date('03-09-2017', 'dd-mm-yyyy'), 8, 'Canceled', 199676039);
insert into ORDERING (orderid, orderdate, shippingprice, orderstatus, storekeeperid)
values (6, to_date('13-11-2012', 'dd-mm-yyyy'), 659, 'Done', 199676039);
commit;
prompt 6 records loaded
prompt Loading ITEM...
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (1, 'Stretcher', 45, 'Flake-Wilk', 1, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (2, 'Wheelchair', 199, 'Myricom', 0, 5, 6);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (3, 'Clothes', 289, 'National H', 3, 3, 7);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (4, 'Medicine', 34, 'Southern F', 1, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (5, 'Ambulance', 215, 'CREDO Petr', 1, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (6, 'Blanket', 20, 'SourceGear', 1, 3, 7);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (7, 'Wheelchair', 179, 'Air Method', 1, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (8, 'Medicine', 3, 'Momentum M', 5, 6, 6);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (9, ' weelchair', 100, ' weel', 5, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (10, ' ambulance', 100000, ' h&v', 6, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (13, ' stretcher', 7000, ' health', 5, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (14, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (15, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (16, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (17, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (18, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (19, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (20, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (21, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (22, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (23, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (24, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (25, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (26, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (27, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (28, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (29, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (30, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (31, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (32, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (33, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (34, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (35, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (36, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (37, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (38, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (39, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (40, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (41, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (42, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (43, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (44, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (45, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (46, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (47, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (48, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (49, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (50, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (51, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (52, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (53, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (54, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (55, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (56, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (57, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (58, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (59, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (60, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (61, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (62, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (63, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (64, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (65, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (66, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (67, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (68, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (69, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (70, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (71, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (72, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (73, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (74, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (75, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (76, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (77, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (78, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (79, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (80, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (81, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (82, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (83, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (84, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (85, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (86, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (87, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (88, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (89, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (90, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (91, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (92, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (93, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (94, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (95, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (96, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (97, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (98, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (99, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (100, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (101, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (102, 'Ambulance', 0, 'Yad2', 0, null, null);
commit;
prompt 100 records committed...
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (103, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (104, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (105, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (106, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (107, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (108, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (109, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (110, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (111, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (112, 'Ambulance', 0, 'Yad2', 0, null, null);
insert into ITEM (itemid, itemname, price, companyname, warrantyears, orderid, warehouseid)
values (113, 'Ambulance', 0, 'Yad2', 0, null, null);
commit;
prompt 111 records loaded
prompt Loading DONATEITEM...
insert into DONATEITEM (donationid, itemid)
values (1, 5);
insert into DONATEITEM (donationid, itemid)
values (5, 4);
commit;
prompt 2 records loaded
prompt Loading DRIVER...
insert into DRIVER (driverid)
values (101584298);
insert into DRIVER (driverid)
values (144935536);
insert into DRIVER (driverid)
values (150507078);
insert into DRIVER (driverid)
values (156186136);
insert into DRIVER (driverid)
values (161160901);
insert into DRIVER (driverid)
values (169997654);
insert into DRIVER (driverid)
values (171117624);
insert into DRIVER (driverid)
values (178457229);
insert into DRIVER (driverid)
values (203883392);
insert into DRIVER (driverid)
values (205827981);
insert into DRIVER (driverid)
values (210204404);
insert into DRIVER (driverid)
values (234659034);
insert into DRIVER (driverid)
values (235345052);
insert into DRIVER (driverid)
values (238992471);
insert into DRIVER (driverid)
values (259790830);
insert into DRIVER (driverid)
values (260961871);
insert into DRIVER (driverid)
values (274340804);
insert into DRIVER (driverid)
values (299400522);
insert into DRIVER (driverid)
values (305336709);
insert into DRIVER (driverid)
values (327599490);
insert into DRIVER (driverid)
values (337884271);
insert into DRIVER (driverid)
values (353002056);
insert into DRIVER (driverid)
values (356009760);
insert into DRIVER (driverid)
values (356886576);
insert into DRIVER (driverid)
values (368489397);
insert into DRIVER (driverid)
values (390685535);
insert into DRIVER (driverid)
values (394178853);
insert into DRIVER (driverid)
values (403208661);
insert into DRIVER (driverid)
values (408357513);
insert into DRIVER (driverid)
values (411522632);
insert into DRIVER (driverid)
values (413997128);
insert into DRIVER (driverid)
values (414668590);
insert into DRIVER (driverid)
values (422988413);
insert into DRIVER (driverid)
values (434134560);
insert into DRIVER (driverid)
values (467610759);
insert into DRIVER (driverid)
values (467624110);
insert into DRIVER (driverid)
values (475197916);
insert into DRIVER (driverid)
values (494877713);
insert into DRIVER (driverid)
values (512089472);
insert into DRIVER (driverid)
values (512333062);
insert into DRIVER (driverid)
values (512647397);
insert into DRIVER (driverid)
values (530131962);
insert into DRIVER (driverid)
values (535975740);
insert into DRIVER (driverid)
values (543820399);
insert into DRIVER (driverid)
values (562129084);
insert into DRIVER (driverid)
values (605815385);
insert into DRIVER (driverid)
values (607515527);
insert into DRIVER (driverid)
values (649977206);
insert into DRIVER (driverid)
values (659837175);
insert into DRIVER (driverid)
values (685378695);
insert into DRIVER (driverid)
values (717450469);
insert into DRIVER (driverid)
values (726500787);
insert into DRIVER (driverid)
values (741127642);
insert into DRIVER (driverid)
values (744119752);
insert into DRIVER (driverid)
values (751921020);
insert into DRIVER (driverid)
values (762566292);
insert into DRIVER (driverid)
values (765141502);
insert into DRIVER (driverid)
values (791364724);
insert into DRIVER (driverid)
values (796808759);
insert into DRIVER (driverid)
values (801444708);
insert into DRIVER (driverid)
values (802698033);
insert into DRIVER (driverid)
values (806090432);
insert into DRIVER (driverid)
values (825072524);
insert into DRIVER (driverid)
values (841009827);
insert into DRIVER (driverid)
values (843519385);
insert into DRIVER (driverid)
values (846551850);
insert into DRIVER (driverid)
values (847856992);
insert into DRIVER (driverid)
values (852113698);
insert into DRIVER (driverid)
values (858604549);
insert into DRIVER (driverid)
values (859974578);
insert into DRIVER (driverid)
values (882458516);
insert into DRIVER (driverid)
values (883025897);
insert into DRIVER (driverid)
values (910230564);
insert into DRIVER (driverid)
values (927539471);
insert into DRIVER (driverid)
values (942644760);
insert into DRIVER (driverid)
values (961635098);
insert into DRIVER (driverid)
values (988686001);
insert into DRIVER (driverid)
values (996027713);
commit;
prompt 78 records loaded
prompt Loading PARAMEDIC...
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (17, 910148391);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (5, 602857670);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 442765602);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (37, 766713817);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (5, 966618858);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (35, 953369172);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 286048247);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (16, 481161391);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 442065013);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (46, 942644760);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 304761100);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (15, 256239435);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 883025897);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (13, 609721920);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 165847242);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (21, 378936331);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 382284930);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 343281461);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (12, 345166422);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 953237471);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (4, 559464664);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (8, 927539471);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (1, 817135362);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (49, 134024937);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (2, 302976561);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 239803816);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 265119104);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (34, 417582361);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (2, 178457229);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (44, 762139241);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (39, 628551248);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 245675893);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (9, 100263721);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 238035478);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (43, 214158330);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 900618507);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (9, 898255498);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (13, 803721923);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (20, 802477498);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (50, 347639660);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (37, 138192266);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (23, 577311698);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (36, 227798879);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (40, 339593939);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (25, 727135472);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (15, 526367693);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (28, 896635944);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (22, 376286668);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (34, 579654282);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 948139256);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (21, 886541617);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (35, 150507078);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (40, 159353604);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (43, 373176861);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (6, 681488617);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (32, 152977912);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (1, 812843652);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (45, 858875113);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (21, 339897673);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (44, 429375037);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (27, 417752520);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 605351268);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (22, 479816079);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (12, 842479128);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (14, 812565282);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 329900476);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (36, 738015436);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 831093867);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 140899169);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (21, 801292271);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (24, 685783715);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (48, 244240688);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (13, 342067673);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (49, 388211214);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (6, 571147818);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 520066928);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 901297210);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (0, 926145059);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 307344200);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (4, 982427445);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (44, 711979218);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 435639070);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (16, 631365623);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (11, 974874812);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (22, 614843052);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 761247130);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (9, 394178853);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (14, 349631451);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (38, 719059544);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (18, 356102475);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (49, 654307339);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (9, 364957248);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (34, 741630052);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (6, 414668590);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 870561709);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (6, 422520960);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (49, 954207230);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (15, 776213891);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (25, 468133232);
commit;
prompt 99 records loaded
prompt Loading TEAM...
insert into TEAM (teamid, driverid, ambulanceid)
values (1, 274340804, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (2, 942644760, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (5, 512647397, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (6, 403208661, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (7, 475197916, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (8, 144935536, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (10, 337884271, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (11, 961635098, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (12, 659837175, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (14, 765141502, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (15, 494877713, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (16, 562129084, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (17, 210204404, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (18, 765141502, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (20, 260961871, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (21, 156186136, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (22, 858604549, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (24, 205827981, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (25, 260961871, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (26, 210204404, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (27, 649977206, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (28, 467610759, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (29, 411522632, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (31, 394178853, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (32, 161160901, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (33, 171117624, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (35, 859974578, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (36, 843519385, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (38, 512647397, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (40, 434134560, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (41, 414668590, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (42, 422988413, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (43, 927539471, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (45, 299400522, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (46, 717450469, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (47, 942644760, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (48, 796808759, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (49, 512089472, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (50, 825072524, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (51, 512333062, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (52, 605815385, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (53, 802698033, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (54, 607515527, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (55, 356886576, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (56, 535975740, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (57, 843519385, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (58, 203883392, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (59, 414668590, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (63, 305336709, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (64, 841009827, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (66, 408357513, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (67, 942644760, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (68, 144935536, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (70, 390685535, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (71, 101584298, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (72, 327599490, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (73, 144935536, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (74, 649977206, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (75, 765141502, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (76, 414668590, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (78, 543820399, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (79, 238992471, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (80, 259790830, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (81, 434134560, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (82, 169997654, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (83, 659837175, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (84, 741127642, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (85, 494877713, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (86, 996027713, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (87, 543820399, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (89, 475197916, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (91, 205827981, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (92, 156186136, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (93, 274340804, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (94, 852113698, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (95, 996027713, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (98, 726500787, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (99, 659837175, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (101, 605815385, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (102, 156186136, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (103, 205827981, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (104, 726500787, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (105, 530131962, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (106, 235345052, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (108, 649977206, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (109, 475197916, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (110, 530131962, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (111, 205827981, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (114, 150507078, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (115, 843519385, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (116, 717450469, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (118, 414668590, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (119, 846551850, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (122, 649977206, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (123, 203883392, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (125, 717450469, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (128, 765141502, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (130, 101584298, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (131, 467624110, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (132, 843519385, 96);
commit;
prompt 100 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (133, 825072524, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (134, 390685535, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (136, 356009760, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (137, 356009760, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (139, 659837175, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (140, 910230564, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (141, 238992471, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (142, 741127642, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (143, 368489397, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (144, 238992471, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (145, 150507078, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (146, 512647397, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (147, 467624110, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (148, 210204404, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (149, 203883392, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (150, 996027713, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (151, 605815385, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (152, 543820399, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (153, 178457229, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (155, 274340804, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (156, 859974578, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (157, 605815385, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (158, 741127642, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (159, 494877713, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (160, 605815385, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (161, 368489397, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (162, 717450469, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (164, 791364724, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (166, 535975740, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (167, 156186136, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (168, 235345052, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (169, 403208661, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (170, 413997128, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (171, 259790830, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (172, 859974578, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (173, 562129084, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (175, 494877713, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (176, 161160901, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (177, 467624110, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (180, 394178853, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (181, 751921020, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (182, 238992471, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (183, 607515527, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (184, 512089472, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (185, 858604549, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (187, 394178853, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (188, 368489397, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (189, 910230564, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (190, 274340804, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (191, 403208661, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (192, 961635098, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (193, 751921020, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (194, 791364724, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (195, 150507078, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (196, 203883392, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (198, 942644760, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (200, 414668590, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (202, 274340804, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (204, 169997654, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (206, 607515527, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (207, 150507078, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (208, 205827981, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (212, 260961871, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (213, 161160901, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (214, 337884271, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (215, 852113698, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (216, 403208661, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (217, 996027713, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (218, 368489397, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (219, 512089472, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (221, 422988413, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (222, 910230564, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (223, 434134560, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (225, 847856992, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (226, 859974578, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (228, 394178853, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (229, 171117624, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (230, 796808759, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (231, 205827981, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (232, 717450469, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (233, 927539471, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (234, 607515527, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (235, 368489397, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (236, 274340804, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (237, 305336709, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (238, 825072524, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (239, 203883392, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (240, 751921020, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (241, 882458516, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (242, 234659034, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (243, 368489397, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (244, 543820399, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (245, 717450469, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (246, 996027713, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (247, 337884271, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (248, 169997654, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (250, 852113698, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (251, 765141502, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (252, 356886576, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (253, 659837175, 39);
commit;
prompt 200 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (254, 144935536, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (255, 910230564, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (256, 744119752, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (257, 765141502, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (258, 368489397, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (259, 235345052, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (260, 825072524, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (261, 996027713, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (263, 988686001, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (264, 234659034, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (265, 171117624, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (266, 171117624, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (267, 203883392, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (268, 530131962, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (269, 403208661, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (272, 414668590, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (274, 274340804, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (275, 846551850, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (276, 988686001, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (277, 205827981, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (278, 356009760, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (279, 411522632, 101);
insert into TEAM (teamid, driverid, ambulanceid)
values (281, 413997128, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (282, 859974578, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (283, 741127642, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (285, 882458516, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (286, 961635098, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (287, 659837175, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (288, 741127642, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (289, 852113698, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (290, 744119752, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (291, 988686001, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (292, 390685535, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (293, 751921020, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (294, 961635098, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (295, 801444708, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (296, 806090432, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (297, 512333062, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (298, 741127642, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (299, 605815385, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (301, 403208661, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (302, 394178853, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (303, 259790830, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (304, 744119752, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (305, 368489397, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (307, 299400522, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (309, 475197916, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (310, 394178853, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (311, 356009760, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (312, 235345052, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (313, 847856992, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (314, 356886576, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (316, 883025897, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (317, 150507078, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (318, 494877713, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (319, 512647397, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (321, 238992471, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (322, 356886576, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (324, 259790830, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (325, 512647397, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (326, 434134560, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (327, 178457229, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (329, 203883392, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (330, 858604549, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (331, 327599490, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (332, 988686001, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (333, 562129084, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (334, 843519385, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (336, 726500787, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (337, 203883392, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (338, 260961871, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (339, 751921020, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (340, 726500787, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (341, 535975740, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (344, 260961871, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (345, 649977206, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (346, 414668590, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (347, 996027713, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (348, 101584298, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (349, 847856992, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (350, 883025897, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (351, 411522632, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (352, 475197916, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (353, 390685535, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (354, 649977206, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (355, 685378695, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (356, 988686001, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (359, 356009760, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (360, 717450469, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (361, 327599490, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (362, 356009760, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (363, 403208661, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (364, 234659034, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (365, 411522632, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (366, 394178853, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (369, 101584298, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (370, 299400522, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (371, 390685535, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (373, 274340804, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (375, 607515527, 80);
commit;
prompt 300 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (376, 353002056, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (377, 846551850, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (378, 235345052, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (379, 171117624, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (380, 150507078, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (381, 234659034, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (382, 156186136, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (383, 530131962, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (384, 467610759, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (385, 414668590, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (386, 235345052, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (387, 422988413, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (389, 605815385, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (391, 927539471, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (392, 801444708, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (393, 305336709, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (394, 847856992, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (395, 274340804, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (396, 841009827, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (399, 843519385, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (400, 859974578, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (401, 751921020, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (402, 961635098, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (403, 260961871, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (404, 234659034, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (405, 791364724, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (408, 741127642, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (409, 801444708, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (410, 368489397, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (411, 467624110, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (412, 512647397, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (413, 305336709, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (414, 408357513, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (416, 260961871, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (418, 512089472, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (419, 353002056, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (421, 408357513, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (423, 101584298, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (425, 235345052, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (426, 238992471, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (427, 512333062, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (428, 414668590, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (430, 825072524, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (432, 852113698, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (433, 408357513, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (434, 413997128, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (437, 858604549, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (439, 234659034, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (440, 161160901, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (441, 305336709, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (443, 101584298, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (444, 150507078, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (445, 806090432, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (447, 535975740, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (448, 260961871, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (449, 744119752, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (450, 475197916, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (452, 178457229, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (455, 259790830, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (456, 305336709, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (457, 259790830, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (459, 210204404, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (461, 394178853, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (462, 178457229, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (463, 234659034, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (464, 562129084, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (467, 394178853, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (468, 988686001, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (469, 685378695, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (470, 413997128, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (471, 512089472, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (474, 494877713, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (475, 144935536, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (476, 852113698, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (477, 403208661, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (479, 765141502, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (480, 883025897, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (481, 927539471, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (482, 988686001, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (485, 394178853, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (486, 530131962, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (487, 356009760, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (488, 353002056, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (489, 161160901, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (492, 353002056, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (493, 144935536, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (494, 685378695, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (495, 717450469, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (496, 235345052, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (497, 910230564, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (498, 434134560, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (499, 765141502, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (500, 910230564, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (501, 847856992, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (503, 791364724, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (504, 368489397, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (505, 178457229, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (506, 942644760, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (507, 274340804, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (508, 910230564, 77);
commit;
prompt 400 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (509, 512089472, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (510, 996027713, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (511, 475197916, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (513, 796808759, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (514, 852113698, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (515, 883025897, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (517, 562129084, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (518, 859974578, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (519, 414668590, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (521, 806090432, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (522, 846551850, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (523, 996027713, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (524, 414668590, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (525, 327599490, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (526, 156186136, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (527, 883025897, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (528, 859974578, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (529, 274340804, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (530, 467624110, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (531, 765141502, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (532, 744119752, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (534, 353002056, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (535, 434134560, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (536, 101584298, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (537, 802698033, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (538, 205827981, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (539, 494877713, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (540, 649977206, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (543, 751921020, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (544, 235345052, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (546, 299400522, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (548, 685378695, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (549, 327599490, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (550, 413997128, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (551, 883025897, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (552, 744119752, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (553, 403208661, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (554, 414668590, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (555, 607515527, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (558, 156186136, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (559, 744119752, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (560, 494877713, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (562, 765141502, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (564, 178457229, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (565, 394178853, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (566, 353002056, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (567, 234659034, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (568, 210204404, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (569, 988686001, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (570, 161160901, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (571, 858604549, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (572, 882458516, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (573, 512089472, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (574, 178457229, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (575, 156186136, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (576, 751921020, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (577, 260961871, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (578, 512089472, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (579, 762566292, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (581, 726500787, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (582, 259790830, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (583, 144935536, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (584, 927539471, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (585, 942644760, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (586, 543820399, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (587, 825072524, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (588, 685378695, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (589, 274340804, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (591, 434134560, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (592, 259790830, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (593, 408357513, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (594, 858604549, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (595, 726500787, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (597, 825072524, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (598, 327599490, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (599, 274340804, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (600, 796808759, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (601, 238992471, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (603, 543820399, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (604, 414668590, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (605, 414668590, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (606, 843519385, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (607, 235345052, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (608, 791364724, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (609, 205827981, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (611, 883025897, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (612, 796808759, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (617, 942644760, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (619, 846551850, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (621, 274340804, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (622, 475197916, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (623, 605815385, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (624, 530131962, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (626, 259790830, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (627, 605815385, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (628, 927539471, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (629, 169997654, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (630, 882458516, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (631, 235345052, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (632, 605815385, 81);
commit;
prompt 500 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (633, 422988413, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (634, 741127642, 101);
insert into TEAM (teamid, driverid, ambulanceid)
values (635, 685378695, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (636, 475197916, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (637, 156186136, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (638, 988686001, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (639, 512333062, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (640, 685378695, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (642, 413997128, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (643, 512333062, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (645, 607515527, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (648, 475197916, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (649, 299400522, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (650, 765141502, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (651, 234659034, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (652, 394178853, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (653, 741127642, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (657, 408357513, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (658, 847856992, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (659, 717450469, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (660, 356886576, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (661, 744119752, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (662, 847856992, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (663, 512647397, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (665, 411522632, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (667, 843519385, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (668, 475197916, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (669, 101584298, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (670, 512333062, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (671, 512089472, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (672, 169997654, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (675, 717450469, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (678, 178457229, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (679, 530131962, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (682, 413997128, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (683, 726500787, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (684, 210204404, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (686, 927539471, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (687, 512333062, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (688, 607515527, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (689, 910230564, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (691, 475197916, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (692, 512647397, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (693, 512089472, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (694, 802698033, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (695, 413997128, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (696, 649977206, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (697, 467610759, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (698, 762566292, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (700, 607515527, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (701, 171117624, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (703, 337884271, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (704, 530131962, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (705, 535975740, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (709, 717450469, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (710, 535975740, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (711, 859974578, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (712, 726500787, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (713, 751921020, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (714, 806090432, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (715, 512333062, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (716, 234659034, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (717, 512647397, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (718, 353002056, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (719, 467624110, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (722, 238992471, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (723, 475197916, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (725, 144935536, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (729, 843519385, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (730, 717450469, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (732, 144935536, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (734, 841009827, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (736, 841009827, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (737, 841009827, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (738, 178457229, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (739, 765141502, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (740, 101584298, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (743, 649977206, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (745, 150507078, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (747, 337884271, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (748, 101584298, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (749, 178457229, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (750, 238992471, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (751, 413997128, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (753, 467624110, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (754, 434134560, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (755, 356009760, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (756, 659837175, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (758, 259790830, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (759, 942644760, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (760, 434134560, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (762, 150507078, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (764, 605815385, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (765, 765141502, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (766, 796808759, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (767, 353002056, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (768, 717450469, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (769, 403208661, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (770, 796808759, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (771, 927539471, 102);
commit;
prompt 600 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (772, 494877713, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (773, 543820399, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (774, 259790830, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (775, 494877713, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (776, 210204404, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (777, 825072524, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (779, 234659034, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (781, 210204404, 101);
insert into TEAM (teamid, driverid, ambulanceid)
values (782, 762566292, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (784, 883025897, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (785, 274340804, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (786, 434134560, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (787, 171117624, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (788, 762566292, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (790, 467610759, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (791, 535975740, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (793, 210204404, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (794, 927539471, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (795, 535975740, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (796, 156186136, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (797, 274340804, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (798, 475197916, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (800, 235345052, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (801, 234659034, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (802, 996027713, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (803, 234659034, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (804, 422988413, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (805, 403208661, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (806, 649977206, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (807, 717450469, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (808, 910230564, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (809, 101584298, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (810, 852113698, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (811, 274340804, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (812, 150507078, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (813, 467610759, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (814, 961635098, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (815, 337884271, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (816, 530131962, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (817, 259790830, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (818, 235345052, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (819, 413997128, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (821, 607515527, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (822, 234659034, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (823, 996027713, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (824, 512647397, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (825, 530131962, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (827, 605815385, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (828, 605815385, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (830, 762566292, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (831, 475197916, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (832, 649977206, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (833, 238992471, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (835, 356009760, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (836, 847856992, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (837, 512647397, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (838, 414668590, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (839, 414668590, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (840, 852113698, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (841, 883025897, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (842, 530131962, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (843, 203883392, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (844, 205827981, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (845, 156186136, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (846, 802698033, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (848, 846551850, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (849, 927539471, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (851, 806090432, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (852, 859974578, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (853, 494877713, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (854, 846551850, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (855, 726500787, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (856, 203883392, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (857, 859974578, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (858, 394178853, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (859, 744119752, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (860, 659837175, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (861, 961635098, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (862, 390685535, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (863, 858604549, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (864, 414668590, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (867, 801444708, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (868, 353002056, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (869, 260961871, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (870, 235345052, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (871, 434134560, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (872, 961635098, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (873, 882458516, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (874, 203883392, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (875, 605815385, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (876, 846551850, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (877, 394178853, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (878, 494877713, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (879, 403208661, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (880, 796808759, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (881, 434134560, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (882, 144935536, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (883, 408357513, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (885, 178457229, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (886, 422988413, 106);
commit;
prompt 700 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (888, 467610759, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (889, 910230564, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (892, 260961871, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (893, 408357513, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (895, 512089472, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (896, 494877713, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (899, 852113698, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (900, 171117624, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (901, 414668590, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (902, 741127642, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (903, 259790830, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (904, 543820399, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (905, 927539471, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (906, 883025897, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (907, 327599490, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (909, 942644760, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (910, 414668590, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (911, 101584298, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (912, 512647397, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (913, 726500787, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (914, 156186136, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (915, 847856992, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (918, 726500787, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (919, 649977206, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (920, 156186136, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (921, 434134560, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (923, 859974578, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (924, 475197916, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (925, 494877713, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (928, 356886576, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (929, 299400522, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (930, 717450469, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (931, 150507078, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (932, 161160901, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (933, 101584298, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (934, 101584298, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (935, 927539471, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (936, 882458516, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (937, 156186136, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (938, 234659034, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (939, 825072524, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (940, 356886576, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (942, 685378695, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (943, 910230564, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (945, 846551850, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (946, 169997654, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (947, 475197916, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (948, 203883392, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (949, 741127642, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (950, 353002056, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (952, 859974578, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (953, 169997654, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (955, 494877713, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (956, 475197916, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (957, 961635098, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (958, 467610759, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (960, 101584298, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (963, 858604549, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (964, 171117624, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (967, 607515527, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (968, 530131962, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (970, 806090432, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (971, 649977206, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (972, 717450469, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (973, 210204404, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (974, 801444708, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (975, 765141502, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (976, 741127642, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (977, 927539471, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (979, 512089472, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (980, 467624110, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (981, 825072524, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (984, 512647397, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (987, 414668590, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (988, 414668590, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (989, 368489397, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (990, 494877713, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (991, 607515527, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (993, 765141502, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (995, 403208661, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (996, 843519385, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (997, 238992471, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1000, 562129084, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1001, 791364724, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1002, 353002056, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1003, 408357513, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1004, 535975740, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1005, 337884271, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1006, 882458516, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1007, 390685535, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1008, 467610759, 101);
insert into TEAM (teamid, driverid, ambulanceid)
values (1009, 467610759, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1010, 605815385, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1011, 178457229, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1012, 299400522, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1014, 205827981, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1016, 883025897, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1017, 467610759, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1019, 210204404, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1020, 422988413, 66);
commit;
prompt 800 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1021, 169997654, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1022, 422988413, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1023, 765141502, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1025, 562129084, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1026, 356009760, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1027, 178457229, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1028, 512089472, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1029, 403208661, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1030, 475197916, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1031, 796808759, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1032, 408357513, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (1033, 607515527, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1034, 841009827, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1035, 562129084, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1037, 235345052, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1038, 649977206, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1039, 390685535, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1041, 422988413, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1042, 543820399, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1043, 512333062, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1044, 765141502, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (1045, 178457229, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (1047, 422988413, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (1048, 796808759, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1050, 413997128, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1051, 859974578, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1053, 852113698, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1054, 101584298, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1055, 169997654, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1056, 910230564, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1057, 726500787, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1058, 161160901, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1059, 535975740, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1062, 205827981, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1063, 411522632, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1064, 846551850, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1065, 156186136, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1066, 305336709, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1067, 751921020, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1068, 765141502, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1070, 762566292, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1074, 852113698, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1075, 411522632, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1076, 467624110, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1077, 882458516, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1078, 806090432, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1079, 605815385, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1081, 274340804, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1082, 961635098, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1083, 259790830, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1085, 274340804, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1086, 535975740, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1087, 659837175, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1088, 368489397, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1090, 259790830, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1091, 605815385, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1092, 512647397, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1094, 685378695, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1095, 717450469, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1096, 411522632, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1097, 394178853, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1098, 205827981, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1099, 859974578, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1100, 368489397, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1101, 882458516, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1102, 305336709, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1104, 802698033, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1105, 305336709, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1107, 806090432, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1109, 413997128, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1110, 765141502, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1111, 408357513, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1114, 852113698, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1115, 882458516, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1116, 210204404, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1117, 434134560, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1118, 535975740, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1119, 356886576, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1120, 327599490, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1121, 356009760, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1122, 413997128, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1123, 156186136, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1124, 494877713, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (1127, 403208661, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1128, 841009827, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1130, 411522632, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1131, 210204404, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1132, 422988413, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1133, 205827981, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1136, 649977206, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1137, 717450469, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1139, 494877713, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1140, 408357513, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1141, 535975740, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1143, 659837175, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1144, 305336709, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1147, 847856992, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1148, 806090432, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1150, 411522632, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1151, 802698033, 99);
commit;
prompt 900 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1152, 210204404, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1154, 801444708, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1155, 927539471, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1156, 259790830, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1157, 234659034, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1158, 741127642, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1159, 234659034, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1161, 403208661, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1162, 841009827, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1163, 356009760, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1164, 422988413, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1165, 726500787, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1166, 144935536, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1167, 806090432, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1168, 927539471, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1169, 169997654, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1170, 178457229, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1172, 605815385, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1173, 961635098, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1174, 685378695, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1175, 852113698, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1176, 512089472, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1177, 562129084, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1178, 562129084, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1179, 434134560, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1180, 205827981, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1181, 305336709, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1182, 858604549, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (1183, 512333062, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1185, 274340804, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1187, 961635098, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1188, 169997654, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1190, 203883392, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1191, 238992471, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1192, 961635098, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1193, 368489397, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1194, 806090432, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1195, 368489397, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1196, 512089472, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (1197, 988686001, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1198, 882458516, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1199, 101584298, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1200, 607515527, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1201, 910230564, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1202, 353002056, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1204, 741127642, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1206, 765141502, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1207, 178457229, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1208, 806090432, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1209, 543820399, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1210, 156186136, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1211, 274340804, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1212, 883025897, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1214, 327599490, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1215, 169997654, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1216, 210204404, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (1217, 762566292, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1218, 403208661, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1219, 796808759, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1226, 408357513, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1227, 806090432, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1228, 353002056, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1229, 996027713, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1230, 413997128, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1231, 259790830, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1232, 475197916, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1233, 717450469, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (1234, 408357513, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1235, 422988413, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1236, 751921020, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1237, 744119752, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1239, 467610759, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1241, 910230564, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1242, 299400522, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (1243, 411522632, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (1244, 741127642, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1245, 927539471, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1246, 996027713, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1248, 203883392, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1250, 210204404, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (1251, 238992471, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1252, 178457229, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (1254, 144935536, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1255, 825072524, 101);
insert into TEAM (teamid, driverid, ambulanceid)
values (1256, 726500787, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1257, 847856992, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1258, 205827981, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1260, 847856992, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1262, 411522632, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1263, 562129084, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1264, 238992471, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1266, 260961871, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1268, 846551850, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (1270, 203883392, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1272, 205827981, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1273, 390685535, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1274, 659837175, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1276, 260961871, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1277, 234659034, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1279, 238992471, 93);
commit;
prompt 1000 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1281, 605815385, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1282, 762566292, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1283, 178457229, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1284, 726500787, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1285, 741127642, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1286, 467624110, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1287, 414668590, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1288, 414668590, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1289, 337884271, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1290, 305336709, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1292, 530131962, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1293, 467624110, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1294, 796808759, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1295, 337884271, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1296, 726500787, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1297, 659837175, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1298, 356009760, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1300, 535975740, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1301, 996027713, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1302, 942644760, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (1303, 996027713, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1304, 882458516, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1305, 744119752, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1306, 843519385, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1307, 161160901, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1308, 161160901, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1309, 726500787, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1311, 726500787, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1312, 762566292, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1314, 169997654, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1315, 475197916, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1316, 368489397, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1317, 299400522, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1318, 796808759, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1319, 356009760, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1320, 806090432, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1321, 996027713, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1322, 801444708, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1324, 434134560, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1325, 403208661, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1326, 356009760, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1328, 512089472, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1330, 467624110, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1331, 751921020, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1333, 649977206, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1334, 161160901, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1335, 543820399, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1336, 390685535, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1338, 299400522, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1341, 235345052, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1342, 235345052, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1345, 494877713, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1346, 144935536, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1348, 685378695, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1350, 685378695, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1351, 927539471, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1352, 411522632, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1353, 843519385, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (1355, 847856992, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1357, 910230564, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1358, 161160901, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1359, 411522632, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1360, 512333062, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1361, 494877713, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1362, 562129084, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1363, 414668590, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1364, 649977206, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (1365, 852113698, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1366, 685378695, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1367, 422988413, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1370, 659837175, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1372, 996027713, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1373, 169997654, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1374, 825072524, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1375, 327599490, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1376, 847856992, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1378, 390685535, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1379, 535975740, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1380, 910230564, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1383, 741127642, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1384, 144935536, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1385, 101584298, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (1387, 161160901, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1388, 403208661, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1389, 235345052, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1390, 150507078, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1391, 353002056, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1392, 543820399, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1394, 847856992, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1395, 910230564, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1396, 259790830, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1397, 203883392, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1398, 791364724, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1399, 353002056, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1400, 530131962, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1401, 259790830, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (1402, 353002056, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1403, 996027713, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1404, 988686001, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1405, 305336709, 14);
commit;
prompt 1100 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1406, 337884271, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1407, 859974578, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1408, 413997128, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1409, 942644760, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1410, 801444708, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1411, 238992471, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1412, 356886576, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1413, 744119752, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1414, 169997654, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1415, 356009760, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1416, 846551850, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1417, 144935536, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1418, 150507078, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1419, 801444708, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1420, 413997128, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1421, 274340804, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1423, 434134560, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1424, 422988413, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1426, 859974578, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1428, 353002056, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1429, 796808759, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1431, 494877713, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1432, 796808759, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1433, 762566292, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1434, 413997128, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1435, 235345052, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1436, 327599490, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1437, 353002056, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1439, 607515527, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1440, 801444708, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1441, 859974578, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1442, 414668590, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (1443, 413997128, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1444, 765141502, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1445, 178457229, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (1446, 327599490, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1447, 259790830, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1449, 178457229, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1450, 494877713, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1451, 825072524, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1452, 408357513, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1453, 535975740, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1454, 203883392, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1456, 717450469, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1457, 408357513, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (1459, 605815385, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1460, 751921020, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1465, 205827981, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1466, 927539471, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1467, 802698033, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1468, 741127642, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1469, 841009827, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1470, 791364724, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1471, 356009760, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1472, 178457229, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1473, 841009827, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1474, 205827981, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1475, 274340804, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1476, 801444708, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1478, 859974578, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1479, 238992471, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1481, 535975740, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1482, 927539471, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1483, 843519385, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1484, 858604549, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1485, 543820399, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1486, 841009827, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1487, 543820399, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1488, 156186136, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1489, 156186136, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1490, 717450469, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1491, 607515527, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1492, 802698033, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1494, 414668590, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1495, 543820399, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1496, 353002056, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1497, 883025897, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1498, 368489397, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (1500, 356009760, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1502, 942644760, 110);
insert into TEAM (teamid, driverid, ambulanceid)
values (1503, 144935536, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1505, 512333062, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1506, 414668590, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1507, 144935536, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1509, 796808759, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (1510, 422988413, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1511, 178457229, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1512, 859974578, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1513, 685378695, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1514, 156186136, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1515, 543820399, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1516, 413997128, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1517, 274340804, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1518, 305336709, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1519, 806090432, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1520, 846551850, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1521, 846551850, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1522, 765141502, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1523, 535975740, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1525, 171117624, 45);
commit;
prompt 1200 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1526, 765141502, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1527, 607515527, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (1528, 210204404, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1530, 858604549, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1532, 259790830, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1533, 961635098, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1534, 144935536, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1535, 337884271, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1536, 961635098, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1537, 512647397, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1538, 741127642, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1539, 274340804, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1540, 543820399, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1541, 259790830, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (1542, 605815385, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1543, 988686001, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1544, 562129084, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1545, 726500787, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1546, 368489397, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1548, 156186136, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1549, 961635098, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1550, 649977206, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1551, 390685535, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1552, 169997654, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1553, 205827981, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (1554, 858604549, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1555, 203883392, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1556, 205827981, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1557, 327599490, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1558, 394178853, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1559, 156186136, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1561, 717450469, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1562, 156186136, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1563, 235345052, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1564, 530131962, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (1565, 144935536, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1566, 530131962, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1567, 411522632, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1568, 356009760, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1569, 858604549, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1570, 411522632, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1571, 353002056, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1572, 150507078, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1573, 413997128, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1574, 607515527, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1575, 422988413, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1577, 825072524, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1578, 659837175, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1580, 408357513, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1581, 161160901, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1582, 259790830, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1583, 203883392, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1584, 841009827, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1586, 927539471, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1587, 942644760, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1588, 467610759, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1589, 434134560, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1590, 161160901, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1591, 843519385, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1592, 802698033, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1593, 607515527, 101);
insert into TEAM (teamid, driverid, ambulanceid)
values (1594, 512089472, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1595, 274340804, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1597, 234659034, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1600, 368489397, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1601, 337884271, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1603, 751921020, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (1604, 659837175, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1605, 717450469, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1607, 210204404, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1608, 356886576, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1609, 337884271, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1611, 411522632, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1612, 411522632, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1614, 305336709, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1615, 562129084, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1616, 467624110, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1617, 178457229, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1618, 274340804, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1619, 910230564, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1620, 390685535, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1622, 535975740, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1623, 825072524, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (1625, 825072524, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1626, 607515527, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1627, 605815385, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1628, 726500787, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1630, 390685535, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1632, 806090432, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1633, 260961871, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (1634, 801444708, 112);
insert into TEAM (teamid, driverid, ambulanceid)
values (1635, 512089472, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1637, 530131962, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1638, 101584298, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1639, 434134560, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1641, 467610759, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1642, 882458516, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1643, 852113698, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1645, 467610759, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1646, 846551850, 17);
commit;
prompt 1300 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1647, 659837175, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1649, 235345052, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1650, 543820399, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1651, 882458516, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1652, 741127642, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1653, 178457229, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1654, 390685535, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1656, 858604549, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1657, 802698033, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1658, 101584298, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1659, 299400522, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1660, 744119752, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1663, 796808759, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1664, 413997128, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1665, 535975740, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1669, 996027713, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1670, 859974578, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1671, 205827981, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1672, 408357513, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1673, 434134560, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1674, 685378695, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1675, 203883392, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1676, 852113698, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1679, 841009827, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1681, 178457229, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1683, 156186136, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1684, 988686001, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1685, 368489397, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1686, 852113698, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1687, 235345052, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1688, 605815385, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1689, 327599490, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1690, 802698033, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1691, 927539471, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1693, 161160901, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (1694, 356009760, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1695, 605815385, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1696, 260961871, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1697, 150507078, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1698, 434134560, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1699, 843519385, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1700, 562129084, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1701, 356886576, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1702, 274340804, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1704, 101584298, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1705, 841009827, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1706, 259790830, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1707, 408357513, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1709, 169997654, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1711, 422988413, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1712, 299400522, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1713, 205827981, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1714, 685378695, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1715, 356886576, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1716, 825072524, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1717, 512647397, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1718, 259790830, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (1719, 171117624, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1720, 751921020, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1721, 390685535, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1723, 144935536, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1724, 685378695, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1727, 607515527, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1728, 858604549, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1729, 413997128, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1730, 356009760, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (1731, 512333062, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1732, 356009760, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1733, 434134560, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1734, 259790830, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1735, 825072524, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1736, 847856992, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1740, 846551850, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1741, 791364724, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1742, 368489397, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1744, 726500787, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1745, 161160901, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1746, 414668590, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1747, 607515527, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1748, 150507078, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1749, 841009827, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1751, 843519385, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1752, 178457229, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1753, 659837175, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1754, 299400522, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1755, 101584298, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1756, 101584298, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1760, 852113698, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1761, 883025897, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1763, 156186136, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1764, 422988413, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1765, 413997128, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1766, 356009760, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1767, 414668590, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1768, 259790830, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1769, 356009760, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1770, 238992471, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1771, 305336709, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1772, 802698033, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1773, 467624110, 92);
commit;
prompt 1400 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1774, 791364724, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1775, 607515527, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1776, 353002056, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1778, 825072524, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1779, 305336709, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1780, 299400522, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1782, 390685535, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1783, 910230564, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1787, 403208661, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1789, 910230564, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1792, 996027713, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1793, 299400522, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1794, 467610759, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (1796, 413997128, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1797, 390685535, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1798, 988686001, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1800, 210204404, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1804, 156186136, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1805, 685378695, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1806, 762566292, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1807, 171117624, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1808, 910230564, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (1809, 843519385, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1811, 394178853, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1812, 841009827, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1813, 846551850, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1815, 356009760, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1816, 467610759, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1817, 605815385, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (1818, 337884271, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1819, 741127642, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1820, 996027713, 109);
insert into TEAM (teamid, driverid, ambulanceid)
values (1821, 846551850, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1822, 927539471, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1825, 996027713, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1826, 530131962, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1828, 942644760, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1831, 796808759, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (1832, 796808759, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1833, 607515527, 105);
insert into TEAM (teamid, driverid, ambulanceid)
values (1834, 169997654, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1836, 801444708, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1838, 841009827, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1839, 414668590, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1840, 299400522, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1841, 259790830, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1843, 101584298, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1844, 411522632, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1845, 659837175, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1846, 356886576, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1848, 394178853, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1849, 259790830, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1850, 927539471, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1851, 234659034, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1852, 356886576, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1854, 858604549, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1855, 434134560, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1856, 530131962, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1857, 717450469, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1858, 512333062, 108);
insert into TEAM (teamid, driverid, ambulanceid)
values (1860, 512647397, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1861, 171117624, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1862, 238992471, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1863, 843519385, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1866, 178457229, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1867, 394178853, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1868, 858604549, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1869, 299400522, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1870, 859974578, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1871, 741127642, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1872, 535975740, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1873, 942644760, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1874, 413997128, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1876, 791364724, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1877, 858604549, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1878, 791364724, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1879, 411522632, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1880, 161160901, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1881, 356886576, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1882, 161160901, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1883, 852113698, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1885, 299400522, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1886, 394178853, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1887, 801444708, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1888, 841009827, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1889, 353002056, 106);
insert into TEAM (teamid, driverid, ambulanceid)
values (1890, 171117624, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1891, 512647397, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1892, 942644760, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1894, 234659034, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1895, 467624110, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1896, 494877713, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1897, 411522632, 113);
insert into TEAM (teamid, driverid, ambulanceid)
values (1898, 327599490, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1899, 260961871, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1900, 852113698, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1901, 791364724, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1902, 961635098, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1904, 996027713, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1905, 274340804, 79);
commit;
prompt 1500 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1906, 685378695, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1907, 843519385, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1912, 996027713, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (1914, 530131962, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1915, 649977206, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1916, 796808759, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1918, 205827981, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1919, 422988413, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1920, 161160901, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1921, 299400522, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1922, 422988413, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1923, 996027713, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1925, 205827981, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1926, 390685535, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1928, 765141502, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1929, 726500787, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1932, 685378695, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1934, 882458516, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1936, 859974578, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1937, 413997128, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1938, 825072524, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1939, 422988413, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1940, 961635098, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1942, 512647397, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1943, 356886576, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1945, 961635098, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1946, 543820399, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1947, 843519385, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1948, 494877713, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1949, 150507078, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1950, 274340804, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1951, 717450469, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1953, 859974578, 111);
insert into TEAM (teamid, driverid, ambulanceid)
values (1954, 238992471, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1955, 751921020, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1956, 210204404, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1957, 234659034, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1959, 274340804, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1960, 765141502, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1961, 101584298, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1962, 883025897, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1964, 801444708, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (1965, 741127642, 103);
insert into TEAM (teamid, driverid, ambulanceid)
values (1966, 649977206, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1968, 726500787, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1969, 846551850, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1971, 422988413, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1973, 274340804, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1974, 467610759, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1975, 883025897, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1976, 169997654, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1977, 543820399, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1981, 259790830, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1982, 156186136, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1983, 762566292, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1984, 512089472, 107);
insert into TEAM (teamid, driverid, ambulanceid)
values (1985, 394178853, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1986, 467610759, 102);
insert into TEAM (teamid, driverid, ambulanceid)
values (1987, 144935536, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1988, 368489397, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1989, 961635098, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1991, 169997654, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1992, 475197916, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1993, 605815385, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1994, 882458516, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1996, 150507078, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1997, 475197916, 104);
insert into TEAM (teamid, driverid, ambulanceid)
values (1999, 475197916, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (2000, 422988413, 91);
commit;
prompt 1569 records loaded
prompt Loading PARTICIPANTPARAMEDIC...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (2, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (2, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (2, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (2, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (5, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (5, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (6, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (6, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (7, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (8, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (10, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (10, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (11, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (12, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (17, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (17, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (18, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (21, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (21, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (22, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (24, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (25, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (26, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (27, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (27, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (28, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (28, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (28, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (29, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (29, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (31, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (31, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (32, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (32, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (33, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (33, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (35, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (35, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (36, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (38, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (42, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (42, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (43, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (47, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (48, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (49, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (49, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (50, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (50, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (51, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (51, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (52, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (52, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (52, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (53, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (53, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (53, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (54, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (55, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (55, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (56, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (56, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (56, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (57, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (57, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (58, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (58, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (59, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (64, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (64, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (64, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (66, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (66, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (67, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (67, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (68, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (68, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (68, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (71, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (71, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (72, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (72, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (72, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (73, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (75, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (75, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (76, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (78, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (79, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (79, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (82, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (82, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (82, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (82, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (83, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (85, 339897673);
commit;
prompt 100 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (86, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (86, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (87, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (87, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (89, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (89, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (91, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (92, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (92, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (93, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (94, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (94, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (94, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (95, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (99, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (101, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (101, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (101, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (101, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (102, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (104, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (105, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (105, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (108, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (108, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (110, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (110, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (111, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (111, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (111, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (114, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (114, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (118, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (119, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (119, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (122, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (123, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (130, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (130, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (131, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (132, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (134, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (136, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (136, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (946, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (950, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (952, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (953, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (955, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (956, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (956, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (956, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (957, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (958, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (958, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (960, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (960, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (963, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (964, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (967, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (970, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (970, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (971, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (971, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (972, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (972, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (973, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (974, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (974, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (976, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (976, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (977, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (980, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 801292271);
commit;
prompt 200 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (988, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (989, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (990, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (990, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (993, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (996, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (996, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (996, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (996, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1000, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1000, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1002, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1004, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1006, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1007, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1007, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1009, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1012, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1012, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1014, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1016, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1017, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1020, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1021, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1023, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1025, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1025, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1025, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1026, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1026, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1027, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1029, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1030, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1032, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1033, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1034, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1034, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1034, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1035, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1035, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1038, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1038, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1039, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1039, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1039, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1041, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1041, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1042, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1042, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1043, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1044, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1044, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1044, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1044, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1045, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1045, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1047, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1048, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1050, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1050, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1050, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1050, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1051, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1053, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1053, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1054, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1054, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1054, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1054, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1056, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1056, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1056, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1058, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1059, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1059, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1062, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1064, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1065, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1065, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1065, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1066, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1067, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1068, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1068, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1068, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1070, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1074, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1077, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1077, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1078, 559464664);
commit;
prompt 300 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1078, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1079, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (489, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (489, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (493, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (493, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (494, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (494, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (495, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (495, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (496, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (496, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (497, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (498, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (501, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (503, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (504, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (504, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (504, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (504, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (505, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (505, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (505, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (507, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (508, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (508, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (509, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (509, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (510, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (510, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (513, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (514, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (514, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (515, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (519, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (519, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (522, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (523, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (524, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (525, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (525, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (526, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (526, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (527, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (527, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (531, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (532, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (534, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (535, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (535, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (535, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (535, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (536, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (538, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (538, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (538, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (539, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (539, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (540, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (540, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (540, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (540, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (543, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (543, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (543, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (544, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (544, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (548, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (549, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (549, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (550, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (551, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (551, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (551, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (554, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (554, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (554, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (555, 239803816);
commit;
prompt 400 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (555, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (559, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (559, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (560, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (560, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (564, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (564, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (564, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (566, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (567, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (567, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (568, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (568, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (572, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (573, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (575, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (576, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (577, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (577, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (577, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (579, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (579, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (579, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (581, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (581, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (582, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (583, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (583, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (584, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (584, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (585, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (585, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (585, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (587, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (588, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (591, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (591, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (592, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (593, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (594, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (594, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (594, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (594, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (595, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (597, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (598, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (598, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (598, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (598, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (599, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (600, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (603, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (604, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (607, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (608, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (608, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (609, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (612, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (617, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (619, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (619, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (621, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (621, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (621, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (623, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (623, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (623, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (624, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (624, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (626, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (627, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (627, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (627, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (629, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (631, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (631, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (631, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (631, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (633, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (633, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (634, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (635, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (635, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (635, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (635, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (636, 347639660);
commit;
prompt 500 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (636, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (637, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (638, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (638, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (638, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (640, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (642, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (642, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (642, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (643, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (643, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (650, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (651, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (652, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (653, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (657, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (658, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (658, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (659, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (660, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (660, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (661, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (661, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (665, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (665, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (665, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (668, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (670, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (670, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (672, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (675, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (678, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (682, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (682, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (683, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (686, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (686, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (686, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (687, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (687, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (688, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (688, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (688, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (688, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (691, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (692, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (693, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (693, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (703, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (704, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (704, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (704, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (705, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (705, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (709, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (710, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (710, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (711, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (712, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (712, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (712, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (713, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (713, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (713, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (715, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (715, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (716, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (716, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (716, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (718, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (722, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (725, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (725, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (730, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (732, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (732, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (732, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (732, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1476, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1478, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1478, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1478, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1479, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1481, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1482, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1482, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1483, 414668590);
commit;
prompt 600 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1483, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1485, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1485, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1486, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1487, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1488, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1488, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1489, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1490, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1490, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1491, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1492, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1494, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1495, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1495, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1495, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1495, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1497, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1497, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1497, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1497, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1498, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1502, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1503, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1505, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1506, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1506, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1507, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1507, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1509, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1511, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1512, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1512, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1513, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1513, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1515, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1515, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1516, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1516, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1517, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1517, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1518, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1520, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1521, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1521, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1521, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1523, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1523, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1525, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1525, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1525, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1527, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1528, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1530, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1532, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1532, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1532, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1533, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1535, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1536, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1536, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1536, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1538, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1538, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1539, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1539, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1539, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1541, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1542, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1543, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1544, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1544, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1545, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1550, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1550, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1550, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1553, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1555, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1556, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1557, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1558, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1558, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1558, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1561, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1561, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1562, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1562, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1563, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1564, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1564, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1565, 388211214);
commit;
prompt 700 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1565, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1565, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1567, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1570, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1570, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1571, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1573, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1573, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1574, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1575, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1577, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1578, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1578, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1578, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1580, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1580, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1581, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1587, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1588, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1588, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1588, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1589, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1589, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1590, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1591, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1591, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1592, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1593, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1593, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1594, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1595, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1595, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1600, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1601, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1604, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1607, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1608, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1609, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1614, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1615, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1615, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1617, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1617, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1618, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1618, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1618, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1620, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1620, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1620, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1622, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1623, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1623, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1623, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1626, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1626, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1627, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1628, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1628, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1628, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1632, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1635, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1637, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1637, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1639, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1639, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1641, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1642, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1643, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1643, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1645, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1645, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1645, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1647, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1649, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1650, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1650, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1651, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1651, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1652, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1652, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1653, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1653, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1653, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1657, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1657, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1657, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1657, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1659, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1659, 628551248);
commit;
prompt 800 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1659, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1660, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1660, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1663, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1664, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1664, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1671, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1671, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1683, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1683, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1683, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1683, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1685, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1686, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1688, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1690, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1690, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1690, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1691, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1694, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1695, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1696, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1697, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1697, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1697, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1698, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1698, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1701, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1701, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1702, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1704, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1705, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1706, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1706, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1712, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1712, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1712, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1716, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1717, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1717, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1717, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1718, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1719, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1720, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1720, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1720, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1721, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1721, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1723, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1724, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1727, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1727, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1728, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1729, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1732, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1734, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1734, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1735, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1735, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1740, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1741, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1742, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1742, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1742, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1744, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1744, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1745, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1746, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1747, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1748, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1749, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1751, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1751, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1751, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1752, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1753, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1226, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1226, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1226, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1227, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1227, 609721920);
commit;
prompt 900 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1228, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1229, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1229, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1231, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1231, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1232, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1232, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1233, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1233, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1234, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1236, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1236, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1236, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1236, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1241, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1241, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1242, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1244, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1244, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1245, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1245, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1246, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1248, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1248, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1250, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1252, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1252, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1254, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1255, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1255, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1256, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1258, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1262, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1263, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1263, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1266, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1268, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1270, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1272, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1273, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1273, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1274, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1276, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1276, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1277, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1277, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1281, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1281, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1281, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1282, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1282, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1283, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1284, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1284, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1285, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1287, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1288, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1288, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1290, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1292, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1293, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1296, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1297, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1297, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1302, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1303, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1304, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1304, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1304, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1304, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1305, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1305, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1306, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1307, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1308, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1308, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1308, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1309, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1309, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1311, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1311, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1312, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1312, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1314, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1314, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1316, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1316, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1318, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1319, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1321, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1321, 414668590);
commit;
prompt 1000 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1321, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1321, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1322, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1325, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1325, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1326, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1331, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1331, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1331, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1331, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1334, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1335, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1335, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1335, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1336, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1338, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1338, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1341, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1342, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1345, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1345, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1346, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1348, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1348, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1351, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1352, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1353, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1353, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1355, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1355, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1355, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1357, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1357, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1358, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1360, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1360, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1362, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1362, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1363, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1363, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1364, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1364, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1364, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1365, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1365, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1366, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1366, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1367, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1370, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1373, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1373, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1375, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1375, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1376, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1376, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1378, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1378, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1378, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1379, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1380, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1384, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1384, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1384, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1385, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1385, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1388, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1388, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1389, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1390, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1390, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1392, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1394, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1395, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1396, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1396, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1397, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1397, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1398, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1398, 910148391);
commit;
prompt 1100 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1399, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1400, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1401, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1402, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1402, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1403, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1403, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1403, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1405, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1407, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1409, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1409, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1410, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1411, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1414, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1414, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1414, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1414, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1415, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1415, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1415, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1416, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1417, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1417, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1418, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1418, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1419, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1419, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1420, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1420, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1420, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1421, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1421, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1423, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1426, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1428, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1428, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1429, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1431, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1433, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1435, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1435, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1435, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1436, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1437, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1439, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1440, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1440, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1441, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1441, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1444, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1444, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1445, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1445, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1446, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1446, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1446, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1447, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1447, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1447, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1450, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1452, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1453, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1454, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1456, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1456, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1457, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1459, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1459, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1466, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1466, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1466, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1466, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1470, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1470, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1470, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1472, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1473, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1473, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1473, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1474, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1475, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1475, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1475, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (281, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (281, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (281, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (281, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (283, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (283, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (286, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 265119104);
commit;
prompt 1200 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (288, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (288, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (290, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (290, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (290, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (291, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (293, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (293, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (293, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (295, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (295, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (297, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (297, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (298, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (301, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (302, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (303, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (303, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (304, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (304, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (304, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (305, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (307, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (307, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (310, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (310, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (312, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (312, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (312, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (312, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (313, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (313, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (314, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (314, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (316, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (316, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (317, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (317, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (317, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (321, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (324, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (324, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (325, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (325, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (326, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (326, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (326, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (327, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (327, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (330, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (330, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (331, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (332, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (333, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (336, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (339, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (339, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (344, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (344, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (344, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (345, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (346, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (346, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (346, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (347, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (348, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (349, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (349, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (350, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (350, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (350, 901297210);
commit;
prompt 1300 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (351, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (351, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (351, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (355, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (355, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (355, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (359, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (359, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (360, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (360, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (361, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (362, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (362, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (363, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (363, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (363, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (364, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (365, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (365, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (366, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (366, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (366, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (369, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (371, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (373, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (373, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (376, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (377, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (377, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (379, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (380, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (381, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (384, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (384, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (384, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (385, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (386, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (387, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (387, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (389, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (389, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (391, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (392, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (392, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (394, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (394, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (394, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (395, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (395, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (396, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (399, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (400, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (400, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (401, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (401, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (401, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (402, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (403, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (404, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (404, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (405, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (408, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (410, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (410, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (411, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (412, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (413, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (416, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (416, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (418, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (418, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (419, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (419, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (421, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (423, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (423, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (423, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (427, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (428, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (430, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (430, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (433, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (434, 134024937);
commit;
prompt 1400 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (437, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (439, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (439, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (441, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (443, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (444, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (445, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (447, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (447, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (447, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (448, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (450, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (452, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (455, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (456, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (457, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (459, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (461, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (462, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (463, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (463, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (464, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (464, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (467, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (467, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (467, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (468, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (468, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (468, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (468, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (470, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (470, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (471, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (471, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (475, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (476, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (476, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (477, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (477, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (480, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (480, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (481, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (482, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (485, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (485, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (486, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (486, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (486, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (486, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (488, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (734, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (734, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (736, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (736, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (736, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (737, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (739, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (739, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (739, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (740, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (740, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (743, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (743, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (743, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (747, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (749, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (749, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (750, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (750, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (750, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (750, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (753, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (753, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (754, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (754, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (756, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (758, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (758, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (760, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (762, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (762, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (764, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (764, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (765, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (766, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (768, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (769, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (769, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (770, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (771, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (772, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (773, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (773, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (774, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (774, 812843652);
commit;
prompt 1500 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (775, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (775, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (777, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (777, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (779, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (781, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (785, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (786, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (787, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (787, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (787, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (788, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (790, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (791, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (791, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (793, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (793, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (795, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (795, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (795, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (796, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (796, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (797, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (797, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (798, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (802, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (804, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (804, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (804, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (805, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (805, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (806, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (806, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (806, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (807, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (808, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (809, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (809, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (809, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (810, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (810, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (810, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (811, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (811, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (811, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (814, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (814, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (816, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (817, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (817, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (817, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (818, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (818, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (819, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (819, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (819, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (822, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (823, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (823, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (824, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (824, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (827, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (827, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (827, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (828, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (828, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (828, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (831, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (831, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (832, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (832, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (838, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (839, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (841, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (841, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (841, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (841, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (843, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (844, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (845, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (846, 373176861);
commit;
prompt 1600 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (846, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (848, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (848, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (848, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (851, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (851, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (851, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (851, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (852, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (852, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (856, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (857, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (858, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (859, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (859, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (859, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (859, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (860, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (860, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (861, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (862, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (862, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (863, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (863, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (864, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (864, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (867, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (867, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (868, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (868, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (869, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (870, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (872, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (875, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (875, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (878, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (878, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (880, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (881, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (881, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (881, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (882, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (882, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (883, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (885, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (886, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (886, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (886, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (888, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (888, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (889, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (889, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (889, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (893, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (893, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (896, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (899, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (899, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (899, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (900, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (901, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (902, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (903, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (904, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (905, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (906, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (907, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (907, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (909, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (910, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (910, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (910, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (911, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (911, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (912, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (913, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (913, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (913, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (914, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (915, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (915, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (915, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (918, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 711979218);
commit;
prompt 1700 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (920, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (921, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (925, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (928, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (928, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (929, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (931, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (931, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (931, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (933, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (933, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (934, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (935, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (936, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (936, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (937, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (940, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (942, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (942, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (942, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (943, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (943, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1760, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1761, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1764, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1764, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1765, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1767, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1767, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1768, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1768, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1768, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1770, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1771, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1771, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1771, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1771, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1772, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1772, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1772, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1772, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1773, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1774, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1774, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1775, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1775, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1775, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1776, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1778, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1779, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1780, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1780, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1782, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1782, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1787, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1789, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1789, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1793, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1793, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1793, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1794, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1796, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1797, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1797, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1804, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1806, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1807, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1812, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1812, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1813, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1817, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1817, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1817, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1817, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1819, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1820, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1820, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1820, 812565282);
commit;
prompt 1800 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1821, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1825, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1826, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1828, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1828, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1831, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1831, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1833, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1834, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1838, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1839, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1840, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1841, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1843, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1843, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1844, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1845, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1845, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1846, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1846, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1846, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1848, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1849, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1850, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1851, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1851, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1852, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1854, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1854, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1857, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1858, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1860, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1860, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1860, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1860, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1861, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1861, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1861, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1862, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1863, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1868, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1868, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1868, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1869, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1869, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1871, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1871, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1872, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1873, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1874, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1874, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1876, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1878, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1878, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1879, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1880, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1881, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1883, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1883, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1885, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1886, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1886, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1887, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1887, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1889, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1890, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1891, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1891, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1892, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1892, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1895, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1895, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1896, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1899, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1900, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1900, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1902, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1902, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1904, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1905, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1906, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1912, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1914, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1914, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1914, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1916, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1922, 138192266);
commit;
prompt 1900 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1922, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1926, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1926, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1928, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1932, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1934, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1934, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1934, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1938, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1938, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1939, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1939, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1940, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1940, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1942, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1943, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1943, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1945, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1945, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1945, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1946, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1946, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1946, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1947, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1947, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1947, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1948, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1948, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1948, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1950, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1951, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1951, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1953, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1953, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1954, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1955, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1955, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1955, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1956, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1956, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1956, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1957, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1957, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1957, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1959, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1959, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1960, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1961, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1961, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1962, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1964, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1965, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1965, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1966, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1968, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1968, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1968, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1969, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1969, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1969, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1973, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1973, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1973, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1974, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1975, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1976, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1976, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1976, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1977, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1981, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1981, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1985, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1986, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1986, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1986, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1988, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1989, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1989, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1991, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1991, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1992, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1993, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1993, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1996, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1999, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1999, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1999, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1999, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1081, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1081, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1081, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1082, 159353604);
commit;
prompt 2000 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1082, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1082, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1085, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1085, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1085, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1085, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1086, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1086, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1087, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1090, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1091, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1092, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1094, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1095, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1096, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1096, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1097, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1097, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1099, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1100, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1100, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1101, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1101, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1102, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1104, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1105, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1105, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1105, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1105, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1107, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1107, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1109, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1109, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1109, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1111, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1111, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1111, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1114, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1114, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1115, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1115, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1116, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1117, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1117, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1118, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1118, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1119, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1119, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1120, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1121, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1123, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1127, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1128, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1128, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1130, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1132, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1132, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1132, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1133, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1136, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1136, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1137, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1139, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1139, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1140, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1141, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1143, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1147, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1148, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1151, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1152, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1152, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1154, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1154, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1154, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1155, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1156, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1156, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1157, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1157, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1159, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1159, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1161, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1161, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1164, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1164, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1165, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1165, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1166, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1168, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1168, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 858875113);
commit;
prompt 2100 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1170, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1172, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1172, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1173, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1173, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1174, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1174, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1175, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1175, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1175, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1179, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1179, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1181, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1182, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1182, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1183, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1185, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1185, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1187, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1188, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1191, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1193, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1194, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1194, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1196, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1196, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1198, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1199, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1200, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1200, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1202, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1202, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1204, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1206, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1208, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1208, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1209, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1211, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1212, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1214, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1214, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1215, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1216, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1217, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1219, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (137, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (137, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (137, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (140, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (140, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (141, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (141, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (141, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (143, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (144, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (145, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (146, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (148, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (149, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (149, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (151, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (151, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (152, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (152, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (152, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (152, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (153, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (155, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (156, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (157, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (158, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (158, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (159, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (159, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (159, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (160, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (160, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (162, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (162, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (162, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (164, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (164, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (164, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (166, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (166, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (167, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (167, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (171, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (172, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (172, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (173, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (173, 966618858);
commit;
prompt 2200 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (175, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (175, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (176, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (177, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (181, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (181, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (183, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (184, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (184, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (185, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (185, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (187, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (187, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (187, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (188, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (188, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (189, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (189, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (190, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (191, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (194, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (194, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (194, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (198, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (202, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (204, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (206, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (207, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (207, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (208, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (208, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (208, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (212, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (212, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (213, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (214, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (215, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (216, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (216, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (216, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (216, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (217, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (218, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (219, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (219, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (222, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (223, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (223, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (225, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (225, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (226, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (228, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (228, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (229, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (229, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (230, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (230, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (233, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (233, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (234, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (235, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (236, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (237, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (238, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (239, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (239, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (240, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (240, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (241, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (242, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (242, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (243, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (243, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (243, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (243, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (246, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (246, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (247, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (247, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (251, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (253, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (254, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (255, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (256, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (256, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (257, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (257, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (257, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (260, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (260, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (261, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (261, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (261, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (263, 373176861);
commit;
prompt 2300 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (263, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (265, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (266, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (266, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (266, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (267, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (268, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (269, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (269, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (272, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (275, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (275, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (275, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (276, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (277, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (278, 256239435);
commit;
prompt 2316 records loaded
prompt Loading VOLUNTEER...
insert into VOLUNTEER (volunteerid)
values (101584298);
insert into VOLUNTEER (volunteerid)
values (108411178);
insert into VOLUNTEER (volunteerid)
values (112371177);
insert into VOLUNTEER (volunteerid)
values (115840139);
insert into VOLUNTEER (volunteerid)
values (123863694);
insert into VOLUNTEER (volunteerid)
values (124475793);
insert into VOLUNTEER (volunteerid)
values (126868783);
insert into VOLUNTEER (volunteerid)
values (152434577);
insert into VOLUNTEER (volunteerid)
values (162788221);
insert into VOLUNTEER (volunteerid)
values (165333583);
insert into VOLUNTEER (volunteerid)
values (177157307);
insert into VOLUNTEER (volunteerid)
values (179630502);
insert into VOLUNTEER (volunteerid)
values (185946154);
insert into VOLUNTEER (volunteerid)
values (187932356);
insert into VOLUNTEER (volunteerid)
values (188224358);
insert into VOLUNTEER (volunteerid)
values (194400947);
insert into VOLUNTEER (volunteerid)
values (213078687);
insert into VOLUNTEER (volunteerid)
values (232559981);
insert into VOLUNTEER (volunteerid)
values (240495059);
insert into VOLUNTEER (volunteerid)
values (250846779);
insert into VOLUNTEER (volunteerid)
values (254279826);
insert into VOLUNTEER (volunteerid)
values (274340804);
insert into VOLUNTEER (volunteerid)
values (276658821);
insert into VOLUNTEER (volunteerid)
values (295925780);
insert into VOLUNTEER (volunteerid)
values (303739378);
insert into VOLUNTEER (volunteerid)
values (305199304);
insert into VOLUNTEER (volunteerid)
values (305993110);
insert into VOLUNTEER (volunteerid)
values (306104563);
insert into VOLUNTEER (volunteerid)
values (311783430);
insert into VOLUNTEER (volunteerid)
values (327572937);
insert into VOLUNTEER (volunteerid)
values (328925588);
insert into VOLUNTEER (volunteerid)
values (332185579);
insert into VOLUNTEER (volunteerid)
values (332990580);
insert into VOLUNTEER (volunteerid)
values (339593939);
insert into VOLUNTEER (volunteerid)
values (343281461);
insert into VOLUNTEER (volunteerid)
values (351332054);
insert into VOLUNTEER (volunteerid)
values (364957248);
insert into VOLUNTEER (volunteerid)
values (376286668);
insert into VOLUNTEER (volunteerid)
values (384551100);
insert into VOLUNTEER (volunteerid)
values (384875242);
insert into VOLUNTEER (volunteerid)
values (386348949);
insert into VOLUNTEER (volunteerid)
values (387684814);
insert into VOLUNTEER (volunteerid)
values (404883551);
insert into VOLUNTEER (volunteerid)
values (413997128);
insert into VOLUNTEER (volunteerid)
values (421810164);
insert into VOLUNTEER (volunteerid)
values (422239445);
insert into VOLUNTEER (volunteerid)
values (429436272);
insert into VOLUNTEER (volunteerid)
values (452544001);
insert into VOLUNTEER (volunteerid)
values (479816079);
insert into VOLUNTEER (volunteerid)
values (506544368);
insert into VOLUNTEER (volunteerid)
values (515300589);
insert into VOLUNTEER (volunteerid)
values (517094574);
insert into VOLUNTEER (volunteerid)
values (531749344);
insert into VOLUNTEER (volunteerid)
values (554527112);
insert into VOLUNTEER (volunteerid)
values (555880862);
insert into VOLUNTEER (volunteerid)
values (558414787);
insert into VOLUNTEER (volunteerid)
values (568666955);
insert into VOLUNTEER (volunteerid)
values (577311698);
insert into VOLUNTEER (volunteerid)
values (578363521);
insert into VOLUNTEER (volunteerid)
values (592339013);
insert into VOLUNTEER (volunteerid)
values (607515527);
insert into VOLUNTEER (volunteerid)
values (612714265);
insert into VOLUNTEER (volunteerid)
values (613658145);
insert into VOLUNTEER (volunteerid)
values (625853599);
insert into VOLUNTEER (volunteerid)
values (649674822);
insert into VOLUNTEER (volunteerid)
values (650502773);
insert into VOLUNTEER (volunteerid)
values (652011695);
insert into VOLUNTEER (volunteerid)
values (664633791);
insert into VOLUNTEER (volunteerid)
values (671157768);
insert into VOLUNTEER (volunteerid)
values (675278483);
insert into VOLUNTEER (volunteerid)
values (681488617);
insert into VOLUNTEER (volunteerid)
values (685378695);
insert into VOLUNTEER (volunteerid)
values (699763110);
insert into VOLUNTEER (volunteerid)
values (749309034);
insert into VOLUNTEER (volunteerid)
values (751304730);
insert into VOLUNTEER (volunteerid)
values (755938204);
insert into VOLUNTEER (volunteerid)
values (761247130);
insert into VOLUNTEER (volunteerid)
values (769195766);
insert into VOLUNTEER (volunteerid)
values (769300586);
insert into VOLUNTEER (volunteerid)
values (777883031);
insert into VOLUNTEER (volunteerid)
values (811724593);
insert into VOLUNTEER (volunteerid)
values (812798570);
insert into VOLUNTEER (volunteerid)
values (813323354);
insert into VOLUNTEER (volunteerid)
values (813563203);
insert into VOLUNTEER (volunteerid)
values (831143606);
insert into VOLUNTEER (volunteerid)
values (843458495);
insert into VOLUNTEER (volunteerid)
values (843512931);
insert into VOLUNTEER (volunteerid)
values (875005373);
insert into VOLUNTEER (volunteerid)
values (886763148);
insert into VOLUNTEER (volunteerid)
values (900618507);
insert into VOLUNTEER (volunteerid)
values (904561233);
insert into VOLUNTEER (volunteerid)
values (934146705);
insert into VOLUNTEER (volunteerid)
values (944746756);
insert into VOLUNTEER (volunteerid)
values (947929576);
insert into VOLUNTEER (volunteerid)
values (951651032);
insert into VOLUNTEER (volunteerid)
values (988611196);
insert into VOLUNTEER (volunteerid)
values (991207433);
insert into VOLUNTEER (volunteerid)
values (994265828);
commit;
prompt 98 records loaded
prompt Loading PARTICIPANTVOLUNTEER...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (2, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (8, 421810164);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (14, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (15, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (16, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (16, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (20, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (21, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (21, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (24, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (24, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (25, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (28, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (31, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (33, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (33, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (35, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (36, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (41, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (41, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (41, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (41, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (45, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (45, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (46, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (46, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (47, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (47, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (49, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (52, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (55, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (56, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (56, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (57, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (57, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (57, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (68, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (87, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (93, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (94, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (98, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (101, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (101, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (101, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (105, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (106, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (109, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (118, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (128, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (139, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (139, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (142, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (142, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (147, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (149, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (151, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (151, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (152, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (152, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (153, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (162, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (167, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (169, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (171, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (173, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (173, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (175, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (176, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (176, 555880862);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (180, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (183, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (187, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (190, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (191, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (194, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (196, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (207, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (212, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (212, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (215, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (218, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (219, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (219, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (222, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (228, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (230, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (230, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (230, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (231, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (233, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (234, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (235, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (237, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (239, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (240, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (241, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (245, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (250, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (251, 376286668);
commit;
prompt 100 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (254, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (256, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (257, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (257, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (258, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (259, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (259, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (259, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (259, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (260, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (263, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (266, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (267, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (268, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (269, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (276, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (278, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (279, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (281, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (281, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (285, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (287, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (288, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (290, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (290, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (297, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (301, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (303, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (305, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (305, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (305, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (310, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (310, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (313, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (322, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (326, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (327, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (330, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (330, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (336, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (337, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (339, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (341, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (345, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (346, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (346, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (348, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (351, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (352, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (352, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (355, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (359, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (361, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (366, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (369, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (371, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (373, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (375, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (375, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (380, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (380, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (383, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (383, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (384, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (387, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (392, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (394, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (395, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (395, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (399, 421810164);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (399, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (402, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (402, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (402, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (403, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (410, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (412, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (414, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (418, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (421, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (421, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (427, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (432, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (437, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (440, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (441, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (447, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (449, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (450, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (450, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (452, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (455, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (455, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (455, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (459, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (461, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (463, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (467, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (470, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (471, 328925588);
commit;
prompt 200 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (474, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (480, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (488, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (492, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (494, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (494, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1003, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1006, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1008, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1009, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1011, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1017, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1019, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1022, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1023, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1023, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1023, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1027, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1027, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1032, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1039, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1042, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1042, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1044, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1044, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1045, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1045, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1045, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1047, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1050, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1057, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1058, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1064, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1077, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1077, 555880862);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1079, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1081, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1081, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1090, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1094, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1096, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1097, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1098, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1100, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1101, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1104, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1104, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1105, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1107, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1107, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1109, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1111, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1116, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1118, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1119, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1120, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1121, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1124, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1127, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1136, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1141, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1143, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1144, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1148, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1150, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1151, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1154, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1155, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1156, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1159, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1162, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1164, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1164, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1167, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1173, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1174, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1175, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1176, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1176, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1177, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1177, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1177, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1180, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1182, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1185, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1187, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1192, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1193, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1199, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1207, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1208, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1208, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1209, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1211, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1211, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1215, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1215, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1218, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1218, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1218, 813563203);
commit;
prompt 300 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1219, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1226, 755938204);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1229, 755938204);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1231, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1233, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1239, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1241, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1241, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1244, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1244, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1245, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1245, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1246, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1255, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1257, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1258, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1262, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1276, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1277, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1279, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1282, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1283, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1290, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1290, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1292, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1298, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1300, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1300, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1301, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1307, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1307, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1309, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1309, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1309, 517094574);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1309, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1312, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1314, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1314, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1315, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1319, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1319, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1320, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1321, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1338, 517094574);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1350, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1351, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1365, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1365, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1365, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1366, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1370, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1388, 755938204);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1396, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1399, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1401, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1403, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1403, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1406, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1411, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1413, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1415, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1416, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1417, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1417, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1420, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1420, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1428, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1428, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1429, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1432, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1434, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1440, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1441, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1443, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1443, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1445, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1446, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1454, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1456, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1460, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1465, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1468, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1472, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1473, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1476, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1476, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1478, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1482, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1483, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1484, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1486, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1489, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1490, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (498, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (498, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (500, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (503, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (504, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (506, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (508, 177157307);
commit;
prompt 400 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (509, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (515, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (518, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (522, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (526, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (526, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (527, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (528, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (529, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (531, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (531, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (546, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (551, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (555, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (565, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (565, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (566, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (567, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (570, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (570, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (570, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (572, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (573, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (578, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (581, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (581, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (584, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (588, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (588, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (592, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (592, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (601, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (603, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (622, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (628, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (628, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (631, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (632, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (637, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (639, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (640, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (640, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (643, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (651, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (660, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (660, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (663, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (665, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (667, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (668, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (668, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (670, 517094574);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (670, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (678, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (684, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (693, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (694, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (694, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (694, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (704, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (704, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (704, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (705, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (710, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (712, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (714, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (717, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (722, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (722, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (722, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (723, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (739, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (739, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (743, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (743, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (747, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (748, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (750, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (753, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (754, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (759, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (768, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (770, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (771, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (773, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (774, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (775, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (776, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (787, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (790, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (791, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (793, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (795, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (795, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (796, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (797, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (798, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (803, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (803, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (805, 364957248);
commit;
prompt 500 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (807, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (808, 413997128);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (809, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (809, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (809, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (810, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (810, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (811, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (811, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (812, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (814, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (814, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (817, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (823, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (824, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (824, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (825, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (827, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (828, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (833, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (836, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (837, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (838, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (838, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (843, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (844, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (845, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (846, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (852, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (854, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (855, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (855, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (856, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (857, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (863, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (863, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (867, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (868, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (869, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (876, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (876, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (879, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (880, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (882, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (883, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (883, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (892, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (903, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (904, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (906, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (907, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (909, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (910, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (913, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (919, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (920, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (921, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (924, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (925, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (935, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (935, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (940, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (946, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (948, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (948, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (950, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (952, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (953, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (956, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (958, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (963, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (968, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (971, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (971, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (972, 413997128);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (975, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (976, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (979, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (980, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (980, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (980, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (980, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (981, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (989, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (989, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (993, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (995, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (996, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1503, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1505, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1506, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1507, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1509, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1510, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1512, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1512, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1514, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1515, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1527, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1535, 413997128);
commit;
prompt 600 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1535, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1538, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1541, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1543, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1544, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1544, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1546, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1548, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1548, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1553, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1556, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1556, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1557, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1557, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1559, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1561, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1561, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1562, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1564, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1565, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1565, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1569, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1569, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1570, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1573, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1575, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1577, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1584, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1584, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1586, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1597, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1603, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1603, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1603, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1603, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1605, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1605, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1609, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1612, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1617, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1626, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1627, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1630, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1637, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1641, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1643, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1647, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1649, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1651, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1651, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1652, 755938204);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1653, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1654, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1657, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1660, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1660, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1664, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1664, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1671, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1673, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1676, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1679, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1681, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1681, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1685, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1687, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1688, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1689, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1691, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1691, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1693, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1695, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1695, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1697, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1698, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1699, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1707, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1713, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1716, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1721, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1721, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1728, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1728, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1731, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1735, 421810164);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1740, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1741, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1746, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1748, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1748, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1752, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1754, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1760, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1760, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1760, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1765, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1772, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1774, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1775, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1779, 213078687);
commit;
prompt 700 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1789, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1793, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1797, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1798, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1800, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1806, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1809, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1813, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1817, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1817, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1819, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1825, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1826, 517094574);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1828, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1832, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1832, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1836, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1840, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1840, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1843, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1845, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1849, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1851, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1857, 555880862);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1861, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1861, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1869, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1870, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1874, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1874, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1876, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1879, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1879, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1881, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1881, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1885, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1885, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1889, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1897, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1898, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1900, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1904, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1906, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1912, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1914, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1914, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1915, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1916, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1918, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1918, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1919, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1919, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1919, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1922, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1923, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1925, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1928, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1928, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1936, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1937, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1939, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1946, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1947, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1947, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1950, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1953, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1955, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1957, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1959, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1968, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1969, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1973, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1976, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1977, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1982, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1988, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1992, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1992, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1992, 531749344);
commit;
prompt 779 records loaded
prompt Loading SENDTEAM...
insert into SENDTEAM (callid, teamid)
values (294, 147);
insert into SENDTEAM (callid, teamid)
values (70, 640);
insert into SENDTEAM (callid, teamid)
values (609, 54);
insert into SENDTEAM (callid, teamid)
values (303, 327);
insert into SENDTEAM (callid, teamid)
values (424, 1128);
insert into SENDTEAM (callid, teamid)
values (220, 1879);
insert into SENDTEAM (callid, teamid)
values (139, 301);
insert into SENDTEAM (callid, teamid)
values (699, 289);
insert into SENDTEAM (callid, teamid)
values (474, 1365);
insert into SENDTEAM (callid, teamid)
values (53, 784);
insert into SENDTEAM (callid, teamid)
values (881, 5);
insert into SENDTEAM (callid, teamid)
values (832, 17);
insert into SENDTEAM (callid, teamid)
values (772, 156);
insert into SENDTEAM (callid, teamid)
values (683, 1038);
insert into SENDTEAM (callid, teamid)
values (183, 555);
insert into SENDTEAM (callid, teamid)
values (746, 1625);
insert into SENDTEAM (callid, teamid)
values (819, 1363);
insert into SENDTEAM (callid, teamid)
values (799, 1589);
insert into SENDTEAM (callid, teamid)
values (952, 20);
insert into SENDTEAM (callid, teamid)
values (311, 1948);
insert into SENDTEAM (callid, teamid)
values (973, 1976);
insert into SENDTEAM (callid, teamid)
values (442, 534);
insert into SENDTEAM (callid, teamid)
values (763, 535);
insert into SENDTEAM (callid, teamid)
values (79, 1199);
insert into SENDTEAM (callid, teamid)
values (878, 1453);
insert into SENDTEAM (callid, teamid)
values (826, 1604);
insert into SENDTEAM (callid, teamid)
values (294, 133);
insert into SENDTEAM (callid, teamid)
values (95, 430);
insert into SENDTEAM (callid, teamid)
values (813, 1132);
insert into SENDTEAM (callid, teamid)
values (307, 1697);
insert into SENDTEAM (callid, teamid)
values (808, 907);
insert into SENDTEAM (callid, teamid)
values (210, 382);
insert into SENDTEAM (callid, teamid)
values (381, 1804);
insert into SENDTEAM (callid, teamid)
values (882, 1694);
insert into SENDTEAM (callid, teamid)
values (206, 1749);
insert into SENDTEAM (callid, teamid)
values (869, 800);
insert into SENDTEAM (callid, teamid)
values (435, 1580);
insert into SENDTEAM (callid, teamid)
values (189, 168);
insert into SENDTEAM (callid, teamid)
values (238, 1012);
insert into SENDTEAM (callid, teamid)
values (69, 1301);
insert into SENDTEAM (callid, teamid)
values (181, 1179);
insert into SENDTEAM (callid, teamid)
values (998, 1877);
insert into SENDTEAM (callid, teamid)
values (809, 1136);
insert into SENDTEAM (callid, teamid)
values (568, 1241);
insert into SENDTEAM (callid, teamid)
values (550, 1697);
insert into SENDTEAM (callid, teamid)
values (407, 1650);
insert into SENDTEAM (callid, teamid)
values (754, 905);
insert into SENDTEAM (callid, teamid)
values (744, 102);
insert into SENDTEAM (callid, teamid)
values (554, 693);
insert into SENDTEAM (callid, teamid)
values (951, 256);
insert into SENDTEAM (callid, teamid)
values (320, 371);
insert into SENDTEAM (callid, teamid)
values (628, 1102);
insert into SENDTEAM (callid, teamid)
values (740, 1671);
insert into SENDTEAM (callid, teamid)
values (748, 471);
insert into SENDTEAM (callid, teamid)
values (182, 1252);
insert into SENDTEAM (callid, teamid)
values (523, 530);
insert into SENDTEAM (callid, teamid)
values (970, 1167);
insert into SENDTEAM (callid, teamid)
values (674, 1375);
insert into SENDTEAM (callid, teamid)
values (45, 1981);
insert into SENDTEAM (callid, teamid)
values (283, 1437);
insert into SENDTEAM (callid, teamid)
values (580, 524);
insert into SENDTEAM (callid, teamid)
values (671, 1004);
insert into SENDTEAM (callid, teamid)
values (840, 1748);
insert into SENDTEAM (callid, teamid)
values (303, 1078);
insert into SENDTEAM (callid, teamid)
values (479, 1414);
insert into SENDTEAM (callid, teamid)
values (487, 1412);
insert into SENDTEAM (callid, teamid)
values (321, 1690);
insert into SENDTEAM (callid, teamid)
values (451, 391);
insert into SENDTEAM (callid, teamid)
values (870, 1210);
insert into SENDTEAM (callid, teamid)
values (923, 627);
insert into SENDTEAM (callid, teamid)
values (628, 818);
insert into SENDTEAM (callid, teamid)
values (610, 1026);
insert into SENDTEAM (callid, teamid)
values (590, 1923);
insert into SENDTEAM (callid, teamid)
values (733, 1391);
insert into SENDTEAM (callid, teamid)
values (16, 605);
insert into SENDTEAM (callid, teamid)
values (190, 468);
insert into SENDTEAM (callid, teamid)
values (426, 448);
insert into SENDTEAM (callid, teamid)
values (540, 1401);
insert into SENDTEAM (callid, teamid)
values (388, 704);
insert into SENDTEAM (callid, teamid)
values (641, 1567);
insert into SENDTEAM (callid, teamid)
values (930, 529);
insert into SENDTEAM (callid, teamid)
values (67, 122);
insert into SENDTEAM (callid, teamid)
values (822, 416);
insert into SENDTEAM (callid, teamid)
values (473, 1730);
insert into SENDTEAM (callid, teamid)
values (567, 1012);
insert into SENDTEAM (callid, teamid)
values (643, 1389);
insert into SENDTEAM (callid, teamid)
values (852, 1211);
insert into SENDTEAM (callid, teamid)
values (880, 860);
insert into SENDTEAM (callid, teamid)
values (519, 309);
insert into SENDTEAM (callid, teamid)
values (129, 1236);
insert into SENDTEAM (callid, teamid)
values (438, 880);
insert into SENDTEAM (callid, teamid)
values (423, 1296);
insert into SENDTEAM (callid, teamid)
values (858, 581);
insert into SENDTEAM (callid, teamid)
values (419, 537);
insert into SENDTEAM (callid, teamid)
values (868, 582);
insert into SENDTEAM (callid, teamid)
values (223, 1279);
insert into SENDTEAM (callid, teamid)
values (241, 1513);
insert into SENDTEAM (callid, teamid)
values (166, 1889);
insert into SENDTEAM (callid, teamid)
values (682, 1403);
insert into SENDTEAM (callid, teamid)
values (389, 1022);
commit;
prompt 100 records committed...
insert into SENDTEAM (callid, teamid)
values (557, 599);
insert into SENDTEAM (callid, teamid)
values (481, 909);
insert into SENDTEAM (callid, teamid)
values (576, 583);
insert into SENDTEAM (callid, teamid)
values (866, 498);
insert into SENDTEAM (callid, teamid)
values (619, 765);
insert into SENDTEAM (callid, teamid)
values (360, 329);
insert into SENDTEAM (callid, teamid)
values (705, 1559);
insert into SENDTEAM (callid, teamid)
values (632, 134);
insert into SENDTEAM (callid, teamid)
values (296, 949);
insert into SENDTEAM (callid, teamid)
values (705, 1086);
insert into SENDTEAM (callid, teamid)
values (496, 1749);
insert into SENDTEAM (callid, teamid)
values (228, 730);
insert into SENDTEAM (callid, teamid)
values (598, 330);
insert into SENDTEAM (callid, teamid)
values (682, 239);
insert into SENDTEAM (callid, teamid)
values (216, 1154);
insert into SENDTEAM (callid, teamid)
values (565, 576);
insert into SENDTEAM (callid, teamid)
values (655, 846);
insert into SENDTEAM (callid, teamid)
values (109, 1774);
insert into SENDTEAM (callid, teamid)
values (373, 554);
insert into SENDTEAM (callid, teamid)
values (979, 1230);
insert into SENDTEAM (callid, teamid)
values (813, 47);
insert into SENDTEAM (callid, teamid)
values (971, 1797);
insert into SENDTEAM (callid, teamid)
values (906, 1308);
insert into SENDTEAM (callid, teamid)
values (580, 981);
insert into SENDTEAM (callid, teamid)
values (491, 264);
insert into SENDTEAM (callid, teamid)
values (811, 445);
insert into SENDTEAM (callid, teamid)
values (499, 1589);
insert into SENDTEAM (callid, teamid)
values (174, 1038);
insert into SENDTEAM (callid, teamid)
values (449, 253);
insert into SENDTEAM (callid, teamid)
values (988, 1179);
insert into SENDTEAM (callid, teamid)
values (926, 1552);
insert into SENDTEAM (callid, teamid)
values (773, 393);
insert into SENDTEAM (callid, teamid)
values (321, 653);
insert into SENDTEAM (callid, teamid)
values (297, 347);
insert into SENDTEAM (callid, teamid)
values (887, 351);
insert into SENDTEAM (callid, teamid)
values (667, 585);
insert into SENDTEAM (callid, teamid)
values (219, 1616);
insert into SENDTEAM (callid, teamid)
values (620, 1432);
insert into SENDTEAM (callid, teamid)
values (127, 1700);
insert into SENDTEAM (callid, teamid)
values (126, 1136);
insert into SENDTEAM (callid, teamid)
values (222, 1137);
insert into SENDTEAM (callid, teamid)
values (270, 1555);
insert into SENDTEAM (callid, teamid)
values (599, 1635);
insert into SENDTEAM (callid, teamid)
values (436, 316);
insert into SENDTEAM (callid, teamid)
values (261, 185);
insert into SENDTEAM (callid, teamid)
values (444, 958);
insert into SENDTEAM (callid, teamid)
values (643, 1723);
insert into SENDTEAM (callid, teamid)
values (844, 74);
insert into SENDTEAM (callid, teamid)
values (821, 325);
insert into SENDTEAM (callid, teamid)
values (904, 1087);
insert into SENDTEAM (callid, teamid)
values (585, 115);
insert into SENDTEAM (callid, teamid)
values (302, 1939);
insert into SENDTEAM (callid, teamid)
values (303, 489);
insert into SENDTEAM (callid, teamid)
values (574, 592);
insert into SENDTEAM (callid, teamid)
values (71, 974);
insert into SENDTEAM (callid, teamid)
values (113, 1350);
insert into SENDTEAM (callid, teamid)
values (421, 1870);
insert into SENDTEAM (callid, teamid)
values (239, 1260);
insert into SENDTEAM (callid, teamid)
values (284, 1854);
insert into SENDTEAM (callid, teamid)
values (675, 686);
insert into SENDTEAM (callid, teamid)
values (945, 878);
insert into SENDTEAM (callid, teamid)
values (477, 848);
insert into SENDTEAM (callid, teamid)
values (181, 1326);
insert into SENDTEAM (callid, teamid)
values (801, 1032);
insert into SENDTEAM (callid, teamid)
values (398, 1095);
insert into SENDTEAM (callid, teamid)
values (233, 1603);
insert into SENDTEAM (callid, teamid)
values (939, 276);
insert into SENDTEAM (callid, teamid)
values (225, 1894);
insert into SENDTEAM (callid, teamid)
values (502, 1436);
insert into SENDTEAM (callid, teamid)
values (857, 785);
insert into SENDTEAM (callid, teamid)
values (284, 2000);
insert into SENDTEAM (callid, teamid)
values (138, 325);
insert into SENDTEAM (callid, teamid)
values (35, 1246);
insert into SENDTEAM (callid, teamid)
values (427, 1287);
insert into SENDTEAM (callid, teamid)
values (379, 1841);
insert into SENDTEAM (callid, teamid)
values (224, 437);
insert into SENDTEAM (callid, teamid)
values (430, 405);
insert into SENDTEAM (callid, teamid)
values (11, 50);
insert into SENDTEAM (callid, teamid)
values (1, 275);
insert into SENDTEAM (callid, teamid)
values (17, 386);
insert into SENDTEAM (callid, teamid)
values (179, 1887);
insert into SENDTEAM (callid, teamid)
values (716, 938);
insert into SENDTEAM (callid, teamid)
values (696, 627);
insert into SENDTEAM (callid, teamid)
values (46, 469);
insert into SENDTEAM (callid, teamid)
values (646, 857);
insert into SENDTEAM (callid, teamid)
values (196, 1152);
insert into SENDTEAM (callid, teamid)
values (941, 1957);
insert into SENDTEAM (callid, teamid)
values (17, 1082);
insert into SENDTEAM (callid, teamid)
values (67, 1079);
insert into SENDTEAM (callid, teamid)
values (995, 1745);
insert into SENDTEAM (callid, teamid)
values (910, 1373);
insert into SENDTEAM (callid, teamid)
values (485, 260);
insert into SENDTEAM (callid, teamid)
values (863, 1284);
insert into SENDTEAM (callid, teamid)
values (633, 606);
insert into SENDTEAM (callid, teamid)
values (691, 693);
insert into SENDTEAM (callid, teamid)
values (142, 1230);
insert into SENDTEAM (callid, teamid)
values (250, 17);
insert into SENDTEAM (callid, teamid)
values (153, 48);
insert into SENDTEAM (callid, teamid)
values (334, 1764);
insert into SENDTEAM (callid, teamid)
values (244, 760);
commit;
prompt 200 records committed...
insert into SENDTEAM (callid, teamid)
values (383, 1567);
insert into SENDTEAM (callid, teamid)
values (909, 696);
insert into SENDTEAM (callid, teamid)
values (909, 476);
insert into SENDTEAM (callid, teamid)
values (297, 1625);
insert into SENDTEAM (callid, teamid)
values (538, 657);
insert into SENDTEAM (callid, teamid)
values (14, 1840);
insert into SENDTEAM (callid, teamid)
values (455, 264);
insert into SENDTEAM (callid, teamid)
values (746, 591);
insert into SENDTEAM (callid, teamid)
values (362, 350);
insert into SENDTEAM (callid, teamid)
values (311, 1660);
insert into SENDTEAM (callid, teamid)
values (393, 242);
insert into SENDTEAM (callid, teamid)
values (981, 1695);
insert into SENDTEAM (callid, teamid)
values (262, 1532);
insert into SENDTEAM (callid, teamid)
values (115, 911);
insert into SENDTEAM (callid, teamid)
values (973, 1867);
insert into SENDTEAM (callid, teamid)
values (356, 1137);
insert into SENDTEAM (callid, teamid)
values (386, 1551);
insert into SENDTEAM (callid, teamid)
values (159, 1989);
insert into SENDTEAM (callid, teamid)
values (844, 24);
insert into SENDTEAM (callid, teamid)
values (582, 1833);
insert into SENDTEAM (callid, teamid)
values (440, 1483);
insert into SENDTEAM (callid, teamid)
values (61, 1887);
insert into SENDTEAM (callid, teamid)
values (751, 1047);
insert into SENDTEAM (callid, teamid)
values (673, 1844);
insert into SENDTEAM (callid, teamid)
values (106, 1384);
insert into SENDTEAM (callid, teamid)
values (104, 912);
insert into SENDTEAM (callid, teamid)
values (409, 50);
insert into SENDTEAM (callid, teamid)
values (76, 56);
insert into SENDTEAM (callid, teamid)
values (770, 1981);
insert into SENDTEAM (callid, teamid)
values (33, 75);
insert into SENDTEAM (callid, teamid)
values (826, 1492);
insert into SENDTEAM (callid, teamid)
values (322, 1525);
insert into SENDTEAM (callid, teamid)
values (427, 1157);
insert into SENDTEAM (callid, teamid)
values (952, 1472);
insert into SENDTEAM (callid, teamid)
values (693, 670);
insert into SENDTEAM (callid, teamid)
values (459, 1804);
insert into SENDTEAM (callid, teamid)
values (882, 143);
insert into SENDTEAM (callid, teamid)
values (436, 1457);
insert into SENDTEAM (callid, teamid)
values (284, 1535);
insert into SENDTEAM (callid, teamid)
values (182, 1417);
insert into SENDTEAM (callid, teamid)
values (311, 1693);
insert into SENDTEAM (callid, teamid)
values (837, 156);
insert into SENDTEAM (callid, teamid)
values (560, 1591);
insert into SENDTEAM (callid, teamid)
values (633, 1709);
insert into SENDTEAM (callid, teamid)
values (206, 1406);
insert into SENDTEAM (callid, teamid)
values (747, 766);
insert into SENDTEAM (callid, teamid)
values (980, 1912);
insert into SENDTEAM (callid, teamid)
values (580, 92);
insert into SENDTEAM (callid, teamid)
values (368, 1416);
insert into SENDTEAM (callid, teamid)
values (134, 1032);
insert into SENDTEAM (callid, teamid)
values (49, 1745);
insert into SENDTEAM (callid, teamid)
values (344, 818);
insert into SENDTEAM (callid, teamid)
values (244, 272);
insert into SENDTEAM (callid, teamid)
values (266, 1646);
insert into SENDTEAM (callid, teamid)
values (872, 885);
insert into SENDTEAM (callid, teamid)
values (562, 567);
insert into SENDTEAM (callid, teamid)
values (839, 286);
insert into SENDTEAM (callid, teamid)
values (220, 73);
insert into SENDTEAM (callid, teamid)
values (769, 745);
insert into SENDTEAM (callid, teamid)
values (922, 1133);
insert into SENDTEAM (callid, teamid)
values (819, 188);
insert into SENDTEAM (callid, teamid)
values (170, 1012);
insert into SENDTEAM (callid, teamid)
values (498, 1746);
insert into SENDTEAM (callid, teamid)
values (376, 1951);
insert into SENDTEAM (callid, teamid)
values (505, 879);
insert into SENDTEAM (callid, teamid)
values (74, 1675);
insert into SENDTEAM (callid, teamid)
values (810, 1406);
insert into SENDTEAM (callid, teamid)
values (865, 144);
insert into SENDTEAM (callid, teamid)
values (983, 1180);
insert into SENDTEAM (callid, teamid)
values (519, 5);
insert into SENDTEAM (callid, teamid)
values (745, 1983);
insert into SENDTEAM (callid, teamid)
values (293, 1143);
insert into SENDTEAM (callid, teamid)
values (189, 811);
insert into SENDTEAM (callid, teamid)
values (340, 1702);
insert into SENDTEAM (callid, teamid)
values (867, 1391);
insert into SENDTEAM (callid, teamid)
values (210, 1868);
insert into SENDTEAM (callid, teamid)
values (49, 75);
insert into SENDTEAM (callid, teamid)
values (617, 1960);
insert into SENDTEAM (callid, teamid)
values (135, 461);
insert into SENDTEAM (callid, teamid)
values (746, 1716);
insert into SENDTEAM (callid, teamid)
values (969, 953);
insert into SENDTEAM (callid, teamid)
values (18, 1459);
insert into SENDTEAM (callid, teamid)
values (573, 1367);
insert into SENDTEAM (callid, teamid)
values (379, 192);
insert into SENDTEAM (callid, teamid)
values (840, 814);
insert into SENDTEAM (callid, teamid)
values (32, 1961);
insert into SENDTEAM (callid, teamid)
values (603, 64);
insert into SENDTEAM (callid, teamid)
values (740, 303);
insert into SENDTEAM (callid, teamid)
values (880, 1078);
insert into SENDTEAM (callid, teamid)
values (894, 1601);
insert into SENDTEAM (callid, teamid)
values (191, 49);
insert into SENDTEAM (callid, teamid)
values (653, 1918);
insert into SENDTEAM (callid, teamid)
values (889, 1164);
insert into SENDTEAM (callid, teamid)
values (838, 327);
insert into SENDTEAM (callid, teamid)
values (742, 410);
insert into SENDTEAM (callid, teamid)
values (756, 1652);
insert into SENDTEAM (callid, teamid)
values (680, 738);
insert into SENDTEAM (callid, teamid)
values (651, 476);
insert into SENDTEAM (callid, teamid)
values (284, 695);
insert into SENDTEAM (callid, teamid)
values (506, 332);
commit;
prompt 300 records committed...
insert into SENDTEAM (callid, teamid)
values (362, 1594);
insert into SENDTEAM (callid, teamid)
values (61, 1973);
insert into SENDTEAM (callid, teamid)
values (167, 535);
insert into SENDTEAM (callid, teamid)
values (172, 52);
insert into SENDTEAM (callid, teamid)
values (811, 1697);
insert into SENDTEAM (callid, teamid)
values (563, 1409);
insert into SENDTEAM (callid, teamid)
values (95, 1943);
insert into SENDTEAM (callid, teamid)
values (985, 1892);
insert into SENDTEAM (callid, teamid)
values (121, 1151);
insert into SENDTEAM (callid, teamid)
values (727, 1914);
insert into SENDTEAM (callid, teamid)
values (160, 102);
insert into SENDTEAM (callid, teamid)
values (217, 1392);
insert into SENDTEAM (callid, teamid)
values (229, 1767);
insert into SENDTEAM (callid, teamid)
values (244, 1302);
insert into SENDTEAM (callid, teamid)
values (801, 1489);
insert into SENDTEAM (callid, teamid)
values (718, 896);
insert into SENDTEAM (callid, teamid)
values (248, 872);
insert into SENDTEAM (callid, teamid)
values (206, 1063);
insert into SENDTEAM (callid, teamid)
values (411, 1306);
insert into SENDTEAM (callid, teamid)
values (269, 1118);
insert into SENDTEAM (callid, teamid)
values (208, 824);
insert into SENDTEAM (callid, teamid)
values (367, 1282);
insert into SENDTEAM (callid, teamid)
values (765, 1443);
insert into SENDTEAM (callid, teamid)
values (353, 878);
insert into SENDTEAM (callid, teamid)
values (195, 421);
insert into SENDTEAM (callid, teamid)
values (886, 698);
insert into SENDTEAM (callid, teamid)
values (861, 59);
insert into SENDTEAM (callid, teamid)
values (404, 1163);
insert into SENDTEAM (callid, teamid)
values (590, 843);
insert into SENDTEAM (callid, teamid)
values (137, 1095);
insert into SENDTEAM (callid, teamid)
values (255, 988);
insert into SENDTEAM (callid, teamid)
values (610, 1432);
insert into SENDTEAM (callid, teamid)
values (985, 925);
insert into SENDTEAM (callid, teamid)
values (990, 1665);
insert into SENDTEAM (callid, teamid)
values (896, 1780);
insert into SENDTEAM (callid, teamid)
values (601, 1763);
insert into SENDTEAM (callid, teamid)
values (322, 1821);
insert into SENDTEAM (callid, teamid)
values (126, 808);
insert into SENDTEAM (callid, teamid)
values (315, 588);
insert into SENDTEAM (callid, teamid)
values (651, 1489);
insert into SENDTEAM (callid, teamid)
values (954, 1877);
insert into SENDTEAM (callid, teamid)
values (2, 892);
insert into SENDTEAM (callid, teamid)
values (748, 244);
insert into SENDTEAM (callid, teamid)
values (931, 1700);
insert into SENDTEAM (callid, teamid)
values (75, 1701);
insert into SENDTEAM (callid, teamid)
values (808, 514);
insert into SENDTEAM (callid, teamid)
values (429, 595);
insert into SENDTEAM (callid, teamid)
values (753, 527);
insert into SENDTEAM (callid, teamid)
values (370, 258);
insert into SENDTEAM (callid, teamid)
values (636, 493);
insert into SENDTEAM (callid, teamid)
values (514, 571);
insert into SENDTEAM (callid, teamid)
values (445, 1070);
insert into SENDTEAM (callid, teamid)
values (751, 696);
insert into SENDTEAM (callid, teamid)
values (670, 1702);
insert into SENDTEAM (callid, teamid)
values (450, 468);
insert into SENDTEAM (callid, teamid)
values (33, 463);
insert into SENDTEAM (callid, teamid)
values (660, 509);
insert into SENDTEAM (callid, teamid)
values (166, 1925);
insert into SENDTEAM (callid, teamid)
values (208, 567);
insert into SENDTEAM (callid, teamid)
values (893, 375);
insert into SENDTEAM (callid, teamid)
values (681, 730);
insert into SENDTEAM (callid, teamid)
values (707, 957);
insert into SENDTEAM (callid, teamid)
values (224, 740);
insert into SENDTEAM (callid, teamid)
values (486, 1210);
insert into SENDTEAM (callid, teamid)
values (309, 1117);
insert into SENDTEAM (callid, teamid)
values (747, 1960);
insert into SENDTEAM (callid, teamid)
values (917, 318);
insert into SENDTEAM (callid, teamid)
values (978, 1051);
insert into SENDTEAM (callid, teamid)
values (795, 648);
insert into SENDTEAM (callid, teamid)
values (856, 1867);
insert into SENDTEAM (callid, teamid)
values (697, 145);
insert into SENDTEAM (callid, teamid)
values (814, 145);
insert into SENDTEAM (callid, teamid)
values (778, 767);
insert into SENDTEAM (callid, teamid)
values (45, 393);
insert into SENDTEAM (callid, teamid)
values (937, 1016);
insert into SENDTEAM (callid, teamid)
values (768, 1264);
insert into SENDTEAM (callid, teamid)
values (814, 737);
insert into SENDTEAM (callid, teamid)
values (360, 1262);
insert into SENDTEAM (callid, teamid)
values (919, 130);
insert into SENDTEAM (callid, teamid)
values (820, 845);
insert into SENDTEAM (callid, teamid)
values (797, 808);
insert into SENDTEAM (callid, teamid)
values (111, 190);
insert into SENDTEAM (callid, teamid)
values (35, 1698);
insert into SENDTEAM (callid, teamid)
values (841, 849);
insert into SENDTEAM (callid, teamid)
values (324, 494);
insert into SENDTEAM (callid, teamid)
values (772, 362);
insert into SENDTEAM (callid, teamid)
values (560, 810);
insert into SENDTEAM (callid, teamid)
values (91, 1282);
insert into SENDTEAM (callid, teamid)
values (519, 1212);
insert into SENDTEAM (callid, teamid)
values (269, 714);
insert into SENDTEAM (callid, teamid)
values (275, 91);
insert into SENDTEAM (callid, teamid)
values (21, 1844);
insert into SENDTEAM (callid, teamid)
values (818, 1657);
insert into SENDTEAM (callid, teamid)
values (751, 1852);
insert into SENDTEAM (callid, teamid)
values (997, 1059);
insert into SENDTEAM (callid, teamid)
values (311, 339);
insert into SENDTEAM (callid, teamid)
values (296, 1403);
insert into SENDTEAM (callid, teamid)
values (402, 267);
insert into SENDTEAM (callid, teamid)
values (49, 464);
insert into SENDTEAM (callid, teamid)
values (113, 1968);
commit;
prompt 400 records committed...
insert into SENDTEAM (callid, teamid)
values (170, 1983);
insert into SENDTEAM (callid, teamid)
values (535, 892);
insert into SENDTEAM (callid, teamid)
values (420, 1570);
insert into SENDTEAM (callid, teamid)
values (377, 1818);
insert into SENDTEAM (callid, teamid)
values (360, 921);
insert into SENDTEAM (callid, teamid)
values (889, 811);
insert into SENDTEAM (callid, teamid)
values (842, 957);
insert into SENDTEAM (callid, teamid)
values (407, 145);
insert into SENDTEAM (callid, teamid)
values (574, 1309);
insert into SENDTEAM (callid, teamid)
values (731, 1335);
insert into SENDTEAM (callid, teamid)
values (419, 93);
insert into SENDTEAM (callid, teamid)
values (75, 1144);
insert into SENDTEAM (callid, teamid)
values (697, 1975);
insert into SENDTEAM (callid, teamid)
values (425, 47);
insert into SENDTEAM (callid, teamid)
values (794, 734);
insert into SENDTEAM (callid, teamid)
values (66, 1922);
insert into SENDTEAM (callid, teamid)
values (217, 1922);
insert into SENDTEAM (callid, teamid)
values (150, 842);
insert into SENDTEAM (callid, teamid)
values (586, 1090);
insert into SENDTEAM (callid, teamid)
values (711, 341);
insert into SENDTEAM (callid, teamid)
values (750, 1948);
insert into SENDTEAM (callid, teamid)
values (75, 1882);
insert into SENDTEAM (callid, teamid)
values (204, 1976);
insert into SENDTEAM (callid, teamid)
values (114, 118);
insert into SENDTEAM (callid, teamid)
values (161, 1611);
insert into SENDTEAM (callid, teamid)
values (270, 1742);
insert into SENDTEAM (callid, teamid)
values (902, 1022);
insert into SENDTEAM (callid, teamid)
values (771, 109);
insert into SENDTEAM (callid, teamid)
values (558, 440);
insert into SENDTEAM (callid, teamid)
values (715, 1038);
insert into SENDTEAM (callid, teamid)
values (454, 854);
insert into SENDTEAM (callid, teamid)
values (45, 1009);
insert into SENDTEAM (callid, teamid)
values (7, 49);
insert into SENDTEAM (callid, teamid)
values (271, 1362);
insert into SENDTEAM (callid, teamid)
values (853, 1435);
insert into SENDTEAM (callid, teamid)
values (293, 1523);
insert into SENDTEAM (callid, teamid)
values (55, 769);
insert into SENDTEAM (callid, teamid)
values (110, 1946);
insert into SENDTEAM (callid, teamid)
values (873, 930);
insert into SENDTEAM (callid, teamid)
values (61, 479);
insert into SENDTEAM (callid, teamid)
values (476, 889);
insert into SENDTEAM (callid, teamid)
values (751, 709);
insert into SENDTEAM (callid, teamid)
values (287, 1384);
insert into SENDTEAM (callid, teamid)
values (538, 1305);
insert into SENDTEAM (callid, teamid)
values (779, 303);
insert into SENDTEAM (callid, teamid)
values (793, 967);
insert into SENDTEAM (callid, teamid)
values (890, 606);
insert into SENDTEAM (callid, teamid)
values (927, 59);
insert into SENDTEAM (callid, teamid)
values (638, 755);
insert into SENDTEAM (callid, teamid)
values (923, 1633);
insert into SENDTEAM (callid, teamid)
values (140, 551);
insert into SENDTEAM (callid, teamid)
values (777, 1274);
insert into SENDTEAM (callid, teamid)
values (156, 8);
insert into SENDTEAM (callid, teamid)
values (320, 1808);
insert into SENDTEAM (callid, teamid)
values (252, 1155);
insert into SENDTEAM (callid, teamid)
values (609, 886);
insert into SENDTEAM (callid, teamid)
values (584, 416);
insert into SENDTEAM (callid, teamid)
values (608, 1162);
insert into SENDTEAM (callid, teamid)
values (86, 1066);
insert into SENDTEAM (callid, teamid)
values (595, 657);
insert into SENDTEAM (callid, teamid)
values (858, 1301);
insert into SENDTEAM (callid, teamid)
values (75, 105);
insert into SENDTEAM (callid, teamid)
values (758, 914);
insert into SENDTEAM (callid, teamid)
values (717, 1541);
insert into SENDTEAM (callid, teamid)
values (52, 235);
insert into SENDTEAM (callid, teamid)
values (391, 1246);
insert into SENDTEAM (callid, teamid)
values (134, 1437);
insert into SENDTEAM (callid, teamid)
values (627, 755);
insert into SENDTEAM (callid, teamid)
values (379, 1557);
insert into SENDTEAM (callid, teamid)
values (889, 1721);
insert into SENDTEAM (callid, teamid)
values (453, 973);
insert into SENDTEAM (callid, teamid)
values (297, 387);
insert into SENDTEAM (callid, teamid)
values (342, 1720);
insert into SENDTEAM (callid, teamid)
values (829, 558);
insert into SENDTEAM (callid, teamid)
values (837, 874);
insert into SENDTEAM (callid, teamid)
values (670, 1926);
insert into SENDTEAM (callid, teamid)
values (171, 1444);
insert into SENDTEAM (callid, teamid)
values (286, 1187);
insert into SENDTEAM (callid, teamid)
values (88, 277);
insert into SENDTEAM (callid, teamid)
values (608, 1534);
insert into SENDTEAM (callid, teamid)
values (160, 137);
insert into SENDTEAM (callid, teamid)
values (217, 1532);
insert into SENDTEAM (callid, teamid)
values (649, 1029);
insert into SENDTEAM (callid, teamid)
values (618, 29);
insert into SENDTEAM (callid, teamid)
values (248, 1114);
insert into SENDTEAM (callid, teamid)
values (122, 1166);
insert into SENDTEAM (callid, teamid)
values (97, 218);
insert into SENDTEAM (callid, teamid)
values (630, 1946);
insert into SENDTEAM (callid, teamid)
values (837, 925);
insert into SENDTEAM (callid, teamid)
values (211, 1385);
insert into SENDTEAM (callid, teamid)
values (267, 1019);
insert into SENDTEAM (callid, teamid)
values (552, 130);
insert into SENDTEAM (callid, teamid)
values (167, 1370);
insert into SENDTEAM (callid, teamid)
values (275, 387);
insert into SENDTEAM (callid, teamid)
values (774, 1111);
insert into SENDTEAM (callid, teamid)
values (826, 207);
insert into SENDTEAM (callid, teamid)
values (947, 1594);
insert into SENDTEAM (callid, teamid)
values (290, 68);
insert into SENDTEAM (callid, teamid)
values (522, 245);
insert into SENDTEAM (callid, teamid)
values (809, 572);
commit;
prompt 500 records committed...
insert into SENDTEAM (callid, teamid)
values (348, 848);
insert into SENDTEAM (callid, teamid)
values (630, 1159);
insert into SENDTEAM (callid, teamid)
values (573, 1818);
insert into SENDTEAM (callid, teamid)
values (670, 355);
insert into SENDTEAM (callid, teamid)
values (5, 153);
insert into SENDTEAM (callid, teamid)
values (839, 1230);
insert into SENDTEAM (callid, teamid)
values (128, 272);
insert into SENDTEAM (callid, teamid)
values (877, 51);
insert into SENDTEAM (callid, teamid)
values (666, 91);
insert into SENDTEAM (callid, teamid)
values (837, 963);
insert into SENDTEAM (callid, teamid)
values (555, 828);
insert into SENDTEAM (callid, teamid)
values (860, 1519);
insert into SENDTEAM (callid, teamid)
values (273, 1296);
insert into SENDTEAM (callid, teamid)
values (194, 952);
insert into SENDTEAM (callid, teamid)
values (977, 1375);
insert into SENDTEAM (callid, teamid)
values (264, 1357);
insert into SENDTEAM (callid, teamid)
values (1000, 1250);
insert into SENDTEAM (callid, teamid)
values (279, 1384);
insert into SENDTEAM (callid, teamid)
values (127, 1833);
insert into SENDTEAM (callid, teamid)
values (84, 80);
insert into SENDTEAM (callid, teamid)
values (722, 935);
insert into SENDTEAM (callid, teamid)
values (242, 858);
insert into SENDTEAM (callid, teamid)
values (549, 66);
insert into SENDTEAM (callid, teamid)
values (409, 828);
insert into SENDTEAM (callid, teamid)
values (59, 1082);
insert into SENDTEAM (callid, teamid)
values (369, 846);
insert into SENDTEAM (callid, teamid)
values (640, 1302);
insert into SENDTEAM (callid, teamid)
values (509, 1846);
insert into SENDTEAM (callid, teamid)
values (492, 633);
insert into SENDTEAM (callid, teamid)
values (157, 312);
insert into SENDTEAM (callid, teamid)
values (522, 696);
insert into SENDTEAM (callid, teamid)
values (442, 1741);
insert into SENDTEAM (callid, teamid)
values (780, 480);
insert into SENDTEAM (callid, teamid)
values (850, 634);
insert into SENDTEAM (callid, teamid)
values (346, 649);
insert into SENDTEAM (callid, teamid)
values (455, 839);
insert into SENDTEAM (callid, teamid)
values (131, 1869);
insert into SENDTEAM (callid, teamid)
values (531, 667);
insert into SENDTEAM (callid, teamid)
values (422, 477);
insert into SENDTEAM (callid, teamid)
values (552, 355);
insert into SENDTEAM (callid, teamid)
values (459, 303);
insert into SENDTEAM (callid, teamid)
values (220, 346);
insert into SENDTEAM (callid, teamid)
values (42, 411);
insert into SENDTEAM (callid, teamid)
values (978, 194);
insert into SENDTEAM (callid, teamid)
values (274, 1068);
insert into SENDTEAM (callid, teamid)
values (195, 564);
insert into SENDTEAM (callid, teamid)
values (722, 1266);
insert into SENDTEAM (callid, teamid)
values (516, 1136);
insert into SENDTEAM (callid, teamid)
values (326, 743);
insert into SENDTEAM (callid, teamid)
values (17, 354);
insert into SENDTEAM (callid, teamid)
values (267, 1845);
insert into SENDTEAM (callid, teamid)
values (126, 1217);
insert into SENDTEAM (callid, teamid)
values (927, 80);
insert into SENDTEAM (callid, teamid)
values (748, 700);
insert into SENDTEAM (callid, teamid)
values (855, 1363);
insert into SENDTEAM (callid, teamid)
values (447, 737);
insert into SENDTEAM (callid, teamid)
values (10, 864);
insert into SENDTEAM (callid, teamid)
values (95, 1569);
insert into SENDTEAM (callid, teamid)
values (563, 1062);
insert into SENDTEAM (callid, teamid)
values (323, 177);
insert into SENDTEAM (callid, teamid)
values (581, 158);
insert into SENDTEAM (callid, teamid)
values (507, 899);
insert into SENDTEAM (callid, teamid)
values (431, 338);
insert into SENDTEAM (callid, teamid)
values (280, 1914);
insert into SENDTEAM (callid, teamid)
values (433, 1505);
insert into SENDTEAM (callid, teamid)
values (843, 1850);
insert into SENDTEAM (callid, teamid)
values (643, 1352);
insert into SENDTEAM (callid, teamid)
values (933, 608);
insert into SENDTEAM (callid, teamid)
values (421, 1675);
insert into SENDTEAM (callid, teamid)
values (872, 1999);
insert into SENDTEAM (callid, teamid)
values (664, 1157);
insert into SENDTEAM (callid, teamid)
values (664, 1428);
insert into SENDTEAM (callid, teamid)
values (594, 1987);
insert into SENDTEAM (callid, teamid)
values (485, 257);
insert into SENDTEAM (callid, teamid)
values (153, 1686);
insert into SENDTEAM (callid, teamid)
values (134, 1976);
insert into SENDTEAM (callid, teamid)
values (511, 1915);
insert into SENDTEAM (callid, teamid)
values (392, 144);
insert into SENDTEAM (callid, teamid)
values (737, 526);
insert into SENDTEAM (callid, teamid)
values (582, 433);
insert into SENDTEAM (callid, teamid)
values (834, 1335);
insert into SENDTEAM (callid, teamid)
values (442, 1681);
insert into SENDTEAM (callid, teamid)
values (325, 1335);
insert into SENDTEAM (callid, teamid)
values (120, 341);
insert into SENDTEAM (callid, teamid)
values (221, 1202);
insert into SENDTEAM (callid, teamid)
values (126, 142);
insert into SENDTEAM (callid, teamid)
values (157, 1719);
insert into SENDTEAM (callid, teamid)
values (477, 753);
insert into SENDTEAM (callid, teamid)
values (65, 1198);
insert into SENDTEAM (callid, teamid)
values (294, 1366);
insert into SENDTEAM (callid, teamid)
values (165, 1098);
insert into SENDTEAM (callid, teamid)
values (189, 604);
insert into SENDTEAM (callid, teamid)
values (723, 851);
insert into SENDTEAM (callid, teamid)
values (574, 1254);
insert into SENDTEAM (callid, teamid)
values (461, 1411);
insert into SENDTEAM (callid, teamid)
values (756, 1372);
insert into SENDTEAM (callid, teamid)
values (652, 1953);
insert into SENDTEAM (callid, teamid)
values (863, 1705);
insert into SENDTEAM (callid, teamid)
values (597, 1874);
insert into SENDTEAM (callid, teamid)
values (847, 228);
commit;
prompt 600 records committed...
insert into SENDTEAM (callid, teamid)
values (719, 1283);
insert into SENDTEAM (callid, teamid)
values (858, 1492);
insert into SENDTEAM (callid, teamid)
values (414, 173);
insert into SENDTEAM (callid, teamid)
values (949, 1615);
insert into SENDTEAM (callid, teamid)
values (938, 409);
insert into SENDTEAM (callid, teamid)
values (57, 660);
insert into SENDTEAM (callid, teamid)
values (92, 1731);
insert into SENDTEAM (callid, teamid)
values (136, 936);
insert into SENDTEAM (callid, teamid)
values (618, 665);
insert into SENDTEAM (callid, teamid)
values (129, 587);
insert into SENDTEAM (callid, teamid)
values (212, 1746);
insert into SENDTEAM (callid, teamid)
values (714, 1745);
insert into SENDTEAM (callid, teamid)
values (89, 1373);
insert into SENDTEAM (callid, teamid)
values (596, 1244);
insert into SENDTEAM (callid, teamid)
values (804, 1041);
insert into SENDTEAM (callid, teamid)
values (824, 1002);
insert into SENDTEAM (callid, teamid)
values (206, 155);
insert into SENDTEAM (callid, teamid)
values (251, 1519);
insert into SENDTEAM (callid, teamid)
values (619, 689);
insert into SENDTEAM (callid, teamid)
values (608, 1321);
insert into SENDTEAM (callid, teamid)
values (226, 991);
insert into SENDTEAM (callid, teamid)
values (917, 1936);
insert into SENDTEAM (callid, teamid)
values (99, 99);
insert into SENDTEAM (callid, teamid)
values (220, 38);
insert into SENDTEAM (callid, teamid)
values (362, 119);
insert into SENDTEAM (callid, teamid)
values (23, 360);
insert into SENDTEAM (callid, teamid)
values (801, 1936);
insert into SENDTEAM (callid, teamid)
values (860, 957);
insert into SENDTEAM (callid, teamid)
values (103, 1419);
insert into SENDTEAM (callid, teamid)
values (665, 1312);
insert into SENDTEAM (callid, teamid)
values (60, 853);
insert into SENDTEAM (callid, teamid)
values (915, 1749);
insert into SENDTEAM (callid, teamid)
values (764, 248);
insert into SENDTEAM (callid, teamid)
values (190, 845);
insert into SENDTEAM (callid, teamid)
values (379, 1570);
insert into SENDTEAM (callid, teamid)
values (551, 634);
insert into SENDTEAM (callid, teamid)
values (497, 1180);
insert into SENDTEAM (callid, teamid)
values (593, 822);
insert into SENDTEAM (callid, teamid)
values (265, 854);
insert into SENDTEAM (callid, teamid)
values (313, 696);
insert into SENDTEAM (callid, teamid)
values (5, 369);
insert into SENDTEAM (callid, teamid)
values (231, 1793);
insert into SENDTEAM (callid, teamid)
values (107, 546);
insert into SENDTEAM (callid, teamid)
values (616, 1615);
insert into SENDTEAM (callid, teamid)
values (328, 669);
insert into SENDTEAM (callid, teamid)
values (442, 1251);
insert into SENDTEAM (callid, teamid)
values (466, 1761);
insert into SENDTEAM (callid, teamid)
values (325, 339);
insert into SENDTEAM (callid, teamid)
values (567, 87);
insert into SENDTEAM (callid, teamid)
values (256, 1023);
insert into SENDTEAM (callid, teamid)
values (135, 193);
insert into SENDTEAM (callid, teamid)
values (820, 1090);
insert into SENDTEAM (callid, teamid)
values (624, 195);
insert into SENDTEAM (callid, teamid)
values (174, 1763);
insert into SENDTEAM (callid, teamid)
values (291, 56);
insert into SENDTEAM (callid, teamid)
values (209, 1885);
insert into SENDTEAM (callid, teamid)
values (856, 703);
insert into SENDTEAM (callid, teamid)
values (276, 766);
insert into SENDTEAM (callid, teamid)
values (869, 1871);
insert into SENDTEAM (callid, teamid)
values (91, 844);
insert into SENDTEAM (callid, teamid)
values (395, 1374);
insert into SENDTEAM (callid, teamid)
values (849, 223);
insert into SENDTEAM (callid, teamid)
values (786, 1204);
insert into SENDTEAM (callid, teamid)
values (419, 1957);
insert into SENDTEAM (callid, teamid)
values (339, 433);
insert into SENDTEAM (callid, teamid)
values (532, 1305);
insert into SENDTEAM (callid, teamid)
values (869, 1385);
insert into SENDTEAM (callid, teamid)
values (337, 506);
insert into SENDTEAM (callid, teamid)
values (322, 105);
insert into SENDTEAM (callid, teamid)
values (630, 688);
insert into SENDTEAM (callid, teamid)
values (357, 889);
insert into SENDTEAM (callid, teamid)
values (491, 1130);
insert into SENDTEAM (callid, teamid)
values (52, 86);
insert into SENDTEAM (callid, teamid)
values (801, 1838);
insert into SENDTEAM (callid, teamid)
values (952, 1136);
insert into SENDTEAM (callid, teamid)
values (389, 1646);
insert into SENDTEAM (callid, teamid)
values (64, 1953);
insert into SENDTEAM (callid, teamid)
values (907, 1679);
insert into SENDTEAM (callid, teamid)
values (386, 1468);
insert into SENDTEAM (callid, teamid)
values (919, 104);
insert into SENDTEAM (callid, teamid)
values (11, 1512);
insert into SENDTEAM (callid, teamid)
values (890, 283);
insert into SENDTEAM (callid, teamid)
values (272, 682);
insert into SENDTEAM (callid, teamid)
values (323, 589);
insert into SENDTEAM (callid, teamid)
values (193, 1673);
insert into SENDTEAM (callid, teamid)
values (794, 653);
insert into SENDTEAM (callid, teamid)
values (294, 1589);
insert into SENDTEAM (callid, teamid)
values (593, 167);
insert into SENDTEAM (callid, teamid)
values (531, 760);
insert into SENDTEAM (callid, teamid)
values (200, 18);
insert into SENDTEAM (callid, teamid)
values (69, 1806);
insert into SENDTEAM (callid, teamid)
values (392, 1716);
insert into SENDTEAM (callid, teamid)
values (24, 1595);
insert into SENDTEAM (callid, teamid)
values (746, 1885);
insert into SENDTEAM (callid, teamid)
values (786, 750);
insert into SENDTEAM (callid, teamid)
values (907, 627);
insert into SENDTEAM (callid, teamid)
values (479, 176);
insert into SENDTEAM (callid, teamid)
values (609, 1082);
insert into SENDTEAM (callid, teamid)
values (103, 1405);
insert into SENDTEAM (callid, teamid)
values (345, 848);
commit;
prompt 700 records committed...
insert into SENDTEAM (callid, teamid)
values (709, 1119);
insert into SENDTEAM (callid, teamid)
values (139, 1594);
insert into SENDTEAM (callid, teamid)
values (851, 1849);
insert into SENDTEAM (callid, teamid)
values (552, 828);
insert into SENDTEAM (callid, teamid)
values (780, 395);
insert into SENDTEAM (callid, teamid)
values (87, 142);
insert into SENDTEAM (callid, teamid)
values (618, 886);
insert into SENDTEAM (callid, teamid)
values (334, 1897);
insert into SENDTEAM (callid, teamid)
values (905, 583);
insert into SENDTEAM (callid, teamid)
values (435, 725);
insert into SENDTEAM (callid, teamid)
values (151, 1154);
insert into SENDTEAM (callid, teamid)
values (43, 1545);
insert into SENDTEAM (callid, teamid)
values (395, 929);
insert into SENDTEAM (callid, teamid)
values (787, 905);
insert into SENDTEAM (callid, teamid)
values (145, 548);
insert into SENDTEAM (callid, teamid)
values (641, 621);
insert into SENDTEAM (callid, teamid)
values (609, 324);
insert into SENDTEAM (callid, teamid)
values (296, 1900);
insert into SENDTEAM (callid, teamid)
values (247, 933);
insert into SENDTEAM (callid, teamid)
values (675, 1128);
insert into SENDTEAM (callid, teamid)
values (995, 263);
insert into SENDTEAM (callid, teamid)
values (891, 500);
insert into SENDTEAM (callid, teamid)
values (713, 1711);
insert into SENDTEAM (callid, teamid)
values (190, 1971);
insert into SENDTEAM (callid, teamid)
values (843, 793);
insert into SENDTEAM (callid, teamid)
values (405, 640);
insert into SENDTEAM (callid, teamid)
values (17, 1118);
insert into SENDTEAM (callid, teamid)
values (843, 1341);
insert into SENDTEAM (callid, teamid)
values (293, 1070);
insert into SENDTEAM (callid, teamid)
values (295, 958);
insert into SENDTEAM (callid, teamid)
values (793, 1957);
insert into SENDTEAM (callid, teamid)
values (449, 216);
insert into SENDTEAM (callid, teamid)
values (558, 522);
insert into SENDTEAM (callid, teamid)
values (714, 376);
insert into SENDTEAM (callid, teamid)
values (561, 1901);
insert into SENDTEAM (callid, teamid)
values (242, 1687);
insert into SENDTEAM (callid, teamid)
values (455, 1904);
insert into SENDTEAM (callid, teamid)
values (1000, 172);
insert into SENDTEAM (callid, teamid)
values (102, 268);
insert into SENDTEAM (callid, teamid)
values (977, 817);
insert into SENDTEAM (callid, teamid)
values (12, 463);
insert into SENDTEAM (callid, teamid)
values (983, 110);
insert into SENDTEAM (callid, teamid)
values (951, 1004);
insert into SENDTEAM (callid, teamid)
values (178, 825);
insert into SENDTEAM (callid, teamid)
values (484, 1414);
insert into SENDTEAM (callid, teamid)
values (230, 1066);
insert into SENDTEAM (callid, teamid)
values (74, 1854);
insert into SENDTEAM (callid, teamid)
values (364, 1513);
insert into SENDTEAM (callid, teamid)
values (693, 1251);
insert into SENDTEAM (callid, teamid)
values (379, 1719);
insert into SENDTEAM (callid, teamid)
values (461, 276);
insert into SENDTEAM (callid, teamid)
values (764, 769);
insert into SENDTEAM (callid, teamid)
values (741, 529);
insert into SENDTEAM (callid, teamid)
values (133, 1635);
insert into SENDTEAM (callid, teamid)
values (724, 1582);
insert into SENDTEAM (callid, teamid)
values (643, 1904);
insert into SENDTEAM (callid, teamid)
values (300, 92);
insert into SENDTEAM (callid, teamid)
values (84, 874);
insert into SENDTEAM (callid, teamid)
values (432, 1473);
insert into SENDTEAM (callid, teamid)
values (203, 1686);
insert into SENDTEAM (callid, teamid)
values (886, 43);
insert into SENDTEAM (callid, teamid)
values (143, 716);
insert into SENDTEAM (callid, teamid)
values (741, 1439);
insert into SENDTEAM (callid, teamid)
values (906, 601);
insert into SENDTEAM (callid, teamid)
values (744, 529);
insert into SENDTEAM (callid, teamid)
values (778, 771);
insert into SENDTEAM (callid, teamid)
values (232, 754);
insert into SENDTEAM (callid, teamid)
values (380, 914);
insert into SENDTEAM (callid, teamid)
values (914, 1025);
insert into SENDTEAM (callid, teamid)
values (129, 1768);
insert into SENDTEAM (callid, teamid)
values (376, 1420);
insert into SENDTEAM (callid, teamid)
values (727, 392);
insert into SENDTEAM (callid, teamid)
values (144, 1921);
insert into SENDTEAM (callid, teamid)
values (975, 1385);
insert into SENDTEAM (callid, teamid)
values (746, 1439);
insert into SENDTEAM (callid, teamid)
values (294, 1571);
insert into SENDTEAM (callid, teamid)
values (120, 348);
insert into SENDTEAM (callid, teamid)
values (731, 1900);
insert into SENDTEAM (callid, teamid)
values (301, 393);
insert into SENDTEAM (callid, teamid)
values (597, 867);
insert into SENDTEAM (callid, teamid)
values (91, 1254);
insert into SENDTEAM (callid, teamid)
values (18, 416);
insert into SENDTEAM (callid, teamid)
values (809, 873);
insert into SENDTEAM (callid, teamid)
values (356, 855);
insert into SENDTEAM (callid, teamid)
values (259, 704);
insert into SENDTEAM (callid, teamid)
values (715, 441);
insert into SENDTEAM (callid, teamid)
values (606, 17);
insert into SENDTEAM (callid, teamid)
values (619, 32);
insert into SENDTEAM (callid, teamid)
values (824, 1154);
insert into SENDTEAM (callid, teamid)
values (217, 1202);
commit;
prompt 790 records loaded
prompt Enabling foreign key constraints for DISPATCHER...
alter table DISPATCHER enable constraint SYS_C0015811;
prompt Enabling foreign key constraints for CALLHELP...
alter table CALLHELP enable constraint SYS_C0015724;
prompt Enabling foreign key constraints for DONOR...
alter table DONOR enable constraint SYS_C0015764;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C0015770;
prompt Enabling foreign key constraints for STOREKEEPER...
alter table STOREKEEPER enable constraint SYS_C0015791;
alter table STOREKEEPER enable constraint SYS_C0015792;
prompt Enabling foreign key constraints for ORDERING...
alter table ORDERING enable constraint SYS_C0015799;
prompt Enabling foreign key constraints for ITEM...
alter table ITEM enable constraint FK_ITEM;
alter table ITEM enable constraint FK_ITEM2;
alter table ITEM enable constraint FK_ITEM3;
prompt Enabling foreign key constraints for DONATEITEM...
alter table DONATEITEM enable constraint SYS_C0015816;
alter table DONATEITEM enable constraint SYS_C0015817;
prompt Enabling foreign key constraints for DRIVER...
alter table DRIVER enable constraint SYS_C0015812;
prompt Enabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC enable constraint SYS_C0015813;
prompt Enabling foreign key constraints for TEAM...
alter table TEAM enable constraint SYS_C0015736;
alter table TEAM enable constraint SYS_C0015810;
prompt Enabling foreign key constraints for PARTICIPANTPARAMEDIC...
alter table PARTICIPANTPARAMEDIC enable constraint SYS_C0015741;
alter table PARTICIPANTPARAMEDIC enable constraint SYS_C0015742;
prompt Enabling foreign key constraints for VOLUNTEER...
alter table VOLUNTEER enable constraint SYS_C0015814;
prompt Enabling foreign key constraints for PARTICIPANTVOLUNTEER...
alter table PARTICIPANTVOLUNTEER enable constraint SYS_C0015749;
alter table PARTICIPANTVOLUNTEER enable constraint SYS_C0015750;
prompt Enabling foreign key constraints for SENDTEAM...
alter table SENDTEAM enable constraint SYS_C0015754;
alter table SENDTEAM enable constraint SYS_C0015755;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for DISPATCHER...
alter table DISPATCHER enable all triggers;
prompt Enabling triggers for CALLHELP...
alter table CALLHELP enable all triggers;
prompt Enabling triggers for DONOR...
alter table DONOR enable all triggers;
prompt Enabling triggers for DONATION...
alter table DONATION enable all triggers;
prompt Enabling triggers for ITEMTYPE...
alter table ITEMTYPE enable all triggers;
prompt Enabling triggers for WAREHOUSE...
alter table WAREHOUSE enable all triggers;
prompt Enabling triggers for STOREKEEPER...
alter table STOREKEEPER enable all triggers;
prompt Enabling triggers for ORDERING...
alter table ORDERING enable all triggers;
prompt Enabling triggers for ITEM...
alter table ITEM enable all triggers;
prompt Enabling triggers for DONATEITEM...
alter table DONATEITEM enable all triggers;
prompt Enabling triggers for DRIVER...
alter table DRIVER enable all triggers;
prompt Enabling triggers for PARAMEDIC...
alter table PARAMEDIC enable all triggers;
prompt Enabling triggers for TEAM...
alter table TEAM enable all triggers;
prompt Enabling triggers for PARTICIPANTPARAMEDIC...
alter table PARTICIPANTPARAMEDIC enable all triggers;
prompt Enabling triggers for VOLUNTEER...
alter table VOLUNTEER enable all triggers;
prompt Enabling triggers for PARTICIPANTVOLUNTEER...
alter table PARTICIPANTVOLUNTEER enable all triggers;
prompt Enabling triggers for SENDTEAM...
alter table SENDTEAM enable all triggers;

set feedback on
set define on
prompt Done
