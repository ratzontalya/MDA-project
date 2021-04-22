prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by User on Monday, April 5, 2021
set feedback off
set define off

prompt Creating AMBULANCE...
create table AMBULANCE
(
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
alter table AMBULANCE
  add primary key (AMBULANCEID)
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

prompt Creating PERSON...
create table PERSON
(
  personid  INTEGER not null,
  firstname VARCHAR2(100) not null,
  lastname  VARCHAR2(100) not null,
  phone     VARCHAR2(100) not null,
  mail      VARCHAR2(100) not null,
  address   VARCHAR2(100) not null,
  birthdate DATE not null
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
  references AMBULANCE (AMBULANCEID) on delete cascade;

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

prompt Disabling triggers for AMBULANCE...
alter table AMBULANCE disable all triggers;
prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for DISPATCHER...
alter table DISPATCHER disable all triggers;
prompt Disabling triggers for CALLHELP...
alter table CALLHELP disable all triggers;
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
alter table DISPATCHER disable constraint SYS_C0011737;
prompt Disabling foreign key constraints for CALLHELP...
alter table CALLHELP disable constraint SYS_C0011742;
prompt Disabling foreign key constraints for DRIVER...
alter table DRIVER disable constraint SYS_C0011730;
prompt Disabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC disable constraint SYS_C0011734;
prompt Disabling foreign key constraints for TEAM...
alter table TEAM disable constraint SYS_C0011749;
alter table TEAM disable constraint SYS_C0011750;
prompt Disabling foreign key constraints for PARTICIPANTPARAMEDIC...
alter table PARTICIPANTPARAMEDIC disable constraint SYS_C0011764;
alter table PARTICIPANTPARAMEDIC disable constraint SYS_C0011765;
prompt Disabling foreign key constraints for VOLUNTEER...
alter table VOLUNTEER disable constraint SYS_C0011727;
prompt Disabling foreign key constraints for PARTICIPANTVOLUNTEER...
alter table PARTICIPANTVOLUNTEER disable constraint SYS_C0011759;
alter table PARTICIPANTVOLUNTEER disable constraint SYS_C0011760;
prompt Disabling foreign key constraints for SENDTEAM...
alter table SENDTEAM disable constraint SYS_C0011754;
alter table SENDTEAM disable constraint SYS_C0011755;
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
prompt Deleting CALLHELP...
delete from CALLHELP;
commit;
prompt Deleting DISPATCHER...
delete from DISPATCHER;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Deleting AMBULANCE...
delete from AMBULANCE;
commit;
prompt Loading AMBULANCE...
insert into AMBULANCE (ambulanceid)
values (1);
insert into AMBULANCE (ambulanceid)
values (2);
insert into AMBULANCE (ambulanceid)
values (3);
insert into AMBULANCE (ambulanceid)
values (4);
insert into AMBULANCE (ambulanceid)
values (5);
insert into AMBULANCE (ambulanceid)
values (6);
insert into AMBULANCE (ambulanceid)
values (7);
insert into AMBULANCE (ambulanceid)
values (8);
insert into AMBULANCE (ambulanceid)
values (9);
insert into AMBULANCE (ambulanceid)
values (10);
insert into AMBULANCE (ambulanceid)
values (11);
insert into AMBULANCE (ambulanceid)
values (12);
insert into AMBULANCE (ambulanceid)
values (13);
insert into AMBULANCE (ambulanceid)
values (14);
insert into AMBULANCE (ambulanceid)
values (15);
insert into AMBULANCE (ambulanceid)
values (16);
insert into AMBULANCE (ambulanceid)
values (17);
insert into AMBULANCE (ambulanceid)
values (18);
insert into AMBULANCE (ambulanceid)
values (19);
insert into AMBULANCE (ambulanceid)
values (20);
insert into AMBULANCE (ambulanceid)
values (21);
insert into AMBULANCE (ambulanceid)
values (22);
insert into AMBULANCE (ambulanceid)
values (23);
insert into AMBULANCE (ambulanceid)
values (24);
insert into AMBULANCE (ambulanceid)
values (25);
insert into AMBULANCE (ambulanceid)
values (26);
insert into AMBULANCE (ambulanceid)
values (27);
insert into AMBULANCE (ambulanceid)
values (28);
insert into AMBULANCE (ambulanceid)
values (29);
insert into AMBULANCE (ambulanceid)
values (30);
insert into AMBULANCE (ambulanceid)
values (31);
insert into AMBULANCE (ambulanceid)
values (32);
insert into AMBULANCE (ambulanceid)
values (33);
insert into AMBULANCE (ambulanceid)
values (34);
insert into AMBULANCE (ambulanceid)
values (35);
insert into AMBULANCE (ambulanceid)
values (36);
insert into AMBULANCE (ambulanceid)
values (37);
insert into AMBULANCE (ambulanceid)
values (38);
insert into AMBULANCE (ambulanceid)
values (39);
insert into AMBULANCE (ambulanceid)
values (40);
insert into AMBULANCE (ambulanceid)
values (41);
insert into AMBULANCE (ambulanceid)
values (42);
insert into AMBULANCE (ambulanceid)
values (43);
insert into AMBULANCE (ambulanceid)
values (44);
insert into AMBULANCE (ambulanceid)
values (45);
insert into AMBULANCE (ambulanceid)
values (46);
insert into AMBULANCE (ambulanceid)
values (47);
insert into AMBULANCE (ambulanceid)
values (48);
insert into AMBULANCE (ambulanceid)
values (49);
insert into AMBULANCE (ambulanceid)
values (50);
insert into AMBULANCE (ambulanceid)
values (51);
insert into AMBULANCE (ambulanceid)
values (52);
insert into AMBULANCE (ambulanceid)
values (53);
insert into AMBULANCE (ambulanceid)
values (54);
insert into AMBULANCE (ambulanceid)
values (55);
insert into AMBULANCE (ambulanceid)
values (56);
insert into AMBULANCE (ambulanceid)
values (57);
insert into AMBULANCE (ambulanceid)
values (58);
insert into AMBULANCE (ambulanceid)
values (59);
insert into AMBULANCE (ambulanceid)
values (60);
insert into AMBULANCE (ambulanceid)
values (61);
insert into AMBULANCE (ambulanceid)
values (62);
insert into AMBULANCE (ambulanceid)
values (63);
insert into AMBULANCE (ambulanceid)
values (64);
insert into AMBULANCE (ambulanceid)
values (65);
insert into AMBULANCE (ambulanceid)
values (66);
insert into AMBULANCE (ambulanceid)
values (67);
insert into AMBULANCE (ambulanceid)
values (68);
insert into AMBULANCE (ambulanceid)
values (69);
insert into AMBULANCE (ambulanceid)
values (70);
insert into AMBULANCE (ambulanceid)
values (71);
insert into AMBULANCE (ambulanceid)
values (72);
insert into AMBULANCE (ambulanceid)
values (73);
insert into AMBULANCE (ambulanceid)
values (74);
insert into AMBULANCE (ambulanceid)
values (75);
insert into AMBULANCE (ambulanceid)
values (76);
insert into AMBULANCE (ambulanceid)
values (77);
insert into AMBULANCE (ambulanceid)
values (78);
insert into AMBULANCE (ambulanceid)
values (79);
insert into AMBULANCE (ambulanceid)
values (80);
insert into AMBULANCE (ambulanceid)
values (81);
insert into AMBULANCE (ambulanceid)
values (82);
insert into AMBULANCE (ambulanceid)
values (83);
insert into AMBULANCE (ambulanceid)
values (84);
insert into AMBULANCE (ambulanceid)
values (85);
insert into AMBULANCE (ambulanceid)
values (86);
insert into AMBULANCE (ambulanceid)
values (87);
insert into AMBULANCE (ambulanceid)
values (88);
insert into AMBULANCE (ambulanceid)
values (89);
insert into AMBULANCE (ambulanceid)
values (90);
insert into AMBULANCE (ambulanceid)
values (91);
insert into AMBULANCE (ambulanceid)
values (92);
insert into AMBULANCE (ambulanceid)
values (93);
insert into AMBULANCE (ambulanceid)
values (94);
insert into AMBULANCE (ambulanceid)
values (95);
insert into AMBULANCE (ambulanceid)
values (96);
insert into AMBULANCE (ambulanceid)
values (97);
insert into AMBULANCE (ambulanceid)
values (98);
insert into AMBULANCE (ambulanceid)
values (99);
insert into AMBULANCE (ambulanceid)
values (100);
commit;
prompt 100 records loaded
prompt Loading PERSON...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (245675893, 'Naomi', 'Leoni', '0582504080', 'naomi.leoni@bmm.com', '36 Amherst DriveMayf', to_date('11-05-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (568594044, 'Jon', 'Fichtner', '0597829934', 'jon@coldstonecreamer', '25 Diddley StreetBel', to_date('10-12-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (418151081, 'Red', 'Tillis', '0528980536', 'red.tillis@digitalmo', '542 Omar BlvdMaccles', to_date('13-04-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (328925588, 'Mandy', 'Kirshner', '0568709637', 'mandy.kirshner@techb', '69 Burlington Street', to_date('28-07-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (442065013, 'Randall', 'Irons', '0597225096', 'randall@bioreliance.', '29 Lunch BlvdHunting', to_date('20-11-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (963532017, 'Norm', 'Byrd', '0568152725', 'norm.b@powerlight.co', '44 LenexaGaza', to_date('12-05-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (809037820, 'Bret', 'Campbell', '0572005320', 'bret.campbell@mai.dk', '40 Kline DriveHiller', to_date('27-12-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (103617623, 'Joanna', 'Uggams', '0521995386', 'joanna.uggams@als.it', '68 Saucedo RoadRoma', to_date('29-05-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (338261690, 'Jeffery', 'Carr', '0524390028', 'jeffery@colgatepalmo', '28 Taye StreetMelbou', to_date('25-03-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (971790932, 'Lorraine', 'Craddock', '0537202489', 'l.craddock@ipsadviso', '63rd StreetBelmont', to_date('18-05-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (738448453, 'Nile', 'Woodward', '0547146533', 'nile.woodward@lloydg', '729 Karlstad RoadHac', to_date('31-08-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (502131885, 'Chely', 'Dalton', '0529386833', 'c.dalton@dillards.co', '9 Suwon-city BlvdNew', to_date('25-11-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (645615690, 'Lara', 'Rivers', '0556099222', 'lara.rivers@cooktek.', '54 Larnelle DrivePai', to_date('22-10-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (602857670, 'Giancarlo', 'Collins', '0597368709', 'giancarlo.collins@vi', '30 Platt AveWaco', to_date('24-08-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (648807300, 'Tzi', 'Warburton', '0537300343', 'tzi.warburton@vesta.', '59 Holmes DriveGliwi', to_date('01-02-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (178457229, 'Wes', 'Magnuson', '0553986603', 'wes@solutionbuilders', '46 Horton DriveMaser', to_date('11-03-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (743929062, 'Rupert', 'Dawson', '0567290157', 'rupert.dawson@americ', '378 Paraju RoadPompe', to_date('22-12-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (388211214, 'Nickel', 'Rains', '0590725237', 'nickel@diamondgroup.', '92nd StreetAmericana', to_date('09-07-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (237257128, 'Wallace', 'Vai', '0588721097', 'wallace@neogen.com', '13 Jena StreetStream', to_date('15-02-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (671249248, 'Alec', 'Pleasence', '0549894653', 'alec@hfn.it', '197 Lynne DriveTrevi', to_date('27-04-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (352391765, 'Terrence', 'Astin', '0552633841', 'terrence@trx.ca', '97 Drive AveBoucherv', to_date('02-02-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (985985506, 'Trace', 'Harper', '0570964982', 'traceh@supplycorecom', '49 Osaka DriveBurlin', to_date('27-04-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (974874812, 'Lari', 'Watley', '0582507395', 'lari.w@alternativete', '35 Briscoe BlvdCrete', to_date('26-08-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (671157768, 'Rosanna', 'Jane', '0543034608', 'rjane@coridiantechno', '14 Charleston DriveL', to_date('15-08-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (966618858, 'Wally', 'McNarland', '0599825457', 'wallym@conquestsyste', '951 Olivette RoadMec', to_date('15-04-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (430928405, 'Molly', 'Marley', '0557491489', 'molly.m@credopetrole', '692 Ford DriveElche', to_date('20-11-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (717450469, 'Maxine', 'Place', '0536088541', 'maxine.place@dell.uk', '84 Ewan StreetTadley', to_date('12-11-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (191836287, 'Albertina', 'Bragg', '0523013440', 'albertina@stonetechp', '16 Tucci RoadTokyo', to_date('06-06-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (968039045, 'Caroline', 'Jamal', '0569345842', 'caroline.jamal@doral', '32nd StreetBedford', to_date('24-09-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (118221793, 'Bernie', 'Chandler', '0525358433', 'bernie.chandler@iss.', '33 Keaton StreetInge', to_date('30-12-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (811724593, 'Robin', 'Everett', '0563401458', 'r.everett@doctorsass', '872 Jude RoadGerstho', to_date('04-11-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (703777997, 'Mac', 'Quatro', '0592389386', 'mquatro@drinkmorewat', '16 Flanagan RoadLeip', to_date('02-11-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (475197916, 'Vanessa', 'Shorter', '0583586372', 'vanessa.shorter@bat.', '52 Bellevue RoadLumm', to_date('26-10-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (843530209, 'Latin', 'Minogue', '0575748455', 'latin.minogue@abatix', '64 Boyle DriveN. ft.', to_date('31-07-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (386411368, 'Corey', 'Kingsley', '0570893692', 'corey@hcoa.dk', '58 Perrineau StreetN', to_date('06-05-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (328064068, 'Earl', 'Plummer', '0529697270', 'earl.plummer@spas.co', '76 Hagerty DriveItha', to_date('15-08-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (795860414, 'Moe', 'Stevenson', '0541893983', 'moe.stevenson@unicru', '45 Sainte-foy Street', to_date('26-11-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (938031275, 'Lily', 'Cohn', '0586550592', 'lily.cohn@onesourcep', '861 Daniel StreetIrv', to_date('22-03-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (320357348, 'Arnold', 'De Niro', '0579982314', 'arnold.deniro@afs.dk', '92 Bryson DriveBillu', to_date('25-01-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (749551047, 'Cole', 'DiBiasio', '0595152815', 'coled@gna.ch', '74 Kimball StreetChu', to_date('24-03-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (841009827, 'Wayne', 'Downey', '0572781093', 'wayne.downey@wendysi', '36 Viterelli AveGaza', to_date('29-12-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (989796718, 'Irene', 'Holiday', '0587382657', 'irene.holiday@cima.j', '6 SaulMito', to_date('31-08-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (973541440, 'Pierce', 'Numan', '0545548796', 'pierce.numan@kmart.f', '63 Evett BlvdKuopio', to_date('18-04-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (647078378, 'Garry', 'Carnes', '0551930526', 'garry@americanland.c', '39 Jeter RoadThalwil', to_date('25-06-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (347639660, 'Rory', 'Heron', '0598903847', 'r.heron@kelmooreinve', '35 Witherspoon RoadD', to_date('29-06-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (500576999, 'Kay', 'Zappacosta', '0542855461', 'kzappacosta@gdatechn', '332 Baldwin RoadOulu', to_date('05-06-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (660284942, 'Derek', 'Van Helden', '0574485881', 'd.vanhelden@wyeth.co', '17 Loreena AveHartfo', to_date('16-09-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (790968789, 'Jeffrey', 'Winter', '0553324666', 'jeffrey.w@younginnov', '66 Yorn RoadOr-yehud', to_date('19-04-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (107457083, 'Ving', 'Broza', '0532193011', 'ving@hewlettpackard.', '43rd StreetRoyston', to_date('27-07-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (259790830, 'Don', 'Gallant', '0558813432', 'don.gallant@cascadeb', '84 Vondie RoadChirig', to_date('16-10-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (765898451, 'Morris', 'Neill', '0557454202', 'morris.neill@portosa', '54 Almaty AveFleet', to_date('01-12-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (452532294, 'Matt', 'McDormand', '0554705420', 'matt.mcdormand@telwa', '52nd StreetHerdecke', to_date('19-10-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (180924389, 'Jude', 'Pressly', '0599113043', 'jude.pressly@smartdr', '63 Arjona AveRoma', to_date('27-02-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (158008357, 'Sonny', 'Warren', '0564852090', 'sonny.warren@ssi.fr', '12 Dylan DriveGennev', to_date('29-09-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (802477498, 'Alex', 'Carrack', '0557193493', 'alex.carrack@pinnacl', '57 BetteEschborn', to_date('20-12-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (421059732, 'Alannah', 'Easton', '0545918354', 'alannah.easton@harri', '49 Mathis StreetPomp', to_date('29-12-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (583494240, 'Domingo', 'Rubinek', '0592072205', 'domingo.rubinek@atxf', '88 Köln RoadOklahoma', to_date('28-02-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (139811004, 'Suzanne', 'Ponty', '0521776735', 'sponty@hencie.com', '22 ImbrugliaRichards', to_date('07-07-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (619496468, 'Ike', 'O''Sullivan', '0559125234', 'ikeo@contract.pl', '497 Grapevine DriveW', to_date('29-10-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (151656920, 'Lionel', 'Rain', '0570456763', 'lionel.rain@career.f', '53rd StreetKerava', to_date('21-03-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (439204233, 'Gino', 'Ledger', '0562864091', 'gledger@apexsystems.', '99 Garofalo StreetSe', to_date('01-08-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (150507078, 'LeVar', 'Krumholtz', '0572012396', 'levar.krumholtz@ssi.', '31st StreetMapo-gu', to_date('25-09-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (687248103, 'Vondie', 'Huston', '0591668934', 'v.huston@qls.com', '18 Kitty RoadDeerfie', to_date('28-08-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (524232756, 'Jeffery', 'Neeson', '0566783246', 'jeffery.neeson@power', '21 Dennis StreetBlac', to_date('19-04-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (729472826, 'Jessica', 'Huston', '0565085285', 'jessica.huston@berks', '76 Camp DriveIngelhe', to_date('06-08-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (533216515, 'Julio', 'Wilkinson', '0564298773', 'julio.wilkinson@conq', '42 Pigott-Smith Stre', to_date('14-10-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (766713817, 'Harvey', 'Burke', '0522595379', 'harvey.burke@bayer.c', '44 Hynde RoadLake Fo', to_date('18-02-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (306104563, 'Mekhi', 'McDonnell', '0573889899', 'mekhi.mcdonnell@capi', '82nd StreetHeiligenh', to_date('15-06-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (373176861, 'Rosie', 'Baez', '0574295943', 'rosie.baez@mls.com', '80 Wilkinson RoadCar', to_date('20-03-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (699763110, 'Merrilee', 'Kahn', '0599322633', 'mkahn@wyeth.com', '71st StreetFountain ', to_date('21-05-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (414668590, 'Mark', 'Northam', '0554048667', 'mark.n@cis.com', '692 Clarence RoadSeo', to_date('18-08-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (101584298, 'Christina', 'Goldwyn', '0562850264', 'c.goldwyn@epiqsystem', '89 Kagoshima AveBedf', to_date('29-11-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (188901791, 'Maura', 'Balk', '0595193145', 'maurab@netnumina.com', '63 Kevin RoadLincoln', to_date('28-11-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (238035478, 'Kurt', 'Rippy', '0525892356', 'kurt.rippy@bashen.co', '5 Jonatha AveNew Hav', to_date('14-08-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (157497482, 'Sylvester', 'Hanks', '0579687749', 'shanks@vms.it', '810 Hyde StreetSanto', to_date('26-07-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (303739378, 'Andrae', 'Kadison', '0535358687', 'andrae@visionarysyst', '16 Karon DriveSydney', to_date('11-05-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (579654282, 'Alessandro', 'Clooney', '0566764380', 'alessandro.clooney@m', '118 Madison StreetAd', to_date('27-04-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (425944003, 'Taylor', 'Emmett', '0553201369', 'taylor.emmett@conque', '870 Klein StreetOden', to_date('15-06-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (215197325, 'Liam', 'Robards', '0541762353', 'l.robards@heartlab.c', '99 Karyo StreetChere', to_date('23-07-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (318789542, 'Marina', 'Cattrall', '0523913102', 'mcattrall@pis.com', '12 ZahnHappy Valley', to_date('14-02-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (176289951, 'Cary', 'Balaban', '0597544094', 'cary@marlabs.com', '22nd StreetRedwood C', to_date('28-07-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (543846356, 'Sonny', 'McCready', '0573082944', 'smccready@universals', '519 Bette RoadBollen', to_date('17-04-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (259028206, 'Mac', 'Wells', '0566146563', 'mac@linksys.com', '92nd StreetJuneau', to_date('15-08-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (172099662, 'Lynn', 'Pride', '0542287992', 'lynnp@qls.jp', '63 George RoadKyoto', to_date('12-04-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (853365493, 'Cary', 'Liu', '0524264364', 'c.liu@otbd.hu', '97 Spacek StreetBeke', to_date('31-10-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (884051499, 'Gailard', 'Gough', '0535548151', 'gailard.g@seafoxboat', '320 Biella RoadNorth', to_date('14-05-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (296941138, 'Garland', 'Whitmore', '0577310642', 'garland.whitmore@aol', '43 ZellwegerSan Fran', to_date('13-03-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (567796300, 'Madeline', 'Cheadle', '0592076427', 'mcheadle@linacsystem', '73rd StreetYomgok-do', to_date('11-07-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (470121309, 'Herbie', 'Saucedo', '0568918188', 'h.saucedo@progressiv', '793 Ojeda RoadFort w', to_date('22-03-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (510149735, 'Henry', 'Kennedy', '0522976901', 'hkennedy@signalperfe', '133 Gaby RoadEdinbur', to_date('20-09-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (953369172, 'Jamie', 'Chaplin', '0526773281', 'jamie.chaplin@sarale', '60 Eastwood BlvdTemp', to_date('29-12-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (939300043, 'Pablo', 'Pantoliano', '0582045396', 'pablo.pantoliano@cns', '16 PowersHamburg', to_date('05-09-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (627355134, 'Nicole', 'Borden', '0563139948', 'nicoleb@officedepot.', '24 Puckett AveHolts ', to_date('01-06-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (556809614, 'Jaime', 'Viterelli', '0535683001', 'jaimev@asapstaffing.', '46 SalisburyAnnandal', to_date('03-01-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (465753415, 'Gino', 'Forrest', '0541658104', 'gino.forrest@seafoxb', '26 McNarland RoadLüb', to_date('22-08-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (421810164, 'Stanley', 'Avital', '0587759200', 's.avital@capstone.co', '5 Ulm DriveBaltimore', to_date('30-10-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (789685574, 'Phoebe', 'Chandler', '0533861848', 'phoebe.chandler@hori', '16 Vista RoadMatsue', to_date('14-09-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (309234614, 'Liam', 'Barkin', '0554938382', 'l.barkin@cascadebanc', '62 StuartCopenhagen', to_date('21-04-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (811696605, 'Lauren', 'Michaels', '0580354901', 'lauren.michaels@demo', '46 Guilfoyle DriveGu', to_date('23-01-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (339593939, 'Robert', 'McGregor', '0560955328', 'r.mcgregor@kiamotors', '10 Purefoy StreetVan', to_date('01-12-1985', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (762566292, 'Sharon', 'Macht', '0543512985', 'sharon.macht@ecopy.p', '72 Patrick DriveGliw', to_date('23-11-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (501767159, 'April', 'Feore', '0556830098', 'afeore@hondamotor.co', '210 Tal StreetTooele', to_date('30-04-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (261539527, 'Brothers', 'Kinnear', '0575961592', 'b.kinnear@officedepo', '33 von Sydow StreetV', to_date('17-03-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (289276888, 'Wendy', 'Taylor', '0580871431', 'wendy.taylor@benecon', '16 GianniniMilton Ke', to_date('31-10-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (825072524, 'Kyra', 'Love', '0564158854', 'kyra.love@ufs.com', '12 Chennai RoadVirgi', to_date('25-09-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (741127642, 'Natacha', 'Weller', '0531686952', 'natacha.weller@marla', '51 Pantoliano RoadSt', to_date('10-02-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (858875113, 'Patty', 'Pleasence', '0583709525', 'patty.pleasence@sear', '472 Belp StreetPoint', to_date('20-04-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (767198829, 'Giovanni', 'Lauper', '0590520659', 'giovanni.lauper@cima', '48 Mifune BlvdThessa', to_date('27-01-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (621121189, 'Teri', 'Crouse', '0559212207', 'teri.crouse@captechv', '46 Roger StreetSt-la', to_date('08-04-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (652011695, 'Alan', 'Gooding', '0566930211', 'alan.gooding@vitacos', '302 MoodyOppenheim', to_date('18-07-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (399467282, 'Carlos', 'Parish', '0596751851', 'carlos.parish@usener', '169 Karlstad DriveCh', to_date('09-02-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (854063610, 'Rod', 'Margolyes', '0595121560', 'rod@tilsonlandscape.', '51 Stocksbridge Driv', to_date('02-05-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (675278483, 'Loreena', 'Damon', '0548694501', 'loreena.damon@bristo', '1 Sample StreetEllic', to_date('25-06-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (159353604, 'Tom', 'Rain', '0546220567', 'tom.rain@learningvoy', '49 Hugo StreetMendoz', to_date('15-03-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (821929263, 'Garry', 'Evanswood', '0564449164', 'garrye@paintedword.c', '88 Vaduz RoadBrossar', to_date('12-03-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (784892920, 'Lionel', 'Aaron', '0562419168', 'lionel.aaron@balchem', '9 Leslie StreetSaras', to_date('16-05-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (650502773, 'Merrill', 'Holly', '0594639781', 'merrill@viacell.com', '15 Blackmore DriveVa', to_date('04-02-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (593572359, 'Neil', 'Streep', '0566661589', 'neil.s@bmm.com', '52 New Castle DriveJ', to_date('04-03-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (820500484, 'Jennifer', 'Sweet', '0551722670', 'jennifer.sweet@kroge', '42 Eder StreetMelbou', to_date('12-01-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (305336709, 'Pelvic', 'Perlman', '0529131224', 'pperlman@yashtechnol', '2 Laurie RoadPaderbo', to_date('08-12-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (577311698, 'Alfie', 'Donovan', '0556528445', 'alfie.d@bestbuy.com', '15 Dunn StreetMclean', to_date('29-11-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (286609319, 'Chazz', 'Gray', '0543782093', 'chazz.gray@curagroup', '42 Raye StreetSainte', to_date('18-10-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (238992471, 'Busta', 'Moffat', '0565872365', 'busta.moffat@axis.co', '45 Gibbons StreetKej', to_date('05-02-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (755117221, 'Nicolas', 'Spacey', '0559808426', 'nicolas.spacey@codyk', '11 Fonda BlvdHorsham', to_date('02-10-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (351243974, 'Clint', 'Thewlis', '0577087028', 'clint.thewlis@yashte', '5 Eric RoadUnionvill', to_date('20-06-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (852113698, 'Ray', 'Zahn', '0566678550', 'ray@marlabs.com', '503 Harahan RoadLake', to_date('12-02-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (865060464, 'Mos', 'Merchant', '0533349232', 'mos.merchant@spinnak', '52nd StreetEhningen', to_date('29-06-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (689549835, 'Jane', 'Murdock', '0593745027', 'janem@meritagetechno', '33 Loggins RoadMaria', to_date('12-01-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (184755960, 'Meg', 'Hagerty', '0555394793', 'meg.hagerty@fmb.no', '85 Chris StreetKrist', to_date('05-09-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (165333583, 'Darren', 'Boone', '0566152557', 'darren@businessplus.', '94 Liotta StreetHilv', to_date('17-04-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (223579296, 'Fisher', 'Payne', '0587563440', 'fisher.payne@comglob', '454 Harrison RoadSpr', to_date('11-10-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (188224358, 'Ian', 'Valentin', '0523520163', 'ian@limitedbrands.co', '445 Peniston BlvdSan', to_date('19-01-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (964640072, 'Sophie', 'Crowe', '0559093401', 'sophie.crowe@dcgroup', '16 Hershey RoadRockf', to_date('17-06-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (795738202, 'Edwin', 'McDowall', '0575219983', 'emcdowall@mms.jp', '40 Julie DriveKobe', to_date('29-05-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (608055389, 'Lindsey', 'Potter', '0575061776', 'lindsey.potter@csi.c', '18 Fierstein DriveSe', to_date('09-12-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (992127225, 'Stephen', 'Baldwin', '0554222476', 'stephen.baldwin@amer', '81 Mykelti StreetBlo', to_date('23-04-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (104169328, 'Mika', 'Dukakis', '0579123987', 'm.dukakis@yumbrands.', '63 Darren AveMount L', to_date('19-01-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (125500395, 'Elvis', 'Loring', '0526228488', 'elvisl@floorgraphics', '35 Todd RoadVaduz', to_date('09-01-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (870619025, 'Chubby', 'Greenwood', '0587952948', 'chubbyg@ibm.de', '438 Morse RoadKoeln', to_date('20-03-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (935141213, 'Burton', 'Gordon', '0572089068', 'burton.gordon@kingla', '4 CannockValencia', to_date('25-07-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (186311936, 'Kiefer', 'Lipnicki', '0594090491', 'kiefer.lipnicki@adve', '10 VinceMonterey', to_date('24-11-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (714905606, 'Alex', 'Short', '0568428009', 'alex.short@tastefull', '222 Leinfelden-Echte', to_date('02-02-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (831093867, 'Carl', 'Weisz', '0543329876', 'carl.weisz@entellige', '904 Genève StreetEdw', to_date('09-08-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (373541122, 'Derek', 'Duke', '0583358451', 'derek.d@verizon.com', '145 Nelly AveSalem', to_date('14-12-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (284435188, 'Alec', 'Lonsdale', '0521712080', 'alec.lonsdale@bmm.de', '96 Giovanni RoadKais', to_date('09-10-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (843519385, 'Molly', 'Redgrave', '0561499334', 'molly@hotmail.com', '52 Edie DriveSeatle', to_date('19-11-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (265119104, 'Avril', 'McLachlan', '0561234610', 'avril.mclachlan@digi', '14 Hässleholm RoadKo', to_date('24-02-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (689097358, 'Mickey', 'Potter', '0529282658', 'mickey.potter@shirtf', '63rd StreetYamaguchi', to_date('15-07-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (456149036, 'Wallace', 'Matthau', '0579671637', 'wallace@chhc.de', '55 Nanci StreetFamba', to_date('01-11-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (538652540, 'Carolyn', 'Irons', '0546134348', 'carolyn.irons@aquick', '612 Butner DriveChaa', to_date('11-06-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (746963718, 'Ewan', 'Posey', '0553345935', 'ewan.p@benecongroup.', '22 Paisley StreetDre', to_date('23-08-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (507339068, 'Jonny Lee', 'Ripley', '0528365711', 'jonnylee.ripley@dell', '334 MantovaPordenone', to_date('06-03-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (159482460, 'Clive', 'Young', '0561277040', 'clive.young@evinco.c', '40 Ponta grossa Road', to_date('28-08-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (543533587, 'Jean', 'Wincott', '0599154546', 'jean.wincott@hotmail', '81 Baker RoadAurora', to_date('08-12-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (255087016, 'Rolando', 'Westerberg', '0594827714', 'r.westerberg@mds.ca', '38 Waltham BlvdBolto', to_date('10-06-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (555636906, 'Ernest', 'Utada', '0589790170', 'ernest@logisticare.n', '81 Dysart BlvdSoest', to_date('22-01-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (653072371, 'Earl', 'Strathairn', '0520016678', 'earl.s@hudsonriverba', '58 Piacenza AveLeawo', to_date('21-02-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (707509224, 'Carole', 'Kleinenberg', '0581193000', 'ckleinenberg@medsour', '40 Rollins DriveLime', to_date('21-04-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (994265828, 'Merle', 'Begley', '0591458779', 'merle.begley@comglob', '16 Macau AveMt. Laur', to_date('18-05-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (165090409, 'Mae', 'Gaines', '0599435153', 'mae.gaines@pioneerda', '32 Rosanne BlvdTorin', to_date('14-07-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (244240688, 'Ivan', 'Allan', '0532963338', 'ivan.allan@tama.it', '48 Flanery StreetUdi', to_date('25-07-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (339897673, 'Elle', 'Damon', '0573669370', 'elle.damon@smg.com', '14 Lynn AveAllen', to_date('17-07-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (932729135, 'Elisabeth', 'Coltrane', '0574844858', 'elisabeth.coltrane@t', '7 Warren RoadNoumea', to_date('31-01-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (256239435, 'Laurence', 'LaBelle', '0522669215', 'laurence.labelle@car', '36 Tomlin BlvdReadin', to_date('05-04-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (834241599, 'Owen', 'Pfeiffer', '0588739181', 'owen.pfeiffer@techrx', '56 Zellweger DriveMe', to_date('04-12-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (235345052, 'Robert', 'Sevenfold', '0566935947', 'rsevenfold@usgovernm', '98 Domino RoadSaint ', to_date('30-09-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (274340804, 'Udo', 'Belushi', '0568891538', 'udo.belushi@abatix.c', '37 Boyle StreetLowel', to_date('18-01-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (205862893, 'Swoosie', 'Deschanel', '0561847822', 'swoosie.deschanel@fa', '286 Shearer StreetCo', to_date('26-12-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (817163899, 'Phoebe', 'Strathairn', '0575182602', 'phoebe.s@atlanticcre', '65 durham DriveLinz', to_date('28-12-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (644336833, 'Kirk', 'Cruz', '0579390308', 'kirk.cruz@pharmafab.', '49 Crimson RoadArlin', to_date('10-06-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (839552387, 'Bruce', 'Wainwright', '0551462580', 'bruce.w@lydiantrust.', '18 Monk StreetPitsto', to_date('22-10-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (562834464, 'Buddy', 'Bailey', '0531239611', 'buddy.bailey@capston', '92 BouchervilleKings', to_date('29-09-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (271266299, 'Carol', 'Newman', '0540638713', 'carol.newman@spectru', '59 Bryan StreetNagoy', to_date('08-01-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (257468741, 'Devon', 'Sheen', '0566163663', 'devon.sheen@restaura', '19 Kyra StreetBudape', to_date('31-05-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (353002056, 'Jill', 'Hingle', '0531513863', 'jill.h@owm.uk', '88 Dempsey StreetPur', to_date('21-04-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (134778927, 'Peter', 'Dayne', '0563508444', 'peter.dayne@lynksyst', '2 Ticotin BlvdRosari', to_date('21-02-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (526367693, 'Eileen', 'Dunst', '0569780688', 'eileend@procurementc', '23rd StreetNatal', to_date('21-09-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (165847242, 'Ani', 'Whitwam', '0544733066', 'ani@advertisingventu', '44 Sao roque AveKans', to_date('24-11-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (385114707, 'Albert', 'Weaving', '0596812655', 'a.weaving@businesspl', '38 Mos RoadRedondo b', to_date('06-07-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (652843443, 'William', 'Fisher', '0532926251', 'william@magnet.com', '55 Nicholas DriveSwa', to_date('18-09-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (611710332, 'Kelly', 'Burstyn', '0577299960', 'kelly.burstyn@max.co', '70 Van Damme StreetL', to_date('30-05-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (670578902, 'Bobby', 'Sedaka', '0555870588', 'bobby.sedaka@columbi', '3 Danni RoadBristol', to_date('08-02-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (853385648, 'Gino', 'Lorenz', '0573884002', 'gino.lorenz@palmbeac', '92 Summer RoadPark R', to_date('15-07-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (449431408, 'Barry', 'Tolkan', '0531133751', 'b.tolkan@msdw.com', '52 Lorraine StreetWa', to_date('08-07-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (660496533, 'Doug', 'Bandy', '0558956611', 'doug.bandy@sweetprod', '62 Koblenz RoadBekes', to_date('30-10-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (553099150, 'Cesar', 'Biehn', '0579361138', 'cbiehn@bradleypharma', '56 Wilkinson RoadMil', to_date('06-12-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (477812004, 'Vince', 'Lorenz', '0599423994', 'vince.lorenz@csi.de', '61 Greenwood RoadMic', to_date('14-06-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (982544367, 'Dabney', 'Humphrey', '0595916153', 'dabney.humphrey@seaf', '40 Dale DriveManches', to_date('13-06-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (918208321, 'Ellen', 'Sandler', '0588468970', 'ellens@ach.de', '44 Curfman AveBad Oe', to_date('28-11-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (599890817, 'Joanna', 'Payton', '0557617961', 'joanna.payton@teoco.', '58 Prowse StreetNaga', to_date('17-03-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (838212407, 'Sander', 'Loveless', '0578286080', 'sander.l@qestrel.ve', '732 Van Damme Street', to_date('07-11-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (186511957, 'Patti', 'Gibson', '0544598499', 'patti.gibson@cynergy', '61 Slidel AveRothenb', to_date('20-10-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (837749329, 'Lindsay', 'Perez', '0583498212', 'lindsay.perez@securi', '88 Brookfield RoadTa', to_date('03-10-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (373788557, 'Sean', 'Singh', '0553175638', 'sean.singh@netnumina', '6 Lavigne BlvdMelbou', to_date('17-03-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (356009760, 'Rosanne', 'Wagner', '0524779253', 'rosanne.wagner@sis.u', '62nd StreetNorthampt', to_date('15-07-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (386348949, 'Thomas', 'Salt', '0598791344', 'tsalt@northhighland.', '6 Del Toro StreetSyr', to_date('06-10-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (777883031, 'Harry', 'Harry', '0522798439', 'hharry@3tsystems.nl', '97 OwenRozenburg', to_date('26-01-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (791364724, 'Alex', 'Bright', '0535319575', 'abright@ceb.es', '641 Jodie RoadSant C', to_date('18-03-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (928952772, 'Josh', 'Yulin', '0550714838', 'josh.y@sensortechnol', '96 Kaiserslautern Ro', to_date('04-04-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (949319984, 'Trini', 'Brickell', '0551985232', 'trini.brickell@safew', '54 Ronny BlvdAvon', to_date('06-11-1991', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (302430936, 'Lauren', 'Nunn', '0535424698', 'lauren.nunn@palmbeac', '15 Sirtis RoadBartle', to_date('01-11-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (112428503, 'Luke', 'Elizabeth', '0564810542', 'luke.elizabeth@yasht', '94 MacNeil RoadNiles', to_date('18-12-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (595345749, 'Howard', 'Young', '0546296548', 'howard.y@portosan.uk', '22 Silverdale AveChi', to_date('07-12-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (209821870, 'France', 'Woodard', '0557408208', 'france.woodard@signa', '755 Anna RoadHarahan', to_date('01-11-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (631854631, 'Katrin', 'Bruce', '0594030703', 'katrin.bruce@dell.uk', '37 Scaggs StreetMaid', to_date('20-05-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (205827981, 'Red', 'Nivola', '0585457618', 'red.nivola@uem.ca', '6 Chesnutt BlvdSt-la', to_date('18-01-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (900618507, 'Ray', 'Marshall', '0551215243', 'ray.marshall@linacsy', '35 Brooke RoadOhtsu', to_date('07-01-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (939111048, 'Kathy', 'Dafoe', '0555482347', 'kathy.dafoe@paintedw', '42 Clinton StreetBet', to_date('10-07-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (927802033, 'Gino', 'Reed', '0575478789', 'gino@cimalabs.com', '76 Martin BlvdMt. La', to_date('29-12-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (295925780, 'Laurie', 'Crow', '0588244635', 'l.crow@sbc.com', '75 Santa Rosa RoadRi', to_date('25-06-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (281402679, 'Bernard', 'Sewell', '0563014180', 'bernard.sewell@green', '434 Gordie StreetBay', to_date('03-03-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (603787067, 'Karen', 'Wills', '0524176846', 'karen.wills@softworl', '22 Fukui BlvdNepean', to_date('23-09-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (744817517, 'Queen', 'McConaughey', '0573284925', 'q.mcconaughey@united', '244 Mantova AveSan R', to_date('25-11-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (483475435, 'Rowan', 'Hackman', '0575017017', 'rowan.hackman@totale', '55 South Weber RoadB', to_date('06-03-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (173430676, 'Buddy', 'Milsap', '0581417682', 'bmilsap@hiltonhotels', '22 Rosanne StreetSt-', to_date('19-05-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (903363912, 'Leonardo', 'Clark', '0578721765', 'leonardoc@fam.com', '91 Lattimore StreetB', to_date('21-10-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (504967455, 'Gladys', 'Damon', '0583729853', 'gladys@homedepot.uk', '517 Stevens RoadMaid', to_date('23-08-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (901324333, 'Seth', 'Jay', '0565875057', 'seth.j@paintedword.c', '54 Douala RoadPasade', to_date('10-12-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (766242929, 'Katrin', 'Stamp', '0559866573', 'katrins@solipsys.com', '4 Brentwood BlvdOmah', to_date('08-03-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (654307339, 'Peabo', 'Griggs', '0578190786', 'pgriggs@taycorfinanc', '948 Sedgwick BlvdNeu', to_date('23-03-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (536210702, 'Randall', 'Haysbert', '0567907202', 'randall.h@johnson.co', '965 CaineSaint Paul', to_date('08-09-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (135445939, 'Janice', 'Bright', '0574969182', 'janice.bright@saltgr', '453 Visnjic StreetSa', to_date('28-01-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (870561709, 'Carrie', 'Howard', '0590446908', 'carrie.h@newviewgift', '74 Evett StreetSuffe', to_date('23-02-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (170255524, 'Dom', 'Robinson', '0569884764', 'd.robinson@pfizer.co', '74 Randal DriveThe W', to_date('02-09-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (171255463, 'Alice', 'Stiers', '0587409936', 'alice.stiers@integra', '75 Carmen DriveOyten', to_date('25-10-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (203883392, 'Terry', 'Withers', '0580340739', 't.withers@cardtronic', '74 Ronstadt StreetMa', to_date('09-12-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (751304730, 'Nathan', 'Lindley', '0566241377', 'nathan.lindley@viace', '44 McCoy BlvdPalo Al', to_date('31-08-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (762139241, 'Marianne', 'Ferry', '0574023827', 'marianne.ferry@anwor', '98 LübeckPecs', to_date('11-04-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (640265997, 'Deborah', 'urban', '0574136219', 'deborah.urban@lifeli', '26 Mandrell BlvdSali', to_date('05-01-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (161160901, 'Freddy', 'Aiken', '0557702136', 'freddy.aiken@ibm.ca', '52 Cherepovets RoadV', to_date('31-10-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (997173813, 'Boyd', 'Bloch', '0522529131', 'boyd@primussoftware.', '81 Dianne StreetLeed', to_date('02-03-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (521421326, 'Fisher', 'Wahlberg', '0557908667', 'fisher.wahlberg@mse.', '96 Meyer StreetForna', to_date('09-07-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (808220490, 'David', 'Lennox', '0537490719', 'david.lennox@extreme', '476 Sevigny DriveBaa', to_date('06-09-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (753588281, 'Julianne', 'Grier', '0590265649', 'julianneg@tmt.nl', '43 Leslie StreetHilv', to_date('29-05-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (482409207, 'Ed', 'Eat World', '0551615801', 'ed.eatworld@bayer.pt', '74 Getty AveLisbon', to_date('29-03-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (898420707, 'Cloris', 'Craig', '0599526409', 'cloris.craig@horizon', '19 Haggard BlvdLodi', to_date('24-02-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (116412822, 'Tony', 'Wopat', '0578981607', 'tony.wopat@adolph.at', '728 Rush RoadBischof', to_date('07-07-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (843512931, 'Clay', 'Webb', '0545424510', 'clay.webb@bradleypha', '65 Joan StreetSursee', to_date('17-04-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (386906499, 'Jeffrey', 'Tinsley', '0552519658', 'jeffrey.t@waltdisney', '259 Ratzenberger Str', to_date('20-03-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (441023695, 'Javon', 'Liu', '0573233705', 'javon.liu@fmb.at', '26 Lynn DriveBischof', to_date('28-05-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (422239445, 'Beth', 'Milsap', '0524355769', 'bethm@aco.th', '2 Sendai AveBkk', to_date('17-07-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (481161391, 'Martha', 'Cohn', '0566265197', 'martha.cohn@cima.de', '12nd StreetMainz-kas', to_date('25-03-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (464750472, 'Nik', 'Bragg', '0587341741', 'nik.bragg@portosan.d', '53 Loretta StreetFre', to_date('12-08-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (998232373, 'Elvis', 'Morrison', '0568066897', 'elvis.morrison@sps.s', '32 TurnerHelsingborg', to_date('09-05-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (377167998, 'Darren', 'Lawrence', '0571220341', 'darren.lawrence@gree', '93 McKean AveRichard', to_date('11-06-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (341328372, 'Powers', 'Liu', '0598023325', 'powers.liu@mwh.nl', '63rd StreetDen Haag', to_date('29-09-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (546922138, 'Yolanda', 'Oates', '0599904344', 'yolanda@ghrsystems.c', '469 Valentin RoadAny', to_date('23-09-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (173111638, 'Vienna', 'Fiorentino', '0559237911', 'vienna@walmartstores', '768 Midler StreetOld', to_date('20-06-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (420933524, 'Donald', 'Stills', '0551910758', 'donald.stills@saksin', '78 OmarSan Francisco', to_date('22-04-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (247602929, 'Bebe', 'Nunn', '0524691233', 'bebe.nunn@safehomese', '42 Bale StreetBiella', to_date('17-04-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (711979218, 'Omar', 'Oldman', '0551995213', 'omar.oldman@onesourc', '99 Atkinson DriveBie', to_date('02-05-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (977594162, 'Liquid', 'Hatchet', '0545273410', 'liquid.hatchet@healt', '80 DeVito RoadGreenw', to_date('18-02-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (844372994, 'Hank', 'Stevenson', '0557722845', 'hank.stevenson@venoc', '73 Molly DriveWarsaw', to_date('21-01-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (150275483, 'Cevin', 'Loring', '0561452106', 'cevinl@sbc.com', '22 JordanBristol', to_date('15-10-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (402522020, 'Tea', 'Farrow', '0591485125', 't.farrow@gtp.com', '73 Annie RoadOlympia', to_date('02-12-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (820186449, 'Howard', 'Hopper', '0534646087', 'howard.hopper@fetchl', '55 Burt DriveRicards', to_date('07-04-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (676848037, 'Nicholas', 'Tomlin', '0527923711', 'nicholas.tomlin@netw', '39 Lübeck BlvdMonter', to_date('16-03-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (521050607, 'Seth', 'Shandling', '0548287138', 'seth.shandling@secur', '51st StreetCoppell', to_date('18-07-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (513160497, 'Rebeka', 'Skerritt', '0596909439', 'rebeka.skerritt@infi', '61 Summer DriveHjall', to_date('25-05-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (334089930, 'Lonnie', 'Rivers', '0548056267', 'lonnie@networkdispla', '48 Spiner RoadSt-bru', to_date('14-03-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (362590582, 'Willie', 'Harry', '0553468241', 'willie.h@virbac.li', '81st StreetVaduz', to_date('20-05-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (823114910, 'Bebe', 'Sledge', '0558913821', 'bebe@scriptsave.com', '21 Karen DriveNarrow', to_date('22-08-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (713148353, 'Scott', 'Oates', '0594883510', 's.oates@capellaeduca', '49 Fisher BlvdFort S', to_date('30-12-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (194400947, 'Breckin', 'Redford', '0536680097', 'bredford@ois.uk', '747 Parsippany Drive', to_date('07-11-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (628551248, 'Tramaine', 'DiCaprio', '0576111411', 'tramaine.dicaprio@gc', '167 Schreiber Street', to_date('01-07-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (649997008, 'Ryan', 'Kleinenberg', '0523749742', 'r.kleinenberg@ubp.cr', '65 Ben-Gurion RoadSa', to_date('03-10-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (208550790, 'Sheena', 'Botti', '0577024259', 'sheena.botti@dynacqi', '96 Tripplehorn RoadG', to_date('16-10-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (873043554, 'Meg', 'Elliott', '0521401773', 'meg.elliott@lfg.com', '501 Ming-Na DriveRed', to_date('20-04-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (369101756, 'Chloe', 'Duke', '0591070278', 'chloe.duke@yes.com', '18 New Haven BlvdLak', to_date('18-10-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (494281887, 'Ronny', 'Harrison', '0590068968', 'rharrison@proclarity', '2 Slidel RoadWavre', to_date('05-06-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (273750148, 'Nastassja', 'Rundgren', '0530293171', 'nastassja.rundgren@e', '38 Natacha StreetHer', to_date('09-08-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (464821399, 'Connie', 'Fariq', '0580932866', 'connie.fariq@general', '81st StreetVarzea gr', to_date('31-08-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (924210502, 'Gloria', 'Allison', '0559820957', 'gloriaa@capellaeduca', '76 KretschmannGaza', to_date('10-12-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (540114031, 'Pamela', 'Haynes', '0529920611', 'pamela@baesch.it', '13rd StreetBolzano', to_date('19-08-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (763139821, 'Gladys', 'Lindo', '0544059285', 'gladys.lindo@lynksys', '87 MoorestownPomona', to_date('06-10-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (435524483, 'Lennie', 'Kershaw', '0589289998', 'lennie.kershaw@trini', '763 Smurfit DriveNae', to_date('10-01-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (809377988, 'Kylie', 'Macht', '0550506947', 'kylie.macht@greenmou', '55 Payton DriveDurha', to_date('08-05-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (461888285, 'Maceo', 'Richards', '0549045464', 'maceo.richards@abati', '89 Conroy StreetSton', to_date('01-11-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (364782364, 'Dylan', 'Cox', '0598122101', 'dylan.cox@prometheus', '61 Cromwell RoadPara', to_date('18-04-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (330509872, 'Lisa', 'Preston', '0550094035', 'lisa.preston@nuinfos', '38 Bean DriveJackson', to_date('15-06-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (305993110, 'Hank', 'Winger', '0551459071', 'hank.winger@proclari', '13rd StreetFt. Leave', to_date('13-04-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (435639070, 'Alec', 'Englund', '0579233514', 'alece@gbas.jp', '86 Gordon RoadToyama', to_date('23-07-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (547214894, 'Jena', 'Busey', '0594290590', 'jena.b@gentrasystems', '18 Love RoadMelrose ', to_date('07-11-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (498875242, 'Stellan', 'Tucci', '0577360061', 's.tucci@alternativet', '78 Hector StreetFort', to_date('25-01-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (165980859, 'Fionnula', 'Weir', '0583902921', 'fionnula.weir@dell.c', '555 Berwyn DriveWaln', to_date('01-05-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (239803816, 'Rhett', 'Tempest', '0586935765', 'rhett.tempest@tama.j', '78 Bonneville DriveW', to_date('05-09-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (239697932, 'Matthew', 'Piven', '0586531071', 'matthew.piven@horizo', '74 Lonnie DriveSprin', to_date('26-05-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (327599490, 'Fisher', 'Jackman', '0585094604', 'fisher.jackman@anwor', '29 Petach-Tikva Road', to_date('14-09-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (802698033, 'First', 'Orton', '0562902452', 'forton@creditorsinte', '119 Edie StreetNorth', to_date('13-03-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (193473233, 'Cyndi', 'Newton', '0576252009', 'cyndin@meritagetechn', '23 GoodingAberdeen', to_date('24-10-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (440414604, 'Kenny', 'Coe', '0588915122', 'kennyc@taycorfinanci', '831 Theron StreetEss', to_date('21-09-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (714675205, 'Darren', 'Goldwyn', '0558105963', 'd.goldwyn@chhc.com', '73rd StreetPasadena', to_date('15-09-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (926145059, 'Timothy', 'Carmen', '0522793480', 'timothy.carmen@benec', '33 Dench StreetPurle', to_date('10-01-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (688591424, 'Kiefer', 'Diehl', '0569054555', 'kiefer@canterburypar', '990 Niigata StreetMe', to_date('29-11-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (177157307, 'Jeremy', 'Tillis', '0558284381', 'jeremyt@harrison.il', '36 Jay DrivePetach-T', to_date('02-02-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (706306682, 'Ike', 'Puckett', '0529439491', 'ike@pearllawgroup.no', '6 Woodard RoadEiksma', to_date('23-09-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (746463143, 'Pamela', 'Sledge', '0595931135', 'pamela.sledge@extrem', '767 Slater StreetSuf', to_date('08-09-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (467624110, 'Neve', 'Whitman', '0578396235', 'nwhitman@oss.com', '91 Turner StreetAust', to_date('09-08-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (477000955, 'Linda', 'Uggams', '0570548956', 'luggams@peerlessmanu', '49 Margolyes StreetG', to_date('14-03-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (339111948, 'Gene', 'Arkin', '0564919625', 'genea@timevision.br', '7 Avalon RoadGoiania', to_date('04-11-1973', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (883025897, 'Jesse', 'Reno', '0559221558', 'jesse.reno@calence.c', '31st StreetLake Oswe', to_date('16-08-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (644722756, 'Sydney', 'Blades', '0556855645', 'sydney.blades@usphys', '52nd StreetFuchstal-', to_date('26-03-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (136649431, 'Jude', 'Davison', '0562035528', 'jude.davison@scherin', '448 Feliciano Street', to_date('29-10-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (152977912, 'Cole', 'Mazar', '0569636490', 'cole.mazar@lms.com', '74 Tucker StreetGree', to_date('22-06-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (199474377, 'Stellan', 'Giannini', '0526089628', 's.giannini@heritagem', '83 AlanaSeoul', to_date('03-02-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (554200371, 'Solomon', 'Gibson', '0591030894', 's.gibson@spas.com', '58 Bernard AveWest C', to_date('28-06-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (612714265, 'Holly', 'Peet', '0563577929', 'holly@sprint.com', '72nd StreetRancho Pa', to_date('14-09-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (504234848, 'Oded', 'Popper', '0576875915', 'odedp@hitechpharmaca', '26 Blades BlvdRichmo', to_date('26-12-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (543820399, 'Petula', 'Bell', '0520673958', 'petula@staffforce.co', '50 Sinead StreetBerk', to_date('27-06-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (945977436, 'Emily', 'Cruz', '0576221746', 'emily.cruz@nsd.de', '59 Leonardo DriveDin', to_date('02-09-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (872367234, 'Angela', 'Phoenix', '0572733899', 'angela@studiobproduc', '68 Whitmore DriveSch', to_date('30-05-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (432595819, 'Hector', 'Midler', '0567455228', 'hector.midler@abs.co', '91 AdamHighlands Ran', to_date('31-07-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (277703343, 'Curt', 'O''Neill', '0586033794', 'curt@gha.com', '76 Graz StreetReiste', to_date('23-08-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (759479781, 'Andie', 'Russo', '0584934988', 'andier@tilsonlandsca', '88 RookerAustin', to_date('26-05-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (351332054, 'Denzel', 'Russell', '0554764799', 'denzel@simplycertifi', '417 Nepean DriveElch', to_date('29-06-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (422988413, 'Maureen', 'Shand', '0568546389', 'maureen.shand@its.co', '13 Scarlett StreetSw', to_date('23-10-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (534443040, 'Roberta', 'Idol', '0544216050', 'roberta.idol@wav.it', '61 Quinlan RoadBrune', to_date('09-09-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (185946154, 'Gary', 'Randal', '0570275803', 'gary@americanmegacom', '859 Avalon StreetBen', to_date('11-11-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (702864573, 'Jonathan', 'Thomson', '0532721240', 'jonathan.thomson@fla', '66 Curtis-Hall Stree', to_date('17-01-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (559464664, 'Judge', 'Rhodes', '0531367977', 'judge.rhodes@hudsonr', '42 Dick DriveHarrisb', to_date('21-07-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (268543916, 'Moe', 'Roy Parnell', '0599304531', 'mroyparnell@vms.com', '91 Steenburgen Stree', to_date('19-12-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (476784202, 'Milla', 'Blackwell', '0590444365', 'milla.blackwell@fnb.', '7 Ramat Gan StreetTh', to_date('15-05-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (240495059, 'Buffy', 'Ford', '0554550673', 'buffy.ford@summitene', '95 TamborAltamonte S', to_date('29-09-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (126868783, 'Lou', 'Ruffalo', '0594973808', 'lou.ruffalo@activese', '138 Fierstein RoadRo', to_date('27-01-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (520066928, 'Bernard', 'Lemmon', '0522541128', 'bernardl@vesta.is', '26 IdleKopavogur', to_date('12-03-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (152135020, 'Herbie', 'Arnold', '0520458786', 'herbie@aventis.de', '658 Snipes BlvdDortm', to_date('13-08-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (688431907, 'Meg', 'Marley', '0521900268', 'meg.m@irissoftware.s', '79 Penders RoadMalmö', to_date('14-10-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (649977206, 'Jeanne', 'Sayer', '0538065621', 'jeanne.sayer@nsd.ar', '50 Wong RoadNeuquen', to_date('23-04-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (524151934, 'Helen', 'Keeslar', '0563963654', 'hkeeslar@employerser', '58 Sossamon AveWarre', to_date('31-05-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (211688357, 'Janice', 'McCain', '0567051315', 'jmccain@signature.co', '91 Appenzell StreetM', to_date('12-05-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (663404655, 'Azucar', 'Lewin', '0542394254', 'azucar.lewin@flavorx', '95 TommyCary', to_date('07-01-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (718428613, 'Kieran', 'Furay', '0595359989', 'kieran.f@prioritylea', '11 BarryNew orleans', to_date('21-01-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (447390845, 'Stanley', 'Rhys-Davies', '0582067832', 'stanley.rhysdavies@a', '56 Isabella RoadOak ', to_date('27-08-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (395234141, 'Geggy', 'Landau', '0535184911', 'geggy.landau@tmt.au', '554 Giamatti RoadKur', to_date('04-05-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (662996368, 'Nicholas', 'Bullock', '0587784451', 'nicholas.b@solipsys.', '73rd StreetMagstadt', to_date('18-12-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (713264703, 'Freddy', 'Kershaw', '0529859412', 'freddy@mss.ar', '13rd StreetMendoza', to_date('16-11-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (109338019, 'Rickie', 'Zevon', '0569739731', 'rzevon@carteretmortg', '44 Stoneham RoadKago', to_date('13-12-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (922656620, 'Alex', 'Tobolowsky', '0568542780', 'alex.tobolowsky@wlt.', '14 Palmieri StreetCh', to_date('24-11-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (364957248, 'Derek', 'Kane', '0531522065', 'derek@thinktanksyste', '92 New orleans RoadC', to_date('07-03-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (950522575, 'Wang', 'Clark', '0569904502', 'wclark@granitesystem', '44 Spike AveBoulder', to_date('28-10-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (138192266, 'Gilbert', 'Suvari', '0556560164', 'gsuvari@httprint.it', '66 Flower moundBiell', to_date('25-02-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (508491962, 'Gin', 'Chinlund', '0556541032', 'gin.chinlund@mms.de', '40 Kevn BlvdDarmstad', to_date('28-04-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (356102475, 'Adina', 'Brothers', '0558365307', 'adina.brothers@emplo', '86 CreekAltamonte Sp', to_date('08-06-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (613658145, 'Gilbert', 'Cumming', '0544550853', 'g.cumming@qssgroup.c', '20 Towson RoadClaymo', to_date('26-07-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (908754150, 'Manu', 'Hawthorne', '0597848855', 'manu.hawthorne@newho', '87 Cattrall RoadSuwo', to_date('26-06-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (347481888, 'Faye', 'Bachman', '0521683560', 'faye.bachman@telepoi', '87 Trieste DriveWint', to_date('01-09-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (568530914, 'Owen', 'MacNeil', '0560146356', 'owen@elmco.se', '16 Manchester Street', to_date('06-06-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (902674875, 'Ozzy', 'Schiff', '0532728288', 'ozzys@fflcbancorp.co', '17 EdwinAnn Arbor', to_date('09-04-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (595470885, 'Marisa', 'Schneider', '0597883405', 'marisa.schneider@gcd', '762 TorresBarksdale ', to_date('07-12-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (580488974, 'Terrence', 'Ruiz', '0522610660', 'terrence@mcdonalds.c', '31 Colleen RoadHaywa', to_date('15-06-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (242585762, 'Nicholas', 'Marx', '0571368786', 'nicholas.marx@author', '82 Chaplin RoadRicha', to_date('09-11-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (615613414, 'Lionel', 'Hong', '0567935967', 'lionel@sprint.uk', '61st StreetChinnor', to_date('07-12-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (111598232, 'Red', 'Shaye', '0528498117', 'red.shaye@bashen.au', '58 Lou StreetAdamsto', to_date('12-01-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (699124064, 'Tracy', 'Chilton', '0582035469', 'tracy.chilton@bat.co', '76 Wheel RoadHercule', to_date('10-08-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (481548013, 'Patty', 'Kelly', '0546568773', 'patty.kelly@spenser.', '42 Chilton DriveEdin', to_date('01-08-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (719059544, 'Wally', 'Belle', '0570323460', 'wally@pds.com', '63 Presley RoadRoche', to_date('30-04-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (266759777, 'Frankie', 'Wong', '0599588591', 'frankie.wong@avs.pl', '78 Collective Street', to_date('28-04-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (156186136, 'Paul', 'Aiken', '0587100887', 'paul.aiken@horizon.c', '897 Geoff RoadNiles', to_date('15-09-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (626327405, 'Hex', 'Adams', '0597070261', 'hex.adams@fmt.com', '9 Sugar Hill StreetL', to_date('27-08-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (952156579, 'Kitty', 'Lennix', '0559196231', 'kitty.lennix@america', '174 WörthWageningen', to_date('25-06-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (988686001, 'Jonatha', 'Thorton', '0580843316', 'jonatha.thorton@mag.', '70 Place StreetSt-br', to_date('07-04-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (942896799, 'Carlene', 'Luongo', '0552084839', 'carlene.luongo@gentr', '90 Boorem RoadHong K', to_date('12-10-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (248542834, 'Loren', 'Dafoe', '0539332345', 'lorend@career.com', '59 Colon StreetSprin', to_date('30-05-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (605661788, 'Kurtwood', 'DiFranco', '0598767351', 'kurtwood.d@lloydgrou', '20 LithgowTaoyuan', to_date('07-10-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (944853689, 'Cesar', 'Thorton', '0530424854', 'cesar@kingland.de', '70 Albany RoadHerfor', to_date('30-06-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (517094574, 'Ellen', 'Doucette', '0540609192', 'ellen.d@northhighlan', '66 Joe RoadErlangen', to_date('21-01-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (803721923, 'Morgan', 'Mann', '0564298018', 'mmann@nha.com', '72nd StreetBoston', to_date('06-03-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (237642726, 'Marianne', 'Franklin', '0534188894', 'marianne.franklin@pa', '1 VillataHeubach', to_date('11-09-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (901297210, 'Brittany', 'Secada', '0543198007', 'bsecada@harrison.de', '22nd StreetBretzfeld', to_date('02-12-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (404883551, 'Donald', 'Abraham', '0523875268', 'donald.abraham@gatew', '7 Malkovich RoadFort', to_date('21-07-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (817135362, 'Giancarlo', 'Carlisle', '0581569685', 'giancarlo.carlisle@p', '13 Clooney BlvdBoise', to_date('18-04-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (641650573, 'Neneh', 'Pryce', '0568363759', 'n.pryce@linersdirect', '24 Branch BlvdKuraby', to_date('06-12-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (223886311, 'Carl', 'Drive', '0577545651', 'carl@cima.hk', '88 Nick BlvdKwun Ton', to_date('30-09-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (564278748, 'Alec', 'Holmes', '0574385872', 'alec@hencie.de', '72 Sharp RoadNuernbe', to_date('11-05-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (729089904, 'Ice', 'McDonnell', '0539926942', 'ice@adeasolutions.co', '36 Crosby BlvdLaurel', to_date('01-11-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (764799376, 'Clive', 'Paquin', '0567238926', 'clive.paquin@saltgro', '63 Hazel RoadCalcutt', to_date('09-05-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (466419010, 'Rowan', 'Westerberg', '0597698778', 'rwesterberg@montpeli', '71 Morales StreetMar', to_date('22-07-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (961191521, 'Denny', 'Stoltz', '0583688516', 'denny.stoltz@kingsto', '58 Williamstown Driv', to_date('30-11-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (200440687, 'Morris', 'Turner', '0583503366', 'morris.turner@diamon', '44 MenaNynäshamn', to_date('05-12-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (708442139, 'Vienna', 'Irving', '0530516717', 'vienna@dearbornbanco', '7 Gough BlvdBrampton', to_date('31-12-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (992508462, 'Joseph', 'Crow', '0529065171', 'joseph.crow@north.it', '1 Lara StreetLodi', to_date('15-10-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (560734429, 'Bette', 'Cherry', '0557083181', 'bette.c@lydiantrust.', '44 McAnally StreetJa', to_date('06-11-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (337884271, 'Kirk', 'Stiers', '0552671072', 'k.stiers@cis.com', '76 Cross AveGranada ', to_date('03-10-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (100263721, 'Leslie', 'Vaughan', '0553127804', 'leslie.vaughan@jma.e', '51 Neville DriveAlco', to_date('25-04-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (513296641, 'Judd', 'Murdock', '0546633268', 'judd.m@americanmegac', '98 Parish RoadCincin', to_date('28-02-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (516978043, 'Melba', 'Warburton', '0544261836', 'melba.warburton@ecop', '69 Krumholtz BlvdVee', to_date('12-03-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (176473026, 'Rebeka', 'Summer', '0598694090', 'rebeka@webgroup.au', '10 Mifune DriveBurwo', to_date('19-01-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (535677385, 'Avril', 'Winstone', '0546946057', 'avril.winstone@clubo', '23 Redhill RoadWest ', to_date('10-11-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (346456880, 'Lari', 'Payne', '0541540490', 'lari.payne@johnson.c', '28 Biehn RoadRaleigh', to_date('21-06-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (622724191, 'Sheena', 'Rhames', '0544503996', 'sheena.rhames@advert', '51 Tucker StreetSton', to_date('26-11-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (368489397, 'Remy', 'Purefoy', '0588839515', 'remyp@interfacesoftw', '82 RobbinsNew hartfo', to_date('08-11-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (723363449, 'Morris', 'Sedaka', '0591885856', 'morriss@quicksilverr', '80 Tyne & Wear AveAs', to_date('08-03-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (116256616, 'Warren', 'Hayes', '0578195065', 'w.hayes@chipssolutio', '21 Mellencamp RoadPo', to_date('29-03-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (142820189, 'Zooey', 'Patillo', '0536532538', 'zooey.patillo@johnke', '41st StreetMiddletow', to_date('05-11-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (616795784, 'Kyra', 'Weller', '0596939251', 'kyra.weller@marriott', '98 Derek StreetLagun', to_date('11-10-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (596859064, 'Richie', 'Boorem', '0593505455', 'richie.boorem@its.co', '20 SnipesDes Plaines', to_date('02-08-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (813563203, 'Gates', 'Rhodes', '0538298518', 'gates.rhodes@zoneper', '64 Teng RoadBangalor', to_date('30-06-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (179630502, 'Mos', 'Lipnicki', '0534285982', 'mos.lipnicki@primuss', '60 Hatosy DriveZueri', to_date('30-12-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (650174181, 'Nickel', 'Lucas', '0531198071', 'nickell@americanland', '2 Collin AveWetzlar', to_date('27-06-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (774685438, 'Rolando', 'Lloyd', '0582791317', 'rolando@mqsoftware.c', '38 Arlington StreetW', to_date('25-10-1987', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (578289418, 'Janice', 'Janney', '0542180434', 'janice.janney@lloydg', '53 Getty StreetHampt', to_date('24-08-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (359947996, 'Geraldine', 'McFerrin', '0531376070', 'geraldine.mcferrin@v', '73 Demi StreetSantan', to_date('02-04-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (624946704, 'Debby', 'Duchovny', '0599681413', 'debby.duchovny@scher', '130 Peterborough Blv', to_date('15-11-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (870772763, 'Mika', 'Irons', '0572449068', 'mirons@americanexpre', '82 Luke StreetPortla', to_date('14-02-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (833368610, 'Thora', 'Gibson', '0596515411', 'thora@computersource', '92nd StreetGainesvil', to_date('14-11-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (213078687, 'Marlon', 'Torino', '0547192840', 'marlon@usgovernment.', '56 JuliaWarszawa', to_date('25-11-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (617803626, 'Peabo', 'Glover', '0551671886', 'peabog@ipsadvisory.d', '55 Shelton BlvdBreme', to_date('13-05-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (886541617, 'Rawlins', 'Conroy', '0577389582', 'rawlins@medsource.de', '71 Pat AveHamburg', to_date('15-04-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (899703325, 'Joey', 'Flack', '0536902306', 'joey@usdairyproducer', '43 Balthazar DriveTa', to_date('15-06-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (239068973, 'Jody', 'Chilton', '0597232019', 'jchilton@egroup.com', '24 Sylvian RoadAiken', to_date('13-04-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (692067497, 'Laura', 'May', '0560076171', 'laura.m@streetglow.e', '31st StreetValencia', to_date('19-07-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (140899169, 'Mary-Louise', 'Sedaka', '0548154360', 'marylouise.sedaka@co', '978 Chaka BlvdTualat', to_date('27-12-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (519251336, 'Graham', 'Patillo', '0539701733', 'graham@linacsystems.', '70 Rita StreetSwarth', to_date('27-10-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (607515527, 'Mykelti', 'Roy Parnell', '0545372279', 'mykelti.royparnell@u', '67 GordieKoeln', to_date('29-07-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (284698328, 'Leslie', 'Rippy', '0560386674', 'leslie.rippy@profitl', '33 Norderstedt RoadC', to_date('14-01-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (835782579, 'Adina', 'Bush', '0567545704', 'abush@esoftsolutions', '59 Sinise StreetCamb', to_date('30-09-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (706752831, 'Louise', 'Cazale', '0573354735', 'louisec@shufflemaste', '301 Hal StreetVenice', to_date('27-08-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (394178853, 'Bette', 'Malone', '0597398322', 'bette.malone@progres', '145 Karon AveHelsink', to_date('08-02-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (865234658, 'Gailard', 'Roth', '0573427950', 'gailard.roth@tropica', '78 Carlos StreetMend', to_date('29-09-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (122924782, 'Sinead', 'Miles', '0598300813', 'sinead.m@conquest.gr', '73 Remy RoadThessalo', to_date('07-05-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (145927171, 'Humberto', 'Hornsby', '0574533319', 'humbertoh@providence', '19 Dern StreetShenzh', to_date('08-03-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (251000829, 'Loretta', 'Geldof', '0588587335', 'lorettag@als.br', '38 Anjelica StreetNa', to_date('19-12-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (228186196, 'Parker', 'Coe', '0520385071', 'parker.coe@larkinent', '364 Giessen DriveHor', to_date('26-09-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (420590479, 'Salma', 'Rosas', '0524823038', 'salma.rosas@generalm', '44 Travolta RoadChib', to_date('01-11-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (747171108, 'Cledus', 'Schwarzenegger', '0587012634', 'cledus.schwarzenegge', '93 Zappacosta RoadKa', to_date('19-11-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (582785824, 'Elizabeth', 'Guinness', '0522755868', 'elizabeth.g@pfizer.c', '14 Meppel BlvdCharle', to_date('27-04-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (383331309, 'Kelly', 'Harary', '0567841922', 'kelly.harary@tilsonl', '18 Holland AveOyten', to_date('21-05-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (134024937, 'Buffy', 'Goldblum', '0558567651', 'buffy.goldblum@novar', '42 Phillips DriveMen', to_date('06-09-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (517027671, 'Joshua', 'O''Neal', '0584870440', 'joshua.oneal@viacom.', '10 Thomas StreetYama', to_date('29-05-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (961635098, 'Goran', 'Hopkins', '0551981222', 'goran.hopkins@fflcba', '55 Norton DrivePecs', to_date('11-03-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (124475793, 'Busta', 'England', '0586025693', 'busta.england@newmed', '302 McKean StreetOrl', to_date('08-04-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (875005373, 'Ryan', 'Rhys-Davies', '0596580234', 'ryan@sourcegear.uk', '455 Lynch BlvdWest S', to_date('18-03-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (686936415, 'Henry', 'Dourif', '0587710469', 'hdourif@servicelink.', '81st StreetNorth Poi', to_date('11-12-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (895069447, 'Ali', 'Choice', '0555965308', 'ali.choice@target.uk', '33 Keeslar DriveCobh', to_date('07-12-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (434134560, 'Edie', 'Liu', '0522314747', 'edie.liu@parker.com', '412 Bend StreetSan D', to_date('19-06-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (553053573, 'Tracy', 'Lattimore', '0579252485', 'tracy.lattimore@lina', '71 Dawson AveLahr', to_date('29-12-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (504376224, 'Steve', 'Skerritt', '0529949748', 'steve@tropicaloasis.', '9 SurseeSchenectady', to_date('18-06-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (152851236, 'Hector', 'Graham', '0551586068', 'hgraham@northhighlan', '56 Fornacette DriveP', to_date('06-06-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (590266488, 'Kimberly', 'Lloyd', '0520191892', 'kimberly.lloyd@alleg', '68 Wills BlvdHerndon', to_date('31-08-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (116564125, 'Rosanna', 'Chesnutt', '0542190280', 'rosanna.chesnutt@you', '314 Rosie StreetBiel', to_date('29-03-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (662412459, 'Simon', 'Clooney', '0576900674', 's.clooney@entelligen', '4 Hagerty DriveDubai', to_date('26-02-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (359685316, 'Rick', 'Saucedo', '0575098507', 'rick@diamondgroup.co', '48 Swoosie BlvdKyunn', to_date('08-01-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (423830430, 'Kelli', 'Zevon', '0547837595', 'kelli.z@egroup.uk', '52 Kretschmann RoadC', to_date('12-09-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (384875242, 'Sheena', 'Cobbs', '0587434877', 'sheena.cobbs@investm', '73 Wills StreetRanch', to_date('21-01-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (360945723, 'Robbie', 'Bean', '0556892216', 'robbie.bean@kroger.c', '30 Reed StreetSlmea', to_date('13-06-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (211506203, 'Natacha', 'Carrack', '0568727580', 'natacha.carrack@info', '314 Metcalf StreetLi', to_date('23-03-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (560895976, 'Sammy', 'Geldof', '0556294240', 'sammy.geldof@captech', '19 Llewelyn StreetMo', to_date('18-06-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (606989493, 'Morris', 'Wong', '0523336094', 'mwong@infovision.com', '524 Byrne RoadLowell', to_date('26-01-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (988611196, 'Howard', 'Collette', '0584510100', 'howard.collette@nrae', '43 Saudarkrokur AveD', to_date('06-02-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (898255498, 'Whoopi', 'Tah', '0523238086', 'whoopi.tah@ccb.es', '79 Lennox RoadToledo', to_date('05-02-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (801292271, 'Carolyn', 'Hector', '0569896300', 'carolyn.h@uem.com', '28 Presley RoadSprin', to_date('29-04-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (449039583, 'Ted', 'Downey', '0559966747', 'tdowney@datawarehous', '224 Armatrading Road', to_date('07-03-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (305199304, 'Cuba', 'Weiss', '0552001606', 'cuba.w@ksj.nl', '51 Mary-Louise RoadZ', to_date('31-05-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (375096553, 'Harrison', 'Carlton', '0566681586', 'harrison.carlton@ves', '93 Moraz StreetDroge', to_date('05-09-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (988206602, 'Alan', 'Connelly', '0588754535', 'alan.connelly@qssgro', '33rd StreetPasadena', to_date('16-02-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (378936331, 'Mos', 'Taylor', '0589198755', 'm.taylor@at.jp', '76 Albert DriveSappo', to_date('02-02-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (258710627, 'Rade', 'Noseworthy', '0547293823', 'rade.noseworthy@msdw', '21st StreetColumbia', to_date('03-05-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (409477082, 'Nicole', 'Estevez', '0529472819', 'nicole.e@prosperityb', '72nd StreetFort gord', to_date('07-03-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (504850343, 'Max', 'McAnally', '0527167963', 'max.mcanally@astute.', '97 Hannover StreetMa', to_date('23-09-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (352958905, 'Miko', 'Devine', '0554433864', 'miko.devine@onesourc', '72 Prague RoadSt Kil', to_date('01-10-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (179865058, 'Mike', 'Sledge', '0589794897', 'mikes@ataservices.de', '59 Pirapora bom Jesu', to_date('01-03-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (416400715, 'Wayman', 'Jackson', '0567324715', 'wayman.jackson@balch', '91st StreetSulzbach', to_date('21-01-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (508135001, 'Coley', 'Reilly', '0599534070', 'creilly@generalelect', '501 Preston StreetBa', to_date('18-06-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (605815385, 'Vin', 'Mirren', '0569798984', 'vin.mirren@telwares.', '99 BirminghamSouth H', to_date('28-09-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (632915045, 'Jonatha', 'Stuermer', '0579222181', 'jonatha.stuermer@fds', '43 LaPaglia BlvdRoth', to_date('16-11-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (967108709, 'Madeline', 'Logue', '0588548657', 'mlogue@speakeasy.com', '96 Snoqualmie RoadWe', to_date('11-05-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (855566871, 'Katie', 'Olin', '0582022729', 'katie.olin@provident', '50 Paltrow RoadTries', to_date('25-03-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (617187928, 'Laurence', 'Springfield', '0555071000', 'laurences@mitsubishi', '51 Brothers BlvdSt. ', to_date('09-02-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (862384357, 'Darren', 'Marx', '0542284541', 'darren.marx@campbell', '153 Davison RoadSnoq', to_date('24-05-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (712253430, 'Gord', 'Reid', '0529522328', 'gord.reid@hewlettpac', '98 Pam DriveGrand-me', to_date('29-11-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (327572937, 'Todd', 'Gayle', '0587211697', 'tgayle@monarchcasino', '18 Shenzhen BlvdNort', to_date('24-12-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (997042482, 'Cheech', 'Wagner', '0545600843', 'cheech.w@lemproducts', '3 Farnham RoadMilfor', to_date('31-10-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (947447478, 'Jeremy', 'Eat World', '0580661953', 'jeremye@accuship.com', '42nd StreetLehi', to_date('11-12-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (302883694, 'Kid', 'Khan', '0548783841', 'kid.khan@ufs.nl', '18 Frances RoadDen H', to_date('11-12-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (359020902, 'Dan', 'Yorn', '0536553086', 'dan.yorn@ultimus.com', '431 Fender RoadPhoen', to_date('29-09-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (162788221, 'Taye', 'McGoohan', '0530704425', 'taye.mcgoohan@fsffin', '43 Jackie RoadForest', to_date('14-05-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (811616794, 'Raymond', 'Dzundza', '0539789099', 'r.dzundza@sfgo.za', '44 Elvis DriveCape t', to_date('12-12-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (558414787, 'Julie', 'Peebles', '0570431650', 'julie.peebles@execus', '66 Wright RoadHanove', to_date('05-09-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (512089472, 'Radney', 'Kleinenberg', '0542585070', 'radney.kleinenberg@a', '1 Wade StreetHappy V', to_date('21-07-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (481955115, 'Mia', 'Buffalo', '0551876527', 'mia.buffalo@max.jp', '746 Ciudad del Este ', to_date('13-10-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (776213891, 'Angie', 'Curtis-Hall', '0599966885', 'angie.curtishall@acc', '63 LaMond RoadHiller', to_date('17-06-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (691546607, 'Rose', 'Noseworthy', '0585898061', 'rose@perfectorder.co', '141 TurturroBismarck', to_date('23-09-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (724567455, 'Michael', 'Kapanka', '0586644391', 'michael.kapanka@tmar', '3 Baker AveCedar Rap', to_date('27-11-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (579846464, 'Jon', 'Deejay', '0595425674', 'jon@epiqsystems.ch', '58 Zappacosta RoadBa', to_date('06-06-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (689909495, 'Sandra', 'Numan', '0547805624', 'sandra.numan@hondamo', '8 Heather StreetPhoe', to_date('28-08-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (237202063, 'Alex', 'Fariq', '0570582452', 'afariq@cws.com', '50 Rhona RoadGranada', to_date('05-09-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (722837047, 'Jet', 'Sawa', '0562073966', 'jet@priorityleasing.', '83 HecheRichmond', to_date('16-11-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (549493698, 'Gord', 'Nelson', '0532138269', 'gord.nelson@stiknowl', '30 Perrineau StreetB', to_date('24-10-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (106135727, 'Owen', 'Scheider', '0564366976', 'o.scheider@dillards.', '94 Lynette BlvdMilfo', to_date('28-05-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (560287870, 'Garth', 'Vance', '0586227067', 'garth@americanexpres', '781 Columbia AveTrar', to_date('23-09-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (883352788, 'Rawlins', 'Phillippe', '0527088231', 'rawlins.phillippe@ro', '978 Hounslow StreetN', to_date('01-08-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (801444708, 'Robin', 'Theron', '0535692664', 'robin.theron@doralde', '87 Shawnee RoadAuckl', to_date('01-01-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (649642534, 'Andrae', 'urban', '0536712387', 'andrae.urban@advance', '24 Elizabeth StreetM', to_date('28-08-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (130649999, 'Chaka', 'Branch', '0530515937', 'chakab@faef.br', '61st StreetSao jose ', to_date('10-07-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (647853816, 'Sean', 'Preston', '0521577120', 'sean.preston@prahs.c', '82 Cesena RoadTowson', to_date('03-07-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (510550199, 'Cliff', 'Cumming', '0548321978', 'cliffc@entelligence.', '23 LauraKuraby', to_date('14-03-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (387684814, 'Tea', 'Geldof', '0543429745', 'tea.geldof@tropicalo', '128 Silverman BlvdHi', to_date('26-04-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (373231071, 'Omar', 'Sanders', '0528904674', 'omar@capitalautomoti', '15 Edison StreetMaid', to_date('26-02-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (869062772, 'Tilda', 'Piven', '0538070672', 't.piven@technica.com', '72 BloemfonteinCerri', to_date('10-09-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (980157606, 'Lucinda', 'Folds', '0593215843', 'lucinda.folds@cardin', '12 Stavanger StreetK', to_date('13-09-1960', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (213824396, 'Cheryl', 'Bush', '0550310874', 'cheryl.bush@trafficm', '16 Trace StreetMiddl', to_date('13-08-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (589087677, 'Juice', 'Donelly', '0590901554', 'j.donelly@cendant.co', '98 Gin RoadFramingah', to_date('31-05-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (610500243, 'Moe', 'Paige', '0529436103', 'moe.paige@kingland.c', '709 Donovan StreetBa', to_date('06-06-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (579447207, 'Graham', 'Presley', '0533610429', 'graham.presley@cyner', '83 Bates RoadBay Sho', to_date('08-09-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (205404893, 'Alfie', 'Uggams', '0568299082', 'alfie.uggams@employe', '31st StreetSaint Oue', to_date('25-04-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (730131503, 'Scott', 'Tucci', '0590847307', 'scott.tucci@maverick', '73 Warren DriveRtp', to_date('29-11-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (315723206, 'Benjamin', 'Penders', '0572569527', 'benjamin.penders@afs', '80 BalkUdine', to_date('19-06-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (606192787, 'Charles', 'Perez', '0564451755', 'charles@mre.com', '52 Nils DrivePompton', to_date('03-09-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (261453365, 'Geoff', 'Crow', '0576685283', 'geoff.crow@gna.br', '66 Diddley AveSao pa', to_date('16-01-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (515076394, 'Balthazar', 'Keener', '0524334724', 'balthazark@connected', '810 Lahr RoadRaleigh', to_date('22-06-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (652775670, 'Yaphet', 'Hopkins', '0575720796', 'yaphet.hopkins@montp', '40 Busta DriveMissis', to_date('22-11-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (882458516, 'Marie', 'Horton', '0576431728', 'm.horton@nuinfosyste', '1 Blue bell RoadGold', to_date('15-01-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (264250868, 'Shannyn', 'Navarro', '0563607229', 'shannyn.navarro@tele', '25 Zooey DriveVallau', to_date('25-08-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (749309034, 'Kevn', 'Gaynor', '0557606279', 'kevn.gaynor@biosite.', '74 Johansson RoadSac', to_date('23-10-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (479816079, 'Tom', 'Page', '0596858572', 'tom.page@scheringplo', '14 Bruce RoadSt. Pet', to_date('09-05-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (906935306, 'Bret', 'Theron', '0549148745', 'bret.theron@tropical', '982 Lavigne StreetEi', to_date('24-08-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (918376496, 'Marty', 'DeGraw', '0588835314', 'marty.degraw@pfizer.', '16 Mason RoadTulsa', to_date('13-05-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (590142450, 'Mira', 'Lewis', '0544382956', 'mira.lewis@newmedia.', '72 Oszajca DriveSpar', to_date('03-06-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (302128747, 'Jose', 'Ammons', '0559561816', 'jose.ammons@carteret', '5 Takapuna RoadBelmo', to_date('31-12-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (136082895, 'Chanté', 'Evanswood', '0556645621', 'chante@captechventur', '13 Gugino StreetWate', to_date('21-01-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (591691784, 'Tori', 'Langella', '0565954380', 'tori.langella@telech', '100 HowieNorth bethe', to_date('04-03-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (563119002, 'Alfred', 'Stigers', '0537196046', 'alfred.stigers@cimal', '90 Sulzbach DrivePra', to_date('23-09-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (233778896, 'Lloyd', 'Springfield', '0558308212', 'lloyds@nlx.it', '52 Allan DriveGuamo', to_date('23-05-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (933741466, 'Roscoe', 'Balin', '0583601493', 'rbalin@gtp.com', '64 Irati RoadFraming', to_date('18-08-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (226930564, 'Naomi', 'Bracco', '0576705934', 'naomi.bracco@unileve', '44 Morioka DriveLibe', to_date('08-02-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (227798879, 'Micky', 'Colon', '0580308252', 'micky.colon@neogen.d', '748 Springville Road', to_date('10-05-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (152434577, 'Gary', 'Austin', '0524467778', 'gaustin@ezecastlesof', '89 Saucedo RoadFlowe', to_date('19-03-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (897245844, 'Harrison', 'Perrineau', '0575339505', 'harrison.perrineau@b', '86 Santiago StreetSh', to_date('14-07-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (668108605, 'Rita', 'Palminteri', '0584102064', 'rita@gsat.uk', '35 Pryce RoadWarring', to_date('20-01-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (129559122, 'Gailard', 'Domino', '0522373886', 'gailard.domino@sbc.c', '35 Carlene AveRoches', to_date('14-11-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (464691516, 'Bonnie', 'Cockburn', '0523169416', 'bonnie.cockburn@cale', '54 Pete RoadMainteno', to_date('30-04-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (428981116, 'Jann', 'Weisberg', '0526030576', 'jann.weisberg@floorg', '58 Luongo AveGliwice', to_date('17-02-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (902680441, 'Dick', 'Katt', '0595625025', 'd.katt@vivendiuniver', '59 Stallone BlvdNord', to_date('19-03-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (995102445, 'Rupert', 'Smith', '0520029715', 'r.smith@scripnet.com', '77 NicksCromwell', to_date('15-07-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (596687100, 'Angela', 'McCain', '0545888949', 'angela.mccain@kramon', '91st StreetKarlstad', to_date('22-06-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (304631430, 'Luis', 'Boorem', '0573779571', 'luis@cns.dk', '51 Alannah StreetPan', to_date('03-08-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (253660155, 'Allison', 'Crow', '0556567081', 'allison.c@gci.uk', '69 Loggins StreetNew', to_date('08-05-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (825589019, 'Collin', 'Klein', '0596095888', 'collin.klein@america', '68 Schiavelli BlvdDr', to_date('06-04-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (293395846, 'Mika', 'Posey', '0553854332', 'mika.p@hitechpharmac', '78 Gilbert RoadCarac', to_date('14-05-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (672173613, 'Kieran', 'Griffiths', '0589822625', 'kgriffiths@spectrum.', '86 Rhames RoadEindho', to_date('02-07-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (800947932, 'Alana', 'Richter', '0520399818', 'alana@pra.com', '30 Stephanie BlvdLex', to_date('13-11-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (971253183, 'Ernie', 'Rosas', '0565222697', 'ernier@sht.de', '12 Basinger RoadDarm', to_date('06-02-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (571964290, 'Roberta', 'Jolie', '0525548810', 'roberta.jolie@sms.co', '53 Parker StreetElki', to_date('11-04-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (237550382, 'Bridget', 'Wright', '0570894943', 'bridgetw@calence.com', '76 Guadalajara RoadR', to_date('26-03-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (196774196, 'Holland', 'Lang', '0592788442', 'holland.lang@daimler', '75 WainwrightSan Mat', to_date('05-05-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (243336161, 'Nicole', 'Quinones', '0538206658', 'nicole.quinones@mind', '89 Shearer DriveTerr', to_date('03-01-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (815079157, 'Shannyn', 'Atkinson', '0551684509', 'satkinson@ubp.il', '77 Rupert RoadOr-yeh', to_date('19-04-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (439108826, 'Carol', 'Branch', '0557805795', 'carol.branch@tropica', '95 Al BlvdNorth Wale', to_date('31-08-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (555439745, 'Franz', 'McGinley', '0550802068', 'franz.mcginley@bashe', '28 Cathy DriveAnière', to_date('05-09-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (187932356, 'Shawn', 'Mohr', '0595848113', 'shawn@bluffcitysteel', '221 Adrien RoadLubbo', to_date('16-10-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (380693543, 'Nathan', 'Johansson', '0567513687', 'njohansson@fab.com', '30 Horton AveSchaumb', to_date('21-10-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (519115066, 'Rowan', 'Bridges', '0596418005', 'r.bridges@formatech.', '7 JuliaPottendorf', to_date('22-11-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (886763148, 'Derrick', 'Wells', '0554738141', 'derrickw@dcgroup.br', '72nd StreetJuazeiro', to_date('08-12-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (909692263, 'Vanessa', 'McKennitt', '0553551803', 'vanessa.mckennitt@ci', '67 Berlin DriveBrook', to_date('17-05-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (345166422, 'Eliza', 'Apple', '0571059680', 'eliza@ungertechnolog', '88 Brothers StreetAi', to_date('09-10-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (727135472, 'Kurtwood', 'Thornton', '0550328156', 'kurtwood@daimlerchry', '88 Eastwood DriveZür', to_date('16-10-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (141282302, 'Alfie', 'Lange', '0588589935', 'alfie@gillette.it', '37 Elias StreetGatti', to_date('06-08-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (555266510, 'Edgar', 'Witherspoon', '0578940181', 'edgar.witherspoon@cw', '71st StreetVejle', to_date('02-08-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (252534268, 'Joey', 'Chestnut', '0559703305', 'joey.chestnut@epamsy', '69 Cummings RoadNaes', to_date('04-03-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (314279440, 'Rita', 'Tomlin', '0525535250', 'rita.tomlin@tps.fr', '64 Emma StreetVelizy', to_date('12-06-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (281928156, 'Pablo', 'Aniston', '0576225212', 'pablo.aniston@americ', '960 MifuneKerava', to_date('12-08-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (720802953, 'Arnold', 'Ali', '0543632660', 'arnold.ali@commworks', '56 Jay RoadLongueuil', to_date('11-08-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (449889052, 'Maura', 'Minogue', '0583585377', 'maura.minogue@sci.jp', '55 Dunn DriveNagasak', to_date('15-08-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (934146705, 'Marc', 'Ronstadt', '0594383741', 'marc.ronstadt@sm.com', '74 Freddie DriveFost', to_date('12-04-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (180260530, 'Albertina', 'Place', '0538134576', 'aplace@smartdrawcom.', '78 Pryce StreetMagst', to_date('17-04-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (791571885, 'Maury', 'Costello', '0572707257', 'maury.costello@sandy', '16 Warden DriveNew o', to_date('01-01-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (765141502, 'Rik', 'Pfeiffer', '0540790783', 'rik.pfeiffer@scjohns', '153 Middletown RoadB', to_date('20-07-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (741630052, 'Alana', 'Holland', '0525785881', 'alana@monitronicsint', '66 Branch StreetMain', to_date('21-08-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (408887477, 'Samantha', 'Mould', '0581035210', 'samantha.mould@mwp.c', '36 Copenhagen RoadPo', to_date('07-12-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (447025734, 'Demi', 'Dean', '0579863006', 'demi.dean@envisionte', '82 Tripplehorn RoadS', to_date('17-08-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (919668566, 'Geena', 'Gyllenhaal', '0539399232', 'geena.gyllenhaal@ser', '50 Malkovich DriveSp', to_date('04-04-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (777766872, 'Harvey', 'Boothe', '0569420585', 'hboothe@employerserv', '50 Wine RoadVenice', to_date('14-02-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (137303403, 'Helen', 'Serbedzija', '0528108723', 'h.serbedzija@traffic', '7 Kennedy DriveWest ', to_date('28-03-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (609721920, 'Anjelica', 'Lynne', '0567589823', 'anjelica.lynne@progr', '89 Ramsey BlvdSeatle', to_date('19-04-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (207311408, 'Fionnula', 'White', '0593639491', 'fionnulaw@printingfo', '413 McCracken RoadCh', to_date('04-07-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (299400522, 'Gilbert', 'Whitman', '0548079918', 'gilbert.w@electrical', '787 Alana StreetChar', to_date('27-06-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (235740365, 'Isaac', 'Moorer', '0552067554', 'isaac.moorer@denaliv', '62 Forrest BlvdSloug', to_date('20-01-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (429375037, 'Giovanni', 'Keitel', '0575873300', 'giovanni.keitel@gene', '201 Arlington BlvdKo', to_date('23-09-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (582653293, 'Peter', 'Bancroft', '0578588741', 'peter.bancroft@cws.h', '59 Owen AveNorth Poi', to_date('09-12-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (942497422, 'Caroline', 'Cantrell', '0596387690', 'caroline.c@allegiant', '26 Connick StreetBat', to_date('12-09-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (409406958, 'Kyle', 'Avital', '0570729450', 'kyle.avital@yumbrand', '1 Masur BlvdUniversi', to_date('05-06-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (384200842, 'Shannyn', 'LaSalle', '0570394463', 'shannyn.lasalle@gtp.', '2 Longview AveNara', to_date('27-02-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (842479128, 'Daryle', 'Jamal', '0551830893', 'daryle.jamal@morganr', '78 Roddy StreetPader', to_date('16-01-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (210362659, 'Vertical', 'Presley', '0527634162', 'verticalp@atlanticne', '39 Dinslaken DriveLe', to_date('01-03-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (378235774, 'Kid', 'Pleasence', '0532021316', 'kidp@coldstonecreame', '66 Cole StreetDuesse', to_date('04-04-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (831143606, 'King', 'Rawls', '0530271191', 'king.rawls@integrate', '63rd StreetObfelden', to_date('08-10-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (349204048, 'Hilary', 'Visnjic', '0568724599', 'hilary@businessplus.', '9 Gleeson RoadSt. Lo', to_date('12-03-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (250846779, 'Johnny', 'Hackman', '0562707864', 'johnnyh@bashen.be', '21 Parker RoadBruxel', to_date('15-06-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (994736896, 'Jonathan', 'Wood', '0584300840', 'jonathan.wood@nexxtw', '83 Gary DriveLucca', to_date('21-02-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (673666777, 'Clay', 'Swinton', '0597250891', 'clays@coadvantageres', '655 VisselhövedeEhni', to_date('12-03-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (966318049, 'Josh', 'Orlando', '0568637270', 'josh.orlando@saltgro', '238 Coburg DriveLein', to_date('23-09-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (182751848, 'Alice', 'Tate', '0599892245', 'alice.tate@sears.com', '59 Caroline DriveDou', to_date('06-02-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (340151288, 'Gailard', 'Lynskey', '0554278202', 'gailard.lynskey@proc', '97 Mönchengladbach B', to_date('14-01-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (504560822, 'Ming-Na', 'Hampton', '0526400523', 'mingna.hampton@natur', '59 Russell DriveSulz', to_date('01-02-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (497473243, 'Curt', 'Akins', '0576279093', 'curt.akins@unit.com', '81 Miller DriveMecha', to_date('11-05-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (944938337, 'Gabriel', 'Ceasar', '0593207776', 'gabriel.c@limitedbra', '885 Ammons BlvdSanta', to_date('01-07-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (405450694, 'Julio', 'Kramer', '0562836888', 'juliok@tropicaloasis', '82 Klugh RoadZuerich', to_date('07-04-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (947288590, 'Queen', 'Driver', '0555952362', 'queen.driver@mms.pe', '13 Michelle BlvdLima', to_date('31-05-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (834919245, 'Tommy', 'Dillane', '0582141392', 'tommy.dillane@americ', '63 NicholasGuadalaja', to_date('20-01-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (750927412, 'Vivica', 'Shand', '0538660739', 'vivica.shand@atg.com', '78 Hamilton StreetPa', to_date('02-09-1951', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (755938204, 'Maxine', 'Blaine', '0589205899', 'mblaine@monarchcasin', '6 San Antonio AveRic', to_date('21-01-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (951651032, 'Jet', 'Tyler', '0585777818', 'jtyler@oss.au', '99 Nelligan BlvdMelb', to_date('18-12-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (802083312, 'Forest', 'McNarland', '0582294182', 'fmcnarland@accessus.', '80 Amos StreetChapec', to_date('25-06-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (674918060, 'Todd', 'Cross', '0580370515', 'todd.cross@spinnaker', '27 Los Angeles AveSc', to_date('25-12-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (313155436, 'Debbie', 'Duncan', '0529553564', 'debbie.duncan@typhoo', '35 Chet AveJuazeiro', to_date('26-04-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (419288079, 'Gordie', 'Milsap', '0588668203', 'gordie.milsap@lempro', '954 Zuerich StreetFo', to_date('24-11-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (366343244, 'Johnette', 'Holland', '0572976466', 'j.holland@gcd.com', '40 Galecki StreetRed', to_date('20-04-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (778303327, 'Brad', 'Easton', '0548282013', 'b.easton@conquestsys', '11 CerritosSantiago', to_date('11-02-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (413831858, 'Denzel', 'Cube', '0532693023', 'denzel@adolph.com', '64 Ohtsu RoadSalem', to_date('11-09-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (515300589, 'Hal', 'Garza', '0571927148', 'hal.garza@millersyst', '3 Sledge BlvdEl Paso', to_date('06-07-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (905681181, 'Nicolas', 'Weisz', '0522285000', 'nicolas.weisz@gra.nl', '18 Sydney DriveUtrec', to_date('14-11-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (329900476, 'Brian', 'Pastore', '0573360495', 'bpastore@biosite.com', '86 Cook DriveShrevep', to_date('30-03-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (214158330, 'Cate', 'Hauser', '0563435299', 'chauser@credopetrole', '51 Firth DriveManche', to_date('15-08-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (769300586, 'Juan', 'Hoffman', '0573060707', 'juan.h@elitemedical.', '94 Miki StreetPorto ', to_date('21-05-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (272359299, 'Rosco', 'Astin', '0526717061', 'rosco.astin@nsd.dk', '86 Chapman StreetSor', to_date('30-08-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (571147818, 'Jared', 'Gellar', '0537080521', 'jaredg@avr.com', '79 Tcheky AveBradent', to_date('30-06-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (617650844, 'Lili', 'Guest', '0549489198', 'lguest@acsis.com', '53 PaulMobile', to_date('03-11-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (748086158, 'Miguel', 'Potter', '0533442476', 'miguel.potter@simply', '197 DiddleyRotterdam', to_date('21-06-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (135572787, 'Anthony', 'Carnes', '0599519265', 'anthony@ubp.com', '51st StreetRichardso', to_date('04-01-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (115840139, 'Drew', 'Piven', '0589061228', 'drew.p@allstar.com', '23rd StreetSt. Louis', to_date('17-03-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (949047821, 'Daryl', 'Coburn', '0589484474', 'darylc@trainersoft.c', '24 Tempest StreetSto', to_date('21-12-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (496484333, 'Bernie', 'Pantoliano', '0576473477', 'b.pantoliano@ultimus', '476 Overstreet RoadT', to_date('12-12-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (604417034, 'Meg', 'Berkeley', '0522503690', 'meg@teamstudio.uk', '46 Anna RoadOxon', to_date('25-08-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (482161968, 'Anna', 'Brock', '0583074656', 'annab@netnumina.ch', '35 Nanci DriveZurich', to_date('22-04-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (514054546, 'Gavin', 'Lynne', '0565061521', 'gavin.lynne@idlabel.', '133 Cockburn StreetR', to_date('29-09-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (356886576, 'Sam', 'Spacek', '0578934154', 'sam.spacek@gha.uk', '14 DerrickBerkshire', to_date('31-08-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (116737317, 'Jeff', 'Palmieri', '0592919201', 'jeffp@hcoa.com', '36 Milano RoadAkron', to_date('25-02-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (758098653, 'Ted', 'Cook', '0584087683', 'ted.cook@sandyspring', '13 Bragg DriveBuffal', to_date('12-10-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (207347544, 'Night', 'Neuwirth', '0561335314', 'night.neuwirth@glmt.', '47 CaanWaalwijk', to_date('01-01-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (919497083, 'Joely', 'Nelligan', '0527858941', 'joely.nelligan@base.', '25 Wolf DriveRiverda', to_date('05-10-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (270363284, 'Nicholas', 'Burns', '0529149421', 'nicholas.burns@jsa.c', '88 Peter AveResearch', to_date('02-02-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (275351971, 'Collin', 'Caan', '0560606105', 'collin@glacierbancor', '13rd StreetChangwon-', to_date('14-08-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (793697568, 'Joseph', 'Allen', '0591115321', 'joseph.allen@tigris.', '7 Dorry StreetSingap', to_date('11-06-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (171117624, 'Kevin', 'Posener', '0532498666', 'kevin@tmt.com', '21st StreetDerwood', to_date('29-08-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (178211795, 'Bernard', 'Chandler', '0582320411', 'bernard.chandler@trx', '690 CarreyEnglewood', to_date('20-09-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (784497084, 'Nile', 'Adkins', '0594723580', 'nile.adkins@ssi.com', '64 Timonium RoadMayf', to_date('14-11-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (851533997, 'Victor', 'Fishburne', '0551631599', 'victor.fishburne@emt', '19 Holliston StreetS', to_date('09-08-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (952094084, 'Shirley', 'O''Hara', '0588990145', 'shirley.ohara@fnb.it', '704 Samrand RoadTori', to_date('12-10-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (179950333, 'Mac', 'Carrey', '0532506117', 'mac.carrey@jewettcam', '72nd StreetSt. Peter', to_date('08-11-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (595024753, 'Vondie', 'McLachlan', '0527098748', 'vondie.m@tilsonhr.co', '66 von Sydow RoadGra', to_date('03-01-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (869296845, 'Larnelle', 'Schock', '0547664374', 'larnelle@ois.com', '93 Tustin AveShrevep', to_date('25-09-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (535975740, 'Temuera', 'Li', '0546554613', 'temuera@knightsbridg', '51 O''Connor RoadBerg', to_date('06-09-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (869810116, 'Jackie', 'Finn', '0541402993', 'jackie.finn@scripnet', '77 Carrington Street', to_date('20-02-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (825149858, 'Geoffrey', 'Love', '0556949442', 'geoffrey@elmco.com', '68 Santana RoadRtp', to_date('24-02-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (214482676, 'Ernie', 'Gooding', '0563681813', 'ernie@ciwservices.jp', '44 IsaacsMorioka', to_date('01-03-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (905792119, 'Sal', 'Diehl', '0585765441', 'sald@newtoninteracti', '527 Brussel AveMonum', to_date('12-07-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (403208661, 'Aida', 'Stiles', '0525517324', 'astiles@ibfh.de', '1 CarlingfordWetzlar', to_date('23-03-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (991207433, 'Cheech', 'Hingle', '0588068037', 'chingle@avr.com', '4 Apple StreetNew Yo', to_date('23-11-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (953237471, 'Chi', 'Fisher', '0540101488', 'c.fisher@ezecastleso', '56 Campbell AveOyten', to_date('05-01-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (115714750, 'Barbara', 'Yorn', '0597128575', 'barbara.yorn@sprint.', '96 Terrence AveVilni', to_date('03-06-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (330470584, 'Dom', 'Ojeda', '0557819339', 'domo@veritekinternat', '88 ReaDuluth', to_date('15-09-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (294298351, 'Mel', 'Cornell', '0567490433', 'melc@clorox.de', '97 West Sussex BlvdD', to_date('16-08-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (996027713, 'Julie', 'Supernaw', '0558395163', 'julie.supernaw@beste', '83 Mahoney BlvdIrvin', to_date('04-02-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (474737518, 'Saffron', 'Kilmer', '0520914755', 'saffron.kilmer@woron', '92 Berlin DriveOak P', to_date('26-02-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (217280363, 'Hank', 'DiBiasio', '0539846412', 'hank.dibiasio@seafox', '45 Heather RoadMorio', to_date('20-08-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (276658821, 'Amanda', 'Fariq', '0532168373', 'amanda@afs.com', '16 MurphyGreenville', to_date('09-11-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (751880443, 'Gino', 'Monk', '0552213525', 'gino.monk@telwares.c', '25 Nikka RoadLaurel', to_date('22-09-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (751921020, 'Milla', 'Chapman', '0578477188', 'milla@aquascapedesig', '38 Cary StreetEchiro', to_date('21-06-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (411522632, 'Mira', 'Swinton', '0541769539', 'mira.swinton@pds.com', '23 Isaiah AveDublin', to_date('06-12-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (501774140, 'Kyra', 'Greene', '0543888700', 'k.greene@trafficmana', '29 Larter StreetNico', to_date('05-04-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (723010786, 'Carla', 'Travolta', '0541401448', 'carla.travolta@procl', '92nd StreetKoppl', to_date('25-04-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (286048247, 'Bryan', 'Pearce', '0549828004', 'bryan.pearce@airmeth', '23 Margulies DriveBr', to_date('17-11-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (340355003, 'Rufus', 'Bonneville', '0576866448', 'rufusb@enterprise.co', '56 Eliza DriveOmaha', to_date('05-11-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (921153447, 'Lydia', 'Rhames', '0539101340', 'lydia.rhames@painted', '35 Sinise BlvdTsu', to_date('29-06-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (605351268, 'Terri', 'Field', '0545625550', 'terri.f@usdairyprodu', '190 Ball StreetMiche', to_date('03-06-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (311783430, 'Walter', 'Nash', '0599509145', 'wnash@networkdisplay', '8 Hal RoadBrisbane', to_date('27-01-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (667498153, 'Bernie', 'Mollard', '0579497571', 'bmollard@infinity.co', '78 Brickell StreetCh', to_date('17-08-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (847052090, 'Jerry', 'Ferrer', '0598351538', 'jerryf@seafoxboat.mo', '394 Walken StreetMac', to_date('03-09-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (121670912, 'Neve', 'Dalton', '0570363663', 'neve@seafoxboat.com', '68 Rizzo DriveGlenda', to_date('02-04-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (812565282, 'Patty', 'Griggs', '0597409728', 'p.griggs@fordmotor.d', '96 Emilio DriveWaldb', to_date('30-12-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (384551100, 'Hugo', 'Minogue', '0588690999', 'h.minogue@providence', '93 Niven RoadBirmens', to_date('19-09-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (144935536, 'Dave', 'Branch', '0551639489', 'dave.branch@tmt.de', '71 Sugar LandIlmenau', to_date('17-04-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (128514981, 'Curt', 'Cusack', '0540994960', 'curtc@at.pt', '309 Mainz-kastel Dri', to_date('02-05-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (872176788, 'Matt', 'Brooke', '0566457413', 'mbrooke@kellogg.es', '162 Nepean BlvdSant ', to_date('30-01-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (796808759, 'Darius', 'Fiennes', '0578178927', 'darius@coadvantagere', '6 HuntingtonSarasota', to_date('08-07-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (642240490, 'Debbie', 'Brooks', '0585507319', 'debbie.brooks@johnso', '31 Jimmy StreetHiros', to_date('04-02-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (850686802, 'Rebecca', 'Leachman', '0552866346', 'rebecca.leachman@mul', '392 Chilton StreetLi', to_date('01-12-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (951414878, 'Cuba', 'Harmon', '0595445184', 'cuba.harmon@outsourc', '565 Sedgwick AveBroo', to_date('15-11-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (390685535, 'Lauren', 'Cocker', '0571055735', 'lcocker@gha.com', '62nd StreetJacksonvi', to_date('17-10-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (596597833, 'Carl', 'Carmen', '0583715331', 'carl@keith.jp', '81st StreetKagoshima', to_date('27-03-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (659837175, 'Rickie', 'Kinney', '0560099935', 'rickie.kinney@servic', '68 Johnnie StreetNeu', to_date('31-08-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (554527112, 'Mena', 'Richards', '0593948288', 'mena.richards@coridi', '67 Imbruglia StreetO', to_date('13-02-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (463485464, 'Oliver', 'Myers', '0550546122', 'oliver.myers@aoltime', '89 Callow StreetMats', to_date('13-03-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (288148854, 'Viggo', 'Posener', '0531294975', 'viggo.posener@base.c', '72 Brampton StreetHa', to_date('05-12-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (662961970, 'Michael', 'Coverdale', '0595699433', 'michael.coverdale@ba', '13 Fehr RoadFair Law', to_date('27-05-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (464273123, 'Fionnula', 'Osbourne', '0586892316', 'fionnula.o@fiberlink', '33 Armatrading RoadN', to_date('14-11-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (597172182, 'Julia', 'Bracco', '0539562573', 'j.bracco@carteretmor', '30 Munich RoadMarian', to_date('20-03-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (112371177, 'Val', 'Assante', '0533851910', 'val@novartis.com', '20 Kinski DriveMinne', to_date('13-01-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (413997128, 'Naomi', 'Duncan', '0589148297', 'naomi.duncan@berkshi', '370 Recife RoadSappo', to_date('20-09-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (573372169, 'Anne', 'Penn', '0586103664', 'anne.penn@globalwire', '31 Marie RoadJun-nam', to_date('16-12-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (244487381, 'Terence', 'Pullman', '0553454521', 'terence@prosperityba', '87 Green RoadStockho', to_date('26-08-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (563475632, 'Mili', 'Bell', '0579140472', 'milib@woronocobancor', '33 Hawn StreetGreen ', to_date('03-08-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (417582361, 'King', 'Kleinenberg', '0596745580', 'king.kleinenberg@asa', '533 Swinton RoadGote', to_date('09-10-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (382284930, 'Emma', 'Fonda', '0568419390', 'emma.fonda@printcafe', '74 Uma StreetMt. Lau', to_date('22-02-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (888906304, 'Ricardo', 'Costner', '0550100993', 'ricardo.costner@fibe', '332 Mykelti DriveBad', to_date('06-08-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (714477015, 'Colm', 'Connelly', '0552475286', 'colm.connelly@cmi.jp', '63 Sobieski StreetFu', to_date('04-12-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (538544311, 'Rick', 'Huston', '0538514934', 'rick.huston@signalpe', '33 Fukushima DriveCa', to_date('23-08-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (314514324, 'Seann', 'Shepard', '0593590302', 'seann.shepard@bluffc', '93 Stockholm RoadDal', to_date('21-10-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (279754521, 'Tanya', 'Smurfit', '0534071601', 'tsmurfit@ecopy.com', '80 HackmanLos Angele', to_date('05-12-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (703394240, 'Kazem', 'Oates', '0566670713', 'koates@kwraf.za', '40 Altstätten Street', to_date('22-08-1993', 'dd-mm-yyyy'));
commit;
prompt 700 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (231388652, 'Gil', 'Cleese', '0532030895', 'gil.cleese@ris.it', '9 Clooney StreetVill', to_date('09-05-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (361855385, 'Lance', 'Amos', '0546602979', 'lance.amos@topicsent', '786 Macy DriveSnoqua', to_date('18-12-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (705868228, 'Juliana', 'Redford', '0571390078', 'juliana.redford@chip', '98 Garry StreetOlszt', to_date('01-12-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (537470693, 'Kiefer', 'McClinton', '0581662844', 'kiefer.m@faef.com', '21 Ferrer DriveAnnan', to_date('14-07-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (625507880, 'Seth', 'Eldard', '0572967619', 'seth.eldard@bis.it', '90 Fort Saskatchewan', to_date('11-12-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (912035052, 'Miriam', 'Rhames', '0592612974', 'miriam.rhames@valley', '100 Angelina StreetE', to_date('30-12-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (234659034, 'Bret', 'Gary', '0584960849', 'bret.gary@idas.uk', '53 BlanchettHounslow', to_date('29-07-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (259072853, 'Kathy', 'Morse', '0561234561', 'kathy.morse@volkswag', '59 Cruz StreetWashin', to_date('09-03-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (752621705, 'Tara', 'Robards', '0527795324', 'tara.robards@infopro', '72 Montreal BlvdKobl', to_date('07-12-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (861892572, 'Trey', 'Sarandon', '0525964893', 'tsarandon@dsp.com', '228 Thornton RoadGra', to_date('23-08-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (332990580, 'Sara', 'Moore', '0575944812', 'sara.moore@voicelog.', '30 Chrissie RoadKago', to_date('23-02-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (219529975, 'Sally', 'Cassidy', '0568279299', 's.cassidy@lms.com', '93 Gertner RoadMosco', to_date('07-05-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (548455601, 'Hilary', 'Hayes', '0591151495', 'hilary.hayes@shar.uk', '64 Ness DriveNewcast', to_date('18-09-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (609056245, 'Ming-Na', 'Jenkins', '0556283812', 'm.jenkins@dbprofessi', '100 McElhone DrivePa', to_date('03-04-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (254279826, 'Harrison', 'Costa', '0593596381', 'harrison.costa@parke', '20 Joey RoadTempe', to_date('17-06-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (844176169, 'Maceo', 'Aiken', '0554894475', 'maceo.aiken@simplyce', '23rd StreetRochester', to_date('29-06-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (128080684, 'Rip', 'Craven', '0528681013', 'ripc@campbellsoup.co', '70 Rochester StreetM', to_date('04-10-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (792078922, 'Richard', 'Tanon', '0542487876', 'richard.tanon@kingla', '55 Newton-le-willows', to_date('23-08-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (711765883, 'Micky', 'Lorenz', '0550816482', 'micky@ctg.uk', '72 Sapporo StreetEde', to_date('10-06-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (243894587, 'Jude', 'Gleeson', '0542370069', 'jude.gleeson@wrgserv', '27 Grand-mere RoadHa', to_date('19-04-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (302976561, 'James', 'Folds', '0523932173', 'jamesf@balchem.com', '29 Dar StreetMason', to_date('22-03-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (724170292, 'Collective', 'Kutcher', '0574214467', 'collectivek@avs.es', '13 Keeslar BlvdAlcob', to_date('09-08-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (319239141, 'Jonny', 'Balin', '0594434579', 'jonny.balin@fsffinan', '19 Wayans DriveWoodb', to_date('25-05-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (613728092, 'Toni', 'Quinlan', '0561052164', 'toni.quinlan@refiner', '651 Gandolfini Stree', to_date('22-10-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (845781590, 'Tilda', 'Mathis', '0541569124', 'tilda.mathis@uniteda', '35 MylesWaldorf', to_date('09-07-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (190698424, 'Woody', 'Wright', '0557601466', 'w.wright@jlphor.com', '31st StreetWoodland ', to_date('25-08-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (970290021, 'Teena', 'Forrest', '0575226235', 'teena.forrest@kramon', '23rd StreetAvon', to_date('27-11-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (520075641, 'Praga', 'Negbaur', '0594274342', 'praga.negbaur@priori', '91st StreetPark Ridg', to_date('22-06-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (799073463, 'Mili', 'urban', '0540251712', 'miliu@scjohnson.com', '53rd StreetLake wort', to_date('09-04-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (103777251, 'Samantha', 'Aglukark', '0540837184', 'samantha.aglukark@wc', '34 Levert AveHorsham', to_date('08-02-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (621758975, 'Toni', 'Pleasure', '0525706581', 'toni.pleasure@cardin', '191 Jarvis AveBarben', to_date('06-05-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (769195766, 'Liquid', 'Salonga', '0594850160', 'liquid.salonga@wendy', '976 Judd StreetChiri', to_date('27-05-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (566541568, 'Gene', 'LaBelle', '0558963568', 'gene.labelle@volkswa', '73rd StreetMount Lau', to_date('18-06-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (433663895, 'Remy', 'Barrymore', '0590832162', 'remyb@mai.uk', '95 Molly RoadBraintr', to_date('31-08-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (246462174, 'Tramaine', 'Kinski', '0572756379', 'tramaine.kinski@wend', '78 Vantaa DriveAracr', to_date('24-12-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (707084605, 'Catherine', 'Armatrading', '0572442692', 'catherinea@sbc.nl', '70 Marin StreetEnsch', to_date('21-01-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (153049726, 'Jean-Luc', 'Burmester', '0565147504', 'jeanluc.burmester@te', '42 Almond StreetBelg', to_date('08-08-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (738015436, 'Terry', 'Van Damme', '0566627160', 'tvandamme@perfectord', '30 Yamaguchi StreetG', to_date('03-08-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (746566968, 'Leelee', 'Pleasence', '0524469881', 'leeleep@dell.de', '42 Withers RoadErlan', to_date('30-01-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (800709158, 'Jake', 'Stowe', '0595601486', 'jake.stowe@venoco.co', '65 Dempsey RoadGlend', to_date('31-07-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (944746756, 'Rueben', 'Quinlan', '0578440201', 'r.quinlan@perfectord', '32 Blaine BlvdCopenh', to_date('17-11-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (245270380, 'Maxine', 'Rio', '0562503052', 'maxine@infinity.br', '24 Dawson StreetIrat', to_date('17-09-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (216501493, 'Shawn', 'Laurie', '0573337170', 'slaurie@ads.uk', '29 Herzogenrath Road', to_date('12-01-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (210204404, 'Brothers', 'Whitley', '0591821263', 'brothers.whitley@tec', '21 Maria BlvdPittsbu', to_date('26-06-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (996740789, 'Gord', 'Cantrell', '0522331764', 'gord@ach.jp', '73 Shorter RoadMorio', to_date('10-03-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (984544484, 'King', 'Jay', '0578730305', 'kingj@ams.at', '51 Knutsford AveStey', to_date('15-08-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (783469465, 'Sylvester', 'Gandolfini', '0520341404', 'sylvester.g@mosaic.c', '476 Dwight RoadBozem', to_date('29-07-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (961261795, 'Robin', 'Leguizamo', '0530768165', 'robin.leguizamo@adva', '80 Burstyn RoadN. ft', to_date('01-02-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (477520608, 'Bobbi', 'Cervine', '0566742858', 'bobbic@firstsouthban', '33 Diggs RoadLongueu', to_date('09-04-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (833029470, 'Isaac', 'Isaacs', '0555365960', 'isaac.isaacs@credito', '84 O''Donnell StreetN', to_date('26-10-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (572152065, 'Elvis', 'Vaughn', '0545290438', 'elvis.v@grayhawksyst', '6 Dushku RoadVeenend', to_date('22-03-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (859974578, 'Minnie', 'Lennix', '0568605688', 'minnie.lennix@gsat.i', '81 Keeslar DriveMumb', to_date('14-01-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (115385560, 'Miguel', 'Quatro', '0556954744', 'miguel@stonetechprof', '64 CarmenHearst', to_date('23-03-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (771900720, 'Simon', 'Oates', '0589652919', 'simon.oates@vivendiu', '28 Macau StreetOppen', to_date('30-03-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (846551850, 'Andie', 'Del Toro', '0542451270', 'adeltoro@marketbased', '12 Kattan StreetPari', to_date('26-09-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (685378695, 'Jamie', 'Duke', '0584984170', 'jduke@ipsadvisory.uk', '91 RikLeeds', to_date('04-02-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (219988479, 'Collin', 'Saxon', '0592680635', 'collin.saxon@wendysi', '21st StreetNarrows', to_date('12-10-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (670043861, 'Colleen', 'Sylvian', '0524558025', 'colleen.sylvian@daim', '254 Briscoe DriveHor', to_date('17-04-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (568666955, 'Victor', 'Fox', '0559828468', 'victor.fox@apexsyste', '75 Sanders RoadRueil', to_date('31-01-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (611970814, 'Trey', 'Gaynor', '0534150485', 'tgaynor@hersheyfoods', '95 Rio DriveEdinburg', to_date('07-05-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (562129084, 'Rufus', 'Li', '0526394839', 'rli@pulaskifinancial', '5 Rosas DriveGennevi', to_date('03-06-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (196863311, 'Hugo', 'Farris', '0529464183', 'hugo.farris@floorgra', '892 Kirsten BlvdHapp', to_date('03-01-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (576082588, 'Neneh', 'Krabbe', '0566987440', 'nenehk@usgovernment.', '78 Slater BlvdBlue b', to_date('30-09-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (681488617, 'Parker', 'Li', '0580248535', 'parker.li@mre.com', '91st StreetTampa', to_date('04-04-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (840387216, 'Kris', 'Collie', '0536289150', 'krisc@staffforce.es', '5 Kristofferson Blvd', to_date('08-07-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (274342049, 'Isaiah', 'Warden', '0599779739', 'isaiah.warden@mitsub', '22nd StreetWaite Par', to_date('19-05-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (456283050, 'Mint', 'Weaving', '0527845574', 'mint.weaving@topicse', '72 Mathis DriveBirke', to_date('10-10-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (306141435, 'Debbie', 'DeLuise', '0551233732', 'debbie.deluise@socke', '63rd StreetBerlin-Ad', to_date('04-08-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (910230564, 'Trace', 'Cozier', '0520582152', 'trace.cozier@america', '874 Shirley DriveCha', to_date('20-06-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (116827917, 'Rascal', 'Owen', '0590214752', 'rascal@viacom.com', '97 Kirk StreetNew or', to_date('27-09-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (798134438, 'Sander', 'Krieger', '0558562095', 'sander.krieger@beste', '67 Winwood RoadEast ', to_date('12-08-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (767092023, 'Carl', 'Rodgers', '0530676704', 'carl.rodgers@accurat', '11 Plimpton RoadGenè', to_date('30-07-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (389446619, 'Ritchie', 'Benson', '0580455593', 'ritchie.benson@provi', '24 Giamatti DriveTar', to_date('23-12-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (123863694, 'Robby', 'Paul', '0520431721', 'robbyp@bioanalytical', '51 Scaggs RoadCape t', to_date('04-12-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (167822567, 'Molly', 'McDonnell', '0521470698', 'molly.mcdonnell@mqso', '61 Duncan StreetWald', to_date('12-08-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (443807373, 'Rosanne', 'Quinn', '0568244737', 'rosanne@msdw.com', '106 Viggo RoadEnglew', to_date('18-03-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (349631451, 'Ewan', 'Hagerty', '0545536275', 'ewan@vitacostcom.com', '46 Schaumburg DriveM', to_date('17-06-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (961886608, 'Donna', 'Hawke', '0531719941', 'donna.hawke@hatworld', '64 Daryl DriveSoutha', to_date('31-01-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (135021415, 'Leelee', 'Wolf', '0541388798', 'leelee.w@bps.com', '88 Aurora BlvdFlower', to_date('04-06-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (439929751, 'Hookah', 'Franklin', '0566165714', 'hookah.franklin@fds.', '30 San Ramon DriveSa', to_date('13-05-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (555880862, 'Toshiro', 'Gibbons', '0549804947', 'toshiro.gibbons@gree', '82nd StreetTallahass', to_date('04-04-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (342067673, 'Omar', 'Ferrell', '0543361097', 'omar.ferrell@gci.com', '32 Arkenstone AveSto', to_date('29-03-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (410475086, 'Mary', 'Ramirez', '0568143343', 'mary.ramirez@uniteda', '84 Bern RoadMechanic', to_date('20-11-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (112698927, 'Roger', 'Feore', '0575087495', 'roger.feore@studiobp', '9 Sizemore RoadStanf', to_date('18-10-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (417588505, 'Merrill', 'Arkin', '0550017853', 'merrill.arkin@lfg.br', '24 Kenny StreetVarze', to_date('12-12-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (475497389, 'Emilio', 'Forrest', '0563910231', 'eforrest@sfmai.de', '779 Maintenon Street', to_date('04-12-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (468133232, 'Coley', 'Griffiths', '0570012982', 'coley@trx.de', '65 Dench StreetGosla', to_date('24-03-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (714192146, 'Ozzy', 'Ferry', '0524133716', 'ozzy.f@fmb.de', '26 Downie StreetBad ', to_date('08-10-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (754870922, 'Crispin', 'Torino', '0545804928', 'crispin.t@pinnaclest', '86 Phifer RoadSalt L', to_date('02-04-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (602061618, 'Vienna', 'Bosco', '0583576645', 'vienna@sunstream.uk', '581 Street RoadChesh', to_date('04-03-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (280808740, 'Charlton', 'Fierstein', '0593921647', 'charlton.fierstein@e', '18 Lincoln BlvdTerni', to_date('23-05-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (660112269, 'Gabriel', 'O''Keefe', '0574514144', 'gabriel.okeefe@gulfm', '590 Hirsch DriveSeat', to_date('25-12-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (135006846, 'Shannyn', 'English', '0537635480', 'senglish@spotfirehol', '60 Holliston RoadBre', to_date('04-01-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (593204826, 'Dylan', 'MacDowell', '0527880106', 'd.macdowell@oss.au', '3 Brooke BlvdBurwood', to_date('22-02-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (649553663, 'Lizzy', 'Penn', '0590865450', 'lizzyp@jcpenney.uk', '30 Belushi RoadMarke', to_date('10-04-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (278373086, 'Rolando', 'Rollins', '0585615542', 'rolandor@procter.ch', '62 HarrisonWinterthu', to_date('14-12-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (442932469, 'Alex', 'Def', '0523522903', 'adef@marlabs.pt', '42nd StreetPaço de A', to_date('23-04-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (431113150, 'Jann', 'Stevens', '0559762147', 'j.stevens@ris.de', '32 Zipf RoadMagstadt', to_date('21-06-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (813358702, 'Chad', 'Whitaker', '0535960903', 'chad.whitaker@dell.c', '9 Schock StreetNepea', to_date('20-09-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (429436272, 'Helen', 'Cooper', '0549931797', 'helen@vms.com', '23 Lexington RoadCol', to_date('21-03-2001', 'dd-mm-yyyy'));
commit;
prompt 800 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (223053783, 'Colin', 'Carradine', '0540220037', 'colinc@mastercardint', '70 Hunter StreetNort', to_date('18-02-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (604813385, 'Jerry', 'Hidalgo', '0525214066', 'j.hidalgo@glmt.de', '143 Winnipeg DriveHe', to_date('29-05-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (351922829, 'Ernie', 'Klugh', '0565277270', 'eklugh@bat.au', '92 Manning RoadSydne', to_date('01-08-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (243238131, 'Mae', 'Stampley', '0534198466', 'mae.stampley@studiob', '22 Hiroshima RoadVar', to_date('02-01-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (899207934, 'Candice', 'Burrows', '0591316950', 'cburrows@paisley.hk', '50 Rickman DriveKwun', to_date('19-09-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (488422806, 'Cathy', 'Myles', '0529464833', 'cathy.m@procter.fr', '57 Arnold AveL''union', to_date('04-09-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (496069738, 'Clay', 'DiFranco', '0531608731', 'clay.d@mindworks.com', '84 Rossellini BlvdSe', to_date('07-08-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (293713016, 'Desmond', 'Lerner', '0598992200', 'desmond.lerner@staff', '43 Alessandro AveEas', to_date('29-10-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (431116476, 'Holly', 'Street', '0542098880', 'holly.street@efcbanc', '21 EppsMonterrey', to_date('25-06-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (592090896, 'Dermot', 'Hart', '0598562741', 'd.hart@actechnologie', '83 Nancy DriveSpresi', to_date('12-12-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (609870937, 'Jaime', 'Stone', '0544621329', 'jaime@savela.br', '54 Oldham RoadRecife', to_date('20-10-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (504738753, 'Vivica', 'Paul', '0585047244', 'vivica.paul@sony.pl', '17 Snipes DriveWarsa', to_date('07-07-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (661994210, 'Nicolas', 'Flanery', '0585894858', 'nicolasf@codykrameri', '28 Gordon DriveMilpi', to_date('27-05-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (169997654, 'Vincent', 'Greene', '0549241144', 'vgreene@envisiontele', '95 Sartain RoadCobha', to_date('09-02-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (452544001, 'Mekhi', 'Cozier', '0584422433', 'mekhi.cozier@palmbea', '73rd StreetBeaverton', to_date('29-12-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (367301148, 'Jared', 'Alexander', '0556975345', 'jared.alexander@kimb', '36 Stills StreetRome', to_date('02-04-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (262177876, 'Lili', 'Moraz', '0547572113', 'l.moraz@aop.com', '88 Loreena StreetLea', to_date('15-03-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (614843052, 'Chloe', 'Sweeney', '0593625103', 'c.sweeney@gcd.com', '43rd StreetFair Lawn', to_date('28-12-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (648358497, 'Humberto', 'Jackson', '0587303427', 'humberto.jackson@gla', '87 Marie StreetFt. L', to_date('03-12-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (336899163, 'Neneh', 'Hauser', '0559471608', 'nenehh@telecheminter', '28 Butler DriveShrev', to_date('27-02-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (910148391, 'Jimmy', 'Shawn', '0579671045', 'jimmy.shawn@stonetec', '95 Lara RoadOshawa', to_date('03-10-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (127560381, 'Angie', 'Short', '0579750232', 'angie.short@marsinc.', '1 Paul StreetNew Del', to_date('09-12-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (942996913, 'Denny', 'Schiavelli', '0544703160', 'denny.schiavelli@ves', '97 Brad DriveWaldbro', to_date('05-08-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (184263508, 'Kid', 'McGriff', '0558562479', 'kid@aventis.com', '5 Hunter StreetAiken', to_date('22-11-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (521500586, 'Melanie', 'Rea', '0582004710', 'melanie.rea@floorgra', '67 Brisbane StreetGe', to_date('08-11-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (326512074, 'Philip', 'Himmelman', '0557011379', 'philiph@printtech.be', '282 Evanswood Street', to_date('06-05-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (520138751, 'Laurence', 'Hedaya', '0543633535', 'laurence.hedaya@camp', '23rd StreetLublin', to_date('23-08-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (867309670, 'Gerald', 'Meniketti', '0570583644', 'geraldm@flavorx.au', '763 Lipnicki StreetR', to_date('12-12-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (896623821, 'Sander', 'Giamatti', '0536772291', 'sgiamatti@dearbornba', '597 Palo Alto RoadBi', to_date('14-03-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (884150938, 'Gordon', 'Duke', '0522072414', 'gordon@whitewave.ca', '70 Avenged RoadMontr', to_date('18-10-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (726500787, 'Sam', 'Zahn', '0556343496', 'sam.zahn@nat.com', '90 Driver DriveClaym', to_date('11-05-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (763693930, 'Mae', 'Kinski', '0580698358', 'maek@cis.no', '77 Ljubljana DriveUl', to_date('10-10-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (670092006, 'Ty', 'Balin', '0563127619', 'tbalin@computersourc', '33rd StreetSomerset', to_date('13-09-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (906401671, 'Praga', 'Barkin', '0572481055', 'praga@educationaldev', '63 Carmichael DriveT', to_date('31-07-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (164756215, 'Norm', 'Driver', '0546286936', 'norm.driver@timberla', '38 Bruce StreetVienn', to_date('02-02-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (598059031, 'Steven', 'Baez', '0557829629', 's.baez@cooktek.br', '64 Lapointe RoadCuia', to_date('06-04-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (422520960, 'Claude', 'Garfunkel', '0585196629', 'claude.g@newhorizons', '507 Issaquah DriveGl', to_date('16-10-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (668105400, 'Sona', 'Puckett', '0552260233', 'sona.puckett@allegia', '601 New DelhiPompton', to_date('11-11-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (817433719, 'Lily', 'Monk', '0589049439', 'lily@saksinc.py', '938 New York RoadCiu', to_date('13-11-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (518821776, 'Hugo', 'Seagal', '0556724787', 'hugo.seagal@otbd.it', '69 Ceasar AveNovara', to_date('08-05-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (134370308, 'Morris', 'Mitra', '0529900506', 'morrism@quicksilverr', '95 Zappacosta Street', to_date('26-09-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (151662302, 'Jeroen', 'Jessee', '0562143048', 'jeroen.jessee@genera', '75 Chao RoadGettysbu', to_date('12-03-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (257629966, 'Tamala', 'Cartlidge', '0599829180', 'tamala@telepoint.au', '80 Lillard BlvdWest ', to_date('18-03-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (792734549, 'LeVar', 'Bale', '0569777144', 'levar.b@csi.ee', '74 CoxTartu', to_date('25-12-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (631365623, 'Cole', 'McDormand', '0578771827', 'colem@integramedamer', '75 Schneider DriveFo', to_date('28-04-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (798302209, 'Ned', 'Fraser', '0520955963', 'ned.fraser@biorefere', '89 Sugar Hill AveBea', to_date('22-12-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (307344200, 'Holly', 'Hirsch', '0528878662', 'holly.h@mwp.com', '59 Brody AveFt. Leav', to_date('24-07-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (951437232, 'Penelope', 'Ribisi', '0595750059', 'peneloper@asapstaffi', '92nd StreetBrugherio', to_date('26-07-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (216505200, 'Wally', 'Gershon', '0550128198', 'wally.gershon@telwar', '89 Steve RoadWashing', to_date('18-05-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (802374700, 'Tobey', 'Schwimmer', '0562071325', 'tobey.schwimmer@idla', '82 Berenger StreetSa', to_date('20-05-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (768911980, 'Henry', 'Carmen', '0571672321', 'henry.carmen@yashtec', '71 Ned AveHayward', to_date('02-11-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (761247130, 'Bryan', 'Davison', '0588661991', 'bryan.davison@invest', '93rd StreetMendoza', to_date('11-06-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (592339013, 'Andie', 'Greene', '0570764982', 'agreene@merck.com', '30 Chilton StreetMcl', to_date('25-11-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (812843652, 'Rosco', 'Rhymes', '0546027110', 'rosco.rhymes@at.jp', '78 Vassar AveMatsuya', to_date('11-06-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (467610759, 'Gary', 'Nash', '0598947941', 'gary.nash@dataprise.', '45 WarsawWhittier', to_date('05-02-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (458589694, 'Neil', 'Holliday', '0598984329', 'neil.h@bowman.com', '71 Joshua AveAurora', to_date('04-02-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (181436117, 'Cledus', 'Basinger', '0587258700', 'cledus.basinger@pion', '28 Shenzhen StreetCo', to_date('21-05-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (513331858, 'Courtney', 'Prinze', '0542761028', 'courtney.prinze@emt.', '100 Uggams RoadGuelp', to_date('26-10-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (159003417, 'Carrie', 'Gryner', '0592253173', 'cgryner@investorstit', '22 Hart DriveNorth P', to_date('18-05-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (908312414, 'Cornell', 'Fonda', '0525918274', 'cornell.fonda@ams.co', '76 Holliday DriveSom', to_date('12-09-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (397901915, 'Walter', 'Rifkin', '0523067283', 'walter@bristolmyers.', '98 Drive DriveNewcas', to_date('15-06-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (517978732, 'Praga', 'Dukakis', '0536694406', 'praga@ams.com', '15 Recife DriveCharl', to_date('11-09-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (812798570, 'Ryan', 'Grant', '0523867060', 'ryan.grant@sprint.co', '86 Studi BlvdDelafie', to_date('26-06-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (525386822, 'Tea', 'Spacek', '0532227226', 'tea.spacek@greenmoun', '23 Kaunas AveAppenze', to_date('08-03-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (637575251, 'Julia', 'McCready', '0571602068', 'julia.mccready@mathi', '1 Eileen AveSalzburg', to_date('25-09-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (980238247, 'Natalie', 'Santana', '0565922178', 'natalie.santana@spri', '70 Sweet RoadWaalwij', to_date('12-07-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (516915284, 'Joseph', 'LuPone', '0574902560', 'josephl@pioneerdatas', '950 Tea StreetSt. Lo', to_date('06-03-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (715193578, 'Carl', 'Milsap', '0522505291', 'carl.m@zoneperfectnu', '56 Cloris DriveSalzb', to_date('15-03-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (140846666, 'Christine', 'Makeba', '0599508261', 'c.makeba@generalmill', '32 Kirsten DriveTaka', to_date('02-07-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (942644760, 'Blair', 'Cheadle', '0544749343', 'blair.c@newtonintera', '59 Tea DriveNew Hope', to_date('23-07-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (883289730, 'Parker', 'Stiers', '0526411196', 'parker@marsinc.es', '72 ProtvinoTerrasa', to_date('11-06-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (664324638, 'Herbie', 'Wills', '0599437141', 'hwills@spotfireholdi', '15 De Niro StreetMob', to_date('03-03-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (690420273, 'Gran', 'Remar', '0577251442', 'gran.r@gha.se', '56 Patti StreetSunds', to_date('21-01-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (649674822, 'Darius', 'Hedaya', '0539507496', 'd.hedaya@hotmail.com', '71 Patti StreetBarne', to_date('04-12-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (907362420, 'Pablo', 'Darren', '0528095252', 'pablo@verizon.com', '36 Jeffrey StreetCle', to_date('21-08-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (954207230, 'Harry', 'Raitt', '0565540661', 'harry.r@conquestsyst', '37 Begley AveRiverda', to_date('05-05-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (300295049, 'Mike', 'Campbell', '0523017816', 'm.campbell@sht.au', '22 Melrose park Blvd', to_date('26-02-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (801817196, 'Cary', 'Dolenz', '0535379375', 'cary.d@blueoceansoft', '67 McDormand AveAlph', to_date('12-07-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (476171954, 'Anna', 'McCormack', '0538481913', 'anna@unitedasset.de', '42nd StreetErlangen', to_date('11-02-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (655270279, 'Wendy', 'Phifer', '0595521826', 'wendy@unilever.be', '67 Sao caetano do su', to_date('04-04-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (414400325, 'Rip', 'Crimson', '0530485582', 'rip.crimson@capitolb', '27 St. Louis RoadJak', to_date('12-01-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (858604549, 'Kirsten', 'Negbaur', '0534613284', 'kirsten.negbaur@vest', '966 Kattan RoadLiver', to_date('29-06-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (764718405, 'Phil', 'Watson', '0523405654', 'pwatson@abatix.it', '351 O''Neal BlvdVilla', to_date('19-03-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (262435609, 'Curt', 'Burton', '0589945044', 'curt@infovision.com', '799 Matheson StreetH', to_date('04-09-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (668397885, 'Robert', 'Boothe', '0553170096', 'robert.boothe@teoco.', '15 Belp StreetMumbai', to_date('09-01-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (963980988, 'Kitty', 'LaSalle', '0592842506', 'kitty@vivendiunivers', '43 Coquitlam RoadNor', to_date('08-05-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (950772818, 'Chely', 'Wariner', '0557204638', 'cwariner@shirtfactor', '3 Berwyn StreetStone', to_date('29-10-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (801631026, 'Andre', 'Avalon', '0526752460', 'andre.avalon@denaliv', '683 Gates AveMenlo P', to_date('26-08-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (817184818, 'Glenn', 'Askew', '0535678628', 'glenn@hcoa.com', '98 AaronMenlo Park', to_date('18-12-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (454262972, 'Collin', 'Crow', '0596139229', 'collin.c@woronocoban', '95 Utsunomiya Street', to_date('18-06-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (909725649, 'Jeffrey', 'Davidtz', '0577479632', 'jeffrey.davidtz@logi', '731 Santa Rosa BlvdS', to_date('16-12-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (304761100, 'Regina', 'Hurt', '0524458992', 'rhurt@oss.com', '30 Cornell DriveBrat', to_date('20-08-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (720780759, 'Juan', 'Lang', '0537794057', 'juan.lang@sms.com', '18 Oakland RoadDoual', to_date('19-03-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (530131962, 'Sona', 'Myers', '0548093606', 'smyers@noodles.jp', '82 Kingsley BlvdOhit', to_date('22-05-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (714865250, 'Mos', 'Farina', '0538216769', 'mos.farina@whitewave', '25 Emma StreetWaltha', to_date('20-06-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (431317000, 'Chaka', 'Platt', '0578104684', 'cplatt@stonebrewing.', '32 Ponce AveSanta Cl', to_date('10-01-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (793726925, 'Paula', 'Torres', '0592706580', 'p.torres@benecongrou', '100 Jesus RoadBalmor', to_date('20-06-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (381730004, 'Marie', 'Sevigny', '0586318372', 'marie.s@stm.com', '48 Kramer RoadLibert', to_date('28-07-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (847856992, 'David', 'Broadbent', '0556792706', 'david.broadbent@trm.', '49 Don StreetEnsched', to_date('08-05-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (368290195, 'Ben', 'Vincent', '0585761251', 'ben.vincent@sfb.ch', '56 Irons RoadSursee', to_date('01-03-1987', 'dd-mm-yyyy'));
commit;
prompt 900 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (232559981, 'Alfred', 'Ruiz', '0562539432', 'alfred.ruiz@tigris.c', '560 Kirkwood RoadExe', to_date('02-05-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (145411869, 'Jody', 'Isaacs', '0544802328', 'jody@dillards.ch', '53 Lovitz StreetWint', to_date('24-12-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (512647397, 'Latin', 'Coverdale', '0525734882', 'latin.c@alogent.fr', '91 FlattsBoulogne', to_date('19-09-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (755010715, 'Ivan', 'Curfman', '0585927431', 'ivan@ezecastlesoftwa', '147 Bristol StreetSu', to_date('22-10-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (589112597, 'Gino', 'McAnally', '0571086571', 'ginom@bis.br', '55 Charlton RoadSao ', to_date('19-02-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (117249783, 'Nile', 'Reubens', '0545906666', 'nile.reubens@news.co', '47 Lonsdale StreetBi', to_date('05-08-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (938086111, 'Dylan', 'Scheider', '0528410221', 'dylan.scheider@walma', '49 Witt AveDrogenbos', to_date('19-10-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (446089916, 'Michael', 'Balaban', '0583241217', 'm.balaban@canterbury', '7 Ann Arbor RoadNeuq', to_date('18-06-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (762000433, 'Stellan', 'Irving', '0550120535', 'stellan.irving@bps.m', '49 Carr AveGuadalaja', to_date('12-01-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (290644641, 'Elle', 'Tisdale', '0556784460', 'elle.tisdale@smartdr', '42 Irvine StreetPeac', to_date('08-07-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (305887245, 'Angela', 'Kapanka', '0530088361', 'angela@hewlettpackar', '54 CosladaBergara', to_date('09-03-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (512333062, 'Mary-Louise', 'Feuerstein', '0557340540', 'marylouise.feuerstei', '724 Hookah StreetPia', to_date('23-08-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (375310901, 'Demi', 'Green', '0567275705', 'demi.green@elitemedi', '65 Aurora RoadWest M', to_date('12-06-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (572928856, 'Jay', 'Pesci', '0536964147', 'jay.pesci@sysconmedi', '83rd StreetNancy', to_date('31-08-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (295721056, 'Belinda', 'Carrere', '0556628598', 'b.carrere@shot.com', '493 Tualatin DriveSa', to_date('10-02-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (440096897, 'Maceo', 'Hong', '0597921684', 'maceo@allstar.fr', '44 Ned RoadTours', to_date('19-10-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (813323354, 'Natasha', 'Allison', '0553917848', 'natasha.allison@hewl', '31 Mexico City BlvdL', to_date('19-05-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (776045496, 'Robbie', 'Estevez', '0525515917', 'robbie@ams.ca', '56 Hagerty BlvdMontr', to_date('07-09-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (767142088, 'Jackie', 'Conners', '0526228558', 'jackie.conners@cowli', '90 Snoqualmie Street', to_date('02-05-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (421100585, 'Regina', 'Rush', '0585336395', 'regina@topicsenterta', '47 Brooks RoadProtvi', to_date('07-12-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (610881195, 'Louise', 'Kretschmann', '0545543026', 'lkretschmann@wrgserv', '284 Boulogne StreetC', to_date('14-09-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (642915008, 'Vanessa', 'Lineback', '0599816638', 'vanessa.lineback@hot', '40 Cate AveAnnandale', to_date('01-01-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (474692968, 'Jean-Luc', 'Byrne', '0588867879', 'j.byrne@stmaryland.j', '50 Roy StreetUtsunom', to_date('12-02-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (232982805, 'Clint', 'Kilmer', '0578576980', 'clint@printtech.com', '36 Dourif StreetGran', to_date('27-09-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (111080540, 'Terrence', 'Newton', '0537193443', 'terrence.newton@gill', '99 Detmer StreetKing', to_date('04-07-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (408357513, 'Davis', 'Travers', '0521671376', 'davist@aventis.fi', '88 Singh DriveKuopio', to_date('05-06-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (618140542, 'Delbert', 'Winger', '0538069321', 'delbert.winger@glmt.', '51 Hart DriveHerne', to_date('07-04-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (950037229, 'Alfie', 'Brothers', '0577077690', 'alfie@loreal.uk', '14 Gavin RoadWest Su', to_date('11-04-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (376286668, 'Dabney', 'Streep', '0573619860', 'dstreep@sfmai.it', '51 Prinze StreetVill', to_date('04-01-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (591988422, 'Matthew', 'Tillis', '0576857313', 'matthew.tillis@fmb.c', '3 Crystal RoadGuelph', to_date('26-03-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (159508703, 'Cevin', 'Arkin', '0549034796', 'cevin.arkin@promethe', '51st StreetZürich', to_date('29-08-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (896635944, 'Fisher', 'Wolf', '0538462970', 'fisher.wolf@trekequi', '579 Fukuoka AveGdans', to_date('01-11-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (761354432, 'Merle', 'Merchant', '0548422348', 'm.merchant@gsat.com', '90 Worrell RoadReno', to_date('23-03-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (183205839, 'Maury', 'Kinski', '0579428800', 'maury.kinski@dynacqi', '17 Lupe RoadTaoyuan', to_date('05-08-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (143811725, 'Jeffrey', 'Blossoms', '0597804447', 'jeffrey.b@reckittben', '807 Milton Keynes Dr', to_date('31-03-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (513524850, 'Sydney', 'Mulroney', '0545948073', 'sydney.mulroney@ptg.', '4 Merle StreetSalzbu', to_date('11-03-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (982427445, 'Bernard', 'Monk', '0550242710', 'bernard.monk@hfg.com', '39 Burr Ridge Street', to_date('09-01-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (953326244, 'Will', 'Torino', '0553616903', 'wtorino@banfeproduct', '66 TomHerdecke', to_date('27-09-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (179815590, 'Nickel', 'Law', '0541684764', 'nickel.law@lms.com', '73rd StreetLos Alamo', to_date('17-05-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (633097629, 'Kurtwood', 'Cherry', '0588875572', 'kurtwood.cherry@rest', '34 Dempsey StreetNan', to_date('29-12-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (260961871, 'Nora', 'Langella', '0566102000', 'nora@progressivemedi', '9 Newman RoadSlmea', to_date('17-11-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (239950761, 'Adina', 'Roth', '0587390533', 'adina@gha.com', '60 Terence AveBrookf', to_date('24-01-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (508823059, 'Irene', 'Tah', '0594341132', 'irene@cns.com', '675 Warszawa StreetS', to_date('25-12-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (806090432, 'Chloe', 'Curtis', '0583198163', 'ccurtis@canterburypa', '23rd StreetSidney', to_date('24-01-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (452939991, 'Liam', 'Yulin', '0554228898', 'liam.yulin@pis.uk', '87 BredaCheshire', to_date('26-03-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (442765602, 'Latin', 'McDonald', '0590824710', 'latin.mcdonald@sis.b', '10 Emilio DriveIrati', to_date('06-09-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (367622091, 'Adrien', 'Witt', '0545523188', 'adrien.witt@gdatechn', '91 Mortensen RoadEtt', to_date('12-03-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (692760095, 'Raul', 'Mueller-Stahl', '0555621592', 'raul.muellerstahl@sa', '62 ShalhoubLowell', to_date('02-07-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (664633791, 'Franco', 'Yorn', '0587260238', 'franco.yorn@business', '4 Yorn StreetValenci', to_date('09-05-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (904561233, 'Judd', 'MacDowell', '0555223061', 'judd.macdowell@conqu', '92nd StreetLongview', to_date('08-12-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (799542087, 'Jonny Lee', 'McNeice', '0562289333', 'jonnylee.mcneice@all', '68 Redford StreetMog', to_date('11-10-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (702072229, 'Clay', 'Sepulveda', '0548397603', 'clay.s@timberlanewoo', '546 Jodie RoadFramin', to_date('02-11-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (613449185, 'Hookah', 'Black', '0557288813', 'hookah.b@bioreferenc', '79 Sinatra StreetNew', to_date('06-04-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (332185579, 'Dermot', 'Hawke', '0573913924', 'dermot.hawke@bashen.', '219 SilvermanZurich', to_date('05-03-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (843458495, 'Dennis', 'Albright', '0545794961', 'dennis.albright@unit', '951 Swoosie DriveBer', to_date('29-01-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (685783715, 'Kay', 'Kleinenberg', '0525617393', 'k.kleinenberg@usgove', '24 Brent BlvdVaduz', to_date('08-09-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (343281461, 'Mekhi', 'Coughlan', '0546370187', 'mekhi@linacsystems.u', '81 Billerica BlvdFar', to_date('24-06-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (108411178, 'Lynn', 'Kennedy', '0567939943', 'lynn@morganresearch.', '52nd StreetFukui', to_date('05-02-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (731895323, 'Johnette', 'Tierney', '0534670540', 'jtierney@teamstudio.', '43 StevensColombo', to_date('29-03-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (744119752, 'Rowan', 'Davies', '0591718047', 'rowan.davies@yes.fr', '622 Macy RoadDardill', to_date('13-11-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (592183873, 'Parker', 'Caine', '0547366384', 'p.caine@ecopy.com', '48 Mountain View Dri', to_date('07-03-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (982468945, 'Nils', 'Gaines', '0534526432', 'nils.g@ait.jp', '58 Carrington AveKob', to_date('15-03-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (472589782, 'Jesus', 'Anderson', '0562809976', 'jesus.anderson@paint', '89 MelanieFriedrichs', to_date('30-05-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (652617705, 'Ming-Na', 'Holliday', '0536353864', 'mingna@usphysicalthe', '1 MortensenSorocaba', to_date('18-02-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (531749344, 'Hugo', 'Lennix', '0536089264', 'hugo.lennix@codykram', '17 McPherson Avedurh', to_date('27-05-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (506544368, 'Johnette', 'Curry', '0558019963', 'johnettec@mastercard', '19 NightingaleCromwe', to_date('29-05-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (927539471, 'Isabella', 'Henstridge', '0587179732', 'isabella.henstridge@', '42 Eliza DriveLehi', to_date('16-07-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (948139256, 'Sonny', 'Shue', '0542874231', 'sonny.shue@solipsys.', '53 McKellen RoadSche', to_date('08-09-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (227596658, 'Terence', 'Aglukark', '0595179408', 'terence.aglukark@pri', '81st StreetOhita', to_date('21-07-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (578363521, 'Ike', 'Moffat', '0555126812', 'imoffat@scripnet.dk', '84 Kansas City Stree', to_date('20-12-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (948704091, 'Isaiah', 'Stamp', '0528753503', 'isaiah.s@oneidafinan', '86 Germantown RoadOa', to_date('20-11-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (921590491, 'Etta', 'Diaz', '0588731284', 'ettad@bioreference.c', '499 Thorton DriveEng', to_date('07-07-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (625853599, 'Lois', 'Jeffreys', '0594461395', 'lois.jeffreys@maveri', '781 Canal Winchester', to_date('12-08-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (523146802, 'Tyrone', 'Lillard', '0557769447', 'tlillard@sony.ca', '507 Trace RoadSummer', to_date('14-01-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (775623212, 'Garry', 'Pacino', '0595882537', 'garry.p@mathis.com', '91 Sundsvall RoadCro', to_date('08-11-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (969611634, 'Sally', 'MacDowell', '0531078818', 'sally.macdowell@usda', '92nd StreetRosario', to_date('28-04-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (947929576, 'Bernie', 'Cara', '0567836569', 'bernie.cara@proclari', '100 Lane BlvdMiami', to_date('15-12-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (118361310, 'Talvin', 'Burmester', '0526971758', 'talvin.burmester@gcd', '48 AmarilloMonument', to_date('26-05-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (717308455, 'Scott', 'McCann', '0531053019', 'scott.mccann@abatix.', '91 Benjamin BlvdCove', to_date('18-06-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (693746050, 'Jonatha', 'Kane', '0534092177', 'jonathak@aventis.it', '45 Meerbusch StreetR', to_date('06-02-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (557735985, 'Dylan', 'Goodall', '0560213966', 'dylan.goodall@mwp.co', '49 Rochester StreetP', to_date('28-02-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (278028781, 'Regina', 'LuPone', '0562380233', 'regina.lupone@calibe', '931 Shreveport RoadW', to_date('13-12-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (525253498, 'Judy', 'Torn', '0582729336', 'judy.t@fmt.dk', '3 Quinlan StreetKøbe', to_date('06-10-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (649982841, 'Fisher', 'Donovan', '0577420303', 'fisher.donovan@credi', '77 Lorenz DriveBrain', to_date('25-09-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (609034561, 'Isabella', 'Peet', '0599008000', 'isabella.peet@esteel', '14 Lowe RoadRosario', to_date('15-01-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (904064500, 'Geoffrey', 'Finney', '0572321379', 'geoffrey.finney@exin', '97 Hynde RoadMenlo P', to_date('01-04-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (494877713, 'Gabrielle', 'Biehn', '0599172989', 'gabrielle.biehn@dis.', '5 Krumholtz RoadSan ', to_date('13-10-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (193186555, 'Robert', 'Hidalgo', '0564583491', 'rhidalgo@ositissoftw', '776 Parker StreetKao', to_date('30-03-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (129525337, 'Tommy', 'Salonga', '0579602978', 'tommy.s@servicesourc', '500 Long Island City', to_date('23-04-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (403919727, 'Penelope', 'Miller', '0541785936', 'pmiller@networkdispl', '45 Rik Roaddurham', to_date('28-02-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (729224779, 'Cate', 'Marin', '0598631389', 'cate.marin@contract.', '33rd StreetMonterrey', to_date('12-02-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (417752520, 'Trini', 'Hartnett', '0540164533', 'trini.hartnett@everg', '83 Mohr RoadAlbany', to_date('02-12-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (798808640, 'Denis', 'Waite', '0543068267', 'denis.waite@abs.au', '2 Akron BlvdBrisbane', to_date('23-01-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (742745195, 'Matthew', 'Stigers', '0570988474', 'matthew@totalenterta', '59 Kazem DrivePotten', to_date('31-05-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (195568866, 'Barbara', 'Levert', '0531876369', 'b.levert@stm.de', '268 McConaughey Stre', to_date('13-05-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (356852395, 'Clive', 'Chestnut', '0543772163', 'clive.chestnut@teams', '852 Colman DriveMoun', to_date('15-09-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (535163098, 'Cheryl', 'Rebhorn', '0575211252', 'cheryl.rebhorn@ads.f', '82 Garza StreetEchir', to_date('09-10-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (959360057, 'Rupert', 'Richards', '0524090926', 'r.richards@cooktek.d', '5 Tlalpan RoadHerfor', to_date('10-12-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (707410732, 'Rueben', 'Cox', '0570852179', 'rueben@mitsubishimot', '219 Agoncillo AveBar', to_date('02-12-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (115916556, 'Ralph', 'Tisdale', '0565477551', 'ralph.tisdale@sarale', '10 Freddy DriveImmen', to_date('24-06-1990', 'dd-mm-yyyy'));
commit;
prompt 1000 records loaded
prompt Loading DISPATCHER...
insert into DISPATCHER (dispatcherid)
values (580488974);
insert into DISPATCHER (dispatcherid)
values (961635098);
insert into DISPATCHER (dispatcherid)
values (399467282);
insert into DISPATCHER (dispatcherid)
values (366343244);
insert into DISPATCHER (dispatcherid)
values (440414604);
insert into DISPATCHER (dispatcherid)
values (747171108);
insert into DISPATCHER (dispatcherid)
values (563119002);
insert into DISPATCHER (dispatcherid)
values (525253498);
insert into DISPATCHER (dispatcherid)
values (504967455);
insert into DISPATCHER (dispatcherid)
values (243336161);
insert into DISPATCHER (dispatcherid)
values (637575251);
insert into DISPATCHER (dispatcherid)
values (947447478);
insert into DISPATCHER (dispatcherid)
values (116564125);
insert into DISPATCHER (dispatcherid)
values (181436117);
insert into DISPATCHER (dispatcherid)
values (942996913);
insert into DISPATCHER (dispatcherid)
values (792078922);
insert into DISPATCHER (dispatcherid)
values (549493698);
insert into DISPATCHER (dispatcherid)
values (834241599);
insert into DISPATCHER (dispatcherid)
values (207347544);
insert into DISPATCHER (dispatcherid)
values (205862893);
insert into DISPATCHER (dispatcherid)
values (395234141);
insert into DISPATCHER (dispatcherid)
values (843512931);
insert into DISPATCHER (dispatcherid)
values (839552387);
insert into DISPATCHER (dispatcherid)
values (165847242);
insert into DISPATCHER (dispatcherid)
values (967108709);
insert into DISPATCHER (dispatcherid)
values (275351971);
insert into DISPATCHER (dispatcherid)
values (951414878);
insert into DISPATCHER (dispatcherid)
values (766242929);
insert into DISPATCHER (dispatcherid)
values (243238131);
insert into DISPATCHER (dispatcherid)
values (496069738);
insert into DISPATCHER (dispatcherid)
values (477520608);
insert into DISPATCHER (dispatcherid)
values (963532017);
insert into DISPATCHER (dispatcherid)
values (609870937);
insert into DISPATCHER (dispatcherid)
values (481548013);
insert into DISPATCHER (dispatcherid)
values (441023695);
insert into DISPATCHER (dispatcherid)
values (800947932);
insert into DISPATCHER (dispatcherid)
values (681488617);
insert into DISPATCHER (dispatcherid)
values (567796300);
insert into DISPATCHER (dispatcherid)
values (727135472);
insert into DISPATCHER (dispatcherid)
values (633097629);
insert into DISPATCHER (dispatcherid)
values (414400325);
insert into DISPATCHER (dispatcherid)
values (952094084);
insert into DISPATCHER (dispatcherid)
values (502131885);
insert into DISPATCHER (dispatcherid)
values (558414787);
insert into DISPATCHER (dispatcherid)
values (513160497);
insert into DISPATCHER (dispatcherid)
values (802374700);
insert into DISPATCHER (dispatcherid)
values (843458495);
insert into DISPATCHER (dispatcherid)
values (553099150);
insert into DISPATCHER (dispatcherid)
values (439929751);
insert into DISPATCHER (dispatcherid)
values (193186555);
insert into DISPATCHER (dispatcherid)
values (825589019);
insert into DISPATCHER (dispatcherid)
values (568666955);
insert into DISPATCHER (dispatcherid)
values (115714750);
insert into DISPATCHER (dispatcherid)
values (507339068);
insert into DISPATCHER (dispatcherid)
values (122924782);
insert into DISPATCHER (dispatcherid)
values (719059544);
insert into DISPATCHER (dispatcherid)
values (404883551);
insert into DISPATCHER (dispatcherid)
values (136082895);
insert into DISPATCHER (dispatcherid)
values (431317000);
insert into DISPATCHER (dispatcherid)
values (351922829);
insert into DISPATCHER (dispatcherid)
values (872367234);
insert into DISPATCHER (dispatcherid)
values (128080684);
insert into DISPATCHER (dispatcherid)
values (918208321);
insert into DISPATCHER (dispatcherid)
values (540114031);
insert into DISPATCHER (dispatcherid)
values (483475435);
insert into DISPATCHER (dispatcherid)
values (906935306);
insert into DISPATCHER (dispatcherid)
values (264250868);
insert into DISPATCHER (dispatcherid)
values (242585762);
insert into DISPATCHER (dispatcherid)
values (926145059);
insert into DISPATCHER (dispatcherid)
values (599890817);
insert into DISPATCHER (dispatcherid)
values (944938337);
insert into DISPATCHER (dispatcherid)
values (675278483);
insert into DISPATCHER (dispatcherid)
values (385114707);
insert into DISPATCHER (dispatcherid)
values (801292271);
insert into DISPATCHER (dispatcherid)
values (498875242);
insert into DISPATCHER (dispatcherid)
values (995102445);
insert into DISPATCHER (dispatcherid)
values (162788221);
insert into DISPATCHER (dispatcherid)
values (214158330);
insert into DISPATCHER (dispatcherid)
values (708442139);
insert into DISPATCHER (dispatcherid)
values (980238247);
insert into DISPATCHER (dispatcherid)
values (535163098);
insert into DISPATCHER (dispatcherid)
values (789685574);
insert into DISPATCHER (dispatcherid)
values (884150938);
insert into DISPATCHER (dispatcherid)
values (101584298);
insert into DISPATCHER (dispatcherid)
values (971253183);
insert into DISPATCHER (dispatcherid)
values (603787067);
insert into DISPATCHER (dispatcherid)
values (184263508);
insert into DISPATCHER (dispatcherid)
values (590266488);
insert into DISPATCHER (dispatcherid)
values (376286668);
insert into DISPATCHER (dispatcherid)
values (525386822);
insert into DISPATCHER (dispatcherid)
values (349631451);
insert into DISPATCHER (dispatcherid)
values (988686001);
insert into DISPATCHER (dispatcherid)
values (314514324);
insert into DISPATCHER (dispatcherid)
values (718428613);
insert into DISPATCHER (dispatcherid)
values (707509224);
insert into DISPATCHER (dispatcherid)
values (869296845);
insert into DISPATCHER (dispatcherid)
values (602857670);
commit;
prompt 97 records loaded
prompt Loading CALLHELP...
insert into CALLHELP (callid, calldate, dispatcherid)
values (1, to_date('16-01-1949', 'dd-mm-yyyy'), 540114031);
insert into CALLHELP (callid, calldate, dispatcherid)
values (2, to_date('15-08-2002', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (3, to_date('04-07-1959', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (4, to_date('03-11-1983', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (5, to_date('20-02-2007', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (6, to_date('20-07-1993', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (7, to_date('23-06-1975', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (8, to_date('21-04-1995', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (9, to_date('24-11-1988', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (10, to_date('30-12-1977', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (11, to_date('14-05-2014', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (12, to_date('01-09-1968', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (13, to_date('05-10-1955', 'dd-mm-yyyy'), 567796300);
insert into CALLHELP (callid, calldate, dispatcherid)
values (14, to_date('22-10-2006', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (15, to_date('02-10-2010', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (16, to_date('30-07-1984', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (17, to_date('30-06-1979', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (18, to_date('03-05-1995', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (19, to_date('23-07-1976', 'dd-mm-yyyy'), 951414878);
insert into CALLHELP (callid, calldate, dispatcherid)
values (20, to_date('25-10-1978', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (21, to_date('16-06-1975', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (22, to_date('07-05-1989', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (23, to_date('20-02-1953', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (24, to_date('27-06-1983', 'dd-mm-yyyy'), 718428613);
insert into CALLHELP (callid, calldate, dispatcherid)
values (25, to_date('14-11-1971', 'dd-mm-yyyy'), 540114031);
insert into CALLHELP (callid, calldate, dispatcherid)
values (26, to_date('10-06-1985', 'dd-mm-yyyy'), 414400325);
insert into CALLHELP (callid, calldate, dispatcherid)
values (27, to_date('16-10-1985', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (28, to_date('02-09-1994', 'dd-mm-yyyy'), 801292271);
insert into CALLHELP (callid, calldate, dispatcherid)
values (29, to_date('18-08-1969', 'dd-mm-yyyy'), 747171108);
insert into CALLHELP (callid, calldate, dispatcherid)
values (30, to_date('26-12-1953', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (31, to_date('30-10-1976', 'dd-mm-yyyy'), 314514324);
insert into CALLHELP (callid, calldate, dispatcherid)
values (32, to_date('14-08-1970', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (33, to_date('06-08-1968', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (34, to_date('11-07-1992', 'dd-mm-yyyy'), 971253183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (35, to_date('13-02-1993', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (36, to_date('27-05-1960', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (37, to_date('28-05-2016', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (38, to_date('16-09-1961', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (39, to_date('14-02-1948', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (40, to_date('09-02-2003', 'dd-mm-yyyy'), 477520608);
insert into CALLHELP (callid, calldate, dispatcherid)
values (41, to_date('28-09-1991', 'dd-mm-yyyy'), 947447478);
insert into CALLHELP (callid, calldate, dispatcherid)
values (42, to_date('18-09-1971', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (43, to_date('13-06-1954', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (44, to_date('25-06-2013', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (45, to_date('23-02-1986', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (46, to_date('28-02-1991', 'dd-mm-yyyy'), 540114031);
insert into CALLHELP (callid, calldate, dispatcherid)
values (47, to_date('28-11-1978', 'dd-mm-yyyy'), 567796300);
insert into CALLHELP (callid, calldate, dispatcherid)
values (48, to_date('15-02-2014', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (49, to_date('28-04-1988', 'dd-mm-yyyy'), 944938337);
insert into CALLHELP (callid, calldate, dispatcherid)
values (50, to_date('18-07-2018', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (51, to_date('17-01-1952', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (52, to_date('27-02-1994', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (53, to_date('06-12-1950', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (54, to_date('24-02-1952', 'dd-mm-yyyy'), 843458495);
insert into CALLHELP (callid, calldate, dispatcherid)
values (55, to_date('10-03-1972', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (56, to_date('20-05-1970', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (57, to_date('11-11-1951', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (58, to_date('22-06-1950', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (59, to_date('06-01-1956', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (60, to_date('22-12-1962', 'dd-mm-yyyy'), 802374700);
insert into CALLHELP (callid, calldate, dispatcherid)
values (61, to_date('24-01-2018', 'dd-mm-yyyy'), 599890817);
insert into CALLHELP (callid, calldate, dispatcherid)
values (62, to_date('24-02-1987', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (63, to_date('26-07-1959', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (64, to_date('18-08-1957', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (65, to_date('01-11-1971', 'dd-mm-yyyy'), 944938337);
insert into CALLHELP (callid, calldate, dispatcherid)
values (66, to_date('15-05-1968', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (67, to_date('27-10-2017', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (68, to_date('06-04-1998', 'dd-mm-yyyy'), 718428613);
insert into CALLHELP (callid, calldate, dispatcherid)
values (69, to_date('04-08-2019', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (70, to_date('20-10-1980', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (71, to_date('26-09-2006', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (72, to_date('25-02-1978', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (73, to_date('15-03-1995', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (74, to_date('06-01-1950', 'dd-mm-yyyy'), 727135472);
insert into CALLHELP (callid, calldate, dispatcherid)
values (75, to_date('14-10-1959', 'dd-mm-yyyy'), 314514324);
insert into CALLHELP (callid, calldate, dispatcherid)
values (76, to_date('22-08-1993', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (77, to_date('06-10-1993', 'dd-mm-yyyy'), 800947932);
insert into CALLHELP (callid, calldate, dispatcherid)
values (78, to_date('28-05-2005', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (79, to_date('03-01-1975', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (80, to_date('13-04-1964', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (81, to_date('27-11-2019', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (82, to_date('11-08-1967', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (83, to_date('25-07-2000', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (84, to_date('11-07-1959', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (85, to_date('31-07-2018', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (86, to_date('06-06-1974', 'dd-mm-yyyy'), 947447478);
insert into CALLHELP (callid, calldate, dispatcherid)
values (87, to_date('13-10-2002', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (88, to_date('18-11-2007', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (89, to_date('11-05-2000', 'dd-mm-yyyy'), 540114031);
insert into CALLHELP (callid, calldate, dispatcherid)
values (90, to_date('05-04-2013', 'dd-mm-yyyy'), 792078922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (91, to_date('07-09-2012', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (92, to_date('09-08-1964', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (93, to_date('31-03-1973', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (94, to_date('01-01-2016', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (95, to_date('24-01-1979', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (96, to_date('09-11-2013', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (97, to_date('14-12-1968', 'dd-mm-yyyy'), 802374700);
insert into CALLHELP (callid, calldate, dispatcherid)
values (98, to_date('28-06-2012', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (99, to_date('05-01-2004', 'dd-mm-yyyy'), 747171108);
insert into CALLHELP (callid, calldate, dispatcherid)
values (100, to_date('17-05-2005', 'dd-mm-yyyy'), 441023695);
commit;
prompt 100 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (101, to_date('17-09-2019', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (102, to_date('01-06-1982', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (103, to_date('19-12-1952', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (104, to_date('27-08-2001', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (105, to_date('23-07-2013', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (106, to_date('29-09-1981', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (107, to_date('08-04-1951', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (108, to_date('11-08-2019', 'dd-mm-yyyy'), 843458495);
insert into CALLHELP (callid, calldate, dispatcherid)
values (109, to_date('21-02-2004', 'dd-mm-yyyy'), 580488974);
insert into CALLHELP (callid, calldate, dispatcherid)
values (110, to_date('20-08-1967', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (111, to_date('13-03-1967', 'dd-mm-yyyy'), 115714750);
insert into CALLHELP (callid, calldate, dispatcherid)
values (112, to_date('04-10-1974', 'dd-mm-yyyy'), 906935306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (113, to_date('05-01-1967', 'dd-mm-yyyy'), 603787067);
insert into CALLHELP (callid, calldate, dispatcherid)
values (114, to_date('14-11-1969', 'dd-mm-yyyy'), 101584298);
insert into CALLHELP (callid, calldate, dispatcherid)
values (115, to_date('11-07-1993', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (116, to_date('16-11-1971', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (117, to_date('06-06-2010', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (118, to_date('10-10-1960', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (119, to_date('25-07-1963', 'dd-mm-yyyy'), 906935306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (120, to_date('10-03-2006', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (121, to_date('22-08-1960', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (122, to_date('21-08-1999', 'dd-mm-yyyy'), 580488974);
insert into CALLHELP (callid, calldate, dispatcherid)
values (123, to_date('15-09-1977', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (124, to_date('10-01-2011', 'dd-mm-yyyy'), 802374700);
insert into CALLHELP (callid, calldate, dispatcherid)
values (125, to_date('12-09-1977', 'dd-mm-yyyy'), 193186555);
insert into CALLHELP (callid, calldate, dispatcherid)
values (126, to_date('18-08-2003', 'dd-mm-yyyy'), 603787067);
insert into CALLHELP (callid, calldate, dispatcherid)
values (127, to_date('24-06-1976', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (128, to_date('03-01-1964', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (129, to_date('27-09-1969', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (130, to_date('23-03-2009', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (131, to_date('02-02-2012', 'dd-mm-yyyy'), 513160497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (132, to_date('15-09-1979', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (133, to_date('17-10-1965', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (134, to_date('21-02-1988', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (135, to_date('18-06-1966', 'dd-mm-yyyy'), 513160497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (136, to_date('26-10-1956', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (137, to_date('30-01-2007', 'dd-mm-yyyy'), 513160497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (138, to_date('24-09-2009', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (139, to_date('20-10-2011', 'dd-mm-yyyy'), 869296845);
insert into CALLHELP (callid, calldate, dispatcherid)
values (140, to_date('06-11-2003', 'dd-mm-yyyy'), 314514324);
insert into CALLHELP (callid, calldate, dispatcherid)
values (141, to_date('18-10-1988', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (142, to_date('05-12-1957', 'dd-mm-yyyy'), 193186555);
insert into CALLHELP (callid, calldate, dispatcherid)
values (143, to_date('16-08-2013', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (144, to_date('06-04-1987', 'dd-mm-yyyy'), 504967455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (145, to_date('01-06-1956', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (146, to_date('30-08-1954', 'dd-mm-yyyy'), 498875242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (147, to_date('26-04-1964', 'dd-mm-yyyy'), 599890817);
insert into CALLHELP (callid, calldate, dispatcherid)
values (148, to_date('04-03-2002', 'dd-mm-yyyy'), 944938337);
insert into CALLHELP (callid, calldate, dispatcherid)
values (149, to_date('02-07-1992', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (150, to_date('09-10-1977', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (151, to_date('08-03-2007', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (152, to_date('06-07-1965', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (153, to_date('22-12-1981', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (154, to_date('10-06-1969', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (155, to_date('22-12-1978', 'dd-mm-yyyy'), 540114031);
insert into CALLHELP (callid, calldate, dispatcherid)
values (156, to_date('11-09-1987', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (157, to_date('10-12-1975', 'dd-mm-yyyy'), 906935306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (158, to_date('11-02-2003', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (159, to_date('16-12-1982', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (160, to_date('17-10-2010', 'dd-mm-yyyy'), 800947932);
insert into CALLHELP (callid, calldate, dispatcherid)
values (161, to_date('16-12-2001', 'dd-mm-yyyy'), 498875242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (162, to_date('28-11-2004', 'dd-mm-yyyy'), 800947932);
insert into CALLHELP (callid, calldate, dispatcherid)
values (163, to_date('13-06-1976', 'dd-mm-yyyy'), 944938337);
insert into CALLHELP (callid, calldate, dispatcherid)
values (164, to_date('18-03-2009', 'dd-mm-yyyy'), 193186555);
insert into CALLHELP (callid, calldate, dispatcherid)
values (165, to_date('11-11-1968', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (166, to_date('23-07-1965', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (167, to_date('13-11-1956', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (168, to_date('09-11-1960', 'dd-mm-yyyy'), 843458495);
insert into CALLHELP (callid, calldate, dispatcherid)
values (169, to_date('17-01-1954', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (170, to_date('24-10-1994', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (171, to_date('12-04-1954', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (172, to_date('24-10-1948', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (173, to_date('03-04-2009', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (174, to_date('18-05-2002', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (175, to_date('09-06-1974', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (176, to_date('03-07-1961', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (177, to_date('23-11-1988', 'dd-mm-yyyy'), 971253183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (178, to_date('27-04-2013', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (179, to_date('06-05-1964', 'dd-mm-yyyy'), 399467282);
insert into CALLHELP (callid, calldate, dispatcherid)
values (180, to_date('19-05-1967', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (181, to_date('27-10-1976', 'dd-mm-yyyy'), 414400325);
insert into CALLHELP (callid, calldate, dispatcherid)
values (182, to_date('03-01-1966', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (183, to_date('16-04-2016', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (184, to_date('26-01-1976', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (185, to_date('22-08-2015', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (186, to_date('05-07-2000', 'dd-mm-yyyy'), 952094084);
insert into CALLHELP (callid, calldate, dispatcherid)
values (187, to_date('22-05-2018', 'dd-mm-yyyy'), 825589019);
insert into CALLHELP (callid, calldate, dispatcherid)
values (188, to_date('27-01-2014', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (189, to_date('01-07-2002', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (190, to_date('18-07-2013', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (191, to_date('25-08-1975', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (192, to_date('04-12-2014', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (193, to_date('22-05-1967', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (194, to_date('17-11-1991', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (195, to_date('30-06-1993', 'dd-mm-yyyy'), 115714750);
insert into CALLHELP (callid, calldate, dispatcherid)
values (196, to_date('09-11-1983', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (197, to_date('10-12-2013', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (198, to_date('03-04-1972', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (199, to_date('02-11-1995', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (200, to_date('25-12-2004', 'dd-mm-yyyy'), 483475435);
commit;
prompt 200 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (201, to_date('22-09-1994', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (202, to_date('29-10-1987', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (203, to_date('08-08-1969', 'dd-mm-yyyy'), 747171108);
insert into CALLHELP (callid, calldate, dispatcherid)
values (204, to_date('21-12-2018', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (205, to_date('15-01-2001', 'dd-mm-yyyy'), 115714750);
insert into CALLHELP (callid, calldate, dispatcherid)
values (206, to_date('23-01-2001', 'dd-mm-yyyy'), 314514324);
insert into CALLHELP (callid, calldate, dispatcherid)
values (207, to_date('16-10-2015', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (208, to_date('15-03-2019', 'dd-mm-yyyy'), 971253183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (209, to_date('21-03-2011', 'dd-mm-yyyy'), 718428613);
insert into CALLHELP (callid, calldate, dispatcherid)
values (210, to_date('08-03-1967', 'dd-mm-yyyy'), 525253498);
insert into CALLHELP (callid, calldate, dispatcherid)
values (211, to_date('03-01-1991', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (212, to_date('14-06-2018', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (213, to_date('31-05-1993', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (214, to_date('24-01-1956', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (215, to_date('14-07-1963', 'dd-mm-yyyy'), 207347544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (216, to_date('24-01-2002', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (217, to_date('26-11-1958', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (218, to_date('05-09-1972', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (219, to_date('06-11-1971', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (220, to_date('16-08-2011', 'dd-mm-yyyy'), 351922829);
insert into CALLHELP (callid, calldate, dispatcherid)
values (221, to_date('22-11-1965', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (222, to_date('04-01-1980', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (223, to_date('11-09-1949', 'dd-mm-yyyy'), 727135472);
insert into CALLHELP (callid, calldate, dispatcherid)
values (224, to_date('10-02-1999', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (225, to_date('18-10-2001', 'dd-mm-yyyy'), 136082895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (226, to_date('19-06-1980', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (227, to_date('15-08-1961', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (228, to_date('07-08-1955', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (229, to_date('19-01-1960', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (230, to_date('26-10-2011', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (231, to_date('05-01-1957', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (232, to_date('29-05-1954', 'dd-mm-yyyy'), 580488974);
insert into CALLHELP (callid, calldate, dispatcherid)
values (233, to_date('24-05-1999', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (234, to_date('10-08-1985', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (235, to_date('02-09-1978', 'dd-mm-yyyy'), 792078922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (236, to_date('11-10-1964', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (237, to_date('05-09-1989', 'dd-mm-yyyy'), 580488974);
insert into CALLHELP (callid, calldate, dispatcherid)
values (238, to_date('28-01-2016', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (239, to_date('28-10-1961', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (240, to_date('22-01-2012', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (241, to_date('28-02-1988', 'dd-mm-yyyy'), 947447478);
insert into CALLHELP (callid, calldate, dispatcherid)
values (242, to_date('01-08-2015', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (243, to_date('12-09-1987', 'dd-mm-yyyy'), 558414787);
insert into CALLHELP (callid, calldate, dispatcherid)
values (244, to_date('09-05-1964', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (245, to_date('19-04-2018', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (246, to_date('12-07-1996', 'dd-mm-yyyy'), 800947932);
insert into CALLHELP (callid, calldate, dispatcherid)
values (247, to_date('23-07-1983', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (248, to_date('19-09-1953', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (249, to_date('16-01-2015', 'dd-mm-yyyy'), 513160497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (250, to_date('13-10-1999', 'dd-mm-yyyy'), 558414787);
insert into CALLHELP (callid, calldate, dispatcherid)
values (251, to_date('01-04-1949', 'dd-mm-yyyy'), 727135472);
insert into CALLHELP (callid, calldate, dispatcherid)
values (252, to_date('22-10-1991', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (253, to_date('26-08-2008', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (254, to_date('03-08-2009', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (255, to_date('03-04-1990', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (256, to_date('25-01-2004', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (257, to_date('19-12-1970', 'dd-mm-yyyy'), 349631451);
insert into CALLHELP (callid, calldate, dispatcherid)
values (258, to_date('05-01-1999', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (259, to_date('23-03-2013', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (260, to_date('27-05-1994', 'dd-mm-yyyy'), 115714750);
insert into CALLHELP (callid, calldate, dispatcherid)
values (261, to_date('20-03-1972', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (262, to_date('31-10-1961', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (263, to_date('19-01-1948', 'dd-mm-yyyy'), 162788221);
insert into CALLHELP (callid, calldate, dispatcherid)
values (264, to_date('03-05-1980', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (265, to_date('28-04-2000', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (266, to_date('28-12-2002', 'dd-mm-yyyy'), 395234141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (267, to_date('19-05-1992', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (268, to_date('13-09-1986', 'dd-mm-yyyy'), 207347544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (269, to_date('09-09-2018', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (270, to_date('01-07-1983', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (271, to_date('09-09-2014', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (272, to_date('15-10-1953', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (273, to_date('30-06-1974', 'dd-mm-yyyy'), 947447478);
insert into CALLHELP (callid, calldate, dispatcherid)
values (274, to_date('10-11-2015', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (275, to_date('26-10-1987', 'dd-mm-yyyy'), 988686001);
insert into CALLHELP (callid, calldate, dispatcherid)
values (276, to_date('18-01-1992', 'dd-mm-yyyy'), 349631451);
insert into CALLHELP (callid, calldate, dispatcherid)
values (277, to_date('01-07-1973', 'dd-mm-yyyy'), 718428613);
insert into CALLHELP (callid, calldate, dispatcherid)
values (278, to_date('27-12-2009', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (279, to_date('05-01-2013', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (280, to_date('26-03-1975', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (281, to_date('01-05-1973', 'dd-mm-yyyy'), 162788221);
insert into CALLHELP (callid, calldate, dispatcherid)
values (282, to_date('27-08-1997', 'dd-mm-yyyy'), 944938337);
insert into CALLHELP (callid, calldate, dispatcherid)
values (283, to_date('29-06-2006', 'dd-mm-yyyy'), 349631451);
insert into CALLHELP (callid, calldate, dispatcherid)
values (284, to_date('30-01-1984', 'dd-mm-yyyy'), 439929751);
insert into CALLHELP (callid, calldate, dispatcherid)
values (285, to_date('18-04-2003', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (286, to_date('17-05-2011', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (287, to_date('19-06-1984', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (288, to_date('02-07-2016', 'dd-mm-yyyy'), 477520608);
insert into CALLHELP (callid, calldate, dispatcherid)
values (289, to_date('30-08-1974', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (290, to_date('06-11-1949', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (291, to_date('16-09-2010', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (292, to_date('23-03-1972', 'dd-mm-yyyy'), 525253498);
insert into CALLHELP (callid, calldate, dispatcherid)
values (293, to_date('17-06-2017', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (294, to_date('19-11-2005', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (295, to_date('04-08-1950', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (296, to_date('27-12-1983', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (297, to_date('15-10-1975', 'dd-mm-yyyy'), 971253183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (298, to_date('24-10-2000', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (299, to_date('19-08-1967', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (300, to_date('12-03-2015', 'dd-mm-yyyy'), 496069738);
commit;
prompt 300 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (301, to_date('06-08-2005', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (302, to_date('02-06-2001', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (303, to_date('16-07-1962', 'dd-mm-yyyy'), 136082895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (304, to_date('08-02-1948', 'dd-mm-yyyy'), 952094084);
insert into CALLHELP (callid, calldate, dispatcherid)
values (305, to_date('30-12-1970', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (306, to_date('06-05-1987', 'dd-mm-yyyy'), 513160497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (307, to_date('07-10-1970', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (308, to_date('29-06-2018', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (309, to_date('15-01-2015', 'dd-mm-yyyy'), 349631451);
insert into CALLHELP (callid, calldate, dispatcherid)
values (310, to_date('11-01-2009', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (311, to_date('21-07-2006', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (312, to_date('26-10-2012', 'dd-mm-yyyy'), 603787067);
insert into CALLHELP (callid, calldate, dispatcherid)
values (313, to_date('15-01-2001', 'dd-mm-yyyy'), 590266488);
insert into CALLHELP (callid, calldate, dispatcherid)
values (314, to_date('20-02-1972', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (315, to_date('22-06-2001', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (316, to_date('29-11-1963', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (317, to_date('07-05-1984', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (318, to_date('13-06-1984', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (319, to_date('26-06-1981', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (320, to_date('15-02-1969', 'dd-mm-yyyy'), 603787067);
insert into CALLHELP (callid, calldate, dispatcherid)
values (321, to_date('29-08-1986', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (322, to_date('25-04-1969', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (323, to_date('21-06-1978', 'dd-mm-yyyy'), 718428613);
insert into CALLHELP (callid, calldate, dispatcherid)
values (324, to_date('11-01-1995', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (325, to_date('21-10-2008', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (326, to_date('24-07-1985', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (327, to_date('15-04-1964', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (328, to_date('25-07-1956', 'dd-mm-yyyy'), 792078922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (329, to_date('23-01-1994', 'dd-mm-yyyy'), 952094084);
insert into CALLHELP (callid, calldate, dispatcherid)
values (330, to_date('30-11-1957', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (331, to_date('27-04-1951', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (332, to_date('21-09-1998', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (333, to_date('04-12-1957', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (334, to_date('02-12-1969', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (335, to_date('07-07-1971', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (336, to_date('18-09-1972', 'dd-mm-yyyy'), 351922829);
insert into CALLHELP (callid, calldate, dispatcherid)
values (337, to_date('08-06-1996', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (338, to_date('17-05-1967', 'dd-mm-yyyy'), 504967455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (339, to_date('09-12-2005', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (340, to_date('25-08-1978', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (341, to_date('12-12-1956', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (342, to_date('28-03-1952', 'dd-mm-yyyy'), 947447478);
insert into CALLHELP (callid, calldate, dispatcherid)
values (343, to_date('26-10-2008', 'dd-mm-yyyy'), 181436117);
insert into CALLHELP (callid, calldate, dispatcherid)
values (344, to_date('10-09-1958', 'dd-mm-yyyy'), 207347544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (345, to_date('12-06-1995', 'dd-mm-yyyy'), 540114031);
insert into CALLHELP (callid, calldate, dispatcherid)
values (346, to_date('23-01-2019', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (347, to_date('04-02-1954', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (348, to_date('02-10-1996', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (349, to_date('02-05-2004', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (350, to_date('25-11-2017', 'dd-mm-yyyy'), 825589019);
insert into CALLHELP (callid, calldate, dispatcherid)
values (351, to_date('16-06-1976', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (352, to_date('25-08-1956', 'dd-mm-yyyy'), 101584298);
insert into CALLHELP (callid, calldate, dispatcherid)
values (353, to_date('25-09-1998', 'dd-mm-yyyy'), 115714750);
insert into CALLHELP (callid, calldate, dispatcherid)
values (354, to_date('01-10-1995', 'dd-mm-yyyy'), 988686001);
insert into CALLHELP (callid, calldate, dispatcherid)
values (355, to_date('27-11-1958', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (356, to_date('11-10-1970', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (357, to_date('12-04-1949', 'dd-mm-yyyy'), 792078922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (358, to_date('12-06-1976', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (359, to_date('15-10-2006', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (360, to_date('15-04-1979', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (361, to_date('01-06-1997', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (362, to_date('14-02-2015', 'dd-mm-yyyy'), 101584298);
insert into CALLHELP (callid, calldate, dispatcherid)
values (363, to_date('06-05-2008', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (364, to_date('30-09-1975', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (365, to_date('14-03-1973', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (366, to_date('02-02-1951', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (367, to_date('08-10-2009', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (368, to_date('02-05-1951', 'dd-mm-yyyy'), 504967455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (369, to_date('03-08-2015', 'dd-mm-yyyy'), 504967455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (370, to_date('16-04-2011', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (371, to_date('26-09-1964', 'dd-mm-yyyy'), 207347544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (372, to_date('23-06-1969', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (373, to_date('30-03-1991', 'dd-mm-yyyy'), 395234141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (374, to_date('14-03-1960', 'dd-mm-yyyy'), 599890817);
insert into CALLHELP (callid, calldate, dispatcherid)
values (375, to_date('18-06-2010', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (376, to_date('23-01-2011', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (377, to_date('27-10-2015', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (378, to_date('06-04-1964', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (379, to_date('02-04-1974', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (380, to_date('27-01-1950', 'dd-mm-yyyy'), 952094084);
insert into CALLHELP (callid, calldate, dispatcherid)
values (381, to_date('10-10-1989', 'dd-mm-yyyy'), 869296845);
insert into CALLHELP (callid, calldate, dispatcherid)
values (382, to_date('24-10-2002', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (383, to_date('13-07-1982', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (384, to_date('15-10-2019', 'dd-mm-yyyy'), 525253498);
insert into CALLHELP (callid, calldate, dispatcherid)
values (385, to_date('28-08-1948', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (386, to_date('24-06-1985', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (387, to_date('01-06-2012', 'dd-mm-yyyy'), 414400325);
insert into CALLHELP (callid, calldate, dispatcherid)
values (388, to_date('06-06-1969', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (389, to_date('26-11-2003', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (390, to_date('17-02-2000', 'dd-mm-yyyy'), 792078922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (391, to_date('27-09-1969', 'dd-mm-yyyy'), 395234141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (392, to_date('11-05-2007', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (393, to_date('16-02-2018', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (394, to_date('12-04-1971', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (395, to_date('10-08-2005', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (396, to_date('23-09-2002', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (397, to_date('10-12-1950', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (398, to_date('06-01-1953', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (399, to_date('14-06-1991', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (400, to_date('31-08-1969', 'dd-mm-yyyy'), 980238247);
commit;
prompt 400 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (401, to_date('24-03-2011', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (402, to_date('03-06-1976', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (403, to_date('22-07-1952', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (404, to_date('09-12-1961', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (405, to_date('12-12-1967', 'dd-mm-yyyy'), 952094084);
insert into CALLHELP (callid, calldate, dispatcherid)
values (406, to_date('02-07-1955', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (407, to_date('18-02-1948', 'dd-mm-yyyy'), 988686001);
insert into CALLHELP (callid, calldate, dispatcherid)
values (408, to_date('20-02-1954', 'dd-mm-yyyy'), 599890817);
insert into CALLHELP (callid, calldate, dispatcherid)
values (409, to_date('08-06-1995', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (410, to_date('01-08-2011', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (411, to_date('04-11-1973', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (412, to_date('30-04-1997', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (413, to_date('13-03-1957', 'dd-mm-yyyy'), 906935306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (414, to_date('09-04-1992', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (415, to_date('09-11-1958', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (416, to_date('30-03-2001', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (417, to_date('16-03-2008', 'dd-mm-yyyy'), 825589019);
insert into CALLHELP (callid, calldate, dispatcherid)
values (418, to_date('05-11-1984', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (419, to_date('25-05-2001', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (420, to_date('11-12-2006', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (421, to_date('12-09-1995', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (422, to_date('11-03-1952', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (423, to_date('16-10-1978', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (424, to_date('28-12-2013', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (425, to_date('20-06-1962', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (426, to_date('21-03-2003', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (427, to_date('02-01-1972', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (428, to_date('15-02-2010', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (429, to_date('03-09-1952', 'dd-mm-yyyy'), 727135472);
insert into CALLHELP (callid, calldate, dispatcherid)
values (430, to_date('12-10-2001', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (431, to_date('14-09-1992', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (432, to_date('05-06-1987', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (433, to_date('16-02-1984', 'dd-mm-yyyy'), 264250868);
insert into CALLHELP (callid, calldate, dispatcherid)
values (434, to_date('09-02-1954', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (435, to_date('19-10-1948', 'dd-mm-yyyy'), 351922829);
insert into CALLHELP (callid, calldate, dispatcherid)
values (436, to_date('30-12-2016', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (437, to_date('01-02-1971', 'dd-mm-yyyy'), 747171108);
insert into CALLHELP (callid, calldate, dispatcherid)
values (438, to_date('21-09-1950', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (439, to_date('23-06-1992', 'dd-mm-yyyy'), 264250868);
insert into CALLHELP (callid, calldate, dispatcherid)
values (440, to_date('18-02-1950', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (441, to_date('26-07-1957', 'dd-mm-yyyy'), 207347544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (442, to_date('07-11-1950', 'dd-mm-yyyy'), 843458495);
insert into CALLHELP (callid, calldate, dispatcherid)
values (443, to_date('08-10-1954', 'dd-mm-yyyy'), 477520608);
insert into CALLHELP (callid, calldate, dispatcherid)
values (444, to_date('25-12-1969', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (445, to_date('13-02-2013', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (446, to_date('13-05-1985', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (447, to_date('31-07-1954', 'dd-mm-yyyy'), 136082895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (448, to_date('26-09-1977', 'dd-mm-yyyy'), 162788221);
insert into CALLHELP (callid, calldate, dispatcherid)
values (449, to_date('24-02-2007', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (450, to_date('10-03-1986', 'dd-mm-yyyy'), 193186555);
insert into CALLHELP (callid, calldate, dispatcherid)
values (451, to_date('01-04-1950', 'dd-mm-yyyy'), 162788221);
insert into CALLHELP (callid, calldate, dispatcherid)
values (452, to_date('14-04-1973', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (453, to_date('08-09-1981', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (454, to_date('23-03-1962', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (455, to_date('03-08-1961', 'dd-mm-yyyy'), 599890817);
insert into CALLHELP (callid, calldate, dispatcherid)
values (456, to_date('26-05-1990', 'dd-mm-yyyy'), 207347544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (457, to_date('16-09-1970', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (458, to_date('10-10-2017', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (459, to_date('07-06-1954', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (460, to_date('26-05-2018', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (461, to_date('02-12-1985', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (462, to_date('22-06-1997', 'dd-mm-yyyy'), 825589019);
insert into CALLHELP (callid, calldate, dispatcherid)
values (463, to_date('07-09-1963', 'dd-mm-yyyy'), 825589019);
insert into CALLHELP (callid, calldate, dispatcherid)
values (464, to_date('29-04-1982', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (465, to_date('21-01-1953', 'dd-mm-yyyy'), 944938337);
insert into CALLHELP (callid, calldate, dispatcherid)
values (466, to_date('08-09-1981', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (467, to_date('11-11-1950', 'dd-mm-yyyy'), 351922829);
insert into CALLHELP (callid, calldate, dispatcherid)
values (468, to_date('12-08-1997', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (469, to_date('07-09-1958', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (470, to_date('15-06-1976', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (471, to_date('22-02-1972', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (472, to_date('04-04-1963', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (473, to_date('27-06-2015', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (474, to_date('27-11-1949', 'dd-mm-yyyy'), 727135472);
insert into CALLHELP (callid, calldate, dispatcherid)
values (475, to_date('04-12-2008', 'dd-mm-yyyy'), 439929751);
insert into CALLHELP (callid, calldate, dispatcherid)
values (476, to_date('30-06-2005', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (477, to_date('26-01-1994', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (478, to_date('06-03-1999', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (479, to_date('06-11-1964', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (480, to_date('22-12-1971', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (481, to_date('06-04-2009', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (482, to_date('02-11-1999', 'dd-mm-yyyy'), 603787067);
insert into CALLHELP (callid, calldate, dispatcherid)
values (483, to_date('15-05-1973', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (484, to_date('30-05-1992', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (485, to_date('23-11-1964', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (486, to_date('22-10-1961', 'dd-mm-yyyy'), 181436117);
insert into CALLHELP (callid, calldate, dispatcherid)
values (487, to_date('14-10-2007', 'dd-mm-yyyy'), 971253183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (488, to_date('16-10-2017', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (489, to_date('15-02-1985', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (490, to_date('15-10-2011', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (491, to_date('17-10-2017', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (492, to_date('05-01-1994', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (493, to_date('15-03-2004', 'dd-mm-yyyy'), 314514324);
insert into CALLHELP (callid, calldate, dispatcherid)
values (494, to_date('06-03-2002', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (495, to_date('14-07-2016', 'dd-mm-yyyy'), 414400325);
insert into CALLHELP (callid, calldate, dispatcherid)
values (496, to_date('28-01-1950', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (497, to_date('18-10-1954', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (498, to_date('28-06-1970', 'dd-mm-yyyy'), 580488974);
insert into CALLHELP (callid, calldate, dispatcherid)
values (499, to_date('21-02-1974', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (500, to_date('28-09-2000', 'dd-mm-yyyy'), 441023695);
commit;
prompt 500 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (501, to_date('06-10-1978', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (502, to_date('15-04-2009', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (503, to_date('13-10-1949', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (504, to_date('21-09-1975', 'dd-mm-yyyy'), 951414878);
insert into CALLHELP (callid, calldate, dispatcherid)
values (505, to_date('20-06-2012', 'dd-mm-yyyy'), 590266488);
insert into CALLHELP (callid, calldate, dispatcherid)
values (506, to_date('02-08-1978', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (507, to_date('19-03-1958', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (508, to_date('30-04-1971', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (509, to_date('28-07-1970', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (510, to_date('17-10-1996', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (511, to_date('26-10-2002', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (512, to_date('30-08-1952', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (513, to_date('26-04-1952', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (514, to_date('16-02-1982', 'dd-mm-yyyy'), 801292271);
insert into CALLHELP (callid, calldate, dispatcherid)
values (515, to_date('27-02-1987', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (516, to_date('15-04-1990', 'dd-mm-yyyy'), 747171108);
insert into CALLHELP (callid, calldate, dispatcherid)
values (517, to_date('08-05-1966', 'dd-mm-yyyy'), 193186555);
insert into CALLHELP (callid, calldate, dispatcherid)
values (518, to_date('12-07-1972', 'dd-mm-yyyy'), 115714750);
insert into CALLHELP (callid, calldate, dispatcherid)
values (519, to_date('10-01-2009', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (520, to_date('19-05-1979', 'dd-mm-yyyy'), 264250868);
insert into CALLHELP (callid, calldate, dispatcherid)
values (521, to_date('28-12-1965', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (522, to_date('03-02-2000', 'dd-mm-yyyy'), 399467282);
insert into CALLHELP (callid, calldate, dispatcherid)
values (523, to_date('25-12-1956', 'dd-mm-yyyy'), 101584298);
insert into CALLHELP (callid, calldate, dispatcherid)
values (524, to_date('06-06-1993', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (525, to_date('19-01-1979', 'dd-mm-yyyy'), 988686001);
insert into CALLHELP (callid, calldate, dispatcherid)
values (526, to_date('24-12-1951', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (527, to_date('28-05-1993', 'dd-mm-yyyy'), 747171108);
insert into CALLHELP (callid, calldate, dispatcherid)
values (528, to_date('21-05-1976', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (529, to_date('11-02-1972', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (530, to_date('09-11-1993', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (531, to_date('14-01-1980', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (532, to_date('08-05-1997', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (533, to_date('07-05-1953', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (534, to_date('19-10-1971', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (535, to_date('15-01-2006', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (536, to_date('26-09-1987', 'dd-mm-yyyy'), 351922829);
insert into CALLHELP (callid, calldate, dispatcherid)
values (537, to_date('15-10-1953', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (538, to_date('21-09-1952', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (539, to_date('12-07-2002', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (540, to_date('09-12-1968', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (541, to_date('22-02-1959', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (542, to_date('22-04-1959', 'dd-mm-yyyy'), 603787067);
insert into CALLHELP (callid, calldate, dispatcherid)
values (543, to_date('18-08-1955', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (544, to_date('09-07-1978', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (545, to_date('03-02-2008', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (546, to_date('27-05-1979', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (547, to_date('05-01-1998', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (548, to_date('14-11-1982', 'dd-mm-yyyy'), 825589019);
insert into CALLHELP (callid, calldate, dispatcherid)
values (549, to_date('26-01-1953', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (550, to_date('23-12-1961', 'dd-mm-yyyy'), 439929751);
insert into CALLHELP (callid, calldate, dispatcherid)
values (551, to_date('18-12-2018', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (552, to_date('17-05-1992', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (553, to_date('31-07-1963', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (554, to_date('10-07-2015', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (555, to_date('24-11-2016', 'dd-mm-yyyy'), 349631451);
insert into CALLHELP (callid, calldate, dispatcherid)
values (556, to_date('07-02-2019', 'dd-mm-yyyy'), 801292271);
insert into CALLHELP (callid, calldate, dispatcherid)
values (557, to_date('25-12-1971', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (558, to_date('19-12-2016', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (559, to_date('11-06-1970', 'dd-mm-yyyy'), 944938337);
insert into CALLHELP (callid, calldate, dispatcherid)
values (560, to_date('19-12-1948', 'dd-mm-yyyy'), 718428613);
insert into CALLHELP (callid, calldate, dispatcherid)
values (561, to_date('14-10-2005', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (562, to_date('14-02-1999', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (563, to_date('13-12-2019', 'dd-mm-yyyy'), 800947932);
insert into CALLHELP (callid, calldate, dispatcherid)
values (564, to_date('25-05-1976', 'dd-mm-yyyy'), 567796300);
insert into CALLHELP (callid, calldate, dispatcherid)
values (565, to_date('17-06-1966', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (566, to_date('30-07-1948', 'dd-mm-yyyy'), 801292271);
insert into CALLHELP (callid, calldate, dispatcherid)
values (567, to_date('26-07-1951', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (568, to_date('06-07-2017', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (569, to_date('19-09-2006', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (570, to_date('26-02-1950', 'dd-mm-yyyy'), 590266488);
insert into CALLHELP (callid, calldate, dispatcherid)
values (571, to_date('09-10-1999', 'dd-mm-yyyy'), 580488974);
insert into CALLHELP (callid, calldate, dispatcherid)
values (572, to_date('17-10-1973', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (573, to_date('25-04-1994', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (574, to_date('16-10-1957', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (575, to_date('06-06-2016', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (576, to_date('03-04-1982', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (577, to_date('10-05-2006', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (578, to_date('29-12-1983', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (579, to_date('01-05-1958', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (580, to_date('14-02-2004', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (581, to_date('29-01-1982', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (582, to_date('27-09-1987', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (583, to_date('29-03-1965', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (584, to_date('27-12-1975', 'dd-mm-yyyy'), 906935306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (585, to_date('02-03-1974', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (586, to_date('30-11-1964', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (587, to_date('11-06-1956', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (588, to_date('02-07-2019', 'dd-mm-yyyy'), 988686001);
insert into CALLHELP (callid, calldate, dispatcherid)
values (589, to_date('09-07-1990', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (590, to_date('23-03-1953', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (591, to_date('18-10-1969', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (592, to_date('14-07-1989', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (593, to_date('02-08-2002', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (594, to_date('14-08-1951', 'dd-mm-yyyy'), 414400325);
insert into CALLHELP (callid, calldate, dispatcherid)
values (595, to_date('10-04-2019', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (596, to_date('04-11-2016', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (597, to_date('15-02-1976', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (598, to_date('20-03-1970', 'dd-mm-yyyy'), 792078922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (599, to_date('03-01-1975', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (600, to_date('06-04-1957', 'dd-mm-yyyy'), 205862893);
commit;
prompt 600 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (601, to_date('11-07-1996', 'dd-mm-yyyy'), 477520608);
insert into CALLHELP (callid, calldate, dispatcherid)
values (602, to_date('19-09-1994', 'dd-mm-yyyy'), 906935306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (603, to_date('03-11-1969', 'dd-mm-yyyy'), 349631451);
insert into CALLHELP (callid, calldate, dispatcherid)
values (604, to_date('08-05-1979', 'dd-mm-yyyy'), 718428613);
insert into CALLHELP (callid, calldate, dispatcherid)
values (605, to_date('08-08-1984', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (606, to_date('04-05-2009', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (607, to_date('17-05-1964', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (608, to_date('30-07-1986', 'dd-mm-yyyy'), 951414878);
insert into CALLHELP (callid, calldate, dispatcherid)
values (609, to_date('18-11-2010', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (610, to_date('26-03-2006', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (611, to_date('07-07-1982', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (612, to_date('01-01-1962', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (613, to_date('27-05-1984', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (614, to_date('24-05-1981', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (615, to_date('05-07-2009', 'dd-mm-yyyy'), 558414787);
insert into CALLHELP (callid, calldate, dispatcherid)
values (616, to_date('05-06-2011', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (617, to_date('08-01-2012', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (618, to_date('07-02-1989', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (619, to_date('06-07-1984', 'dd-mm-yyyy'), 558414787);
insert into CALLHELP (callid, calldate, dispatcherid)
values (620, to_date('30-01-1961', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (621, to_date('11-03-1988', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (622, to_date('02-11-1966', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (623, to_date('14-08-1959', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (624, to_date('16-10-1949', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (625, to_date('14-04-1999', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (626, to_date('08-09-1978', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (627, to_date('30-05-1993', 'dd-mm-yyyy'), 162788221);
insert into CALLHELP (callid, calldate, dispatcherid)
values (628, to_date('26-08-1999', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (629, to_date('12-05-1958', 'dd-mm-yyyy'), 590266488);
insert into CALLHELP (callid, calldate, dispatcherid)
values (630, to_date('16-04-2013', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (631, to_date('05-01-1995', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (632, to_date('12-03-2005', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (633, to_date('29-06-1982', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (634, to_date('30-03-1984', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (635, to_date('20-08-1950', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (636, to_date('25-01-1997', 'dd-mm-yyyy'), 181436117);
insert into CALLHELP (callid, calldate, dispatcherid)
values (637, to_date('15-07-2000', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (638, to_date('14-01-2005', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (639, to_date('10-08-1956', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (640, to_date('14-03-1960', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (641, to_date('12-06-1959', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (642, to_date('18-06-2002', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (643, to_date('15-12-1986', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (644, to_date('23-06-1998', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (645, to_date('23-01-1981', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (646, to_date('14-07-1964', 'dd-mm-yyyy'), 504967455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (647, to_date('01-06-1971', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (648, to_date('27-11-1981', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (649, to_date('01-06-1965', 'dd-mm-yyyy'), 513160497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (650, to_date('06-12-1958', 'dd-mm-yyyy'), 567796300);
insert into CALLHELP (callid, calldate, dispatcherid)
values (651, to_date('02-01-1968', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (652, to_date('21-04-1972', 'dd-mm-yyyy'), 477520608);
insert into CALLHELP (callid, calldate, dispatcherid)
values (653, to_date('08-07-2008', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (654, to_date('22-11-1993', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (655, to_date('19-01-1998', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (656, to_date('15-06-1987', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (657, to_date('28-08-1978', 'dd-mm-yyyy'), 747171108);
insert into CALLHELP (callid, calldate, dispatcherid)
values (658, to_date('29-08-2009', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (659, to_date('04-10-1975', 'dd-mm-yyyy'), 162788221);
insert into CALLHELP (callid, calldate, dispatcherid)
values (660, to_date('12-10-1967', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (661, to_date('14-03-1979', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (662, to_date('22-05-2000', 'dd-mm-yyyy'), 599890817);
insert into CALLHELP (callid, calldate, dispatcherid)
values (663, to_date('26-03-1948', 'dd-mm-yyyy'), 162788221);
insert into CALLHELP (callid, calldate, dispatcherid)
values (664, to_date('10-07-2017', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (665, to_date('21-11-1969', 'dd-mm-yyyy'), 349631451);
insert into CALLHELP (callid, calldate, dispatcherid)
values (666, to_date('30-07-1978', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (667, to_date('18-01-1998', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (668, to_date('30-05-1984', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (669, to_date('21-08-1986', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (670, to_date('21-12-1997', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (671, to_date('12-04-1952', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (672, to_date('30-10-1961', 'dd-mm-yyyy'), 399467282);
insert into CALLHELP (callid, calldate, dispatcherid)
values (673, to_date('27-10-1951', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (674, to_date('06-01-2019', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (675, to_date('21-01-1978', 'dd-mm-yyyy'), 951414878);
insert into CALLHELP (callid, calldate, dispatcherid)
values (676, to_date('01-07-1985', 'dd-mm-yyyy'), 951414878);
insert into CALLHELP (callid, calldate, dispatcherid)
values (677, to_date('31-01-2011', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (678, to_date('28-09-1976', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (679, to_date('11-08-1976', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (680, to_date('20-08-2004', 'dd-mm-yyyy'), 399467282);
insert into CALLHELP (callid, calldate, dispatcherid)
values (681, to_date('18-08-1956', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (682, to_date('24-03-1979', 'dd-mm-yyyy'), 414400325);
insert into CALLHELP (callid, calldate, dispatcherid)
values (683, to_date('26-10-2007', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (684, to_date('20-08-1983', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (685, to_date('08-01-1969', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (686, to_date('23-06-1988', 'dd-mm-yyyy'), 399467282);
insert into CALLHELP (callid, calldate, dispatcherid)
values (687, to_date('01-04-2017', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (688, to_date('26-03-1990', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (689, to_date('23-06-2013', 'dd-mm-yyyy'), 947447478);
insert into CALLHELP (callid, calldate, dispatcherid)
values (690, to_date('17-11-1991', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (691, to_date('18-09-2017', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (692, to_date('11-03-1982', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (693, to_date('29-08-1978', 'dd-mm-yyyy'), 971253183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (694, to_date('08-02-2016', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (695, to_date('25-04-2005', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (696, to_date('15-06-2012', 'dd-mm-yyyy'), 567796300);
insert into CALLHELP (callid, calldate, dispatcherid)
values (697, to_date('27-12-1981', 'dd-mm-yyyy'), 558414787);
insert into CALLHELP (callid, calldate, dispatcherid)
values (698, to_date('19-07-1983', 'dd-mm-yyyy'), 439929751);
insert into CALLHELP (callid, calldate, dispatcherid)
values (699, to_date('26-12-1969', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (700, to_date('02-11-1988', 'dd-mm-yyyy'), 477520608);
commit;
prompt 700 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (701, to_date('05-06-1977', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (702, to_date('24-03-1987', 'dd-mm-yyyy'), 351922829);
insert into CALLHELP (callid, calldate, dispatcherid)
values (703, to_date('15-07-2000', 'dd-mm-yyyy'), 525253498);
insert into CALLHELP (callid, calldate, dispatcherid)
values (704, to_date('08-03-1996', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (705, to_date('11-10-1961', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (706, to_date('24-03-1976', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (707, to_date('20-03-1980', 'dd-mm-yyyy'), 800947932);
insert into CALLHELP (callid, calldate, dispatcherid)
values (708, to_date('13-01-1957', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (709, to_date('28-06-1987', 'dd-mm-yyyy'), 264250868);
insert into CALLHELP (callid, calldate, dispatcherid)
values (710, to_date('10-08-2003', 'dd-mm-yyyy'), 540114031);
insert into CALLHELP (callid, calldate, dispatcherid)
values (711, to_date('27-09-1952', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (712, to_date('29-10-1998', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (713, to_date('07-12-1981', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (714, to_date('29-10-1956', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (715, to_date('07-11-2006', 'dd-mm-yyyy'), 802374700);
insert into CALLHELP (callid, calldate, dispatcherid)
values (716, to_date('12-07-2015', 'dd-mm-yyyy'), 952094084);
insert into CALLHELP (callid, calldate, dispatcherid)
values (717, to_date('25-03-1949', 'dd-mm-yyyy'), 801292271);
insert into CALLHELP (callid, calldate, dispatcherid)
values (718, to_date('03-09-1994', 'dd-mm-yyyy'), 567796300);
insert into CALLHELP (callid, calldate, dispatcherid)
values (719, to_date('10-05-1967', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (720, to_date('02-11-2007', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (721, to_date('08-07-1978', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (722, to_date('02-09-1962', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (723, to_date('04-09-1972', 'dd-mm-yyyy'), 395234141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (724, to_date('04-11-1977', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (725, to_date('06-10-1986', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (726, to_date('06-01-2019', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (727, to_date('28-11-1994', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (728, to_date('17-03-1954', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (729, to_date('24-01-1988', 'dd-mm-yyyy'), 439929751);
insert into CALLHELP (callid, calldate, dispatcherid)
values (730, to_date('28-12-1950', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (731, to_date('05-05-1958', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (732, to_date('25-10-2003', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (733, to_date('06-06-1953', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (734, to_date('20-11-1989', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (735, to_date('12-07-1952', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (736, to_date('19-12-2013', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (737, to_date('04-02-1981', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (738, to_date('08-06-1956', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (739, to_date('01-11-1963', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (740, to_date('17-01-1965', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (741, to_date('19-04-1985', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (742, to_date('17-09-1976', 'dd-mm-yyyy'), 214158330);
insert into CALLHELP (callid, calldate, dispatcherid)
values (743, to_date('16-06-1989', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (744, to_date('08-09-1973', 'dd-mm-yyyy'), 843458495);
insert into CALLHELP (callid, calldate, dispatcherid)
values (745, to_date('08-08-1983', 'dd-mm-yyyy'), 440414604);
insert into CALLHELP (callid, calldate, dispatcherid)
values (746, to_date('28-07-1960', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (747, to_date('01-01-1958', 'dd-mm-yyyy'), 101584298);
insert into CALLHELP (callid, calldate, dispatcherid)
values (748, to_date('12-06-1962', 'dd-mm-yyyy'), 513160497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (749, to_date('30-08-1974', 'dd-mm-yyyy'), 504967455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (750, to_date('27-07-2002', 'dd-mm-yyyy'), 906935306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (751, to_date('09-07-1960', 'dd-mm-yyyy'), 747171108);
insert into CALLHELP (callid, calldate, dispatcherid)
values (752, to_date('24-12-1963', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (753, to_date('20-07-1982', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (754, to_date('18-05-1977', 'dd-mm-yyyy'), 988686001);
insert into CALLHELP (callid, calldate, dispatcherid)
values (755, to_date('18-01-2000', 'dd-mm-yyyy'), 825589019);
insert into CALLHELP (callid, calldate, dispatcherid)
values (756, to_date('14-09-1979', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (757, to_date('16-07-1979', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (758, to_date('16-09-1985', 'dd-mm-yyyy'), 580488974);
insert into CALLHELP (callid, calldate, dispatcherid)
values (759, to_date('29-08-1979', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (760, to_date('25-12-1968', 'dd-mm-yyyy'), 513160497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (761, to_date('23-05-1975', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (762, to_date('29-09-1994', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (763, to_date('05-01-2001', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (764, to_date('17-10-1968', 'dd-mm-yyyy'), 947447478);
insert into CALLHELP (callid, calldate, dispatcherid)
values (765, to_date('04-03-1985', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (766, to_date('15-01-1969', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (767, to_date('28-05-1965', 'dd-mm-yyyy'), 792078922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (768, to_date('23-11-1983', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (769, to_date('17-07-2019', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (770, to_date('23-12-1987', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (771, to_date('21-04-1989', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (772, to_date('30-06-2007', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (773, to_date('17-07-1953', 'dd-mm-yyyy'), 507339068);
insert into CALLHELP (callid, calldate, dispatcherid)
values (774, to_date('23-08-1989', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (775, to_date('28-05-1978', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (776, to_date('07-06-1956', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (777, to_date('26-11-1993', 'dd-mm-yyyy'), 558414787);
insert into CALLHELP (callid, calldate, dispatcherid)
values (778, to_date('18-04-2005', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (779, to_date('04-03-2016', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (780, to_date('08-11-1952', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (781, to_date('03-11-2016', 'dd-mm-yyyy'), 633097629);
insert into CALLHELP (callid, calldate, dispatcherid)
values (782, to_date('02-04-1948', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (783, to_date('23-11-1982', 'dd-mm-yyyy'), 961635098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (784, to_date('14-05-2016', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (785, to_date('08-05-2008', 'dd-mm-yyyy'), 314514324);
insert into CALLHELP (callid, calldate, dispatcherid)
values (786, to_date('02-05-1965', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (787, to_date('21-03-1989', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (788, to_date('23-09-1958', 'dd-mm-yyyy'), 800947932);
insert into CALLHELP (callid, calldate, dispatcherid)
values (789, to_date('01-01-1951', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (790, to_date('10-10-1982', 'dd-mm-yyyy'), 580488974);
insert into CALLHELP (callid, calldate, dispatcherid)
values (791, to_date('19-03-1968', 'dd-mm-yyyy'), 525253498);
insert into CALLHELP (callid, calldate, dispatcherid)
values (792, to_date('31-12-1984', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (793, to_date('28-03-1949', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (794, to_date('23-08-1958', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (795, to_date('26-11-2009', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (796, to_date('30-03-1985', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (797, to_date('05-03-2017', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (798, to_date('10-10-1977', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (799, to_date('25-04-1998', 'dd-mm-yyyy'), 707509224);
insert into CALLHELP (callid, calldate, dispatcherid)
values (800, to_date('03-09-1964', 'dd-mm-yyyy'), 961635098);
commit;
prompt 800 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (801, to_date('21-11-1960', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (802, to_date('08-03-1973', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (803, to_date('11-01-1991', 'dd-mm-yyyy'), 477520608);
insert into CALLHELP (callid, calldate, dispatcherid)
values (804, to_date('02-05-1956', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (805, to_date('28-03-2003', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (806, to_date('27-12-2009', 'dd-mm-yyyy'), 951414878);
insert into CALLHELP (callid, calldate, dispatcherid)
values (807, to_date('26-03-1973', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (808, to_date('09-04-1992', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (809, to_date('12-02-1991', 'dd-mm-yyyy'), 727135472);
insert into CALLHELP (callid, calldate, dispatcherid)
values (810, to_date('31-10-1979', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (811, to_date('04-04-1994', 'dd-mm-yyyy'), 971253183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (812, to_date('18-03-1989', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (813, to_date('18-04-1993', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (814, to_date('22-10-2001', 'dd-mm-yyyy'), 439929751);
insert into CALLHELP (callid, calldate, dispatcherid)
values (815, to_date('16-08-1966', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (816, to_date('18-09-1980', 'dd-mm-yyyy'), 590266488);
insert into CALLHELP (callid, calldate, dispatcherid)
values (817, to_date('10-09-1984', 'dd-mm-yyyy'), 162788221);
insert into CALLHELP (callid, calldate, dispatcherid)
values (818, to_date('16-11-2017', 'dd-mm-yyyy'), 971253183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (819, to_date('06-08-1991', 'dd-mm-yyyy'), 988686001);
insert into CALLHELP (callid, calldate, dispatcherid)
values (820, to_date('17-11-1975', 'dd-mm-yyyy'), 801292271);
insert into CALLHELP (callid, calldate, dispatcherid)
values (821, to_date('08-03-1985', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (822, to_date('17-10-1950', 'dd-mm-yyyy'), 115714750);
insert into CALLHELP (callid, calldate, dispatcherid)
values (823, to_date('25-03-1987', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (824, to_date('19-06-1948', 'dd-mm-yyyy'), 525253498);
insert into CALLHELP (callid, calldate, dispatcherid)
values (825, to_date('19-11-2004', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (826, to_date('11-07-1992', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (827, to_date('28-11-1986', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (828, to_date('15-08-1956', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (829, to_date('17-12-2011', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (830, to_date('05-03-2015', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (831, to_date('26-05-1956', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (832, to_date('07-01-1961', 'dd-mm-yyyy'), 952094084);
insert into CALLHELP (callid, calldate, dispatcherid)
values (833, to_date('02-12-1994', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (834, to_date('24-05-1976', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (835, to_date('28-05-1993', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (836, to_date('14-07-1989', 'dd-mm-yyyy'), 207347544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (837, to_date('30-05-1975', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (838, to_date('01-05-1951', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (839, to_date('04-08-1973', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (840, to_date('01-06-2000', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (841, to_date('07-07-1971', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (842, to_date('07-01-2007', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (843, to_date('26-02-2011', 'dd-mm-yyyy'), 801292271);
insert into CALLHELP (callid, calldate, dispatcherid)
values (844, to_date('23-12-2019', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (845, to_date('19-07-1983', 'dd-mm-yyyy'), 681488617);
insert into CALLHELP (callid, calldate, dispatcherid)
values (846, to_date('27-04-1991', 'dd-mm-yyyy'), 590266488);
insert into CALLHELP (callid, calldate, dispatcherid)
values (847, to_date('08-11-2005', 'dd-mm-yyyy'), 802374700);
insert into CALLHELP (callid, calldate, dispatcherid)
values (848, to_date('26-09-1978', 'dd-mm-yyyy'), 747171108);
insert into CALLHELP (callid, calldate, dispatcherid)
values (849, to_date('09-05-2002', 'dd-mm-yyyy'), 242585762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (850, to_date('04-05-1956', 'dd-mm-yyyy'), 952094084);
insert into CALLHELP (callid, calldate, dispatcherid)
values (851, to_date('28-07-2004', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (852, to_date('11-02-1966', 'dd-mm-yyyy'), 181436117);
insert into CALLHELP (callid, calldate, dispatcherid)
values (853, to_date('08-02-1968', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (854, to_date('10-05-1992', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (855, to_date('06-05-2009', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (856, to_date('05-08-1967', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (857, to_date('08-08-1967', 'dd-mm-yyyy'), 942996913);
insert into CALLHELP (callid, calldate, dispatcherid)
values (858, to_date('23-03-1976', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (859, to_date('04-12-1951', 'dd-mm-yyyy'), 349631451);
insert into CALLHELP (callid, calldate, dispatcherid)
values (860, to_date('23-05-1948', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (861, to_date('20-01-1950', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (862, to_date('28-04-1954', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (863, to_date('26-10-1978', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (864, to_date('22-08-1995', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (865, to_date('26-05-1969', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (866, to_date('12-12-2007', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (867, to_date('31-10-1966', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (868, to_date('18-01-2015', 'dd-mm-yyyy'), 404883551);
insert into CALLHELP (callid, calldate, dispatcherid)
values (869, to_date('31-01-2017', 'dd-mm-yyyy'), 414400325);
insert into CALLHELP (callid, calldate, dispatcherid)
values (870, to_date('04-04-1961', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (871, to_date('16-02-1997', 'dd-mm-yyyy'), 558414787);
insert into CALLHELP (callid, calldate, dispatcherid)
values (872, to_date('28-01-1990', 'dd-mm-yyyy'), 264250868);
insert into CALLHELP (callid, calldate, dispatcherid)
values (873, to_date('14-05-1949', 'dd-mm-yyyy'), 792078922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (874, to_date('10-09-2011', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (875, to_date('07-10-1987', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (876, to_date('12-08-2011', 'dd-mm-yyyy'), 590266488);
insert into CALLHELP (callid, calldate, dispatcherid)
values (877, to_date('11-02-2013', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (878, to_date('16-11-1978', 'dd-mm-yyyy'), 869296845);
insert into CALLHELP (callid, calldate, dispatcherid)
values (879, to_date('28-09-1996', 'dd-mm-yyyy'), 496069738);
insert into CALLHELP (callid, calldate, dispatcherid)
values (880, to_date('19-02-2006', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (881, to_date('05-02-1954', 'dd-mm-yyyy'), 165847242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (882, to_date('24-01-1980', 'dd-mm-yyyy'), 525253498);
insert into CALLHELP (callid, calldate, dispatcherid)
values (883, to_date('20-07-1971', 'dd-mm-yyyy'), 116564125);
insert into CALLHELP (callid, calldate, dispatcherid)
values (884, to_date('26-05-1954', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (885, to_date('15-10-2019', 'dd-mm-yyyy'), 727135472);
insert into CALLHELP (callid, calldate, dispatcherid)
values (886, to_date('18-01-2012', 'dd-mm-yyyy'), 718428613);
insert into CALLHELP (callid, calldate, dispatcherid)
values (887, to_date('19-03-1953', 'dd-mm-yyyy'), 399467282);
insert into CALLHELP (callid, calldate, dispatcherid)
values (888, to_date('03-08-1952', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (889, to_date('29-08-1968', 'dd-mm-yyyy'), 128080684);
insert into CALLHELP (callid, calldate, dispatcherid)
values (890, to_date('31-07-1951', 'dd-mm-yyyy'), 843458495);
insert into CALLHELP (callid, calldate, dispatcherid)
values (891, to_date('08-11-2014', 'dd-mm-yyyy'), 431317000);
insert into CALLHELP (callid, calldate, dispatcherid)
values (892, to_date('04-01-1972', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (893, to_date('23-12-1973', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (894, to_date('22-04-1974', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (895, to_date('17-09-2006', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (896, to_date('31-03-1965', 'dd-mm-yyyy'), 399467282);
insert into CALLHELP (callid, calldate, dispatcherid)
values (897, to_date('07-02-1966', 'dd-mm-yyyy'), 540114031);
insert into CALLHELP (callid, calldate, dispatcherid)
values (898, to_date('04-03-1952', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (899, to_date('16-09-1971', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (900, to_date('04-11-1958', 'dd-mm-yyyy'), 540114031);
commit;
prompt 900 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (901, to_date('13-04-2005', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (902, to_date('10-05-1989', 'dd-mm-yyyy'), 513160497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (903, to_date('30-06-2007', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (904, to_date('18-06-1988', 'dd-mm-yyyy'), 349631451);
insert into CALLHELP (callid, calldate, dispatcherid)
values (905, to_date('13-12-1956', 'dd-mm-yyyy'), 205862893);
insert into CALLHELP (callid, calldate, dispatcherid)
values (906, to_date('07-09-2008', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (907, to_date('27-12-2006', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (908, to_date('30-07-1948', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (909, to_date('11-07-1981', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (910, to_date('24-07-1972', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (911, to_date('06-06-1997', 'dd-mm-yyyy'), 535163098);
insert into CALLHELP (callid, calldate, dispatcherid)
values (912, to_date('17-08-2004', 'dd-mm-yyyy'), 184263508);
insert into CALLHELP (callid, calldate, dispatcherid)
values (913, to_date('14-09-1966', 'dd-mm-yyyy'), 395234141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (914, to_date('18-05-2018', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (915, to_date('03-12-1997', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (916, to_date('10-09-1983', 'dd-mm-yyyy'), 525253498);
insert into CALLHELP (callid, calldate, dispatcherid)
values (917, to_date('04-04-1990', 'dd-mm-yyyy'), 553099150);
insert into CALLHELP (callid, calldate, dispatcherid)
values (918, to_date('13-06-2004', 'dd-mm-yyyy'), 884150938);
insert into CALLHELP (callid, calldate, dispatcherid)
values (919, to_date('26-06-1971', 'dd-mm-yyyy'), 439929751);
insert into CALLHELP (callid, calldate, dispatcherid)
values (920, to_date('01-09-1975', 'dd-mm-yyyy'), 477520608);
insert into CALLHELP (callid, calldate, dispatcherid)
values (921, to_date('03-05-2013', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (922, to_date('04-06-1978', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (923, to_date('05-08-2015', 'dd-mm-yyyy'), 637575251);
insert into CALLHELP (callid, calldate, dispatcherid)
values (924, to_date('09-12-1984', 'dd-mm-yyyy'), 802374700);
insert into CALLHELP (callid, calldate, dispatcherid)
values (925, to_date('04-04-1956', 'dd-mm-yyyy'), 314514324);
insert into CALLHELP (callid, calldate, dispatcherid)
values (926, to_date('19-03-1984', 'dd-mm-yyyy'), 314514324);
insert into CALLHELP (callid, calldate, dispatcherid)
values (927, to_date('25-03-1999', 'dd-mm-yyyy'), 727135472);
insert into CALLHELP (callid, calldate, dispatcherid)
values (928, to_date('20-07-2000', 'dd-mm-yyyy'), 947447478);
insert into CALLHELP (callid, calldate, dispatcherid)
values (929, to_date('21-10-2012', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (930, to_date('30-05-1999', 'dd-mm-yyyy'), 708442139);
insert into CALLHELP (callid, calldate, dispatcherid)
values (931, to_date('06-06-2014', 'dd-mm-yyyy'), 567796300);
insert into CALLHELP (callid, calldate, dispatcherid)
values (932, to_date('16-11-1980', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (933, to_date('11-01-1979', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (934, to_date('18-03-2003', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (935, to_date('01-05-1986', 'dd-mm-yyyy'), 101584298);
insert into CALLHELP (callid, calldate, dispatcherid)
values (936, to_date('15-10-1968', 'dd-mm-yyyy'), 483475435);
insert into CALLHELP (callid, calldate, dispatcherid)
values (937, to_date('16-07-1972', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (938, to_date('02-11-1958', 'dd-mm-yyyy'), 243238131);
insert into CALLHELP (callid, calldate, dispatcherid)
values (939, to_date('19-09-1953', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (940, to_date('04-05-1977', 'dd-mm-yyyy'), 843512931);
insert into CALLHELP (callid, calldate, dispatcherid)
values (941, to_date('21-04-1950', 'dd-mm-yyyy'), 839552387);
insert into CALLHELP (callid, calldate, dispatcherid)
values (942, to_date('18-06-1998', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (943, to_date('25-01-2012', 'dd-mm-yyyy'), 481548013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (944, to_date('03-12-2005', 'dd-mm-yyyy'), 675278483);
insert into CALLHELP (callid, calldate, dispatcherid)
values (945, to_date('10-12-1968', 'dd-mm-yyyy'), 906935306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (946, to_date('16-08-2018', 'dd-mm-yyyy'), 766242929);
insert into CALLHELP (callid, calldate, dispatcherid)
values (947, to_date('03-02-1991', 'dd-mm-yyyy'), 918208321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (948, to_date('15-12-1970', 'dd-mm-yyyy'), 789685574);
insert into CALLHELP (callid, calldate, dispatcherid)
values (949, to_date('15-07-1963', 'dd-mm-yyyy'), 800947932);
insert into CALLHELP (callid, calldate, dispatcherid)
values (950, to_date('25-02-1982', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (951, to_date('21-10-2018', 'dd-mm-yyyy'), 498875242);
insert into CALLHELP (callid, calldate, dispatcherid)
values (952, to_date('15-01-1983', 'dd-mm-yyyy'), 414400325);
insert into CALLHELP (callid, calldate, dispatcherid)
values (953, to_date('26-11-1980', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (954, to_date('05-08-1990', 'dd-mm-yyyy'), 869296845);
insert into CALLHELP (callid, calldate, dispatcherid)
values (955, to_date('15-01-1956', 'dd-mm-yyyy'), 719059544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (956, to_date('23-08-1962', 'dd-mm-yyyy'), 580488974);
insert into CALLHELP (callid, calldate, dispatcherid)
values (957, to_date('01-06-2003', 'dd-mm-yyyy'), 980238247);
insert into CALLHELP (callid, calldate, dispatcherid)
values (958, to_date('17-02-1983', 'dd-mm-yyyy'), 502131885);
insert into CALLHELP (callid, calldate, dispatcherid)
values (959, to_date('09-07-2005', 'dd-mm-yyyy'), 718428613);
insert into CALLHELP (callid, calldate, dispatcherid)
values (960, to_date('07-04-1962', 'dd-mm-yyyy'), 525253498);
insert into CALLHELP (callid, calldate, dispatcherid)
values (961, to_date('12-04-2011', 'dd-mm-yyyy'), 792078922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (962, to_date('29-12-1997', 'dd-mm-yyyy'), 951414878);
insert into CALLHELP (callid, calldate, dispatcherid)
values (963, to_date('26-05-1975', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (964, to_date('10-02-1971', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (965, to_date('07-05-1995', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (966, to_date('29-05-1988', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (967, to_date('17-04-2005', 'dd-mm-yyyy'), 549493698);
insert into CALLHELP (callid, calldate, dispatcherid)
values (968, to_date('06-04-1994', 'dd-mm-yyyy'), 951414878);
insert into CALLHELP (callid, calldate, dispatcherid)
values (969, to_date('27-05-1992', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (970, to_date('25-12-1984', 'dd-mm-yyyy'), 122924782);
insert into CALLHELP (callid, calldate, dispatcherid)
values (971, to_date('09-11-2018', 'dd-mm-yyyy'), 136082895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (972, to_date('08-05-1974', 'dd-mm-yyyy'), 568666955);
insert into CALLHELP (callid, calldate, dispatcherid)
values (973, to_date('20-12-1998', 'dd-mm-yyyy'), 602857670);
insert into CALLHELP (callid, calldate, dispatcherid)
values (974, to_date('30-08-1956', 'dd-mm-yyyy'), 563119002);
insert into CALLHELP (callid, calldate, dispatcherid)
values (975, to_date('20-10-1990', 'dd-mm-yyyy'), 727135472);
insert into CALLHELP (callid, calldate, dispatcherid)
values (976, to_date('25-09-1987', 'dd-mm-yyyy'), 599890817);
insert into CALLHELP (callid, calldate, dispatcherid)
values (977, to_date('05-08-1979', 'dd-mm-yyyy'), 525386822);
insert into CALLHELP (callid, calldate, dispatcherid)
values (978, to_date('18-02-2018', 'dd-mm-yyyy'), 995102445);
insert into CALLHELP (callid, calldate, dispatcherid)
values (979, to_date('16-06-1948', 'dd-mm-yyyy'), 101584298);
insert into CALLHELP (callid, calldate, dispatcherid)
values (980, to_date('24-02-1995', 'dd-mm-yyyy'), 366343244);
insert into CALLHELP (callid, calldate, dispatcherid)
values (981, to_date('25-08-1969', 'dd-mm-yyyy'), 243336161);
insert into CALLHELP (callid, calldate, dispatcherid)
values (982, to_date('28-09-1975', 'dd-mm-yyyy'), 963532017);
insert into CALLHELP (callid, calldate, dispatcherid)
values (983, to_date('27-10-1995', 'dd-mm-yyyy'), 376286668);
insert into CALLHELP (callid, calldate, dispatcherid)
values (984, to_date('01-12-2010', 'dd-mm-yyyy'), 207347544);
insert into CALLHELP (callid, calldate, dispatcherid)
values (985, to_date('20-08-1984', 'dd-mm-yyyy'), 944938337);
insert into CALLHELP (callid, calldate, dispatcherid)
values (986, to_date('04-12-2011', 'dd-mm-yyyy'), 275351971);
insert into CALLHELP (callid, calldate, dispatcherid)
values (987, to_date('04-02-2000', 'dd-mm-yyyy'), 800947932);
insert into CALLHELP (callid, calldate, dispatcherid)
values (988, to_date('31-07-1970', 'dd-mm-yyyy'), 967108709);
insert into CALLHELP (callid, calldate, dispatcherid)
values (989, to_date('22-12-1951', 'dd-mm-yyyy'), 834241599);
insert into CALLHELP (callid, calldate, dispatcherid)
values (990, to_date('21-02-1988', 'dd-mm-yyyy'), 540114031);
insert into CALLHELP (callid, calldate, dispatcherid)
values (991, to_date('25-09-1948', 'dd-mm-yyyy'), 906935306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (992, to_date('05-02-2017', 'dd-mm-yyyy'), 439929751);
insert into CALLHELP (callid, calldate, dispatcherid)
values (993, to_date('18-04-1953', 'dd-mm-yyyy'), 971253183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (994, to_date('06-04-1958', 'dd-mm-yyyy'), 801292271);
insert into CALLHELP (callid, calldate, dispatcherid)
values (995, to_date('03-01-1969', 'dd-mm-yyyy'), 609870937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (996, to_date('04-07-1981', 'dd-mm-yyyy'), 441023695);
insert into CALLHELP (callid, calldate, dispatcherid)
values (997, to_date('04-04-1985', 'dd-mm-yyyy'), 872367234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (998, to_date('13-07-1948', 'dd-mm-yyyy'), 926145059);
insert into CALLHELP (callid, calldate, dispatcherid)
values (999, to_date('10-01-2010', 'dd-mm-yyyy'), 385114707);
insert into CALLHELP (callid, calldate, dispatcherid)
values (1000, to_date('04-02-2002', 'dd-mm-yyyy'), 727135472);
commit;
prompt 1000 records loaded
prompt Loading DRIVER...
insert into DRIVER (driverid)
values (543820399);
insert into DRIVER (driverid)
values (259790830);
insert into DRIVER (driverid)
values (356009760);
insert into DRIVER (driverid)
values (762566292);
insert into DRIVER (driverid)
values (337884271);
insert into DRIVER (driverid)
values (547214894);
insert into DRIVER (driverid)
values (235345052);
insert into DRIVER (driverid)
values (685378695);
insert into DRIVER (driverid)
values (156186136);
insert into DRIVER (driverid)
values (718428613);
insert into DRIVER (driverid)
values (210204404);
insert into DRIVER (driverid)
values (394178853);
insert into DRIVER (driverid)
values (843519385);
insert into DRIVER (driverid)
values (806090432);
insert into DRIVER (driverid)
values (852113698);
insert into DRIVER (driverid)
values (717450469);
insert into DRIVER (driverid)
values (991207433);
insert into DRIVER (driverid)
values (468133232);
insert into DRIVER (driverid)
values (562129084);
insert into DRIVER (driverid)
values (422988413);
insert into DRIVER (driverid)
values (150507078);
insert into DRIVER (driverid)
values (414668590);
insert into DRIVER (driverid)
values (605815385);
insert into DRIVER (driverid)
values (403208661);
insert into DRIVER (driverid)
values (535975740);
insert into DRIVER (driverid)
values (784497084);
insert into DRIVER (driverid)
values (368489397);
insert into DRIVER (driverid)
values (927539471);
insert into DRIVER (driverid)
values (260961871);
insert into DRIVER (driverid)
values (813323354);
insert into DRIVER (driverid)
values (996027713);
insert into DRIVER (driverid)
values (801444708);
insert into DRIVER (driverid)
values (870772763);
insert into DRIVER (driverid)
values (512089472);
insert into DRIVER (driverid)
values (751921020);
insert into DRIVER (driverid)
values (494281887);
insert into DRIVER (driverid)
values (205827981);
insert into DRIVER (driverid)
values (467624110);
insert into DRIVER (driverid)
values (494877713);
insert into DRIVER (driverid)
values (741127642);
insert into DRIVER (driverid)
values (203883392);
insert into DRIVER (driverid)
values (935141213);
insert into DRIVER (driverid)
values (846551850);
insert into DRIVER (driverid)
values (409477082);
insert into DRIVER (driverid)
values (847856992);
insert into DRIVER (driverid)
values (802698033);
insert into DRIVER (driverid)
values (859974578);
insert into DRIVER (driverid)
values (883025897);
insert into DRIVER (driverid)
values (858604549);
insert into DRIVER (driverid)
values (841009827);
insert into DRIVER (driverid)
values (238992471);
insert into DRIVER (driverid)
values (171117624);
insert into DRIVER (driverid)
values (390685535);
insert into DRIVER (driverid)
values (961635098);
insert into DRIVER (driverid)
values (101584298);
insert into DRIVER (driverid)
values (659837175);
insert into DRIVER (driverid)
values (161160901);
insert into DRIVER (driverid)
values (299400522);
insert into DRIVER (driverid)
values (381730004);
insert into DRIVER (driverid)
values (882458516);
insert into DRIVER (driverid)
values (512333062);
insert into DRIVER (driverid)
values (765141502);
insert into DRIVER (driverid)
values (356886576);
insert into DRIVER (driverid)
values (467610759);
insert into DRIVER (driverid)
values (791364724);
insert into DRIVER (driverid)
values (305336709);
insert into DRIVER (driverid)
values (408357513);
insert into DRIVER (driverid)
values (413997128);
insert into DRIVER (driverid)
values (726500787);
insert into DRIVER (driverid)
values (246462174);
insert into DRIVER (driverid)
values (375096553);
insert into DRIVER (driverid)
values (234659034);
insert into DRIVER (driverid)
values (825072524);
insert into DRIVER (driverid)
values (942644760);
insert into DRIVER (driverid)
values (274340804);
insert into DRIVER (driverid)
values (431116476);
insert into DRIVER (driverid)
values (530131962);
insert into DRIVER (driverid)
values (649977206);
insert into DRIVER (driverid)
values (475197916);
insert into DRIVER (driverid)
values (172099662);
insert into DRIVER (driverid)
values (411522632);
insert into DRIVER (driverid)
values (592339013);
insert into DRIVER (driverid)
values (988686001);
insert into DRIVER (driverid)
values (512647397);
insert into DRIVER (driverid)
values (910230564);
insert into DRIVER (driverid)
values (607515527);
insert into DRIVER (driverid)
values (796808759);
insert into DRIVER (driverid)
values (353002056);
insert into DRIVER (driverid)
values (178457229);
insert into DRIVER (driverid)
values (169997654);
insert into DRIVER (driverid)
values (744119752);
insert into DRIVER (driverid)
values (140899169);
insert into DRIVER (driverid)
values (434134560);
insert into DRIVER (driverid)
values (144935536);
insert into DRIVER (driverid)
values (928952772);
insert into DRIVER (driverid)
values (327599490);
commit;
prompt 96 records loaded
prompt Loading PARAMEDIC...
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (15, 910148391);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 602857670);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 442765602);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (37, 766713817);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 966618858);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 953369172);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 286048247);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (16, 481161391);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 442065013);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (44, 942644760);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 304761100);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (15, 256239435);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 883025897);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (13, 609721920);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 165847242);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (19, 378936331);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (28, 382284930);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (29, 343281461);
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
values (47, 134024937);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (2, 302976561);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (40, 239803816);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 265119104);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (34, 417582361);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (2, 178457229);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 762139241);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (39, 628551248);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (40, 245675893);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 100263721);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 238035478);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (41, 214158330);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 900618507);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 898255498);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (11, 803721923);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (20, 802477498);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (50, 347639660);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (37, 138192266);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (23, 577311698);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (34, 227798879);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (38, 339593939);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (25, 727135472);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (15, 526367693);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (26, 896635944);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (22, 376286668);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (34, 579654282);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (29, 948139256);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (19, 886541617);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (35, 150507078);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (40, 159353604);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (43, 373176861);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (4, 681488617);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 152977912);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (1, 812843652);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (45, 858875113);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (19, 339897673);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 429375037);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (25, 417752520);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (5, 605351268);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (20, 479816079);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (10, 842479128);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (12, 812565282);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 329900476);
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
values (40, 520066928);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 901297210);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (0, 926145059);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (5, 307344200);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (4, 982427445);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (44, 711979218);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (40, 435639070);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (14, 631365623);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (9, 974874812);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (22, 614843052);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (29, 761247130);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 394178853);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (14, 349631451);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (36, 719059544);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (18, 356102475);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (49, 654307339);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 364957248);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (32, 741630052);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (4, 414668590);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (31, 870561709);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (6, 422520960);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (49, 954207230);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (13, 776213891);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (23, 468133232);
commit;
prompt 99 records loaded
prompt Loading TEAM...
insert into TEAM (teamid, driverid, ambulanceid)
values (1, 274340804, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (2, 942644760, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (3, 883025897, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (4, 547214894, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (5, 512647397, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (6, 403208661, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (7, 475197916, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (8, 144935536, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (9, 409477082, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (10, 337884271, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (11, 961635098, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (12, 659837175, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (13, 870772763, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (14, 765141502, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (15, 494877713, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (16, 562129084, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (17, 210204404, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (18, 765141502, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (19, 409477082, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (20, 260961871, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (21, 156186136, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (22, 858604549, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (23, 494281887, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (24, 205827981, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (25, 260961871, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (26, 210204404, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (27, 649977206, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (28, 467610759, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (29, 411522632, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (30, 547214894, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (31, 394178853, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (32, 161160901, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (33, 171117624, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (34, 592339013, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (35, 859974578, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (36, 843519385, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (37, 592339013, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (38, 512647397, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (39, 991207433, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (40, 434134560, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (41, 414668590, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (42, 422988413, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (43, 927539471, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (44, 870772763, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (45, 299400522, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (46, 717450469, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (47, 942644760, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (48, 796808759, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (49, 512089472, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (50, 825072524, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (51, 512333062, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (52, 605815385, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (53, 802698033, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (54, 607515527, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (55, 356886576, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (56, 535975740, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (57, 843519385, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (58, 203883392, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (59, 414668590, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (60, 494281887, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (61, 409477082, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (62, 928952772, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (63, 305336709, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (64, 841009827, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (65, 375096553, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (66, 408357513, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (67, 942644760, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (68, 144935536, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (69, 172099662, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (70, 390685535, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (71, 101584298, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (72, 327599490, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (73, 144935536, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (74, 649977206, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (75, 765141502, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (76, 414668590, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (77, 592339013, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (78, 543820399, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (79, 238992471, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (80, 259790830, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (81, 434134560, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (82, 169997654, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (83, 659837175, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (84, 741127642, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (85, 494877713, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (86, 996027713, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (87, 543820399, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (88, 718428613, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (89, 475197916, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (90, 494281887, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (91, 205827981, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (92, 156186136, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (93, 274340804, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (94, 852113698, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (95, 996027713, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (96, 991207433, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (97, 494281887, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (98, 726500787, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (99, 659837175, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (100, 813323354, 71);
commit;
prompt 100 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (101, 605815385, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (102, 156186136, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (103, 205827981, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (104, 726500787, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (105, 530131962, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (106, 235345052, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (107, 806090432, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (108, 649977206, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (109, 475197916, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (110, 530131962, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (111, 205827981, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (112, 928952772, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (113, 494281887, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (114, 150507078, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (115, 843519385, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (116, 717450469, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (117, 140899169, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (118, 414668590, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (119, 846551850, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (120, 991207433, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (121, 718428613, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (122, 649977206, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (123, 203883392, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (124, 928952772, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (125, 717450469, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (126, 431116476, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (127, 494281887, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (128, 765141502, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (129, 409477082, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (130, 101584298, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (131, 467624110, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (132, 843519385, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (133, 825072524, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (134, 390685535, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (135, 784497084, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (136, 356009760, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (137, 356009760, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (138, 409477082, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (139, 659837175, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (140, 910230564, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (141, 238992471, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (142, 741127642, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (143, 368489397, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (144, 238992471, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (145, 150507078, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (146, 512647397, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (147, 467624110, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (148, 210204404, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (149, 203883392, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (150, 996027713, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (151, 605815385, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (152, 543820399, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (153, 178457229, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (154, 172099662, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (155, 274340804, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (156, 859974578, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (157, 605815385, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (158, 741127642, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (159, 494877713, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (160, 605815385, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (161, 368489397, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (162, 717450469, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (163, 140899169, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (164, 791364724, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (165, 813323354, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (166, 535975740, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (167, 156186136, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (168, 235345052, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (169, 403208661, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (170, 413997128, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (171, 259790830, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (172, 859974578, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (173, 562129084, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (174, 928952772, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (175, 494877713, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (176, 161160901, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (177, 467624110, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (178, 409477082, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (179, 246462174, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (180, 394178853, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (181, 751921020, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (182, 238992471, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (183, 607515527, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (184, 512089472, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (185, 858604549, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (186, 431116476, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (187, 394178853, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (188, 368489397, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (189, 910230564, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (190, 274340804, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (191, 403208661, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (192, 961635098, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (193, 751921020, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (194, 791364724, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (195, 150507078, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (196, 203883392, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (197, 718428613, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (198, 942644760, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (199, 543820399, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (200, 414668590, 83);
commit;
prompt 200 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (201, 813323354, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (202, 274340804, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (203, 375096553, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (204, 169997654, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (205, 870772763, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (206, 607515527, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (207, 150507078, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (208, 205827981, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (209, 547214894, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (210, 246462174, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (211, 375096553, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (212, 260961871, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (213, 161160901, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (214, 337884271, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (215, 852113698, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (216, 403208661, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (217, 996027713, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (218, 368489397, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (219, 512089472, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (220, 784497084, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (221, 422988413, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (222, 910230564, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (223, 434134560, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (224, 935141213, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (225, 847856992, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (226, 859974578, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (227, 935141213, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (228, 394178853, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (229, 171117624, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (230, 796808759, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (231, 205827981, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (232, 717450469, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (233, 927539471, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (234, 607515527, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (235, 368489397, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (236, 274340804, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (237, 305336709, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (238, 825072524, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (239, 203883392, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (240, 751921020, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (241, 882458516, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (242, 234659034, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (243, 368489397, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (244, 543820399, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (245, 717450469, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (246, 996027713, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (247, 337884271, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (248, 169997654, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (249, 547214894, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (250, 852113698, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (251, 765141502, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (252, 356886576, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (253, 659837175, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (254, 144935536, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (255, 910230564, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (256, 744119752, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (257, 765141502, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (258, 368489397, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (259, 235345052, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (260, 825072524, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (261, 996027713, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (262, 375096553, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (263, 988686001, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (264, 234659034, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (265, 171117624, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (266, 171117624, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (267, 203883392, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (268, 530131962, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (269, 403208661, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (270, 409477082, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (271, 140899169, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (272, 414668590, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (273, 246462174, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (274, 274340804, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (275, 846551850, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (276, 988686001, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (277, 205827981, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (278, 356009760, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (279, 411522632, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (280, 140899169, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (281, 413997128, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (282, 859974578, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (283, 741127642, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (284, 172099662, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (285, 882458516, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (286, 961635098, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (287, 659837175, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (288, 741127642, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (289, 852113698, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (290, 744119752, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (291, 988686001, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (292, 390685535, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (293, 751921020, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (294, 961635098, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (295, 801444708, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (296, 806090432, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (297, 512333062, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (298, 741127642, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (299, 605815385, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (300, 547214894, 4);
commit;
prompt 300 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (301, 403208661, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (302, 394178853, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (303, 259790830, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (304, 744119752, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (305, 368489397, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (306, 494281887, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (307, 299400522, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (308, 375096553, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (309, 475197916, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (310, 394178853, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (311, 356009760, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (312, 235345052, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (313, 847856992, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (314, 356886576, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (315, 870772763, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (316, 883025897, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (317, 150507078, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (318, 494877713, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (319, 512647397, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (320, 935141213, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (321, 238992471, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (322, 356886576, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (323, 431116476, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (324, 259790830, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (325, 512647397, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (326, 434134560, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (327, 178457229, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (328, 375096553, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (329, 203883392, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (330, 858604549, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (331, 327599490, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (332, 988686001, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (333, 562129084, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (334, 843519385, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (335, 547214894, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (336, 726500787, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (337, 203883392, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (338, 260961871, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (339, 751921020, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (340, 726500787, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (341, 535975740, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (342, 431116476, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (343, 494281887, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (344, 260961871, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (345, 649977206, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (346, 414668590, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (347, 996027713, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (348, 101584298, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (349, 847856992, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (350, 883025897, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (351, 411522632, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (352, 475197916, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (353, 390685535, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (354, 649977206, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (355, 685378695, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (356, 988686001, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (357, 784497084, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (358, 234659034, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (359, 356009760, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (360, 717450469, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (361, 327599490, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (362, 356009760, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (363, 403208661, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (364, 234659034, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (365, 411522632, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (366, 394178853, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (367, 431116476, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (368, 928952772, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (369, 101584298, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (370, 299400522, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (371, 390685535, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (372, 468133232, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (373, 274340804, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (374, 409477082, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (375, 607515527, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (376, 353002056, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (377, 846551850, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (378, 235345052, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (379, 171117624, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (380, 150507078, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (381, 234659034, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (382, 156186136, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (383, 530131962, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (384, 467610759, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (385, 414668590, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (386, 235345052, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (387, 422988413, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (388, 718428613, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (389, 605815385, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (390, 928952772, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (391, 927539471, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (392, 801444708, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (393, 305336709, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (394, 847856992, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (395, 274340804, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (396, 841009827, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (397, 991207433, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (398, 140899169, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (399, 843519385, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (400, 859974578, 68);
commit;
prompt 400 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (401, 751921020, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (402, 961635098, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (403, 260961871, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (404, 234659034, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (405, 791364724, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (406, 172099662, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (407, 592339013, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (408, 741127642, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (409, 801444708, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (410, 368489397, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (411, 467624110, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (412, 512647397, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (413, 305336709, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (414, 408357513, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (415, 870772763, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (416, 260961871, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (417, 592339013, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (418, 512089472, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (419, 353002056, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (420, 140899169, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (421, 408357513, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (422, 928952772, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (423, 101584298, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (424, 494281887, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (425, 235345052, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (426, 238992471, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (427, 512333062, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (428, 414668590, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (429, 935141213, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (430, 825072524, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (431, 813323354, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (432, 852113698, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (433, 408357513, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (434, 413997128, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (435, 140899169, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (436, 784497084, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (437, 858604549, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (438, 592339013, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (439, 234659034, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (440, 161160901, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (441, 305336709, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (442, 468133232, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (443, 101584298, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (444, 150507078, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (445, 806090432, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (446, 547214894, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (447, 535975740, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (448, 260961871, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (449, 744119752, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (450, 475197916, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (451, 717450469, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (452, 178457229, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (453, 592339013, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (454, 996027713, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (455, 259790830, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (456, 305336709, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (457, 259790830, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (458, 468133232, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (459, 210204404, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (460, 991207433, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (461, 394178853, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (462, 178457229, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (463, 234659034, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (464, 562129084, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (465, 375096553, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (466, 172099662, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (467, 394178853, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (468, 988686001, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (469, 685378695, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (470, 413997128, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (471, 512089472, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (472, 409477082, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (473, 928952772, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (474, 494877713, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (475, 144935536, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (476, 852113698, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (477, 403208661, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (478, 468133232, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (479, 765141502, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (480, 883025897, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (481, 927539471, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (482, 988686001, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (483, 422988413, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (484, 246462174, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (485, 394178853, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (486, 530131962, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (487, 356009760, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (488, 353002056, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (489, 161160901, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (490, 467610759, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (491, 375096553, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (492, 353002056, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (493, 144935536, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (494, 685378695, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (495, 717450469, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (496, 235345052, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (497, 910230564, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (498, 434134560, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (499, 765141502, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (500, 910230564, 36);
commit;
prompt 500 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (501, 847856992, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (502, 172099662, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (503, 791364724, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (504, 368489397, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (505, 178457229, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (506, 942644760, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (507, 274340804, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (508, 910230564, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (509, 512089472, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (510, 996027713, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (511, 475197916, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (512, 928952772, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (513, 796808759, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (514, 852113698, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (515, 883025897, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (516, 494281887, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (517, 562129084, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (518, 859974578, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (519, 414668590, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (520, 140899169, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (521, 806090432, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (522, 846551850, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (523, 996027713, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (524, 414668590, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (525, 327599490, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (526, 156186136, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (527, 883025897, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (528, 859974578, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (529, 274340804, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (530, 467624110, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (531, 765141502, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (532, 744119752, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (533, 140899169, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (534, 353002056, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (535, 434134560, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (536, 101584298, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (537, 802698033, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (538, 205827981, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (539, 494877713, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (540, 649977206, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (541, 718428613, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (542, 928952772, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (543, 751921020, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (544, 235345052, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (545, 547214894, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (546, 299400522, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (547, 431116476, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (548, 685378695, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (549, 327599490, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (550, 413997128, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (551, 883025897, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (552, 744119752, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (553, 403208661, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (554, 414668590, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (555, 607515527, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (556, 468133232, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (557, 935141213, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (558, 156186136, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (559, 744119752, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (560, 494877713, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (561, 870772763, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (562, 765141502, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (563, 847856992, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (564, 178457229, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (565, 394178853, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (566, 353002056, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (567, 234659034, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (568, 210204404, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (569, 988686001, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (570, 161160901, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (571, 858604549, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (572, 882458516, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (573, 512089472, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (574, 178457229, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (575, 156186136, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (576, 751921020, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (577, 260961871, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (578, 512089472, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (579, 762566292, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (580, 870772763, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (581, 726500787, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (582, 259790830, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (583, 144935536, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (584, 927539471, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (585, 942644760, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (586, 543820399, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (587, 825072524, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (588, 685378695, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (589, 274340804, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (590, 409477082, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (591, 434134560, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (592, 259790830, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (593, 408357513, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (594, 858604549, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (595, 726500787, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (596, 353002056, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (597, 825072524, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (598, 327599490, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (599, 274340804, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (600, 796808759, 93);
commit;
prompt 600 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (601, 238992471, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (602, 928952772, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (603, 543820399, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (604, 414668590, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (605, 414668590, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (606, 843519385, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (607, 235345052, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (608, 791364724, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (609, 205827981, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (610, 411522632, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (611, 883025897, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (612, 796808759, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (613, 431116476, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (614, 403208661, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (615, 547214894, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (616, 381730004, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (617, 942644760, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (618, 928952772, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (619, 846551850, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (620, 409477082, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (621, 274340804, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (622, 475197916, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (623, 605815385, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (624, 530131962, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (625, 784497084, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (626, 259790830, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (627, 605815385, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (628, 927539471, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (629, 169997654, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (630, 882458516, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (631, 235345052, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (632, 605815385, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (633, 422988413, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (634, 741127642, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (635, 685378695, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (636, 475197916, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (637, 156186136, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (638, 988686001, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (639, 512333062, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (640, 685378695, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (641, 870772763, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (642, 413997128, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (643, 512333062, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (644, 375096553, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (645, 607515527, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (646, 935141213, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (647, 494281887, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (648, 475197916, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (649, 299400522, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (650, 765141502, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (651, 234659034, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (652, 394178853, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (653, 741127642, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (654, 547214894, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (655, 246462174, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (656, 935141213, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (657, 408357513, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (658, 847856992, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (659, 717450469, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (660, 356886576, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (661, 744119752, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (662, 847856992, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (663, 512647397, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (664, 381730004, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (665, 411522632, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (666, 928952772, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (667, 843519385, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (668, 475197916, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (669, 101584298, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (670, 512333062, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (671, 512089472, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (672, 169997654, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (673, 847856992, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (674, 592339013, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (675, 717450469, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (676, 718428613, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (677, 140899169, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (678, 178457229, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (679, 530131962, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (680, 547214894, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (681, 592339013, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (682, 413997128, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (683, 726500787, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (684, 210204404, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (685, 140899169, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (686, 927539471, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (687, 512333062, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (688, 607515527, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (689, 910230564, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (690, 494281887, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (691, 475197916, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (692, 512647397, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (693, 512089472, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (694, 802698033, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (695, 413997128, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (696, 649977206, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (697, 467610759, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (698, 762566292, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (699, 172099662, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (700, 607515527, 41);
commit;
prompt 700 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (701, 171117624, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (702, 468133232, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (703, 337884271, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (704, 530131962, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (705, 535975740, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (706, 409477082, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (707, 718428613, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (708, 409477082, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (709, 717450469, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (710, 535975740, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (711, 859974578, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (712, 726500787, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (713, 751921020, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (714, 806090432, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (715, 512333062, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (716, 234659034, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (717, 512647397, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (718, 353002056, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (719, 467624110, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (720, 494281887, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (721, 928952772, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (722, 238992471, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (723, 475197916, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (724, 547214894, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (725, 144935536, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (726, 592339013, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (727, 870772763, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (728, 172099662, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (729, 843519385, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (730, 717450469, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (731, 718428613, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (732, 144935536, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (733, 718428613, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (734, 841009827, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (735, 431116476, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (736, 841009827, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (737, 841009827, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (738, 178457229, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (739, 765141502, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (740, 101584298, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (741, 140899169, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (742, 784497084, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (743, 649977206, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (744, 935141213, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (745, 150507078, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (746, 991207433, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (747, 337884271, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (748, 101584298, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (749, 178457229, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (750, 238992471, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (751, 413997128, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (752, 870772763, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (753, 467624110, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (754, 434134560, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (755, 356009760, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (756, 659837175, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (757, 592339013, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (758, 259790830, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (759, 942644760, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (760, 434134560, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (761, 140899169, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (762, 150507078, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (763, 718428613, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (764, 605815385, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (765, 765141502, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (766, 796808759, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (767, 353002056, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (768, 717450469, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (769, 403208661, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (770, 796808759, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (771, 927539471, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (772, 494877713, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (773, 543820399, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (774, 259790830, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (775, 494877713, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (776, 210204404, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (777, 825072524, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (778, 784497084, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (779, 234659034, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (780, 494281887, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (781, 210204404, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (782, 762566292, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (783, 238992471, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (784, 883025897, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (785, 274340804, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (786, 434134560, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (787, 171117624, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (788, 762566292, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (789, 813323354, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (790, 467610759, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (791, 535975740, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (792, 246462174, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (793, 210204404, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (794, 927539471, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (795, 535975740, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (796, 156186136, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (797, 274340804, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (798, 475197916, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (799, 928952772, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (800, 235345052, 9);
commit;
prompt 800 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (801, 234659034, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (802, 996027713, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (803, 234659034, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (804, 422988413, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (805, 403208661, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (806, 649977206, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (807, 717450469, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (808, 910230564, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (809, 101584298, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (810, 852113698, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (811, 274340804, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (812, 150507078, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (813, 467610759, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (814, 961635098, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (815, 337884271, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (816, 530131962, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (817, 259790830, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (818, 235345052, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (819, 413997128, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (820, 813323354, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (821, 607515527, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (822, 234659034, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (823, 996027713, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (824, 512647397, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (825, 530131962, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (826, 246462174, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (827, 605815385, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (828, 605815385, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (829, 494281887, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (830, 762566292, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (831, 475197916, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (832, 649977206, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (833, 238992471, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (834, 813323354, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (835, 356009760, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (836, 847856992, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (837, 512647397, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (838, 414668590, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (839, 414668590, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (840, 852113698, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (841, 883025897, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (842, 530131962, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (843, 203883392, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (844, 205827981, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (845, 156186136, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (846, 802698033, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (847, 246462174, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (848, 846551850, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (849, 927539471, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (850, 547214894, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (851, 806090432, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (852, 859974578, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (853, 494877713, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (854, 846551850, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (855, 726500787, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (856, 203883392, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (857, 859974578, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (858, 394178853, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (859, 744119752, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (860, 659837175, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (861, 961635098, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (862, 390685535, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (863, 858604549, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (864, 414668590, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (865, 494281887, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (866, 813323354, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (867, 801444708, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (868, 353002056, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (869, 260961871, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (870, 235345052, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (871, 434134560, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (872, 961635098, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (873, 882458516, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (874, 203883392, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (875, 605815385, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (876, 846551850, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (877, 394178853, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (878, 494877713, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (879, 403208661, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (880, 796808759, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (881, 434134560, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (882, 144935536, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (883, 408357513, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (884, 140899169, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (885, 178457229, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (886, 422988413, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (887, 409477082, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (888, 467610759, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (889, 910230564, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (890, 870772763, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (891, 961635098, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (892, 260961871, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (893, 408357513, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (894, 381730004, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (895, 512089472, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (896, 494877713, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (897, 813323354, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (898, 140899169, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (899, 852113698, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (900, 171117624, 59);
commit;
prompt 900 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (901, 414668590, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (902, 741127642, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (903, 259790830, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (904, 543820399, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (905, 927539471, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (906, 883025897, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (907, 327599490, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (908, 468133232, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (909, 942644760, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (910, 414668590, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (911, 101584298, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (912, 512647397, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (913, 726500787, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (914, 156186136, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (915, 847856992, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (916, 813323354, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (917, 375096553, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (918, 726500787, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (919, 649977206, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (920, 156186136, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (921, 434134560, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (922, 409477082, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (923, 859974578, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (924, 475197916, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (925, 494877713, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (926, 375096553, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (927, 744119752, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (928, 356886576, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (929, 299400522, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (930, 717450469, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (931, 150507078, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (932, 161160901, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (933, 101584298, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (934, 101584298, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (935, 927539471, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (936, 882458516, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (937, 156186136, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (938, 234659034, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (939, 825072524, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (940, 356886576, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (941, 784497084, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (942, 685378695, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (943, 910230564, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (944, 813323354, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (945, 846551850, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (946, 169997654, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (947, 475197916, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (948, 203883392, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (949, 741127642, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (950, 353002056, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (951, 784497084, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (952, 859974578, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (953, 169997654, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (954, 172099662, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (955, 494877713, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (956, 475197916, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (957, 961635098, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (958, 467610759, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (959, 718428613, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (960, 101584298, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (961, 431116476, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (962, 718428613, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (963, 858604549, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (964, 171117624, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (965, 238992471, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (966, 718428613, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (967, 607515527, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (968, 530131962, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (969, 592339013, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (970, 806090432, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (971, 649977206, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (972, 717450469, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (973, 210204404, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (974, 801444708, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (975, 765141502, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (976, 741127642, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (977, 927539471, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (978, 813323354, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (979, 512089472, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (980, 467624110, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (981, 825072524, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (982, 928952772, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (983, 381730004, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (984, 512647397, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (985, 784497084, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (986, 547214894, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (987, 414668590, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (988, 414668590, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (989, 368489397, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (990, 494877713, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (991, 607515527, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (992, 928952772, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (993, 765141502, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (994, 991207433, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (995, 403208661, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (996, 843519385, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (997, 238992471, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (998, 172099662, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (999, 150507078, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1000, 562129084, 4);
commit;
prompt 1000 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1001, 791364724, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1002, 353002056, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1003, 408357513, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1004, 535975740, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1005, 337884271, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1006, 882458516, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1007, 390685535, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1008, 467610759, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1009, 467610759, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1010, 605815385, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1011, 178457229, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1012, 299400522, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1013, 172099662, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1014, 205827981, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1015, 172099662, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1016, 883025897, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1017, 467610759, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1018, 928952772, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1019, 210204404, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1020, 422988413, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1021, 169997654, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1022, 422988413, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1023, 765141502, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1024, 928952772, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1025, 562129084, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1026, 356009760, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1027, 178457229, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1028, 512089472, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1029, 403208661, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1030, 475197916, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1031, 796808759, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1032, 408357513, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1033, 607515527, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1034, 841009827, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1035, 562129084, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1036, 246462174, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1037, 235345052, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1038, 649977206, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1039, 390685535, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1040, 375096553, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1041, 422988413, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1042, 543820399, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1043, 512333062, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1044, 765141502, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1045, 178457229, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1046, 431116476, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1047, 422988413, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1048, 796808759, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1049, 718428613, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1050, 413997128, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1051, 859974578, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1052, 468133232, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1053, 852113698, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1054, 101584298, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1055, 169997654, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1056, 910230564, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1057, 726500787, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1058, 161160901, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1059, 535975740, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1060, 935141213, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1061, 381730004, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1062, 205827981, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1063, 411522632, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1064, 846551850, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1065, 156186136, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1066, 305336709, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1067, 751921020, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1068, 765141502, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1069, 935141213, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1070, 762566292, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1071, 172099662, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1072, 381730004, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1073, 172099662, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1074, 852113698, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1075, 411522632, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1076, 467624110, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1077, 882458516, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1078, 806090432, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1079, 605815385, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1080, 592339013, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1081, 274340804, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1082, 961635098, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1083, 259790830, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1084, 592339013, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1085, 274340804, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1086, 535975740, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1087, 659837175, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1088, 368489397, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1089, 375096553, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1090, 259790830, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1091, 605815385, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1092, 512647397, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1093, 172099662, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1094, 685378695, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1095, 717450469, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1096, 411522632, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1097, 394178853, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1098, 205827981, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1099, 859974578, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1100, 368489397, 34);
commit;
prompt 1100 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1101, 882458516, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1102, 305336709, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1103, 592339013, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1104, 802698033, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1105, 305336709, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1106, 409477082, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1107, 806090432, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1108, 140899169, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1109, 413997128, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1110, 765141502, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1111, 408357513, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1112, 512089472, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1113, 991207433, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1114, 852113698, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1115, 882458516, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1116, 210204404, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1117, 434134560, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1118, 535975740, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1119, 356886576, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1120, 327599490, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1121, 356009760, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1122, 413997128, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1123, 156186136, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1124, 494877713, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1125, 813323354, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1126, 375096553, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1127, 403208661, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1128, 841009827, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1129, 547214894, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1130, 411522632, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1131, 210204404, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1132, 422988413, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1133, 205827981, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1134, 494281887, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1135, 813323354, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1136, 649977206, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1137, 717450469, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1138, 140899169, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1139, 494877713, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1140, 408357513, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1141, 535975740, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1142, 246462174, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1143, 659837175, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1144, 305336709, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1145, 928952772, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1146, 870772763, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1147, 847856992, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1148, 806090432, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1149, 547214894, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1150, 411522632, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1151, 802698033, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1152, 210204404, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1153, 381730004, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1154, 801444708, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1155, 927539471, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1156, 259790830, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1157, 234659034, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1158, 741127642, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1159, 234659034, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1160, 494281887, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1161, 403208661, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1162, 841009827, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1163, 356009760, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1164, 422988413, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1165, 726500787, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1166, 144935536, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1167, 806090432, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1168, 927539471, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1169, 169997654, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1170, 178457229, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1171, 246462174, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1172, 605815385, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1173, 961635098, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1174, 685378695, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1175, 852113698, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1176, 512089472, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1177, 562129084, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1178, 562129084, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1179, 434134560, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1180, 205827981, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1181, 305336709, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1182, 858604549, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1183, 512333062, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1184, 140899169, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1185, 274340804, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1186, 431116476, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1187, 961635098, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1188, 169997654, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1189, 547214894, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1190, 203883392, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1191, 238992471, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1192, 961635098, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1193, 368489397, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1194, 806090432, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1195, 368489397, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1196, 512089472, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1197, 988686001, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1198, 882458516, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1199, 101584298, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1200, 607515527, 41);
commit;
prompt 1200 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1201, 910230564, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1202, 353002056, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1203, 409477082, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1204, 741127642, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1205, 468133232, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1206, 765141502, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1207, 178457229, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1208, 806090432, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1209, 543820399, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1210, 156186136, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1211, 274340804, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1212, 883025897, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1213, 246462174, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1214, 327599490, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1215, 169997654, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1216, 210204404, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1217, 762566292, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1218, 403208661, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1219, 796808759, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1220, 467610759, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1221, 409477082, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1222, 870772763, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1223, 375096553, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1224, 409477082, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1225, 928952772, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1226, 408357513, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1227, 806090432, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1228, 353002056, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1229, 996027713, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1230, 413997128, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1231, 259790830, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1232, 475197916, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1233, 717450469, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1234, 408357513, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1235, 422988413, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1236, 751921020, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1237, 744119752, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1238, 381730004, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1239, 467610759, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1240, 547214894, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1241, 910230564, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1242, 299400522, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1243, 411522632, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1244, 741127642, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1245, 927539471, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1246, 996027713, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1247, 409477082, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1248, 203883392, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1249, 468133232, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1250, 210204404, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1251, 238992471, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1252, 178457229, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1253, 870772763, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1254, 144935536, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1255, 825072524, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1256, 726500787, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1257, 847856992, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1258, 205827981, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1259, 468133232, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1260, 847856992, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1261, 172099662, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1262, 411522632, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1263, 562129084, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1264, 238992471, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1265, 991207433, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1266, 260961871, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1267, 172099662, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1268, 846551850, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1269, 607515527, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1270, 203883392, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1271, 494281887, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1272, 205827981, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1273, 390685535, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1274, 659837175, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1275, 813323354, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1276, 260961871, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1277, 234659034, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1278, 246462174, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1279, 238992471, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1280, 140899169, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1281, 605815385, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1282, 762566292, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1283, 178457229, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1284, 726500787, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1285, 741127642, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1286, 467624110, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1287, 414668590, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1288, 414668590, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1289, 337884271, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1290, 305336709, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1291, 991207433, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1292, 530131962, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1293, 467624110, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1294, 796808759, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1295, 337884271, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1296, 726500787, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1297, 659837175, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1298, 356009760, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1299, 935141213, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1300, 535975740, 60);
commit;
prompt 1300 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1301, 996027713, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1302, 942644760, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1303, 996027713, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1304, 882458516, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1305, 744119752, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1306, 843519385, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1307, 161160901, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1308, 161160901, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1309, 726500787, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1310, 246462174, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1311, 726500787, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1312, 762566292, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1313, 847856992, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1314, 169997654, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1315, 475197916, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1316, 368489397, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1317, 299400522, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1318, 796808759, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1319, 356009760, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1320, 806090432, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1321, 996027713, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1322, 801444708, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1323, 991207433, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1324, 434134560, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1325, 403208661, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1326, 356009760, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1327, 431116476, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1328, 512089472, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1329, 784497084, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1330, 467624110, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1331, 751921020, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1332, 791364724, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1333, 649977206, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1334, 161160901, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1335, 543820399, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1336, 390685535, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1337, 813323354, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1338, 299400522, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1339, 494281887, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1340, 140899169, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1341, 235345052, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1342, 235345052, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1343, 592339013, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1344, 784497084, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1345, 494877713, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1346, 144935536, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1347, 468133232, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1348, 685378695, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1349, 156186136, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1350, 685378695, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1351, 927539471, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1352, 411522632, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1353, 843519385, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1354, 784497084, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1355, 847856992, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1356, 784497084, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1357, 910230564, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1358, 161160901, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1359, 411522632, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1360, 512333062, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1361, 494877713, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1362, 562129084, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1363, 414668590, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1364, 649977206, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1365, 852113698, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1366, 685378695, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1367, 422988413, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1368, 468133232, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1369, 718428613, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1370, 659837175, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1371, 961635098, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1372, 996027713, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1373, 169997654, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1374, 825072524, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1375, 327599490, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1376, 847856992, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1377, 172099662, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1378, 390685535, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1379, 535975740, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1380, 910230564, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1381, 813323354, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1382, 375096553, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1383, 741127642, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1384, 144935536, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1385, 101584298, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1386, 375096553, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1387, 161160901, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1388, 403208661, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1389, 235345052, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1390, 150507078, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1391, 353002056, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1392, 543820399, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1393, 494281887, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1394, 847856992, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1395, 910230564, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1396, 259790830, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1397, 203883392, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1398, 791364724, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1399, 353002056, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1400, 530131962, 6);
commit;
prompt 1400 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1401, 259790830, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1402, 353002056, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1403, 996027713, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1404, 988686001, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1405, 305336709, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1406, 337884271, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1407, 859974578, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1408, 413997128, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1409, 942644760, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1410, 801444708, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1411, 238992471, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1412, 356886576, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1413, 744119752, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1414, 169997654, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1415, 356009760, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1416, 846551850, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1417, 144935536, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1418, 150507078, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1419, 801444708, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1420, 413997128, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1421, 274340804, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1422, 431116476, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1423, 434134560, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1424, 422988413, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1425, 172099662, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1426, 859974578, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1427, 935141213, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1428, 353002056, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1429, 796808759, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1430, 547214894, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1431, 494877713, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1432, 796808759, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1433, 762566292, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1434, 413997128, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1435, 235345052, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1436, 327599490, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1437, 353002056, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1438, 935141213, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1439, 607515527, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1440, 801444708, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1441, 859974578, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1442, 414668590, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1443, 413997128, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1444, 765141502, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1445, 178457229, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1446, 327599490, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1447, 259790830, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1448, 494281887, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1449, 178457229, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1450, 494877713, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1451, 825072524, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1452, 408357513, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1453, 535975740, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1454, 203883392, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1455, 991207433, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1456, 717450469, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1457, 408357513, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1458, 431116476, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1459, 605815385, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1460, 751921020, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1461, 991207433, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1462, 468133232, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1463, 468133232, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1464, 784497084, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1465, 205827981, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1466, 927539471, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1467, 802698033, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1468, 741127642, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1469, 841009827, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1470, 791364724, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1471, 356009760, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1472, 178457229, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1473, 841009827, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1474, 205827981, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1475, 274340804, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1476, 801444708, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1477, 935141213, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1478, 859974578, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1479, 238992471, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1480, 991207433, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1481, 535975740, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1482, 927539471, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1483, 843519385, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1484, 858604549, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1485, 543820399, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1486, 841009827, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1487, 543820399, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1488, 156186136, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1489, 156186136, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1490, 717450469, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1491, 607515527, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1492, 802698033, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1493, 356009760, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1494, 414668590, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1495, 543820399, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1496, 353002056, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1497, 883025897, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1498, 368489397, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1499, 409477082, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1500, 356009760, 25);
commit;
prompt 1500 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1501, 381730004, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1502, 942644760, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1503, 144935536, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1504, 813323354, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1505, 512333062, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1506, 414668590, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1507, 144935536, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1508, 409477082, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1509, 796808759, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1510, 422988413, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1511, 178457229, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1512, 859974578, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1513, 685378695, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1514, 156186136, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1515, 543820399, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1516, 413997128, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1517, 274340804, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1518, 305336709, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1519, 806090432, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1520, 846551850, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1521, 846551850, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1522, 765141502, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1523, 535975740, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1524, 381730004, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1525, 171117624, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1526, 765141502, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1527, 607515527, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1528, 210204404, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1529, 718428613, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1530, 858604549, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1531, 468133232, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1532, 259790830, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1533, 961635098, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1534, 144935536, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1535, 337884271, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1536, 961635098, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1537, 512647397, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1538, 741127642, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1539, 274340804, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1540, 543820399, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1541, 259790830, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1542, 605815385, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1543, 988686001, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1544, 562129084, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1545, 726500787, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1546, 368489397, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1547, 468133232, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1548, 156186136, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1549, 961635098, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1550, 649977206, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1551, 390685535, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1552, 169997654, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1553, 205827981, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1554, 858604549, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1555, 203883392, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1556, 205827981, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1557, 327599490, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1558, 394178853, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1559, 156186136, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1560, 494281887, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1561, 717450469, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1562, 156186136, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1563, 235345052, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1564, 530131962, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1565, 144935536, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1566, 530131962, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1567, 411522632, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1568, 356009760, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1569, 858604549, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1570, 411522632, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1571, 353002056, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1572, 150507078, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1573, 413997128, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1574, 607515527, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1575, 422988413, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1576, 409477082, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1577, 825072524, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1578, 659837175, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1579, 408357513, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1580, 408357513, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1581, 161160901, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1582, 259790830, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1583, 203883392, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1584, 841009827, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1585, 172099662, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1586, 927539471, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1587, 942644760, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1588, 467610759, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1589, 434134560, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1590, 161160901, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1591, 843519385, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1592, 802698033, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1593, 607515527, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1594, 512089472, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1595, 274340804, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1596, 547214894, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1597, 234659034, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1598, 928952772, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1599, 806090432, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1600, 368489397, 50);
commit;
prompt 1600 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1601, 337884271, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1602, 791364724, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1603, 751921020, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1604, 659837175, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1605, 717450469, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1606, 375096553, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1607, 210204404, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1608, 356886576, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1609, 337884271, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1610, 140899169, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1611, 411522632, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1612, 411522632, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1613, 205827981, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1614, 305336709, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1615, 562129084, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1616, 467624110, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1617, 178457229, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1618, 274340804, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1619, 910230564, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1620, 390685535, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1621, 535975740, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1622, 535975740, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1623, 825072524, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1624, 935141213, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1625, 825072524, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1626, 607515527, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1627, 605815385, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1628, 726500787, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1629, 928952772, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1630, 390685535, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1631, 547214894, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1632, 806090432, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1633, 260961871, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1634, 801444708, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1635, 512089472, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1636, 172099662, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1637, 530131962, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1638, 101584298, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1639, 434134560, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1640, 935141213, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1641, 467610759, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1642, 882458516, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1643, 852113698, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1644, 547214894, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1645, 467610759, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1646, 846551850, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1647, 659837175, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1648, 259790830, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1649, 235345052, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1650, 543820399, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1651, 882458516, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1652, 741127642, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1653, 178457229, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1654, 390685535, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1655, 928952772, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1656, 858604549, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1657, 802698033, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1658, 101584298, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1659, 299400522, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1660, 744119752, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1661, 547214894, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1662, 246462174, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1663, 796808759, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1664, 413997128, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1665, 535975740, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1666, 409477082, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1667, 494281887, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1668, 140899169, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1669, 996027713, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1670, 859974578, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1671, 205827981, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1672, 408357513, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1673, 434134560, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1674, 685378695, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1675, 203883392, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1676, 852113698, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1677, 935141213, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1678, 991207433, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1679, 841009827, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1680, 718428613, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1681, 178457229, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1682, 784497084, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1683, 156186136, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1684, 988686001, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1685, 368489397, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1686, 852113698, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1687, 235345052, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1688, 605815385, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1689, 327599490, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1690, 802698033, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1691, 927539471, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1692, 991207433, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1693, 161160901, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1694, 356009760, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1695, 605815385, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1696, 260961871, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1697, 150507078, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1698, 434134560, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1699, 843519385, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1700, 562129084, 57);
commit;
prompt 1700 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1701, 356886576, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1702, 274340804, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1703, 784497084, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1704, 101584298, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1705, 841009827, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1706, 259790830, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1707, 408357513, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1708, 468133232, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1709, 169997654, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1710, 928952772, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1711, 422988413, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1712, 299400522, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1713, 205827981, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1714, 685378695, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1715, 356886576, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1716, 825072524, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1717, 512647397, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1718, 259790830, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1719, 171117624, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1720, 751921020, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1721, 390685535, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1722, 140899169, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1723, 144935536, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1724, 685378695, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1725, 409477082, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1726, 422988413, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1727, 607515527, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1728, 858604549, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1729, 413997128, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1730, 356009760, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1731, 512333062, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1732, 356009760, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1733, 434134560, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1734, 259790830, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1735, 825072524, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1736, 847856992, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1737, 991207433, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1738, 935141213, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1739, 784497084, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1740, 846551850, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1741, 791364724, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1742, 368489397, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1743, 718428613, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1744, 726500787, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1745, 161160901, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1746, 414668590, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1747, 607515527, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1748, 150507078, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1749, 841009827, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1750, 870772763, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1751, 843519385, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1752, 178457229, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1753, 659837175, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1754, 299400522, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1755, 101584298, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1756, 101584298, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1757, 825072524, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1758, 784497084, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1759, 140899169, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1760, 852113698, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1761, 883025897, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1762, 762566292, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1763, 156186136, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1764, 422988413, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1765, 413997128, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1766, 356009760, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1767, 414668590, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1768, 259790830, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1769, 356009760, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1770, 238992471, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1771, 305336709, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1772, 802698033, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1773, 467624110, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1774, 791364724, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1775, 607515527, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1776, 353002056, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1777, 140899169, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1778, 825072524, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1779, 305336709, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1780, 299400522, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1781, 784497084, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1782, 390685535, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1783, 910230564, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1784, 468133232, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1785, 172099662, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1786, 784497084, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1787, 403208661, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1788, 592339013, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1789, 910230564, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1790, 409477082, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1791, 246462174, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1792, 996027713, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1793, 299400522, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1794, 467610759, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1795, 928952772, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1796, 413997128, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1797, 390685535, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1798, 988686001, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1799, 813323354, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1800, 210204404, 36);
commit;
prompt 1800 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1801, 494877713, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1802, 431116476, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1803, 246462174, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1804, 156186136, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1805, 685378695, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1806, 762566292, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1807, 171117624, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1808, 910230564, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1809, 843519385, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1810, 140899169, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1811, 394178853, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1812, 841009827, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1813, 846551850, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1814, 870772763, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1815, 356009760, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1816, 467610759, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1817, 605815385, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1818, 337884271, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1819, 741127642, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1820, 996027713, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1821, 846551850, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1822, 927539471, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1823, 431116476, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1824, 870772763, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1825, 996027713, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1826, 530131962, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1827, 547214894, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1828, 942644760, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1829, 935141213, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1830, 411522632, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1831, 796808759, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1832, 796808759, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1833, 607515527, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1834, 169997654, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1835, 935141213, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1836, 801444708, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1837, 928952772, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1838, 841009827, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1839, 414668590, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1840, 299400522, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1841, 259790830, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1842, 870772763, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1843, 101584298, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1844, 411522632, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1845, 659837175, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1846, 356886576, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1847, 718428613, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1848, 394178853, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1849, 259790830, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1850, 927539471, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1851, 234659034, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1852, 356886576, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1853, 813323354, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1854, 858604549, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1855, 434134560, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1856, 530131962, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1857, 717450469, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1858, 512333062, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1859, 784497084, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1860, 512647397, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1861, 171117624, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1862, 238992471, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1863, 843519385, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1864, 431116476, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1865, 870772763, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1866, 178457229, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1867, 394178853, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1868, 858604549, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1869, 299400522, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1870, 859974578, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1871, 741127642, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1872, 535975740, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1873, 942644760, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1874, 413997128, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1875, 381730004, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1876, 791364724, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1877, 858604549, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1878, 791364724, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1879, 411522632, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1880, 161160901, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1881, 356886576, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1882, 161160901, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1883, 852113698, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1884, 431116476, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1885, 299400522, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1886, 394178853, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1887, 801444708, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1888, 841009827, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1889, 353002056, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1890, 171117624, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1891, 512647397, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1892, 942644760, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1893, 927539471, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1894, 234659034, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1895, 467624110, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1896, 494877713, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1897, 411522632, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1898, 327599490, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1899, 260961871, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1900, 852113698, 63);
commit;
prompt 1900 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1901, 791364724, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1902, 961635098, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1903, 431116476, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1904, 996027713, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1905, 274340804, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1906, 685378695, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1907, 843519385, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1908, 494281887, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1909, 784497084, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1910, 592339013, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1911, 784497084, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1912, 996027713, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1913, 592339013, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1914, 530131962, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1915, 649977206, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1916, 796808759, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1917, 413997128, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1918, 205827981, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1919, 422988413, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1920, 161160901, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1921, 299400522, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1922, 422988413, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1923, 996027713, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1924, 935141213, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1925, 205827981, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1926, 390685535, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1927, 813323354, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1928, 765141502, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1929, 726500787, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1930, 381730004, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1931, 431116476, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1932, 685378695, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1933, 562129084, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1934, 882458516, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1935, 813323354, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1936, 859974578, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1937, 413997128, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1938, 825072524, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1939, 422988413, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1940, 961635098, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1941, 991207433, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1942, 512647397, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1943, 356886576, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1944, 592339013, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1945, 961635098, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1946, 543820399, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1947, 843519385, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1948, 494877713, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1949, 150507078, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1950, 274340804, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1951, 717450469, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1952, 870772763, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1953, 859974578, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1954, 238992471, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1955, 751921020, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1956, 210204404, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1957, 234659034, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1958, 784497084, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1959, 274340804, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1960, 765141502, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1961, 101584298, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1962, 883025897, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1963, 381730004, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1964, 801444708, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1965, 741127642, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1966, 649977206, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1967, 991207433, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1968, 726500787, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1969, 846551850, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1970, 784497084, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1971, 422988413, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1972, 718428613, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1973, 274340804, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1974, 467610759, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1975, 883025897, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1976, 169997654, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1977, 543820399, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1978, 961635098, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1979, 431116476, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1980, 928952772, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1981, 259790830, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1982, 156186136, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1983, 762566292, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1984, 512089472, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1985, 394178853, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1986, 467610759, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1987, 144935536, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1988, 368489397, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1989, 961635098, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1990, 409477082, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1991, 169997654, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1992, 475197916, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1993, 605815385, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1994, 882458516, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1995, 547214894, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1996, 150507078, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1997, 475197916, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1998, 859974578, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1999, 475197916, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (2000, 422988413, 78);
commit;
prompt 2000 records loaded
prompt Loading PARTICIPANTPARAMEDIC...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (230, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (349, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1007, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (846, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1115, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (313, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (307, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1304, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1111, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1488, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (709, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1900, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1910, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (999, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (178, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (130, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (59, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (860, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (268, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1902, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (809, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (219, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1793, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (26, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1801, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (422, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1340, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (931, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1614, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1786, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (773, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (891, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (149, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1718, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (595, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (7, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1174, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1370, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1948, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1170, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1774, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1140, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (568, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1018, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1159, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1842, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (875, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1998, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (933, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1175, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1232, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1807, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (184, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (609, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1464, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (446, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (430, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (584, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1445, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (328, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1368, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1666, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (19, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (380, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (941, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1107, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (32, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1398, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (178, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1644, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (251, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (152, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1521, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1485, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (448, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (467, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (280, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1073, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (828, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (688, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (870, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1512, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (94, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1357, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (878, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (827, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1475, 304761100);
commit;
prompt 100 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1079, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (634, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1775, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (257, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (203, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1271, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (740, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1305, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (350, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (132, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (359, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1667, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (138, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1863, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (300, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1499, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (191, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1425, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (485, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1095, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1366, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (22, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1025, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (365, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1241, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (656, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (198, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (186, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1970, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1655, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (483, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (173, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (330, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1211, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1256, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (592, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (114, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1052, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (907, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1503, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1105, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1447, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (944, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (857, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (686, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (171, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (581, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (272, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (693, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1668, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1255, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (811, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1139, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1490, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1483, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1318, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1488, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (363, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1972, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1772, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (780, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (736, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (638, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (638, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (551, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1722, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (135, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (381, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1678, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1222, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1120, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (52, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (402, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1721, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1599, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (350, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (956, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (143, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (866, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (480, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1117, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (910, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1263, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (452, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1410, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1567, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (25, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1014, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1481, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (2, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1452, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1668, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1513, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 559464664);
commit;
prompt 200 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1946, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (43, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1179, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (841, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1948, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (101, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (792, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (783, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1952, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1340, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1287, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1615, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (820, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1992, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1573, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1593, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (6, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1694, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1770, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1536, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1427, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1829, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1242, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1447, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1795, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1141, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (911, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1957, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1288, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (715, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (401, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1036, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1635, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (230, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (453, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (184, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (819, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1717, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1823, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1874, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1587, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1478, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (68, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (818, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (831, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1790, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (398, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (263, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1609, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1161, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (437, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1704, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (889, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1944, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (321, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1002, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (531, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (306, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (771, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1963, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1132, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (590, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (330, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (614, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1072, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (730, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (859, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1236, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (636, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1650, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1114, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (494, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (943, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1053, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1628, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1082, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (66, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (126, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (467, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (889, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1314, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (977, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (894, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (460, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (635, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1069, 942644760);
commit;
prompt 300 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (495, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (788, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (568, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (215, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (809, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1396, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1668, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1407, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1327, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1021, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (137, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1304, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1337, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1493, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1668, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1986, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1959, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (802, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (342, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (822, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1804, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1868, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1086, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (539, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (179, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1388, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (682, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (187, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1139, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (218, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (635, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (795, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (838, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (781, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1682, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (10, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1102, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (416, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1860, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (367, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1802, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (804, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (886, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (750, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (307, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1732, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1727, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1636, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (327, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (35, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1458, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (141, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (884, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1682, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (732, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (841, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1768, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1423, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1446, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (395, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1945, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (538, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (567, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (297, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1415, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (758, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (955, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (653, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (210, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1065, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (915, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1035, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1764, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1343, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1643, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (772, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1245, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1166, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1887, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1875, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1909, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (56, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1438, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (242, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1664, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (454, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1152, 842479128);
commit;
prompt 400 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (445, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1440, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (647, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (716, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1774, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1018, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1487, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (998, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (347, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1085, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1226, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1209, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (405, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (739, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1282, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1531, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (257, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (727, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (608, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1420, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (704, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1399, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1577, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1960, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (216, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (349, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1493, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (234, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (554, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1542, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1617, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1924, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (235, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (960, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (149, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1446, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1357, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (623, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (456, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (677, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (881, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (351, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1118, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (35, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1486, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1147, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (593, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1175, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1046, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (211, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (514, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1316, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (742, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1578, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1185, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1786, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (377, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (214, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (598, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (780, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1504, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1652, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1697, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1226, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1558, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (483, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (88, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (141, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1080, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1977, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1069, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (618, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1338, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1903, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1376, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1214, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1149, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1321, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (809, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1384, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (351, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (862, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (418, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1111, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (699, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1716, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1284, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1096, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1381, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1930, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1306, 339593939);
commit;
prompt 500 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1659, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1606, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (105, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1939, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (839, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1991, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1349, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (129, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1649, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (447, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1862, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1281, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1536, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (415, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (687, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (885, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1840, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1414, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (982, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (446, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (366, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (331, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1884, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1193, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1819, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (434, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1400, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1154, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (543, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1381, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1311, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (194, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (291, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1311, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1152, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (572, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1749, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1281, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (281, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1976, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (596, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (457, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (350, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (750, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (390, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (554, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1476, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1852, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (362, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (796, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (631, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (190, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (604, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1198, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1212, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1044, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1926, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (733, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (956, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (525, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (366, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (355, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (713, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1504, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (392, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1751, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (320, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (374, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (577, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1820, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (82, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1414, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (906, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (928, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1312, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (365, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (123, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1498, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1627, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1722, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (33, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (99, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (543, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1222, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (959, 100263721);
commit;
prompt 600 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (9, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1735, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1355, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1979, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (92, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1661, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1228, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1980, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1642, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1132, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1885, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1373, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (207, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (504, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (362, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (780, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (851, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1739, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (913, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1810, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (915, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (5, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (503, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1222, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1742, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1698, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (9, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1038, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (314, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (423, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1435, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1109, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (867, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1353, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1708, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (394, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1806, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1268, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (902, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1952, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (712, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (607, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (21, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1939, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1329, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (484, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (910, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (276, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1482, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1041, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (953, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (364, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1899, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (482, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (478, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (863, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1335, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (625, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1974, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1365, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (486, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1592, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (774, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (733, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1250, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1420, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (585, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1995, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1464, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (743, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (731, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1640, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1631, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1943, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (392, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (889, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1085, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (728, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (795, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (972, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1402, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (969, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (176, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1508, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (850, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (647, 265119104);
commit;
prompt 700 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (306, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (342, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (555, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1164, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1278, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (82, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (87, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1060, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (489, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1248, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (403, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (888, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (312, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1459, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (137, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1980, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1461, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1942, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (410, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (811, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1922, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1580, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (633, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1275, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (540, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1821, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1025, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (270, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (581, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (965, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (129, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (996, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (693, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (408, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1173, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1310, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1896, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (752, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (277, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1838, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (710, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1012, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (921, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (137, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (805, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1421, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1288, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (540, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (108, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1050, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1883, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1683, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (284, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (623, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (688, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1354, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (120, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1860, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1980, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (536, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1364, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (57, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (724, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1358, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (384, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (223, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (914, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1409, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1969, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1943, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1246, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1004, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1165, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (152, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (297, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (660, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (369, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (535, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (346, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (473, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1419, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1462, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (525, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (942, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1629, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (241, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1817, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1508, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (970, 954207230);
commit;
prompt 800 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1466, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1299, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1497, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1419, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (777, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (11, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1538, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (97, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (665, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (102, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (468, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1829, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1430, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (117, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1613, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1137, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (827, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1007, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1050, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (174, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (777, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (683, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1483, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1082, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1579, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1355, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (831, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1565, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1961, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1219, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1062, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1653, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1473, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (316, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (384, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1067, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (797, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1086, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (288, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1314, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1117, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1995, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1538, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (539, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1466, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (583, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1999, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (886, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1851, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1196, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1955, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (433, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1962, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (39, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (584, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (379, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1326, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1125, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (368, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (213, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (88, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1420, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1390, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1053, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (79, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1701, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1164, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1276, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1422, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1376, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1712, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (165, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (848, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (320, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (100, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (928, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (462, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (965, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1229, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1433, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1221, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1757, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (507, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (538, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (957, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1255, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (490, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (328, 468133232);
commit;
prompt 900 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (865, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1142, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1029, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (388, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (197, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1720, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1438, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1789, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1039, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (290, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1456, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1604, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (859, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1778, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1588, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (138, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (386, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1199, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (361, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1931, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (672, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1401, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1113, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1145, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1271, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1886, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1426, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1214, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1072, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (881, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (422, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1820, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (389, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (670, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (866, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (886, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1379, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (233, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1988, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (203, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1056, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (994, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1793, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1734, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (304, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1290, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (872, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (153, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (910, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1979, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (616, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1335, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (982, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1466, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (610, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (627, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1231, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (31, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (217, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (971, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (243, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (52, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (2, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (851, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1321, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1578, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (523, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (847, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (376, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (136, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1470, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (50, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (377, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1957, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (424, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1108, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1428, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1831, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1244, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1889, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (460, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1595, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1782, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (564, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1227, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1016, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1935, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (588, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1312, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (159, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (446, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1768, 435639070);
commit;
prompt 1000 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (315, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (384, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1850, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (72, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1954, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (162, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1602, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (884, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (731, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (310, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1600, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (246, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1725, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (806, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1074, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1054, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1849, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (851, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (513, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1205, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (166, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1871, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (118, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (17, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (816, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1322, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (996, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1563, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1924, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (621, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (708, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (956, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1729, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1077, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1309, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1980, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (163, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1213, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (744, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1737, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1585, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1119, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (935, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1932, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1530, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1657, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (579, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (146, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (540, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (961, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (355, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1892, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (224, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (4, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1506, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1054, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1860, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1620, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (197, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (783, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (556, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (713, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (490, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (2, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (47, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (77, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1959, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1550, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (112, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1844, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1910, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1935, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (614, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (559, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (246, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (727, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (173, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1884, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1455, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (913, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (140, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (811, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1093, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (130, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (911, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1775, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (228, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (978, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (577, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (637, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1059, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (708, 429375037);
commit;
prompt 1100 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1945, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1722, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (962, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1722, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1751, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (543, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (707, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (121, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1240, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1820, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (342, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (790, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1516, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1038, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1238, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (635, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1965, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1624, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1184, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1851, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (990, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (325, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1945, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (344, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1940, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (348, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1304, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1523, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (626, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1550, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1456, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (204, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (661, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1998, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (121, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (642, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (898, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1096, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (391, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (96, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1970, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1802, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1125, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1624, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1006, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1623, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1914, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1946, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (486, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (778, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (220, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (970, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (851, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (387, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (951, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (591, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (585, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (931, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1360, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1641, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1728, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (51, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1871, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (486, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1015, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (961, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (261, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (635, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1495, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1078, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (726, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (617, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (650, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (743, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (845, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (481, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1099, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1385, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (691, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1825, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1946, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1666, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (281, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1034, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (954, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (893, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1377, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (548, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (326, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1651, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1892, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (810, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1405, 417582361);
commit;
prompt 1200 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (27, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1680, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1752, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (733, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (28, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (962, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (181, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1580, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (658, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (620, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1742, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1092, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1000, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (961, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (940, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (134, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (522, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1462, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1392, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1336, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1348, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (676, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1050, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1955, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1536, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (127, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (757, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (188, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1335, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1771, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (439, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (758, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (209, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (210, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (541, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (266, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (72, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (509, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1934, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (631, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (208, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1651, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1914, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (360, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (208, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (504, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1097, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (212, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1168, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (737, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (327, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (532, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1861, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1431, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (220, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1589, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1026, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (705, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (665, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (418, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (464, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (286, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (284, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (856, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1970, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1662, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (918, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1182, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (875, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1845, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1482, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1724, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (739, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1922, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (599, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1652, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (316, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (774, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (754, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (728, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1516, 609721920);
commit;
prompt 1300 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1206, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1491, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1109, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (363, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (762, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (757, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (980, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1615, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (470, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (674, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (594, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (199, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1276, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (734, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (478, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (716, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1248, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1854, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (828, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (216, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1056, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (151, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1042, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1968, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1701, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (9, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1135, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1093, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1637, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (389, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1274, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (53, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1087, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1742, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (564, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (962, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (722, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1620, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1618, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1304, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1371, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (704, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1618, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (832, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (49, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1860, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1702, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (510, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1135, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (547, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1981, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (927, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1663, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1618, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (725, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (862, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1196, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (974, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (111, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (76, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1660, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (453, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1875, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1346, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1345, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (55, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (769, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (787, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1868, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (461, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1966, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1077, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (933, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (552, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1623, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1613, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1368, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (484, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1161, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1780, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (661, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (764, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (172, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (598, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1557, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1418, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1049, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (411, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1009, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (144, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1813, 479816079);
commit;
prompt 1400 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1105, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (407, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1418, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1523, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (243, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1976, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (943, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (42, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1283, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1334, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (67, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (404, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (668, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (502, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1194, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1847, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (266, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1148, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1698, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1027, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (819, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1964, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (640, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1826, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (612, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1461, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1544, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1884, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (351, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (665, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (832, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1881, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (62, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1356, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (791, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (298, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (366, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (86, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (21, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (281, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (878, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (453, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1512, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (936, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (404, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1153, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (119, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (764, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (223, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1872, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1853, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (243, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1996, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (664, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1236, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1623, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (799, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (89, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1973, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1142, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (544, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (480, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (598, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (958, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (317, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1362, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (757, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1052, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (497, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (520, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1046, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1236, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (438, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (893, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (441, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1657, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (412, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (646, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1531, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (804, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (164, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1824, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1980, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1100, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (175, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1802, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1499, 429375037);
commit;
prompt 1500 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (985, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1308, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (189, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (39, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1325, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1048, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (58, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1495, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1875, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1130, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (926, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1528, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (247, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (750, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (990, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (613, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (651, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1626, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1344, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1998, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1018, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (623, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1562, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (779, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (716, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (861, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (680, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1781, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1690, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (177, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (346, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (734, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1525, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1293, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1352, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (148, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (239, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1135, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1073, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (385, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1995, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1525, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1969, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (642, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (736, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (869, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1244, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (937, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1154, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (535, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1172, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (90, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1636, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (841, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1593, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1097, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1284, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1105, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (219, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (68, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1802, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (82, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1621, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (100, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1275, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1415, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (344, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1990, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1208, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1575, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1186, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1411, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1156, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (713, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1105, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1562, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1205, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1570, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (151, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (38, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (850, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1947, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (56, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (641, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1051, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (527, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (958, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1647, 602857670);
commit;
prompt 1600 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (778, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (459, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (760, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1686, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (175, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (549, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1109, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1258, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (86, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (5, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1869, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1823, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1025, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (791, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1509, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1403, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1184, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (444, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1414, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1441, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (48, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (111, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (155, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1054, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (654, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (53, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1043, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1398, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (185, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1543, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (620, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1688, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (163, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1497, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (199, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (185, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1429, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (178, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1772, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1045, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1231, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (202, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1226, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (51, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (468, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (162, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1107, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (743, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1238, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (946, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (344, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (858, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (793, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (516, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (959, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1789, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (79, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1479, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1427, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (472, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (908, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (293, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (657, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (903, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1748, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (87, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (594, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1269, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1108, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (710, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1750, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1565, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (18, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1504, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1878, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (107, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (471, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1772, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1040, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (725, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1632, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1331, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1142, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (642, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1645, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (71, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (75, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1030, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (122, 417752520);
commit;
prompt 1700 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (890, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (305, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1934, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1441, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (739, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (576, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1466, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (582, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (824, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (992, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1395, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1035, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1384, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (194, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (302, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (407, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1215, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (229, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1439, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (702, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (976, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (900, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1671, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1341, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (450, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1475, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1430, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (56, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1368, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (936, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1435, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1521, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1846, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1133, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (186, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (677, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (969, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (110, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1155, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1308, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1734, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (166, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1781, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (346, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (577, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1759, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (732, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1349, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (508, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (399, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (197, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1234, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (972, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (253, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (749, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (152, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1785, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1842, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (488, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1786, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1044, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1861, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1841, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1202, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (49, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (724, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1282, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (614, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1685, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (463, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (342, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (551, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1913, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1181, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1277, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (976, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1591, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1750, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (415, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1797, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (4, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (476, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1947, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (549, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1179, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (424, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1858, 302976561);
commit;
prompt 1800 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1403, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1725, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1842, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (579, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (68, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1447, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1779, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1812, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (156, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (915, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (400, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (846, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (712, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (817, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (810, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1956, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1596, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (471, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (28, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1532, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1839, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (705, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1154, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (283, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (624, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (373, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (164, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (888, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (493, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (290, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1558, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (3, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1259, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1085, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (401, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1153, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1561, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1904, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1507, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (516, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (145, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (899, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1397, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1620, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1136, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1857, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1746, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1217, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1416, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1776, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (749, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1165, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1795, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (64, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1091, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1940, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1364, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (560, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1773, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1100, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1999, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1273, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1415, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (538, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (52, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (315, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1650, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (750, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1351, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (357, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1934, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1254, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (967, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1905, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (304, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (819, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (266, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1064, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (396, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (711, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (104, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (775, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1058, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (762, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1667, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (423, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (489, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (783, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (69, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1998, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (608, 373176861);
commit;
prompt 1900 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (674, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1302, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1390, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (766, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1296, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (724, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1981, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1768, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1023, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (50, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1233, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (30, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (844, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1017, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (413, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1444, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1868, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1393, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1657, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1071, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (641, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (850, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (37, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (187, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1366, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (493, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (934, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1967, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (896, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (39, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (119, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1108, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1382, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1252, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1232, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1437, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1493, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (829, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1842, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1833, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1145, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (255, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (746, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (66, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1829, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1878, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (101, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (368, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1039, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (61, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1628, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (848, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (423, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1490, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1325, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1331, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (157, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1555, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (261, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1505, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1435, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1378, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1796, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1975, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1188, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1517, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (367, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (974, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1388, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (141, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1781, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (206, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (828, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1590, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1349, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1119, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1744, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (753, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (999, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (960, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (267, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1659, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (643, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (339, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1903, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (254, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1047, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1780, 802477498);
commit;
prompt 2000 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (269, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (328, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1034, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1624, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1292, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (458, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1550, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1291, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1046, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1556, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (514, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (428, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1458, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1104, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (798, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1720, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1473, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1705, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (447, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (847, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (281, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (848, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1078, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (901, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (446, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1968, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (579, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (4, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (526, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1764, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (843, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1281, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1247, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1321, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1384, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1765, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1414, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1157, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (91, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1071, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1817, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1360, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (27, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1034, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1930, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (470, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1422, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1044, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (775, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1375, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (852, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (100, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1564, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1767, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (931, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (746, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (400, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1305, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (590, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1128, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1364, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1229, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1039, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (485, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (188, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (167, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (535, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (431, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1085, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1626, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (447, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (256, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (333, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (502, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (239, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1753, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (583, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (986, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (942, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (860, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (564, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (30, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1156, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (505, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1474, 579654282);
commit;
prompt 2100 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (326, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1308, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1957, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1045, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (544, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (963, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (810, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (670, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1947, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (996, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (94, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (927, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1999, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (453, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1574, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (312, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (982, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (163, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (504, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (75, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (443, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (475, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1757, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (397, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1891, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (591, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (8, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (797, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1565, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (106, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1041, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (686, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1225, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (927, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1758, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1409, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (616, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (345, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1453, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1194, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (312, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1864, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1935, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1645, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (269, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1956, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1373, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1594, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1706, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1506, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (257, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (131, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (112, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1473, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (95, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1068, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (754, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1492, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1989, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (752, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (406, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1876, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (992, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (573, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (208, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (284, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (89, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (479, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1455, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (547, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (806, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (110, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (19, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1118, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (431, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1561, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1389, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1143, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1883, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1767, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (339, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (164, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (178, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (519, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1222, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1440, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1547, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (96, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (887, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (897, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1159, 602857670);
commit;
prompt 2200 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (226, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1706, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1478, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (486, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (476, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1245, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1787, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1309, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1081, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1081, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1539, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (112, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1721, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1895, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (390, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1948, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (867, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1445, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1581, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1454, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (666, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (225, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1771, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (308, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1823, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1831, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (952, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (324, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (304, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1515, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (159, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (793, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (765, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (627, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (240, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (477, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (181, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (818, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1864, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1847, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1874, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1998, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (509, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1828, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (808, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (534, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1659, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1173, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (881, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1368, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (410, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (814, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (398, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (882, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (823, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1951, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (786, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (864, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1951, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1521, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (9, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (78, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (332, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (685, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (72, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (283, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (464, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (313, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1340, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (624, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (688, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (275, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1307, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (96, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (94, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1208, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1355, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (453, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (430, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (736, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1903, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (526, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1182, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (111, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (31, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (222, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1497, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1712, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1205, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (747, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1319, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (9, 685783715);
commit;
prompt 2300 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1263, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (373, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (508, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (950, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (187, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1660, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1532, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1081, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1020, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1578, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (326, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (505, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1495, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (868, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (674, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (498, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1365, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1090, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (12, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1683, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (773, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1677, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (817, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1989, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1475, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1185, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (53, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (913, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1026, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (108, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (496, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (796, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1891, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1065, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1723, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (420, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (770, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1893, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1417, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1727, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1683, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (951, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (550, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (959, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (929, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (673, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1843, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (706, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (515, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1777, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1854, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (627, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (419, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (561, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1524, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1033, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (778, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1639, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1617, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1497, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (273, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1927, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1233, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (363, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (494, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1385, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (64, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1094, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1123, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1345, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1588, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (740, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (682, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (472, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (829, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1622, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1745, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (989, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (39, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (220, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1277, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1744, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (136, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (761, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (603, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (686, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1270, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1906, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (852, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (510, 559464664);
commit;
prompt 2400 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1887, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1380, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (859, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (275, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1459, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (439, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1664, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (290, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1793, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (707, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (194, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1272, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1297, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1478, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1362, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1965, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1236, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1394, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1993, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1775, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1797, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (703, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1175, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (712, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1417, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (619, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1450, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (501, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1720, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (660, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1843, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1527, 762139241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (228, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1297, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (96, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (527, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1266, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1657, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1382, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1396, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (371, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (807, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1499, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (120, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1794, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1608, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1000, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1267, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1544, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1111, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1591, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (128, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1059, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1502, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1472, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (39, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1535, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (275, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1533, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1171, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (899, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1950, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (229, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1564, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1735, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1353, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (944, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1760, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1457, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1013, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1890, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1050, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (394, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (238, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1127, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (824, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (666, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1719, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (863, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (295, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1717, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1146, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1961, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (859, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1696, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (416, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1531, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1570, 307344200);
commit;
prompt 2500 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (183, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1893, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (971, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1247, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1588, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (240, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (260, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1938, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (55, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (242, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (343, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1068, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1060, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1900, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1294, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1683, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1183, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (596, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1571, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1790, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1895, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1303, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1747, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1101, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1013, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1628, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (212, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (237, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1893, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1782, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1337, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1886, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1903, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (463, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (880, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1595, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (162, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (359, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (619, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1690, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1485, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (882, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (616, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1817, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1963, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1518, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1101, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (112, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (158, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1812, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1986, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (992, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1928, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1970, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (2, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1573, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (92, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1458, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (715, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (431, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (29, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (629, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (690, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1532, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1771, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1470, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1968, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (988, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (753, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1653, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1316, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1902, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (320, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1999, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1525, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (496, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1601, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1106, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1068, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1520, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (678, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (961, 227798879);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1926, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1134, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1993, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1834, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1610, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1191, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (894, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1378, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1758, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (621, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1986, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (864, 953369172);
commit;
prompt 2600 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (575, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (925, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (419, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 378936331);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (814, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (367, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1174, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (467, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (783, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (30, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (310, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1422, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (140, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1697, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (160, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (85, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (652, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (64, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1880, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (868, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1477, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1762, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1204, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1202, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1427, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (303, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1515, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1403, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (265, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1504, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1493, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1066, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1777, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (524, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (969, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1845, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1846, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1421, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1545, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1024, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (687, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1985, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (93, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1216, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (805, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1042, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1428, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1639, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1044, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (394, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (769, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (566, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1771, 766713817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1499, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (600, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1517, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1157, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1073, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (247, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1494, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1200, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1116, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1151, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (60, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1740, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1367, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1285, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (887, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (829, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1331, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1938, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (455, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1172, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1252, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1121, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1539, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (594, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (560, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1203, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1187, 974874812);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (105, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (787, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (732, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (631, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1645, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (82, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (732, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (101, 761247130);
commit;
prompt 2700 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (909, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (806, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1589, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1717, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1941, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (24, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1136, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1113, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (610, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (460, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1386, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1916, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (585, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1823, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1973, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (324, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (427, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (959, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1690, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (152, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1241, 953237471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (673, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (620, 801292271);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1677, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (71, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (401, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1128, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (907, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1501, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (704, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (785, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1321, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1171, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (883, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1712, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (733, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (993, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1846, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1115, 559464664);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (293, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (101, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1106, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (315, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (395, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (973, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (37, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1363, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1814, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1848, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (317, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (261, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (468, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1772, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (10, 134024937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (827, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1802, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (263, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1262, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1168, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (804, 942644760);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1607, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1621, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (787, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1637, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (994, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (317, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (904, 727135472);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1953, 388211214);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (216, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1873, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (535, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (744, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1249, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (33, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (295, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1012, 339593939);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1444, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1927, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (820, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1054, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (905, 245675893);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (638, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1470, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (964, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1830, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (559, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1930, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1912, 896635944);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1436, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (602, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1671, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1375, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1227, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (256, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (610, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (303, 376286668);
commit;
prompt 2800 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1741, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1082, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (688, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (472, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (436, 900618507);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1879, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1070, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (465, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1200, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (477, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (966, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (278, 256239435);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1489, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (160, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 345166422);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (551, 339897673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1089, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (699, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (692, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (421, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (505, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (29, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1342, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (6, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (965, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (540, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (172, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1507, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (67, 858875113);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1991, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1861, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (941, 883025897);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1032, 910148391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1057, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (207, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (495, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1596, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1495, 982427445);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (325, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1508, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (519, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (468, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (73, 948139256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1725, 479816079);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (312, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1480, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1273, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (58, 761247130);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1882, 817135362);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1869, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (32, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (675, 178457229);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1914, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (504, 265119104);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (597, 711979218);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (54, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1973, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (942, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (643, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (631, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (841, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1378, 898255498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (3, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 685783715);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1056, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (216, 526367693);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (28, 954207230);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (114, 304761100);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (83, 307344200);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1269, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1558, 577311698);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (167, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (107, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (587, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1539, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (360, 302976561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (451, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (899, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (243, 442065013);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1348, 343281461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (616, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1695, 238035478);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1132, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1691, 926145059);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1953, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (920, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1331, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1864, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1955, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (301, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (741, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1893, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1171, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (293, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1761, 802477498);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (621, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (756, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (658, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1653, 761247130);
commit;
prompt 2900 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (590, 812565282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (633, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (659, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1513, 329900476);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (554, 140899169);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (288, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (890, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1884, 100263721);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (189, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (718, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (982, 394178853);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (996, 812843652);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1828, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1363, 719059544);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1553, 468133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1402, 152977912);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (387, 347639660);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (598, 382284930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (355, 831093867);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (57, 609721920);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (36, 681488617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1065, 614843052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (260, 373176861);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1329, 654307339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1847, 429375037);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (236, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (986, 605351268);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (994, 631365623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (336, 579654282);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1976, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (454, 901297210);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (124, 349631451);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (636, 442765602);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1751, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (768, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (594, 356102475);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (284, 628551248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1446, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (817, 953369172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (225, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1643, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1817, 776213891);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1511, 214158330);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1541, 803721923);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 286048247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (567, 165847242);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1631, 520066928);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (158, 886541617);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1956, 842479128);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (42, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (315, 571147818);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (795, 414668590);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (271, 481161391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (555, 239803816);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (159, 342067673);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (912, 159353604);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (233, 966618858);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1338, 870561709);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 138192266);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1969, 364957248);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (473, 417582361);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1114, 150507078);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (17, 738015436);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (314, 435639070);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 422520960);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 376286668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1220, 602857670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1697, 927539471);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1397, 244240688);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (823, 741630052);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (547, 417752520);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 520066928);
commit;
prompt 2972 records loaded
prompt Loading VOLUNTEER...
insert into VOLUNTEER (volunteerid)
values (555880862);
insert into VOLUNTEER (volunteerid)
values (124475793);
insert into VOLUNTEER (volunteerid)
values (108411178);
insert into VOLUNTEER (volunteerid)
values (328925588);
insert into VOLUNTEER (volunteerid)
values (994265828);
insert into VOLUNTEER (volunteerid)
values (305993110);
insert into VOLUNTEER (volunteerid)
values (384551100);
insert into VOLUNTEER (volunteerid)
values (607515527);
insert into VOLUNTEER (volunteerid)
values (311783430);
insert into VOLUNTEER (volunteerid)
values (404883551);
insert into VOLUNTEER (volunteerid)
values (944746756);
insert into VOLUNTEER (volunteerid)
values (339593939);
insert into VOLUNTEER (volunteerid)
values (751304730);
insert into VOLUNTEER (volunteerid)
values (376286668);
insert into VOLUNTEER (volunteerid)
values (240495059);
insert into VOLUNTEER (volunteerid)
values (115840139);
insert into VOLUNTEER (volunteerid)
values (177157307);
insert into VOLUNTEER (volunteerid)
values (652011695);
insert into VOLUNTEER (volunteerid)
values (875005373);
insert into VOLUNTEER (volunteerid)
values (123863694);
insert into VOLUNTEER (volunteerid)
values (612714265);
insert into VOLUNTEER (volunteerid)
values (951651032);
insert into VOLUNTEER (volunteerid)
values (749309034);
insert into VOLUNTEER (volunteerid)
values (769300586);
insert into VOLUNTEER (volunteerid)
values (934146705);
insert into VOLUNTEER (volunteerid)
values (671157768);
insert into VOLUNTEER (volunteerid)
values (681488617);
insert into VOLUNTEER (volunteerid)
values (699763110);
insert into VOLUNTEER (volunteerid)
values (755938204);
insert into VOLUNTEER (volunteerid)
values (577311698);
insert into VOLUNTEER (volunteerid)
values (900618507);
insert into VOLUNTEER (volunteerid)
values (429436272);
insert into VOLUNTEER (volunteerid)
values (384875242);
insert into VOLUNTEER (volunteerid)
values (479816079);
insert into VOLUNTEER (volunteerid)
values (947929576);
insert into VOLUNTEER (volunteerid)
values (274340804);
insert into VOLUNTEER (volunteerid)
values (165333583);
insert into VOLUNTEER (volunteerid)
values (194400947);
insert into VOLUNTEER (volunteerid)
values (232559981);
insert into VOLUNTEER (volunteerid)
values (650502773);
insert into VOLUNTEER (volunteerid)
values (452544001);
insert into VOLUNTEER (volunteerid)
values (305199304);
insert into VOLUNTEER (volunteerid)
values (625853599);
insert into VOLUNTEER (volunteerid)
values (386348949);
insert into VOLUNTEER (volunteerid)
values (332990580);
insert into VOLUNTEER (volunteerid)
values (179630502);
insert into VOLUNTEER (volunteerid)
values (188224358);
insert into VOLUNTEER (volunteerid)
values (675278483);
insert into VOLUNTEER (volunteerid)
values (517094574);
insert into VOLUNTEER (volunteerid)
values (332185579);
insert into VOLUNTEER (volunteerid)
values (327572937);
insert into VOLUNTEER (volunteerid)
values (558414787);
insert into VOLUNTEER (volunteerid)
values (101584298);
insert into VOLUNTEER (volunteerid)
values (761247130);
insert into VOLUNTEER (volunteerid)
values (554527112);
insert into VOLUNTEER (volunteerid)
values (813563203);
insert into VOLUNTEER (volunteerid)
values (988611196);
insert into VOLUNTEER (volunteerid)
values (162788221);
insert into VOLUNTEER (volunteerid)
values (777883031);
insert into VOLUNTEER (volunteerid)
values (991207433);
insert into VOLUNTEER (volunteerid)
values (343281461);
insert into VOLUNTEER (volunteerid)
values (152434577);
insert into VOLUNTEER (volunteerid)
values (213078687);
insert into VOLUNTEER (volunteerid)
values (506544368);
insert into VOLUNTEER (volunteerid)
values (904561233);
insert into VOLUNTEER (volunteerid)
values (886763148);
insert into VOLUNTEER (volunteerid)
values (769195766);
insert into VOLUNTEER (volunteerid)
values (364957248);
insert into VOLUNTEER (volunteerid)
values (276658821);
insert into VOLUNTEER (volunteerid)
values (422239445);
insert into VOLUNTEER (volunteerid)
values (413997128);
insert into VOLUNTEER (volunteerid)
values (531749344);
insert into VOLUNTEER (volunteerid)
values (811724593);
insert into VOLUNTEER (volunteerid)
values (649674822);
insert into VOLUNTEER (volunteerid)
values (306104563);
insert into VOLUNTEER (volunteerid)
values (592339013);
insert into VOLUNTEER (volunteerid)
values (185946154);
insert into VOLUNTEER (volunteerid)
values (112371177);
insert into VOLUNTEER (volunteerid)
values (813323354);
insert into VOLUNTEER (volunteerid)
values (250846779);
insert into VOLUNTEER (volunteerid)
values (613658145);
insert into VOLUNTEER (volunteerid)
values (568666955);
insert into VOLUNTEER (volunteerid)
values (578363521);
insert into VOLUNTEER (volunteerid)
values (187932356);
insert into VOLUNTEER (volunteerid)
values (843512931);
insert into VOLUNTEER (volunteerid)
values (387684814);
insert into VOLUNTEER (volunteerid)
values (812798570);
insert into VOLUNTEER (volunteerid)
values (351332054);
insert into VOLUNTEER (volunteerid)
values (295925780);
insert into VOLUNTEER (volunteerid)
values (831143606);
insert into VOLUNTEER (volunteerid)
values (664633791);
insert into VOLUNTEER (volunteerid)
values (303739378);
insert into VOLUNTEER (volunteerid)
values (421810164);
insert into VOLUNTEER (volunteerid)
values (254279826);
insert into VOLUNTEER (volunteerid)
values (685378695);
insert into VOLUNTEER (volunteerid)
values (515300589);
insert into VOLUNTEER (volunteerid)
values (126868783);
insert into VOLUNTEER (volunteerid)
values (843458495);
commit;
prompt 98 records loaded
prompt Loading PARTICIPANTVOLUNTEER...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1693, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (190, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1682, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (218, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (306, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (518, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (531, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (174, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (795, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (101, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (975, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (212, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1298, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1908, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (305, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (980, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1219, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (528, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (556, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1973, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1321, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (776, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1643, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1944, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (175, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (922, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (124, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1957, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (235, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (547, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1586, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1044, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1535, 413997128);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1023, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (656, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (506, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1017, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (622, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (639, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (828, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1478, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (241, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (778, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1221, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (142, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1760, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1144, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1793, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (863, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1023, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1143, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (339, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1950, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1443, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1657, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1760, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1609, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (234, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (803, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (106, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1027, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1262, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1320, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1244, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1064, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (529, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1584, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (152, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (580, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (281, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (240, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (834, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (383, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1731, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (466, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (868, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (807, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (421, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1861, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (567, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (904, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (201, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1953, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (778, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1276, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1832, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1339, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1299, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (520, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (219, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (447, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1919, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1301, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (266, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1919, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (88, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (56, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1354, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (628, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1209, 108411178);
commit;
prompt 100 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (313, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (452, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1310, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1560, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1644, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1842, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1827, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1829, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (237, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1476, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (55, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1290, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1097, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1959, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (397, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (592, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1869, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (151, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1914, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1177, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (287, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1399, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (94, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1323, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1249, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (392, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (233, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (814, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1515, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (644, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (450, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (230, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (33, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (596, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (322, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (869, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1889, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (346, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1146, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1283, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1876, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1009, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1826, 517094574);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (455, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1699, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (694, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (387, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1584, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (798, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1109, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1107, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (508, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (793, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (795, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1282, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (746, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1564, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (976, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1612, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1164, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (948, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (47, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (212, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (268, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (61, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (670, 517094574);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (251, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1127, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (250, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1514, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1211, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (907, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1666, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1603, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1774, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1050, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1465, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1300, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (336, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (56, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1629, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1915, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1142, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (909, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (417, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1928, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (47, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1116, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1441, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1851, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1904, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1377, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (361, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1707, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1576, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (876, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1213, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1135, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (573, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1199, 305199304);
commit;
prompt 200 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (358, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (117, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1309, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (880, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (52, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (342, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (998, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (566, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1651, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1177, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1156, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (812, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (432, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (278, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (743, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (494, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (41, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (820, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (926, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1861, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (572, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1351, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1460, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (194, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (259, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (273, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (705, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (105, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (809, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (948, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1261, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (451, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (343, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1428, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1229, 755938204);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1879, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1977, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (811, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1098, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (994, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (14, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (219, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (259, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1153, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1775, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (407, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1136, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1879, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1046, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1992, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (956, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (908, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1150, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (310, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1129, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (856, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1649, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (890, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (259, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (509, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (667, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1570, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (790, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (747, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (838, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1218, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1255, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1081, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (883, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1093, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (173, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (824, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (808, 413997128);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (823, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1556, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (883, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (727, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1011, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (45, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (179, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1312, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (467, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1676, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (685, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1870, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (61, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (260, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1101, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (36, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1205, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1403, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1141, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1104, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (959, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (135, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (453, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (971, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1758, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (176, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (165, 951651032);
commit;
prompt 300 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (714, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1772, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (824, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1045, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (789, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1885, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1461, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (305, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (855, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1299, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1695, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1008, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1221, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1765, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1121, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (120, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1924, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (440, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (704, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1171, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1427, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1365, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1797, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1553, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (940, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1573, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (770, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (435, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (375, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1819, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1279, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1307, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1914, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1933, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (149, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1149, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1215, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (803, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (884, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (220, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (228, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (980, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (810, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (483, 413997128);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1653, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1908, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1828, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (640, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1006, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1779, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (810, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1806, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (326, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (15, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1603, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1798, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1493, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (373, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (670, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (57, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1180, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (674, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (351, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1187, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1427, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1159, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1748, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1125, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1840, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1473, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1239, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1933, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1415, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (263, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (614, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1218, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1988, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1417, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (836, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (173, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1309, 517094574);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (913, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1428, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (245, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1740, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (303, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1484, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (429, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (581, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (817, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (310, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1185, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (16, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (93, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1679, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (981, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (694, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1535, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1721, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1463, 364957248);
commit;
prompt 400 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (920, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (290, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (437, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1246, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1483, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1857, 555880862);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (833, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (330, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (109, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1314, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1680, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1148, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1527, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1176, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1906, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (230, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1175, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1874, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (603, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (498, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (522, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (863, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (664, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (183, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (16, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (348, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (49, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (368, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1660, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1644, 421810164);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (668, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1155, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1211, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (152, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (891, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (460, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (2, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (971, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1691, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1432, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (395, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1120, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (399, 421810164);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (491, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (852, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (402, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (96, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (637, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (876, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (620, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1559, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (135, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (972, 413997128);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1207, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1918, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (809, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (211, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (750, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1524, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (768, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (570, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1687, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1689, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1969, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (455, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1512, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (380, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1039, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1314, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1912, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (640, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1728, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (857, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1529, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1630, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (979, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (924, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (346, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (297, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (631, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1955, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1698, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1664, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (739, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (101, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1913, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1754, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (527, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (953, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1569, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1129, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (962, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1897, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (380, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1057, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (950, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1096, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1713, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (308, 384551100);
commit;
prompt 500 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1164, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1094, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (722, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (570, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1489, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1047, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (107, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (494, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (101, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1577, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1506, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (358, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (163, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (257, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (500, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1365, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (151, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1710, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1258, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1557, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1800, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (345, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (791, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (359, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1685, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1710, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (845, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1748, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (410, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (471, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1406, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (46, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1443, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1022, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1845, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (337, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1557, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (710, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1671, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1510, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (910, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1695, 625853599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (925, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1927, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (739, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1429, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (187, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1716, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (690, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1758, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (215, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1691, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1760, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (660, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1205, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (892, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (879, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (592, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1681, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (753, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1105, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1476, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1003, 404883551);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1898, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1446, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (305, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1505, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1556, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (315, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1369, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (257, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1605, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (601, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1112, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (454, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1241, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (366, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1617, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (421, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (269, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1174, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (704, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (259, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1023, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (37, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (668, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (98, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (906, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (989, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1627, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1990, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1562, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (290, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1509, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1416, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (665, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1241, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (654, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (427, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (341, 254279826);
commit;
prompt 600 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (643, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1044, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (403, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (207, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (866, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (162, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (441, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1042, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1548, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1468, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1366, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1077, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (922, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1507, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1365, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (916, 755938204);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (761, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1641, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1257, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1079, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (958, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (399, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1369, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (165, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1721, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (465, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (57, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1652, 755938204);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1396, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (276, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1836, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1309, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1922, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (258, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1146, 421810164);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1245, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1900, 108411178);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1678, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1737, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (570, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1292, 675278483);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (128, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1681, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (693, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1752, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1626, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (8, 421810164);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1238, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (565, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1350, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (968, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (588, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (230, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (993, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1919, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1052, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1654, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (741, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (838, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (660, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (980, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1881, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1456, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1575, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (33, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (31, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (23, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1146, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (394, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (995, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1692, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1565, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1244, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (531, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (169, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1982, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1019, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1162, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (352, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (578, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (68, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (19, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1112, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (746, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1992, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (239, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1215, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (846, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1233, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (171, 811724593);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1992, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1561, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (678, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1512, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (754, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1356, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1885, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1071, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (837, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1544, 112371177);
commit;
prompt 700 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1947, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (153, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (267, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (989, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (962, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1576, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1058, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (431, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (147, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (301, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1124, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (431, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (565, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1697, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (827, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (952, 386348949);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (480, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1430, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (142, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (551, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1338, 517094574);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (969, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (451, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1208, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (375, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (728, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (961, 681488617);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (773, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1843, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (826, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1746, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1042, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (867, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1472, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1417, 112371177);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1454, 843512931);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1928, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (980, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1413, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (417, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1967, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1401, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (919, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (256, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (112, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1790, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (412, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1790, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (41, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1090, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1825, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (526, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (644, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1340, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (488, 276658821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1182, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (330, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (811, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1664, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (424, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (327, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1801, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1081, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (590, 115840139);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (498, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (254, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1503, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1290, 568666955);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1403, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1786, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1758, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1939, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (935, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1603, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (684, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (483, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (584, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1045, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (704, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (759, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1319, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (752, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1027, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (474, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1107, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (461, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (470, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1809, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (41, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1420, 831143606);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1910, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (651, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1111, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1430, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (355, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (449, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (581, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (520, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (644, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (694, 813323354);
commit;
prompt 800 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (9, 843458495);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1231, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (774, 177157307);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (21, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1541, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (844, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1947, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (866, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (402, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1637, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1218, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (717, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1916, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (809, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (797, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (771, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (118, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (723, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1462, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (87, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (402, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1893, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (45, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1213, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1561, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (57, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (280, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1569, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (454, 607515527);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (882, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (285, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (459, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1300, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (281, 613658145);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (674, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1708, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1597, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (369, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1277, 951651032);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1923, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (663, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1032, 558414787);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (503, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (384, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (805, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1129, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1319, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (547, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1315, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1853, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1192, 101584298);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1874, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (492, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (628, 991207433);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1173, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1621, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1881, 274340804);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (414, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1813, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (796, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (722, 886763148);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (712, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (916, 452544001);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (46, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1599, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (855, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (395, 671157768);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1138, 306104563);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1388, 755938204);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1743, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1544, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (504, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1832, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (196, 554527112);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1918, 343281461);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1411, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1741, 934146705);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1936, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1849, 577311698);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (748, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (814, 162788221);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1189, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (580, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (450, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1089, 387684814);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (921, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (25, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1538, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (20, 213078687);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1688, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (163, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (787, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1171, 761247130);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1119, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (41, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (21, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (546, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (24, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (415, 187932356);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (28, 625853599);
commit;
prompt 900 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (533, 769195766);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1118, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (13, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1104, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1482, 699763110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (383, 813323354);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1420, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (222, 384551100);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (903, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1045, 332185579);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (588, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (826, 339593939);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (288, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (180, 875005373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1976, 429436272);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1245, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1565, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1946, 749309034);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1309, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1739, 194400947);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1167, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1434, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1968, 254279826);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (167, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1735, 421810164);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1154, 947929576);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (996, 179630502);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (279, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1440, 311783430);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (139, 578363521);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (743, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (632, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (935, 612714265);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1673, 813563203);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (120, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (139, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1925, 769300586);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1647, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1490, 592339013);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (231, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1370, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1543, 376286668);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1176, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1651, 305993110);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1307, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (35, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1605, 124475793);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1875, 506544368);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (300, 364957248);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1223, 232559981);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1061, 384875242);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1153, 652011695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (515, 479816079);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1486, 250846779);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1077, 555880862);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1177, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (418, 812798570);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (963, 751304730);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1445, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (371, 126868783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1100, 988611196);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1660, 185946154);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (854, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1817, 165333583);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (224, 303739378);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (179, 328925588);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1151, 422239445);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1789, 944746756);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1603, 904561233);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1072, 900618507);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1226, 755938204);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (926, 531749344);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (397, 777883031);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (825, 123863694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (526, 305199304);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (24, 327572937);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1937, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (463, 664633791);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (191, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (455, 188224358);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (176, 555880862);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (775, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1817, 332990580);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1208, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1759, 515300589);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (179, 240495059);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1840, 649674822);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (555, 351332054);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1728, 152434577);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1193, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1548, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (352, 650502773);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (843, 295925780);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1546, 685378695);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (722, 994265828);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (946, 612714265);
commit;
prompt 996 records loaded
prompt Loading SENDTEAM...
insert into SENDTEAM (callid, teamid)
values (294, 147);
insert into SENDTEAM (callid, teamid)
values (70, 640);
insert into SENDTEAM (callid, teamid)
values (609, 54);
insert into SENDTEAM (callid, teamid)
values (126, 1125);
insert into SENDTEAM (callid, teamid)
values (303, 327);
insert into SENDTEAM (callid, teamid)
values (424, 1128);
insert into SENDTEAM (callid, teamid)
values (962, 458);
insert into SENDTEAM (callid, teamid)
values (220, 1879);
insert into SENDTEAM (callid, teamid)
values (139, 301);
insert into SENDTEAM (callid, teamid)
values (699, 289);
insert into SENDTEAM (callid, teamid)
values (474, 1365);
insert into SENDTEAM (callid, teamid)
values (160, 121);
insert into SENDTEAM (callid, teamid)
values (53, 784);
insert into SENDTEAM (callid, teamid)
values (881, 5);
insert into SENDTEAM (callid, teamid)
values (882, 435);
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
values (30, 1803);
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
values (203, 1049);
insert into SENDTEAM (callid, teamid)
values (381, 1804);
insert into SENDTEAM (callid, teamid)
values (882, 1694);
insert into SENDTEAM (callid, teamid)
values (206, 1749);
insert into SENDTEAM (callid, teamid)
values (926, 1347);
insert into SENDTEAM (callid, teamid)
values (869, 800);
insert into SENDTEAM (callid, teamid)
values (379, 1830);
insert into SENDTEAM (callid, teamid)
values (167, 834);
insert into SENDTEAM (callid, teamid)
values (435, 1580);
insert into SENDTEAM (callid, teamid)
values (189, 168);
insert into SENDTEAM (callid, teamid)
values (238, 1012);
insert into SENDTEAM (callid, teamid)
values (151, 320);
insert into SENDTEAM (callid, teamid)
values (708, 154);
insert into SENDTEAM (callid, teamid)
values (943, 1835);
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
values (436, 1624);
insert into SENDTEAM (callid, teamid)
values (265, 271);
insert into SENDTEAM (callid, teamid)
values (554, 693);
insert into SENDTEAM (callid, teamid)
values (951, 256);
insert into SENDTEAM (callid, teamid)
values (827, 1455);
insert into SENDTEAM (callid, teamid)
values (320, 371);
insert into SENDTEAM (callid, teamid)
values (628, 1102);
insert into SENDTEAM (callid, teamid)
values (740, 1671);
insert into SENDTEAM (callid, teamid)
values (764, 829);
insert into SENDTEAM (callid, teamid)
values (748, 471);
insert into SENDTEAM (callid, teamid)
values (182, 1252);
insert into SENDTEAM (callid, teamid)
values (523, 530);
insert into SENDTEAM (callid, teamid)
values (894, 60);
insert into SENDTEAM (callid, teamid)
values (970, 1167);
insert into SENDTEAM (callid, teamid)
values (674, 1375);
insert into SENDTEAM (callid, teamid)
values (45, 1981);
insert into SENDTEAM (callid, teamid)
values (331, 786);
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
values (221, 1259);
insert into SENDTEAM (callid, teamid)
values (451, 391);
insert into SENDTEAM (callid, teamid)
values (212, 966);
insert into SENDTEAM (callid, teamid)
values (618, 1393);
insert into SENDTEAM (callid, teamid)
values (870, 1210);
insert into SENDTEAM (callid, teamid)
values (786, 516);
insert into SENDTEAM (callid, teamid)
values (923, 627);
insert into SENDTEAM (callid, teamid)
values (628, 818);
insert into SENDTEAM (callid, teamid)
values (610, 1026);
insert into SENDTEAM (callid, teamid)
values (4, 1786);
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
commit;
prompt 100 records committed...
insert into SENDTEAM (callid, teamid)
values (540, 1401);
insert into SENDTEAM (callid, teamid)
values (388, 704);
insert into SENDTEAM (callid, teamid)
values (641, 1567);
insert into SENDTEAM (callid, teamid)
values (54, 1480);
insert into SENDTEAM (callid, teamid)
values (930, 529);
insert into SENDTEAM (callid, teamid)
values (67, 122);
insert into SENDTEAM (callid, teamid)
values (822, 416);
insert into SENDTEAM (callid, teamid)
values (473, 1730);
insert into SENDTEAM (callid, teamid)
values (429, 1499);
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
values (36, 1743);
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
values (96, 944);
insert into SENDTEAM (callid, teamid)
values (241, 1513);
insert into SENDTEAM (callid, teamid)
values (166, 1889);
insert into SENDTEAM (callid, teamid)
values (682, 1403);
insert into SENDTEAM (callid, teamid)
values (389, 1022);
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
values (284, 13);
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
values (754, 1349);
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
values (180, 1222);
insert into SENDTEAM (callid, teamid)
values (971, 1797);
insert into SENDTEAM (callid, teamid)
values (906, 1308);
insert into SENDTEAM (callid, teamid)
values (580, 981);
insert into SENDTEAM (callid, teamid)
values (491, 264);
insert into SENDTEAM (callid, teamid)
values (887, 666);
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
values (530, 1347);
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
values (390, 707);
insert into SENDTEAM (callid, teamid)
values (599, 1635);
insert into SENDTEAM (callid, teamid)
values (436, 316);
insert into SENDTEAM (callid, teamid)
values (261, 185);
insert into SENDTEAM (callid, teamid)
values (444, 958);
insert into SENDTEAM (callid, teamid)
values (846, 1644);
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
values (29, 1052);
insert into SENDTEAM (callid, teamid)
values (303, 489);
insert into SENDTEAM (callid, teamid)
values (574, 592);
insert into SENDTEAM (callid, teamid)
values (331, 268);
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
values (785, 641);
insert into SENDTEAM (callid, teamid)
values (675, 686);
insert into SENDTEAM (callid, teamid)
values (945, 878);
insert into SENDTEAM (callid, teamid)
values (477, 848);
insert into SENDTEAM (callid, teamid)
values (818, 1425);
commit;
prompt 200 records committed...
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
values (501, 1249);
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
values (515, 1757);
insert into SENDTEAM (callid, teamid)
values (67, 1079);
insert into SENDTEAM (callid, teamid)
values (279, 1462);
insert into SENDTEAM (callid, teamid)
values (330, 265);
insert into SENDTEAM (callid, teamid)
values (995, 1745);
insert into SENDTEAM (callid, teamid)
values (910, 1373);
insert into SENDTEAM (callid, teamid)
values (485, 260);
insert into SENDTEAM (callid, teamid)
values (243, 1261);
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
values (128, 1089);
insert into SENDTEAM (callid, teamid)
values (244, 760);
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
values (541, 613);
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
values (706, 388);
insert into SENDTEAM (callid, teamid)
values (843, 778);
insert into SENDTEAM (callid, teamid)
values (262, 1532);
insert into SENDTEAM (callid, teamid)
values (297, 1758);
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
values (149, 478);
insert into SENDTEAM (callid, teamid)
values (751, 1047);
insert into SENDTEAM (callid, teamid)
values (333, 1380);
insert into SENDTEAM (callid, teamid)
values (149, 1501);
insert into SENDTEAM (callid, teamid)
values (217, 1438);
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
values (347, 1624);
insert into SENDTEAM (callid, teamid)
values (331, 1187);
insert into SENDTEAM (callid, teamid)
values (952, 1472);
insert into SENDTEAM (callid, teamid)
values (693, 670);
insert into SENDTEAM (callid, teamid)
values (459, 1804);
insert into SENDTEAM (callid, teamid)
values (882, 143);
insert into SENDTEAM (callid, teamid)
values (31, 1995);
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
commit;
prompt 300 records committed...
insert into SENDTEAM (callid, teamid)
values (747, 766);
insert into SENDTEAM (callid, teamid)
values (980, 1912);
insert into SENDTEAM (callid, teamid)
values (611, 69);
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
values (333, 1143);
insert into SENDTEAM (callid, teamid)
values (872, 885);
insert into SENDTEAM (callid, teamid)
values (562, 567);
insert into SENDTEAM (callid, teamid)
values (839, 286);
insert into SENDTEAM (callid, teamid)
values (512, 1917);
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
values (675, 941);
insert into SENDTEAM (callid, teamid)
values (293, 1143);
insert into SENDTEAM (callid, teamid)
values (801, 656);
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
values (88, 357);
insert into SENDTEAM (callid, teamid)
values (617, 1960);
insert into SENDTEAM (callid, teamid)
values (135, 461);
insert into SENDTEAM (callid, teamid)
values (746, 1716);
insert into SENDTEAM (callid, teamid)
values (100, 1958);
insert into SENDTEAM (callid, teamid)
values (331, 266);
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
values (143, 1829);
insert into SENDTEAM (callid, teamid)
values (814, 1093);
insert into SENDTEAM (callid, teamid)
values (880, 1078);
insert into SENDTEAM (callid, teamid)
values (330, 1186);
insert into SENDTEAM (callid, teamid)
values (894, 1601);
insert into SENDTEAM (callid, teamid)
values (990, 1340);
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
insert into SENDTEAM (callid, teamid)
values (362, 1594);
insert into SENDTEAM (callid, teamid)
values (417, 1777);
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
values (304, 435);
insert into SENDTEAM (callid, teamid)
values (902, 1602);
insert into SENDTEAM (callid, teamid)
values (492, 203);
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
values (307, 1668);
insert into SENDTEAM (callid, teamid)
values (217, 1392);
insert into SENDTEAM (callid, teamid)
values (308, 1381);
insert into SENDTEAM (callid, teamid)
values (647, 1933);
insert into SENDTEAM (callid, teamid)
values (229, 1767);
insert into SENDTEAM (callid, teamid)
values (244, 1302);
insert into SENDTEAM (callid, teamid)
values (801, 1489);
insert into SENDTEAM (callid, teamid)
values (843, 1061);
insert into SENDTEAM (callid, teamid)
values (718, 896);
insert into SENDTEAM (callid, teamid)
values (581, 763);
insert into SENDTEAM (callid, teamid)
values (96, 982);
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
values (9, 985);
commit;
prompt 400 records committed...
insert into SENDTEAM (callid, teamid)
values (765, 1443);
insert into SENDTEAM (callid, teamid)
values (353, 878);
insert into SENDTEAM (callid, teamid)
values (195, 421);
insert into SENDTEAM (callid, teamid)
values (835, 1371);
insert into SENDTEAM (callid, teamid)
values (886, 698);
insert into SENDTEAM (callid, teamid)
values (861, 59);
insert into SENDTEAM (callid, teamid)
values (404, 1163);
insert into SENDTEAM (callid, teamid)
values (454, 673);
insert into SENDTEAM (callid, teamid)
values (590, 843);
insert into SENDTEAM (callid, teamid)
values (520, 1135);
insert into SENDTEAM (callid, teamid)
values (137, 1095);
insert into SENDTEAM (callid, teamid)
values (255, 988);
insert into SENDTEAM (callid, teamid)
values (615, 210);
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
values (539, 1129);
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
values (388, 1125);
insert into SENDTEAM (callid, teamid)
values (814, 145);
insert into SENDTEAM (callid, teamid)
values (273, 908);
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
values (342, 1049);
insert into SENDTEAM (callid, teamid)
values (912, 431);
insert into SENDTEAM (callid, teamid)
values (797, 808);
insert into SENDTEAM (callid, teamid)
values (111, 190);
insert into SENDTEAM (callid, teamid)
values (35, 1698);
insert into SENDTEAM (callid, teamid)
values (841, 849);
insert into SENDTEAM (callid, teamid)
values (804, 1952);
insert into SENDTEAM (callid, teamid)
values (324, 494);
insert into SENDTEAM (callid, teamid)
values (772, 362);
insert into SENDTEAM (callid, teamid)
values (560, 810);
insert into SENDTEAM (callid, teamid)
values (91, 1282);
insert into SENDTEAM (callid, teamid)
values (263, 763);
insert into SENDTEAM (callid, teamid)
values (519, 1212);
insert into SENDTEAM (callid, teamid)
values (775, 163);
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
values (924, 1613);
insert into SENDTEAM (callid, teamid)
values (402, 267);
insert into SENDTEAM (callid, teamid)
values (25, 446);
insert into SENDTEAM (callid, teamid)
values (49, 464);
insert into SENDTEAM (callid, teamid)
values (113, 1968);
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
values (103, 986);
commit;
prompt 500 records committed...
insert into SENDTEAM (callid, teamid)
values (407, 145);
insert into SENDTEAM (callid, teamid)
values (574, 1309);
insert into SENDTEAM (callid, teamid)
values (731, 1335);
insert into SENDTEAM (callid, teamid)
values (420, 342);
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
values (263, 533);
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
values (561, 397);
insert into SENDTEAM (callid, teamid)
values (75, 1882);
insert into SENDTEAM (callid, teamid)
values (204, 1976);
insert into SENDTEAM (callid, teamid)
values (492, 887);
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
values (308, 926);
insert into SENDTEAM (callid, teamid)
values (558, 440);
insert into SENDTEAM (callid, teamid)
values (715, 1038);
insert into SENDTEAM (callid, teamid)
values (548, 1640);
insert into SENDTEAM (callid, teamid)
values (454, 854);
insert into SENDTEAM (callid, teamid)
values (730, 1599);
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
values (228, 34);
insert into SENDTEAM (callid, teamid)
values (110, 1946);
insert into SENDTEAM (callid, teamid)
values (873, 930);
insert into SENDTEAM (callid, teamid)
values (61, 479);
insert into SENDTEAM (callid, teamid)
values (476, 889);
insert into SENDTEAM (callid, teamid)
values (822, 1126);
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
values (621, 614);
insert into SENDTEAM (callid, teamid)
values (820, 1084);
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
values (119, 335);
insert into SENDTEAM (callid, teamid)
values (957, 1499);
insert into SENDTEAM (callid, teamid)
values (777, 1274);
insert into SENDTEAM (callid, teamid)
values (861, 763);
insert into SENDTEAM (callid, teamid)
values (156, 8);
insert into SENDTEAM (callid, teamid)
values (926, 422);
insert into SENDTEAM (callid, teamid)
values (587, 677);
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
values (456, 1835);
insert into SENDTEAM (callid, teamid)
values (86, 1066);
insert into SENDTEAM (callid, teamid)
values (595, 657);
insert into SENDTEAM (callid, teamid)
values (858, 1301);
insert into SENDTEAM (callid, teamid)
values (875, 335);
insert into SENDTEAM (callid, teamid)
values (75, 105);
insert into SENDTEAM (callid, teamid)
values (425, 965);
insert into SENDTEAM (callid, teamid)
values (758, 914);
insert into SENDTEAM (callid, teamid)
values (717, 1541);
insert into SENDTEAM (callid, teamid)
values (854, 1386);
insert into SENDTEAM (callid, teamid)
values (52, 235);
insert into SENDTEAM (callid, teamid)
values (391, 1246);
insert into SENDTEAM (callid, teamid)
values (134, 1437);
insert into SENDTEAM (callid, teamid)
values (501, 941);
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
values (364, 512);
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
values (602, 205);
insert into SENDTEAM (callid, teamid)
values (160, 137);
insert into SENDTEAM (callid, teamid)
values (217, 1532);
insert into SENDTEAM (callid, teamid)
values (649, 1029);
insert into SENDTEAM (callid, teamid)
values (193, 121);
commit;
prompt 600 records committed...
insert into SENDTEAM (callid, teamid)
values (618, 29);
insert into SENDTEAM (callid, teamid)
values (787, 1135);
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
values (287, 966);
insert into SENDTEAM (callid, teamid)
values (290, 68);
insert into SENDTEAM (callid, teamid)
values (522, 245);
insert into SENDTEAM (callid, teamid)
values (809, 572);
insert into SENDTEAM (callid, teamid)
values (348, 848);
insert into SENDTEAM (callid, teamid)
values (877, 3);
insert into SENDTEAM (callid, teamid)
values (630, 1159);
insert into SENDTEAM (callid, teamid)
values (573, 1818);
insert into SENDTEAM (callid, teamid)
values (481, 563);
insert into SENDTEAM (callid, teamid)
values (670, 355);
insert into SENDTEAM (callid, teamid)
values (5, 153);
insert into SENDTEAM (callid, teamid)
values (839, 1230);
insert into SENDTEAM (callid, teamid)
values (223, 1438);
insert into SENDTEAM (callid, teamid)
values (860, 1785);
insert into SENDTEAM (callid, teamid)
values (128, 272);
insert into SENDTEAM (callid, teamid)
values (877, 51);
insert into SENDTEAM (callid, teamid)
values (40, 1722);
insert into SENDTEAM (callid, teamid)
values (5, 1203);
insert into SENDTEAM (callid, teamid)
values (666, 91);
insert into SENDTEAM (callid, teamid)
values (837, 963);
insert into SENDTEAM (callid, teamid)
values (555, 828);
insert into SENDTEAM (callid, teamid)
values (636, 1927);
insert into SENDTEAM (callid, teamid)
values (860, 1519);
insert into SENDTEAM (callid, teamid)
values (273, 1296);
insert into SENDTEAM (callid, teamid)
values (580, 1708);
insert into SENDTEAM (callid, teamid)
values (194, 952);
insert into SENDTEAM (callid, teamid)
values (713, 1737);
insert into SENDTEAM (callid, teamid)
values (977, 1375);
insert into SENDTEAM (callid, teamid)
values (969, 1347);
insert into SENDTEAM (callid, teamid)
values (264, 1357);
insert into SENDTEAM (callid, teamid)
values (1000, 1250);
insert into SENDTEAM (callid, teamid)
values (121, 1980);
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
values (633, 1332);
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
values (433, 922);
insert into SENDTEAM (callid, teamid)
values (364, 1225);
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
values (942, 465);
insert into SENDTEAM (callid, teamid)
values (220, 346);
insert into SENDTEAM (callid, teamid)
values (42, 411);
insert into SENDTEAM (callid, teamid)
values (978, 194);
insert into SENDTEAM (callid, teamid)
values (678, 478);
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
values (240, 30);
insert into SENDTEAM (callid, teamid)
values (267, 1845);
insert into SENDTEAM (callid, teamid)
values (126, 1217);
insert into SENDTEAM (callid, teamid)
values (927, 80);
insert into SENDTEAM (callid, teamid)
values (542, 1224);
insert into SENDTEAM (callid, teamid)
values (361, 834);
insert into SENDTEAM (callid, teamid)
values (37, 69);
insert into SENDTEAM (callid, teamid)
values (748, 700);
insert into SENDTEAM (callid, teamid)
values (855, 1363);
insert into SENDTEAM (callid, teamid)
values (747, 113);
insert into SENDTEAM (callid, teamid)
values (447, 737);
insert into SENDTEAM (callid, teamid)
values (10, 864);
insert into SENDTEAM (callid, teamid)
values (187, 431);
insert into SENDTEAM (callid, teamid)
values (95, 1569);
insert into SENDTEAM (callid, teamid)
values (988, 761);
commit;
prompt 700 records committed...
insert into SENDTEAM (callid, teamid)
values (563, 1062);
insert into SENDTEAM (callid, teamid)
values (714, 1682);
insert into SENDTEAM (callid, teamid)
values (323, 177);
insert into SENDTEAM (callid, teamid)
values (581, 158);
insert into SENDTEAM (callid, teamid)
values (507, 899);
insert into SENDTEAM (callid, teamid)
values (967, 1579);
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
values (972, 1056);
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
values (587, 941);
insert into SENDTEAM (callid, teamid)
values (804, 1560);
insert into SENDTEAM (callid, teamid)
values (128, 1980);
insert into SENDTEAM (callid, teamid)
values (120, 341);
insert into SENDTEAM (callid, teamid)
values (221, 1202);
insert into SENDTEAM (callid, teamid)
values (126, 142);
insert into SENDTEAM (callid, teamid)
values (614, 1463);
insert into SENDTEAM (callid, teamid)
values (157, 1719);
insert into SENDTEAM (callid, teamid)
values (477, 753);
insert into SENDTEAM (callid, teamid)
values (659, 1810);
insert into SENDTEAM (callid, teamid)
values (65, 1198);
insert into SENDTEAM (callid, teamid)
values (652, 1080);
insert into SENDTEAM (callid, teamid)
values (10, 372);
insert into SENDTEAM (callid, teamid)
values (924, 1529);
insert into SENDTEAM (callid, teamid)
values (294, 1366);
insert into SENDTEAM (callid, teamid)
values (165, 1098);
insert into SENDTEAM (callid, teamid)
values (189, 604);
insert into SENDTEAM (callid, teamid)
values (420, 1680);
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
values (34, 954);
insert into SENDTEAM (callid, teamid)
values (597, 1874);
insert into SENDTEAM (callid, teamid)
values (847, 228);
insert into SENDTEAM (callid, teamid)
values (719, 1283);
insert into SENDTEAM (callid, teamid)
values (858, 1492);
insert into SENDTEAM (callid, teamid)
values (414, 173);
insert into SENDTEAM (callid, teamid)
values (429, 1458);
insert into SENDTEAM (callid, teamid)
values (949, 1615);
insert into SENDTEAM (callid, teamid)
values (938, 409);
insert into SENDTEAM (callid, teamid)
values (57, 660);
insert into SENDTEAM (callid, teamid)
values (92, 1731);
insert into SENDTEAM (callid, teamid)
values (698, 1369);
insert into SENDTEAM (callid, teamid)
values (941, 367);
insert into SENDTEAM (callid, teamid)
values (136, 936);
insert into SENDTEAM (callid, teamid)
values (618, 665);
insert into SENDTEAM (callid, teamid)
values (494, 625);
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
values (156, 1784);
insert into SENDTEAM (callid, teamid)
values (127, 129);
insert into SENDTEAM (callid, teamid)
values (824, 1002);
insert into SENDTEAM (callid, teamid)
values (206, 155);
insert into SENDTEAM (callid, teamid)
values (251, 1519);
insert into SENDTEAM (callid, teamid)
values (619, 689);
insert into SENDTEAM (callid, teamid)
values (544, 1661);
insert into SENDTEAM (callid, teamid)
values (120, 121);
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
values (794, 897);
insert into SENDTEAM (callid, teamid)
values (915, 1749);
insert into SENDTEAM (callid, teamid)
values (482, 165);
insert into SENDTEAM (callid, teamid)
values (764, 248);
insert into SENDTEAM (callid, teamid)
values (798, 422);
insert into SENDTEAM (callid, teamid)
values (190, 845);
commit;
prompt 800 records committed...
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
values (516, 472);
insert into SENDTEAM (callid, teamid)
values (890, 328);
insert into SENDTEAM (callid, teamid)
values (616, 1615);
insert into SENDTEAM (callid, teamid)
values (297, 34);
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
values (292, 1313);
insert into SENDTEAM (callid, teamid)
values (776, 19);
insert into SENDTEAM (callid, teamid)
values (452, 1186);
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
values (134, 681);
insert into SENDTEAM (callid, teamid)
values (518, 30);
insert into SENDTEAM (callid, teamid)
values (337, 506);
insert into SENDTEAM (callid, teamid)
values (322, 105);
insert into SENDTEAM (callid, teamid)
values (630, 688);
insert into SENDTEAM (callid, teamid)
values (357, 889);
insert into SENDTEAM (callid, teamid)
values (275, 1952);
insert into SENDTEAM (callid, teamid)
values (491, 1130);
insert into SENDTEAM (callid, teamid)
values (53, 731);
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
values (72, 982);
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
values (792, 179);
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
values (977, 1061);
insert into SENDTEAM (callid, teamid)
values (609, 1082);
insert into SENDTEAM (callid, teamid)
values (103, 1405);
insert into SENDTEAM (callid, teamid)
values (345, 848);
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
values (76, 429);
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
values (281, 656);
insert into SENDTEAM (callid, teamid)
values (787, 905);
insert into SENDTEAM (callid, teamid)
values (145, 548);
insert into SENDTEAM (callid, teamid)
values (641, 621);
insert into SENDTEAM (callid, teamid)
values (274, 994);
insert into SENDTEAM (callid, teamid)
values (609, 324);
insert into SENDTEAM (callid, teamid)
values (296, 1900);
commit;
prompt 900 records committed...
insert into SENDTEAM (callid, teamid)
values (247, 933);
insert into SENDTEAM (callid, teamid)
values (675, 1128);
insert into SENDTEAM (callid, teamid)
values (995, 263);
insert into SENDTEAM (callid, teamid)
values (226, 998);
insert into SENDTEAM (callid, teamid)
values (891, 500);
insert into SENDTEAM (callid, teamid)
values (713, 1711);
insert into SENDTEAM (callid, teamid)
values (544, 367);
insert into SENDTEAM (callid, teamid)
values (221, 388);
insert into SENDTEAM (callid, teamid)
values (190, 1971);
insert into SENDTEAM (callid, teamid)
values (207, 965);
insert into SENDTEAM (callid, teamid)
values (843, 793);
insert into SENDTEAM (callid, teamid)
values (405, 640);
insert into SENDTEAM (callid, teamid)
values (877, 1784);
insert into SENDTEAM (callid, teamid)
values (17, 1118);
insert into SENDTEAM (callid, teamid)
values (550, 1049);
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
values (186, 1678);
insert into SENDTEAM (callid, teamid)
values (558, 522);
insert into SENDTEAM (callid, teamid)
values (879, 746);
insert into SENDTEAM (callid, teamid)
values (714, 376);
insert into SENDTEAM (callid, teamid)
values (831, 1332);
insert into SENDTEAM (callid, teamid)
values (561, 1901);
insert into SENDTEAM (callid, teamid)
values (313, 1265);
insert into SENDTEAM (callid, teamid)
values (242, 1687);
insert into SENDTEAM (callid, teamid)
values (455, 1904);
insert into SENDTEAM (callid, teamid)
values (1000, 172);
insert into SENDTEAM (callid, teamid)
values (133, 1323);
insert into SENDTEAM (callid, teamid)
values (102, 268);
insert into SENDTEAM (callid, teamid)
values (977, 817);
insert into SENDTEAM (callid, teamid)
values (12, 463);
insert into SENDTEAM (callid, teamid)
values (560, 1153);
insert into SENDTEAM (callid, teamid)
values (983, 110);
insert into SENDTEAM (callid, teamid)
values (61, 1576);
insert into SENDTEAM (callid, teamid)
values (492, 1129);
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
values (809, 77);
insert into SENDTEAM (callid, teamid)
values (848, 1142);
insert into SENDTEAM (callid, teamid)
values (693, 1251);
insert into SENDTEAM (callid, teamid)
values (206, 763);
insert into SENDTEAM (callid, teamid)
values (379, 1719);
insert into SENDTEAM (callid, teamid)
values (561, 1759);
insert into SENDTEAM (callid, teamid)
values (461, 276);
insert into SENDTEAM (callid, teamid)
values (764, 769);
insert into SENDTEAM (callid, teamid)
values (616, 1933);
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
values (882, 994);
insert into SENDTEAM (callid, teamid)
values (744, 529);
insert into SENDTEAM (callid, teamid)
values (677, 1814);
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
values (65, 644);
insert into SENDTEAM (callid, teamid)
values (376, 1420);
insert into SENDTEAM (callid, teamid)
values (58, 454);
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
values (564, 397);
insert into SENDTEAM (callid, teamid)
values (301, 393);
insert into SENDTEAM (callid, teamid)
values (597, 867);
insert into SENDTEAM (callid, teamid)
values (221, 897);
insert into SENDTEAM (callid, teamid)
values (765, 65);
insert into SENDTEAM (callid, teamid)
values (91, 1254);
insert into SENDTEAM (callid, teamid)
values (18, 416);
insert into SENDTEAM (callid, teamid)
values (64, 1369);
insert into SENDTEAM (callid, teamid)
values (809, 873);
insert into SENDTEAM (callid, teamid)
values (301, 138);
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
prompt 1000 records loaded
prompt Enabling foreign key constraints for DISPATCHER...
alter table DISPATCHER enable constraint SYS_C0011737;
prompt Enabling foreign key constraints for CALLHELP...
alter table CALLHELP enable constraint SYS_C0011742;
prompt Enabling foreign key constraints for DRIVER...
alter table DRIVER enable constraint SYS_C0011730;
prompt Enabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC enable constraint SYS_C0011734;
prompt Enabling foreign key constraints for TEAM...
alter table TEAM enable constraint SYS_C0011749;
alter table TEAM enable constraint SYS_C0011750;
prompt Enabling foreign key constraints for PARTICIPANTPARAMEDIC...
alter table PARTICIPANTPARAMEDIC enable constraint SYS_C0011764;
alter table PARTICIPANTPARAMEDIC enable constraint SYS_C0011765;
prompt Enabling foreign key constraints for VOLUNTEER...
alter table VOLUNTEER enable constraint SYS_C0011727;
prompt Enabling foreign key constraints for PARTICIPANTVOLUNTEER...
alter table PARTICIPANTVOLUNTEER enable constraint SYS_C0011759;
alter table PARTICIPANTVOLUNTEER enable constraint SYS_C0011760;
prompt Enabling foreign key constraints for SENDTEAM...
alter table SENDTEAM enable constraint SYS_C0011754;
alter table SENDTEAM enable constraint SYS_C0011755;
prompt Enabling triggers for AMBULANCE...
alter table AMBULANCE enable all triggers;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for DISPATCHER...
alter table DISPATCHER enable all triggers;
prompt Enabling triggers for CALLHELP...
alter table CALLHELP enable all triggers;
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
