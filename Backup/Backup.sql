prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by User on Monday, March 8, 2021
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
  references DISPATCHER (DISPATCHERID);

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
  references DRIVER (DRIVERID);
alter table TEAM
  add foreign key (AMBULANCEID)
  references AMBULANCE (AMBULANCEID);

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
  references TEAM (TEAMID);
alter table PARTICIPANTPARAMEDIC
  add foreign key (PARAMEDICID)
  references PARAMEDIC (PARAMEDICID);

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
  references TEAM (TEAMID);
alter table PARTICIPANTVOLUNTEER
  add foreign key (VOLUNTEERID)
  references VOLUNTEER (VOLUNTEERID);

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
  references CALLHELP (CALLID);
alter table SENDTEAM
  add foreign key (TEAMID)
  references TEAM (TEAMID);

prompt Disabling triggers for AMBULANCE...
alter table AMBULANCE disable all triggers;
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
prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for SENDTEAM...
alter table SENDTEAM disable all triggers;
prompt Disabling foreign key constraints for CALLHELP...
alter table CALLHELP disable constraint SYS_C008135;
prompt Disabling foreign key constraints for TEAM...
alter table TEAM disable constraint SYS_C008142;
alter table TEAM disable constraint SYS_C008143;
prompt Disabling foreign key constraints for PARTICIPANTPARAMEDIC...
alter table PARTICIPANTPARAMEDIC disable constraint SYS_C008157;
alter table PARTICIPANTPARAMEDIC disable constraint SYS_C008158;
prompt Disabling foreign key constraints for PARTICIPANTVOLUNTEER...
alter table PARTICIPANTVOLUNTEER disable constraint SYS_C008152;
alter table PARTICIPANTVOLUNTEER disable constraint SYS_C008153;
prompt Disabling foreign key constraints for SENDTEAM...
alter table SENDTEAM disable constraint SYS_C008147;
alter table SENDTEAM disable constraint SYS_C008148;
prompt Deleting SENDTEAM...
delete from SENDTEAM;
commit;
prompt Deleting PERSON...
delete from PERSON;
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
prompt Loading DISPATCHER...
insert into DISPATCHER (dispatcherid)
values (183388113);
insert into DISPATCHER (dispatcherid)
values (640480720);
insert into DISPATCHER (dispatcherid)
values (126597937);
insert into DISPATCHER (dispatcherid)
values (301528474);
insert into DISPATCHER (dispatcherid)
values (882974225);
insert into DISPATCHER (dispatcherid)
values (781552572);
insert into DISPATCHER (dispatcherid)
values (176774232);
insert into DISPATCHER (dispatcherid)
values (370717744);
insert into DISPATCHER (dispatcherid)
values (181286799);
insert into DISPATCHER (dispatcherid)
values (799583810);
insert into DISPATCHER (dispatcherid)
values (230513924);
insert into DISPATCHER (dispatcherid)
values (926155825);
insert into DISPATCHER (dispatcherid)
values (718359114);
insert into DISPATCHER (dispatcherid)
values (732124306);
insert into DISPATCHER (dispatcherid)
values (271819575);
insert into DISPATCHER (dispatcherid)
values (629649482);
insert into DISPATCHER (dispatcherid)
values (907807730);
insert into DISPATCHER (dispatcherid)
values (388876145);
insert into DISPATCHER (dispatcherid)
values (978779321);
insert into DISPATCHER (dispatcherid)
values (350254293);
insert into DISPATCHER (dispatcherid)
values (318648963);
insert into DISPATCHER (dispatcherid)
values (850950414);
insert into DISPATCHER (dispatcherid)
values (884753922);
insert into DISPATCHER (dispatcherid)
values (822031404);
insert into DISPATCHER (dispatcherid)
values (664144723);
insert into DISPATCHER (dispatcherid)
values (540162175);
insert into DISPATCHER (dispatcherid)
values (699369790);
insert into DISPATCHER (dispatcherid)
values (842065450);
insert into DISPATCHER (dispatcherid)
values (587026468);
insert into DISPATCHER (dispatcherid)
values (981597035);
insert into DISPATCHER (dispatcherid)
values (575647393);
insert into DISPATCHER (dispatcherid)
values (725530361);
insert into DISPATCHER (dispatcherid)
values (422066354);
insert into DISPATCHER (dispatcherid)
values (775003956);
insert into DISPATCHER (dispatcherid)
values (782429762);
insert into DISPATCHER (dispatcherid)
values (281175627);
insert into DISPATCHER (dispatcherid)
values (829531211);
insert into DISPATCHER (dispatcherid)
values (112802719);
insert into DISPATCHER (dispatcherid)
values (921040663);
insert into DISPATCHER (dispatcherid)
values (235298895);
insert into DISPATCHER (dispatcherid)
values (701434627);
insert into DISPATCHER (dispatcherid)
values (606650535);
insert into DISPATCHER (dispatcherid)
values (446253243);
insert into DISPATCHER (dispatcherid)
values (104860473);
insert into DISPATCHER (dispatcherid)
values (674951299);
insert into DISPATCHER (dispatcherid)
values (792593323);
insert into DISPATCHER (dispatcherid)
values (294766103);
insert into DISPATCHER (dispatcherid)
values (222389506);
insert into DISPATCHER (dispatcherid)
values (402498328);
insert into DISPATCHER (dispatcherid)
values (926360339);
insert into DISPATCHER (dispatcherid)
values (965774744);
insert into DISPATCHER (dispatcherid)
values (244818870);
insert into DISPATCHER (dispatcherid)
values (593421768);
insert into DISPATCHER (dispatcherid)
values (190928615);
insert into DISPATCHER (dispatcherid)
values (652554824);
insert into DISPATCHER (dispatcherid)
values (225742953);
insert into DISPATCHER (dispatcherid)
values (601145118);
insert into DISPATCHER (dispatcherid)
values (192929550);
insert into DISPATCHER (dispatcherid)
values (689213887);
insert into DISPATCHER (dispatcherid)
values (506241993);
insert into DISPATCHER (dispatcherid)
values (844295357);
insert into DISPATCHER (dispatcherid)
values (704212385);
insert into DISPATCHER (dispatcherid)
values (499031759);
insert into DISPATCHER (dispatcherid)
values (783665095);
insert into DISPATCHER (dispatcherid)
values (316665484);
insert into DISPATCHER (dispatcherid)
values (609785028);
insert into DISPATCHER (dispatcherid)
values (224854323);
insert into DISPATCHER (dispatcherid)
values (249969746);
insert into DISPATCHER (dispatcherid)
values (528422726);
insert into DISPATCHER (dispatcherid)
values (807055203);
insert into DISPATCHER (dispatcherid)
values (387721649);
insert into DISPATCHER (dispatcherid)
values (506205888);
insert into DISPATCHER (dispatcherid)
values (799010990);
insert into DISPATCHER (dispatcherid)
values (116452197);
insert into DISPATCHER (dispatcherid)
values (570675025);
insert into DISPATCHER (dispatcherid)
values (340163676);
insert into DISPATCHER (dispatcherid)
values (137968823);
insert into DISPATCHER (dispatcherid)
values (323695688);
insert into DISPATCHER (dispatcherid)
values (439634346);
insert into DISPATCHER (dispatcherid)
values (375359937);
insert into DISPATCHER (dispatcherid)
values (359849386);
insert into DISPATCHER (dispatcherid)
values (326146555);
insert into DISPATCHER (dispatcherid)
values (404274655);
insert into DISPATCHER (dispatcherid)
values (322492683);
insert into DISPATCHER (dispatcherid)
values (558486949);
insert into DISPATCHER (dispatcherid)
values (254746679);
insert into DISPATCHER (dispatcherid)
values (824940431);
insert into DISPATCHER (dispatcherid)
values (203687493);
insert into DISPATCHER (dispatcherid)
values (621340115);
insert into DISPATCHER (dispatcherid)
values (721900875);
insert into DISPATCHER (dispatcherid)
values (307513185);
insert into DISPATCHER (dispatcherid)
values (604239875);
insert into DISPATCHER (dispatcherid)
values (899832305);
insert into DISPATCHER (dispatcherid)
values (974180286);
insert into DISPATCHER (dispatcherid)
values (879708395);
insert into DISPATCHER (dispatcherid)
values (196424839);
insert into DISPATCHER (dispatcherid)
values (641986332);
insert into DISPATCHER (dispatcherid)
values (695265116);
insert into DISPATCHER (dispatcherid)
values (896500443);
insert into DISPATCHER (dispatcherid)
values (638446497);
commit;
prompt 100 records committed...
insert into DISPATCHER (dispatcherid)
values (107574714);
insert into DISPATCHER (dispatcherid)
values (438813407);
insert into DISPATCHER (dispatcherid)
values (293770073);
insert into DISPATCHER (dispatcherid)
values (814124117);
insert into DISPATCHER (dispatcherid)
values (564352234);
insert into DISPATCHER (dispatcherid)
values (842443489);
insert into DISPATCHER (dispatcherid)
values (872649579);
insert into DISPATCHER (dispatcherid)
values (765542455);
insert into DISPATCHER (dispatcherid)
values (354589284);
insert into DISPATCHER (dispatcherid)
values (221845501);
insert into DISPATCHER (dispatcherid)
values (315830523);
insert into DISPATCHER (dispatcherid)
values (336547274);
insert into DISPATCHER (dispatcherid)
values (855275039);
insert into DISPATCHER (dispatcherid)
values (858098492);
insert into DISPATCHER (dispatcherid)
values (752603295);
insert into DISPATCHER (dispatcherid)
values (426330673);
insert into DISPATCHER (dispatcherid)
values (543717343);
insert into DISPATCHER (dispatcherid)
values (533618858);
insert into DISPATCHER (dispatcherid)
values (280412141);
insert into DISPATCHER (dispatcherid)
values (251883743);
insert into DISPATCHER (dispatcherid)
values (646453183);
insert into DISPATCHER (dispatcherid)
values (817554939);
insert into DISPATCHER (dispatcherid)
values (135607013);
insert into DISPATCHER (dispatcherid)
values (392516978);
insert into DISPATCHER (dispatcherid)
values (933776135);
insert into DISPATCHER (dispatcherid)
values (385229456);
insert into DISPATCHER (dispatcherid)
values (858806514);
insert into DISPATCHER (dispatcherid)
values (926831963);
insert into DISPATCHER (dispatcherid)
values (639408278);
insert into DISPATCHER (dispatcherid)
values (453085783);
insert into DISPATCHER (dispatcherid)
values (587382823);
insert into DISPATCHER (dispatcherid)
values (259605572);
insert into DISPATCHER (dispatcherid)
values (256855102);
insert into DISPATCHER (dispatcherid)
values (566353911);
insert into DISPATCHER (dispatcherid)
values (335052588);
commit;
prompt 135 records loaded
prompt Loading CALLHELP...
insert into CALLHELP (callid, calldate, dispatcherid)
values (1, to_date('15-06-2006', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (2, to_date('22-12-2017', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (3, to_date('08-07-1984', 'dd-mm-yyyy'), 814124117);
insert into CALLHELP (callid, calldate, dispatcherid)
values (4, to_date('14-03-2015', 'dd-mm-yyyy'), 385229456);
insert into CALLHELP (callid, calldate, dispatcherid)
values (5, to_date('08-04-1999', 'dd-mm-yyyy'), 543717343);
insert into CALLHELP (callid, calldate, dispatcherid)
values (6, to_date('18-08-1993', 'dd-mm-yyyy'), 879708395);
insert into CALLHELP (callid, calldate, dispatcherid)
values (7, to_date('11-12-2017', 'dd-mm-yyyy'), 570675025);
insert into CALLHELP (callid, calldate, dispatcherid)
values (8, to_date('21-02-2003', 'dd-mm-yyyy'), 316665484);
insert into CALLHELP (callid, calldate, dispatcherid)
values (9, to_date('29-12-2004', 'dd-mm-yyyy'), 453085783);
insert into CALLHELP (callid, calldate, dispatcherid)
values (10, to_date('15-01-1999', 'dd-mm-yyyy'), 359849386);
insert into CALLHELP (callid, calldate, dispatcherid)
values (11, to_date('15-07-2002', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (12, to_date('25-09-1995', 'dd-mm-yyyy'), 907807730);
insert into CALLHELP (callid, calldate, dispatcherid)
values (13, to_date('13-12-1966', 'dd-mm-yyyy'), 385229456);
insert into CALLHELP (callid, calldate, dispatcherid)
values (14, to_date('15-06-1968', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (15, to_date('22-03-2003', 'dd-mm-yyyy'), 322492683);
insert into CALLHELP (callid, calldate, dispatcherid)
values (16, to_date('17-12-1978', 'dd-mm-yyyy'), 116452197);
insert into CALLHELP (callid, calldate, dispatcherid)
values (17, to_date('03-12-2005', 'dd-mm-yyyy'), 807055203);
insert into CALLHELP (callid, calldate, dispatcherid)
values (18, to_date('01-01-2011', 'dd-mm-yyyy'), 221845501);
insert into CALLHELP (callid, calldate, dispatcherid)
values (19, to_date('16-09-1965', 'dd-mm-yyyy'), 543717343);
insert into CALLHELP (callid, calldate, dispatcherid)
values (20, to_date('20-07-1955', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (21, to_date('05-03-1986', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (22, to_date('15-07-1987', 'dd-mm-yyyy'), 587382823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (23, to_date('29-12-2009', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (24, to_date('29-01-2010', 'dd-mm-yyyy'), 230513924);
insert into CALLHELP (callid, calldate, dispatcherid)
values (25, to_date('04-03-1991', 'dd-mm-yyyy'), 446253243);
insert into CALLHELP (callid, calldate, dispatcherid)
values (26, to_date('02-01-1956', 'dd-mm-yyyy'), 301528474);
insert into CALLHELP (callid, calldate, dispatcherid)
values (27, to_date('27-04-1972', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (28, to_date('30-07-2018', 'dd-mm-yyyy'), 230513924);
insert into CALLHELP (callid, calldate, dispatcherid)
values (29, to_date('24-10-1975', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (30, to_date('19-04-1973', 'dd-mm-yyyy'), 181286799);
insert into CALLHELP (callid, calldate, dispatcherid)
values (31, to_date('06-09-1995', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (32, to_date('24-08-2010', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (33, to_date('05-03-1963', 'dd-mm-yyyy'), 558486949);
insert into CALLHELP (callid, calldate, dispatcherid)
values (34, to_date('18-08-1973', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (35, to_date('16-10-2008', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (36, to_date('22-01-1960', 'dd-mm-yyyy'), 221845501);
insert into CALLHELP (callid, calldate, dispatcherid)
values (37, to_date('26-09-1993', 'dd-mm-yyyy'), 882974225);
insert into CALLHELP (callid, calldate, dispatcherid)
values (38, to_date('14-05-2011', 'dd-mm-yyyy'), 933776135);
insert into CALLHELP (callid, calldate, dispatcherid)
values (39, to_date('01-08-1965', 'dd-mm-yyyy'), 453085783);
insert into CALLHELP (callid, calldate, dispatcherid)
values (40, to_date('17-11-2011', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (41, to_date('14-02-1971', 'dd-mm-yyyy'), 256855102);
insert into CALLHELP (callid, calldate, dispatcherid)
values (42, to_date('30-05-2004', 'dd-mm-yyyy'), 244818870);
insert into CALLHELP (callid, calldate, dispatcherid)
values (43, to_date('06-03-1981', 'dd-mm-yyyy'), 807055203);
insert into CALLHELP (callid, calldate, dispatcherid)
values (44, to_date('22-01-1994', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (45, to_date('30-04-1980', 'dd-mm-yyyy'), 621340115);
insert into CALLHELP (callid, calldate, dispatcherid)
values (46, to_date('20-01-1986', 'dd-mm-yyyy'), 438813407);
insert into CALLHELP (callid, calldate, dispatcherid)
values (47, to_date('18-05-2004', 'dd-mm-yyyy'), 695265116);
insert into CALLHELP (callid, calldate, dispatcherid)
values (48, to_date('25-07-2013', 'dd-mm-yyyy'), 926155825);
insert into CALLHELP (callid, calldate, dispatcherid)
values (49, to_date('19-06-1998', 'dd-mm-yyyy'), 792593323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (50, to_date('30-04-2001', 'dd-mm-yyyy'), 359849386);
insert into CALLHELP (callid, calldate, dispatcherid)
values (51, to_date('29-08-1962', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (52, to_date('19-12-1976', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (53, to_date('24-12-2005', 'dd-mm-yyyy'), 230513924);
insert into CALLHELP (callid, calldate, dispatcherid)
values (54, to_date('16-11-2007', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (55, to_date('21-08-2019', 'dd-mm-yyyy'), 249969746);
insert into CALLHELP (callid, calldate, dispatcherid)
values (56, to_date('25-07-1979', 'dd-mm-yyyy'), 316665484);
insert into CALLHELP (callid, calldate, dispatcherid)
values (57, to_date('29-05-1994', 'dd-mm-yyyy'), 829531211);
insert into CALLHELP (callid, calldate, dispatcherid)
values (58, to_date('20-04-1997', 'dd-mm-yyyy'), 792593323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (59, to_date('21-01-2009', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (60, to_date('26-12-1978', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (61, to_date('04-08-2014', 'dd-mm-yyyy'), 183388113);
insert into CALLHELP (callid, calldate, dispatcherid)
values (62, to_date('14-01-1977', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (63, to_date('19-04-1989', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (64, to_date('20-04-1977', 'dd-mm-yyyy'), 907807730);
insert into CALLHELP (callid, calldate, dispatcherid)
values (65, to_date('02-06-1977', 'dd-mm-yyyy'), 540162175);
insert into CALLHELP (callid, calldate, dispatcherid)
values (66, to_date('13-09-1956', 'dd-mm-yyyy'), 280412141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (67, to_date('29-04-1974', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (68, to_date('22-08-1991', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (69, to_date('24-01-1999', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (70, to_date('12-12-2010', 'dd-mm-yyyy'), 315830523);
insert into CALLHELP (callid, calldate, dispatcherid)
values (71, to_date('13-03-1993', 'dd-mm-yyyy'), 704212385);
insert into CALLHELP (callid, calldate, dispatcherid)
values (72, to_date('13-04-1957', 'dd-mm-yyyy'), 230513924);
insert into CALLHELP (callid, calldate, dispatcherid)
values (73, to_date('20-09-1994', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (74, to_date('03-11-1986', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (75, to_date('15-01-1974', 'dd-mm-yyyy'), 882974225);
insert into CALLHELP (callid, calldate, dispatcherid)
values (76, to_date('13-04-1995', 'dd-mm-yyyy'), 879708395);
insert into CALLHELP (callid, calldate, dispatcherid)
values (77, to_date('25-10-1960', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (78, to_date('13-09-2007', 'dd-mm-yyyy'), 640480720);
insert into CALLHELP (callid, calldate, dispatcherid)
values (79, to_date('17-07-1956', 'dd-mm-yyyy'), 196424839);
insert into CALLHELP (callid, calldate, dispatcherid)
values (80, to_date('26-07-1964', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (81, to_date('14-10-2009', 'dd-mm-yyyy'), 604239875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (82, to_date('22-06-1973', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (83, to_date('04-12-1984', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (84, to_date('27-07-1954', 'dd-mm-yyyy'), 438813407);
insert into CALLHELP (callid, calldate, dispatcherid)
values (85, to_date('08-04-2013', 'dd-mm-yyyy'), 850950414);
insert into CALLHELP (callid, calldate, dispatcherid)
values (86, to_date('03-08-2001', 'dd-mm-yyyy'), 570675025);
insert into CALLHELP (callid, calldate, dispatcherid)
values (87, to_date('08-06-1969', 'dd-mm-yyyy'), 609785028);
insert into CALLHELP (callid, calldate, dispatcherid)
values (88, to_date('21-04-1990', 'dd-mm-yyyy'), 322492683);
insert into CALLHELP (callid, calldate, dispatcherid)
values (89, to_date('11-11-2005', 'dd-mm-yyyy'), 564352234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (90, to_date('23-04-2008', 'dd-mm-yyyy'), 543717343);
insert into CALLHELP (callid, calldate, dispatcherid)
values (91, to_date('29-04-1948', 'dd-mm-yyyy'), 783665095);
insert into CALLHELP (callid, calldate, dispatcherid)
values (92, to_date('31-12-1957', 'dd-mm-yyyy'), 609785028);
insert into CALLHELP (callid, calldate, dispatcherid)
values (93, to_date('08-05-1981', 'dd-mm-yyyy'), 978779321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (94, to_date('09-08-2014', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (95, to_date('08-05-1958', 'dd-mm-yyyy'), 506205888);
insert into CALLHELP (callid, calldate, dispatcherid)
values (96, to_date('14-03-1967', 'dd-mm-yyyy'), 280412141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (97, to_date('10-06-2017', 'dd-mm-yyyy'), 782429762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (98, to_date('30-06-1952', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (99, to_date('23-09-2017', 'dd-mm-yyyy'), 375359937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (100, to_date('16-05-1997', 'dd-mm-yyyy'), 674951299);
commit;
prompt 100 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (101, to_date('30-12-2008', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (102, to_date('06-12-1979', 'dd-mm-yyyy'), 799010990);
insert into CALLHELP (callid, calldate, dispatcherid)
values (103, to_date('25-08-2005', 'dd-mm-yyyy'), 689213887);
insert into CALLHELP (callid, calldate, dispatcherid)
values (104, to_date('11-01-1981', 'dd-mm-yyyy'), 540162175);
insert into CALLHELP (callid, calldate, dispatcherid)
values (105, to_date('11-10-2017', 'dd-mm-yyyy'), 244818870);
insert into CALLHELP (callid, calldate, dispatcherid)
values (106, to_date('17-02-2008', 'dd-mm-yyyy'), 392516978);
insert into CALLHELP (callid, calldate, dispatcherid)
values (107, to_date('31-03-2014', 'dd-mm-yyyy'), 775003956);
insert into CALLHELP (callid, calldate, dispatcherid)
values (108, to_date('28-04-1963', 'dd-mm-yyyy'), 307513185);
insert into CALLHELP (callid, calldate, dispatcherid)
values (109, to_date('29-08-2014', 'dd-mm-yyyy'), 604239875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (110, to_date('13-06-1953', 'dd-mm-yyyy'), 879708395);
insert into CALLHELP (callid, calldate, dispatcherid)
values (111, to_date('28-01-1949', 'dd-mm-yyyy'), 842443489);
insert into CALLHELP (callid, calldate, dispatcherid)
values (112, to_date('24-02-1978', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (113, to_date('20-05-1950', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (114, to_date('29-09-1993', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (115, to_date('15-02-1962', 'dd-mm-yyyy'), 224854323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (116, to_date('15-10-2000', 'dd-mm-yyyy'), 570675025);
insert into CALLHELP (callid, calldate, dispatcherid)
values (117, to_date('13-10-2010', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (118, to_date('25-03-1965', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (119, to_date('05-04-1989', 'dd-mm-yyyy'), 926360339);
insert into CALLHELP (callid, calldate, dispatcherid)
values (120, to_date('24-12-1976', 'dd-mm-yyyy'), 587382823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (121, to_date('10-07-1976', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (122, to_date('31-10-1987', 'dd-mm-yyyy'), 807055203);
insert into CALLHELP (callid, calldate, dispatcherid)
values (123, to_date('31-03-1976', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (124, to_date('19-07-2000', 'dd-mm-yyyy'), 244818870);
insert into CALLHELP (callid, calldate, dispatcherid)
values (125, to_date('02-05-1991', 'dd-mm-yyyy'), 907807730);
insert into CALLHELP (callid, calldate, dispatcherid)
values (126, to_date('18-01-2015', 'dd-mm-yyyy'), 203687493);
insert into CALLHELP (callid, calldate, dispatcherid)
values (127, to_date('17-03-2001', 'dd-mm-yyyy'), 926360339);
insert into CALLHELP (callid, calldate, dispatcherid)
values (128, to_date('06-07-1991', 'dd-mm-yyyy'), 621340115);
insert into CALLHELP (callid, calldate, dispatcherid)
values (129, to_date('25-09-2002', 'dd-mm-yyyy'), 782429762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (130, to_date('26-04-1964', 'dd-mm-yyyy'), 792593323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (131, to_date('16-08-2005', 'dd-mm-yyyy'), 137968823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (132, to_date('08-09-1954', 'dd-mm-yyyy'), 375359937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (133, to_date('12-04-1963', 'dd-mm-yyyy'), 822031404);
insert into CALLHELP (callid, calldate, dispatcherid)
values (134, to_date('14-11-1995', 'dd-mm-yyyy'), 704212385);
insert into CALLHELP (callid, calldate, dispatcherid)
values (135, to_date('24-10-1997', 'dd-mm-yyyy'), 116452197);
insert into CALLHELP (callid, calldate, dispatcherid)
values (136, to_date('21-10-1954', 'dd-mm-yyyy'), 842065450);
insert into CALLHELP (callid, calldate, dispatcherid)
values (137, to_date('16-04-2000', 'dd-mm-yyyy'), 453085783);
insert into CALLHELP (callid, calldate, dispatcherid)
values (138, to_date('31-01-2004', 'dd-mm-yyyy'), 224854323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (139, to_date('27-11-2008', 'dd-mm-yyyy'), 196424839);
insert into CALLHELP (callid, calldate, dispatcherid)
values (140, to_date('11-02-1952', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (141, to_date('03-02-1978', 'dd-mm-yyyy'), 256855102);
insert into CALLHELP (callid, calldate, dispatcherid)
values (142, to_date('09-05-1977', 'dd-mm-yyyy'), 249969746);
insert into CALLHELP (callid, calldate, dispatcherid)
values (143, to_date('08-05-2017', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (144, to_date('29-06-2002', 'dd-mm-yyyy'), 528422726);
insert into CALLHELP (callid, calldate, dispatcherid)
values (145, to_date('27-09-1964', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (146, to_date('12-06-2002', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (147, to_date('14-11-1985', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (148, to_date('21-01-1958', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (149, to_date('06-04-2019', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (150, to_date('10-05-1985', 'dd-mm-yyyy'), 765542455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (151, to_date('23-12-2010', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (152, to_date('10-04-1964', 'dd-mm-yyyy'), 725530361);
insert into CALLHELP (callid, calldate, dispatcherid)
values (153, to_date('22-05-2019', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (154, to_date('02-09-1952', 'dd-mm-yyyy'), 783665095);
insert into CALLHELP (callid, calldate, dispatcherid)
values (155, to_date('06-12-2008', 'dd-mm-yyyy'), 718359114);
insert into CALLHELP (callid, calldate, dispatcherid)
values (156, to_date('26-07-1953', 'dd-mm-yyyy'), 221845501);
insert into CALLHELP (callid, calldate, dispatcherid)
values (157, to_date('12-10-1961', 'dd-mm-yyyy'), 587026468);
insert into CALLHELP (callid, calldate, dispatcherid)
values (158, to_date('06-06-1997', 'dd-mm-yyyy'), 882974225);
insert into CALLHELP (callid, calldate, dispatcherid)
values (159, to_date('28-03-2018', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (160, to_date('04-06-2007', 'dd-mm-yyyy'), 316665484);
insert into CALLHELP (callid, calldate, dispatcherid)
values (161, to_date('13-10-2014', 'dd-mm-yyyy'), 336547274);
insert into CALLHELP (callid, calldate, dispatcherid)
values (162, to_date('22-06-2013', 'dd-mm-yyyy'), 446253243);
insert into CALLHELP (callid, calldate, dispatcherid)
values (163, to_date('18-08-1966', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (164, to_date('05-01-2003', 'dd-mm-yyyy'), 307513185);
insert into CALLHELP (callid, calldate, dispatcherid)
values (165, to_date('24-08-1963', 'dd-mm-yyyy'), 350254293);
insert into CALLHELP (callid, calldate, dispatcherid)
values (166, to_date('27-04-2010', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (167, to_date('21-07-1982', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (168, to_date('14-04-1984', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (169, to_date('01-04-1992', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (170, to_date('04-07-2000', 'dd-mm-yyyy'), 392516978);
insert into CALLHELP (callid, calldate, dispatcherid)
values (171, to_date('22-02-1955', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (172, to_date('02-08-1961', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (173, to_date('13-05-1993', 'dd-mm-yyyy'), 725530361);
insert into CALLHELP (callid, calldate, dispatcherid)
values (174, to_date('21-06-1963', 'dd-mm-yyyy'), 926360339);
insert into CALLHELP (callid, calldate, dispatcherid)
values (175, to_date('23-09-1998', 'dd-mm-yyyy'), 829531211);
insert into CALLHELP (callid, calldate, dispatcherid)
values (176, to_date('09-10-2003', 'dd-mm-yyyy'), 782429762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (177, to_date('11-05-1999', 'dd-mm-yyyy'), 453085783);
insert into CALLHELP (callid, calldate, dispatcherid)
values (178, to_date('17-11-1957', 'dd-mm-yyyy'), 230513924);
insert into CALLHELP (callid, calldate, dispatcherid)
values (179, to_date('14-10-1949', 'dd-mm-yyyy'), 222389506);
insert into CALLHELP (callid, calldate, dispatcherid)
values (180, to_date('19-10-1974', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (181, to_date('14-06-2005', 'dd-mm-yyyy'), 385229456);
insert into CALLHELP (callid, calldate, dispatcherid)
values (182, to_date('09-07-1950', 'dd-mm-yyyy'), 575647393);
insert into CALLHELP (callid, calldate, dispatcherid)
values (183, to_date('15-06-1984', 'dd-mm-yyyy'), 318648963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (184, to_date('11-11-1994', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (185, to_date('10-06-1977', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (186, to_date('19-08-2009', 'dd-mm-yyyy'), 388876145);
insert into CALLHELP (callid, calldate, dispatcherid)
values (187, to_date('01-07-1980', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (188, to_date('23-12-1969', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (189, to_date('08-12-1971', 'dd-mm-yyyy'), 135607013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (190, to_date('18-10-1998', 'dd-mm-yyyy'), 858806514);
insert into CALLHELP (callid, calldate, dispatcherid)
values (191, to_date('21-10-1999', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (192, to_date('11-02-1990', 'dd-mm-yyyy'), 322492683);
insert into CALLHELP (callid, calldate, dispatcherid)
values (193, to_date('01-02-2009', 'dd-mm-yyyy'), 646453183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (194, to_date('07-04-1995', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (195, to_date('11-05-2019', 'dd-mm-yyyy'), 318648963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (196, to_date('12-10-2011', 'dd-mm-yyyy'), 249969746);
insert into CALLHELP (callid, calldate, dispatcherid)
values (197, to_date('03-11-1985', 'dd-mm-yyyy'), 725530361);
insert into CALLHELP (callid, calldate, dispatcherid)
values (198, to_date('31-10-1992', 'dd-mm-yyyy'), 974180286);
insert into CALLHELP (callid, calldate, dispatcherid)
values (199, to_date('25-09-1990', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (200, to_date('24-02-1977', 'dd-mm-yyyy'), 137968823);
commit;
prompt 200 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (201, to_date('24-08-1989', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (202, to_date('17-03-1969', 'dd-mm-yyyy'), 725530361);
insert into CALLHELP (callid, calldate, dispatcherid)
values (203, to_date('27-01-2012', 'dd-mm-yyyy'), 336547274);
insert into CALLHELP (callid, calldate, dispatcherid)
values (204, to_date('02-09-2009', 'dd-mm-yyyy'), 587382823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (205, to_date('17-09-2004', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (206, to_date('08-11-1957', 'dd-mm-yyyy'), 249969746);
insert into CALLHELP (callid, calldate, dispatcherid)
values (207, to_date('29-07-1964', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (208, to_date('02-03-1966', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (209, to_date('21-09-2018', 'dd-mm-yyyy'), 438813407);
insert into CALLHELP (callid, calldate, dispatcherid)
values (210, to_date('09-05-1980', 'dd-mm-yyyy'), 933776135);
insert into CALLHELP (callid, calldate, dispatcherid)
values (211, to_date('26-06-1981', 'dd-mm-yyyy'), 850950414);
insert into CALLHELP (callid, calldate, dispatcherid)
values (212, to_date('12-06-2001', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (213, to_date('03-02-1954', 'dd-mm-yyyy'), 792593323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (214, to_date('10-04-1983', 'dd-mm-yyyy'), 765542455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (215, to_date('23-07-1949', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (216, to_date('04-06-1985', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (217, to_date('06-09-1999', 'dd-mm-yyyy'), 817554939);
insert into CALLHELP (callid, calldate, dispatcherid)
values (218, to_date('11-07-1995', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (219, to_date('25-01-1987', 'dd-mm-yyyy'), 254746679);
insert into CALLHELP (callid, calldate, dispatcherid)
values (220, to_date('18-09-2004', 'dd-mm-yyyy'), 183388113);
insert into CALLHELP (callid, calldate, dispatcherid)
values (221, to_date('14-01-1975', 'dd-mm-yyyy'), 453085783);
insert into CALLHELP (callid, calldate, dispatcherid)
values (222, to_date('18-03-2002', 'dd-mm-yyyy'), 884753922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (223, to_date('12-04-1954', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (224, to_date('04-10-2004', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (225, to_date('20-02-1959', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (226, to_date('30-12-1966', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (227, to_date('06-06-2012', 'dd-mm-yyyy'), 316665484);
insert into CALLHELP (callid, calldate, dispatcherid)
values (228, to_date('31-05-2012', 'dd-mm-yyyy'), 112802719);
insert into CALLHELP (callid, calldate, dispatcherid)
values (229, to_date('11-08-1951', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (230, to_date('20-12-2002', 'dd-mm-yyyy'), 882974225);
insert into CALLHELP (callid, calldate, dispatcherid)
values (231, to_date('23-03-1999', 'dd-mm-yyyy'), 765542455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (232, to_date('30-01-2003', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (233, to_date('23-06-2006', 'dd-mm-yyyy'), 359849386);
insert into CALLHELP (callid, calldate, dispatcherid)
values (234, to_date('28-12-1971', 'dd-mm-yyyy'), 638446497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (235, to_date('23-10-1996', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (236, to_date('17-04-1988', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (237, to_date('19-05-1974', 'dd-mm-yyyy'), 792593323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (238, to_date('22-07-1952', 'dd-mm-yyyy'), 222389506);
insert into CALLHELP (callid, calldate, dispatcherid)
values (239, to_date('07-04-2004', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (240, to_date('10-11-1963', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (241, to_date('01-05-2005', 'dd-mm-yyyy'), 224854323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (242, to_date('03-03-1992', 'dd-mm-yyyy'), 326146555);
insert into CALLHELP (callid, calldate, dispatcherid)
values (243, to_date('01-08-2010', 'dd-mm-yyyy'), 858806514);
insert into CALLHELP (callid, calldate, dispatcherid)
values (244, to_date('06-06-2006', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (245, to_date('05-12-2011', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (246, to_date('05-03-2008', 'dd-mm-yyyy'), 782429762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (247, to_date('26-02-1964', 'dd-mm-yyyy'), 183388113);
insert into CALLHELP (callid, calldate, dispatcherid)
values (248, to_date('22-08-2014', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (249, to_date('04-02-1965', 'dd-mm-yyyy'), 181286799);
insert into CALLHELP (callid, calldate, dispatcherid)
values (250, to_date('22-02-1981', 'dd-mm-yyyy'), 387721649);
insert into CALLHELP (callid, calldate, dispatcherid)
values (251, to_date('02-10-1998', 'dd-mm-yyyy'), 792593323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (252, to_date('16-09-1958', 'dd-mm-yyyy'), 814124117);
insert into CALLHELP (callid, calldate, dispatcherid)
values (253, to_date('02-05-2014', 'dd-mm-yyyy'), 965774744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (254, to_date('19-09-2008', 'dd-mm-yyyy'), 354589284);
insert into CALLHELP (callid, calldate, dispatcherid)
values (255, to_date('09-01-1980', 'dd-mm-yyyy'), 540162175);
insert into CALLHELP (callid, calldate, dispatcherid)
values (256, to_date('18-07-1990', 'dd-mm-yyyy'), 575647393);
insert into CALLHELP (callid, calldate, dispatcherid)
values (257, to_date('04-06-2000', 'dd-mm-yyyy'), 244818870);
insert into CALLHELP (callid, calldate, dispatcherid)
values (258, to_date('22-12-2003', 'dd-mm-yyyy'), 438813407);
insert into CALLHELP (callid, calldate, dispatcherid)
values (259, to_date('17-06-1956', 'dd-mm-yyyy'), 370717744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (260, to_date('09-05-1982', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (261, to_date('10-09-2016', 'dd-mm-yyyy'), 782429762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (262, to_date('12-04-1974', 'dd-mm-yyyy'), 322492683);
insert into CALLHELP (callid, calldate, dispatcherid)
values (263, to_date('22-11-2002', 'dd-mm-yyyy'), 752603295);
insert into CALLHELP (callid, calldate, dispatcherid)
values (264, to_date('02-10-2005', 'dd-mm-yyyy'), 280412141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (265, to_date('23-09-2002', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (266, to_date('27-08-2016', 'dd-mm-yyyy'), 587382823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (267, to_date('22-06-1960', 'dd-mm-yyyy'), 842443489);
insert into CALLHELP (callid, calldate, dispatcherid)
values (268, to_date('23-05-1951', 'dd-mm-yyyy'), 439634346);
insert into CALLHELP (callid, calldate, dispatcherid)
values (269, to_date('12-08-1954', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (270, to_date('21-08-1957', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (271, to_date('28-02-2009', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (272, to_date('10-01-2017', 'dd-mm-yyyy'), 392516978);
insert into CALLHELP (callid, calldate, dispatcherid)
values (273, to_date('02-09-1959', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (274, to_date('20-08-2005', 'dd-mm-yyyy'), 453085783);
insert into CALLHELP (callid, calldate, dispatcherid)
values (275, to_date('12-09-1984', 'dd-mm-yyyy'), 181286799);
insert into CALLHELP (callid, calldate, dispatcherid)
values (276, to_date('05-03-1976', 'dd-mm-yyyy'), 533618858);
insert into CALLHELP (callid, calldate, dispatcherid)
values (277, to_date('11-09-1983', 'dd-mm-yyyy'), 322492683);
insert into CALLHELP (callid, calldate, dispatcherid)
values (278, to_date('13-10-1967', 'dd-mm-yyyy'), 558486949);
insert into CALLHELP (callid, calldate, dispatcherid)
values (279, to_date('10-02-1960', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (280, to_date('12-03-1963', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (281, to_date('06-09-1986', 'dd-mm-yyyy'), 271819575);
insert into CALLHELP (callid, calldate, dispatcherid)
values (282, to_date('22-04-1983', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (283, to_date('04-09-2003', 'dd-mm-yyyy'), 609785028);
insert into CALLHELP (callid, calldate, dispatcherid)
values (284, to_date('20-11-1966', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (285, to_date('23-01-2007', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (286, to_date('20-05-1965', 'dd-mm-yyyy'), 822031404);
insert into CALLHELP (callid, calldate, dispatcherid)
values (287, to_date('30-05-1977', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (288, to_date('23-08-1976', 'dd-mm-yyyy'), 224854323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (289, to_date('10-06-1998', 'dd-mm-yyyy'), 280412141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (290, to_date('03-07-1983', 'dd-mm-yyyy'), 850950414);
insert into CALLHELP (callid, calldate, dispatcherid)
values (291, to_date('25-01-1952', 'dd-mm-yyyy'), 280412141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (292, to_date('07-01-1989', 'dd-mm-yyyy'), 254746679);
insert into CALLHELP (callid, calldate, dispatcherid)
values (293, to_date('01-11-1994', 'dd-mm-yyyy'), 799583810);
insert into CALLHELP (callid, calldate, dispatcherid)
values (294, to_date('26-04-2002', 'dd-mm-yyyy'), 926155825);
insert into CALLHELP (callid, calldate, dispatcherid)
values (295, to_date('10-08-2014', 'dd-mm-yyyy'), 256855102);
insert into CALLHELP (callid, calldate, dispatcherid)
values (296, to_date('08-11-2018', 'dd-mm-yyyy'), 387721649);
insert into CALLHELP (callid, calldate, dispatcherid)
values (297, to_date('23-05-1956', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (298, to_date('03-01-1985', 'dd-mm-yyyy'), 196424839);
insert into CALLHELP (callid, calldate, dispatcherid)
values (299, to_date('07-03-1972', 'dd-mm-yyyy'), 316665484);
insert into CALLHELP (callid, calldate, dispatcherid)
values (300, to_date('19-11-1970', 'dd-mm-yyyy'), 824940431);
commit;
prompt 300 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (301, to_date('25-08-2015', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (302, to_date('23-02-2001', 'dd-mm-yyyy'), 575647393);
insert into CALLHELP (callid, calldate, dispatcherid)
values (303, to_date('18-08-1960', 'dd-mm-yyyy'), 388876145);
insert into CALLHELP (callid, calldate, dispatcherid)
values (304, to_date('08-11-2019', 'dd-mm-yyyy'), 112802719);
insert into CALLHELP (callid, calldate, dispatcherid)
values (305, to_date('27-03-1972', 'dd-mm-yyyy'), 842065450);
insert into CALLHELP (callid, calldate, dispatcherid)
values (306, to_date('20-01-1979', 'dd-mm-yyyy'), 271819575);
insert into CALLHELP (callid, calldate, dispatcherid)
values (307, to_date('14-06-2013', 'dd-mm-yyyy'), 978779321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (308, to_date('13-02-1987', 'dd-mm-yyyy'), 775003956);
insert into CALLHELP (callid, calldate, dispatcherid)
values (309, to_date('22-02-1980', 'dd-mm-yyyy'), 254746679);
insert into CALLHELP (callid, calldate, dispatcherid)
values (310, to_date('23-08-1966', 'dd-mm-yyyy'), 850950414);
insert into CALLHELP (callid, calldate, dispatcherid)
values (311, to_date('19-04-1959', 'dd-mm-yyyy'), 799583810);
insert into CALLHELP (callid, calldate, dispatcherid)
values (312, to_date('04-10-2017', 'dd-mm-yyyy'), 646453183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (313, to_date('05-06-1979', 'dd-mm-yyyy'), 907807730);
insert into CALLHELP (callid, calldate, dispatcherid)
values (314, to_date('21-10-1964', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (315, to_date('13-12-2007', 'dd-mm-yyyy'), 249969746);
insert into CALLHELP (callid, calldate, dispatcherid)
values (316, to_date('07-03-1966', 'dd-mm-yyyy'), 704212385);
insert into CALLHELP (callid, calldate, dispatcherid)
values (317, to_date('19-06-1960', 'dd-mm-yyyy'), 116452197);
insert into CALLHELP (callid, calldate, dispatcherid)
values (318, to_date('03-04-1981', 'dd-mm-yyyy'), 858098492);
insert into CALLHELP (callid, calldate, dispatcherid)
values (319, to_date('20-10-2008', 'dd-mm-yyyy'), 116452197);
insert into CALLHELP (callid, calldate, dispatcherid)
values (320, to_date('29-03-2010', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (321, to_date('05-09-1980', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (322, to_date('19-11-2016', 'dd-mm-yyyy'), 965774744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (323, to_date('13-11-1973', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (324, to_date('04-11-1973', 'dd-mm-yyyy'), 315830523);
insert into CALLHELP (callid, calldate, dispatcherid)
values (325, to_date('09-10-2005', 'dd-mm-yyyy'), 814124117);
insert into CALLHELP (callid, calldate, dispatcherid)
values (326, to_date('21-08-1984', 'dd-mm-yyyy'), 104860473);
insert into CALLHELP (callid, calldate, dispatcherid)
values (327, to_date('25-03-1993', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (328, to_date('20-01-1950', 'dd-mm-yyyy'), 426330673);
insert into CALLHELP (callid, calldate, dispatcherid)
values (329, to_date('20-06-2007', 'dd-mm-yyyy'), 388876145);
insert into CALLHELP (callid, calldate, dispatcherid)
values (330, to_date('09-11-1992', 'dd-mm-yyyy'), 640480720);
insert into CALLHELP (callid, calldate, dispatcherid)
values (331, to_date('19-01-1975', 'dd-mm-yyyy'), 259605572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (332, to_date('15-09-1992', 'dd-mm-yyyy'), 907807730);
insert into CALLHELP (callid, calldate, dispatcherid)
values (333, to_date('24-09-1957', 'dd-mm-yyyy'), 933776135);
insert into CALLHELP (callid, calldate, dispatcherid)
values (334, to_date('22-02-1985', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (335, to_date('15-01-2002', 'dd-mm-yyyy'), 375359937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (336, to_date('07-07-1956', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (337, to_date('09-07-2007', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (338, to_date('22-09-1960', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (339, to_date('16-06-2008', 'dd-mm-yyyy'), 882974225);
insert into CALLHELP (callid, calldate, dispatcherid)
values (340, to_date('07-09-1989', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (341, to_date('03-01-1986', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (342, to_date('25-04-1983', 'dd-mm-yyyy'), 965774744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (343, to_date('30-07-2001', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (344, to_date('06-01-1951', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (345, to_date('29-04-1948', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (346, to_date('14-06-1978', 'dd-mm-yyyy'), 281175627);
insert into CALLHELP (callid, calldate, dispatcherid)
values (347, to_date('10-09-1963', 'dd-mm-yyyy'), 176774232);
insert into CALLHELP (callid, calldate, dispatcherid)
values (348, to_date('08-07-1983', 'dd-mm-yyyy'), 533618858);
insert into CALLHELP (callid, calldate, dispatcherid)
values (349, to_date('15-10-1971', 'dd-mm-yyyy'), 570675025);
insert into CALLHELP (callid, calldate, dispatcherid)
values (350, to_date('22-05-1967', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (351, to_date('28-07-2010', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (352, to_date('06-07-2012', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (353, to_date('18-08-1992', 'dd-mm-yyyy'), 817554939);
insert into CALLHELP (callid, calldate, dispatcherid)
values (354, to_date('06-06-2017', 'dd-mm-yyyy'), 244818870);
insert into CALLHELP (callid, calldate, dispatcherid)
values (355, to_date('25-06-2014', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (356, to_date('04-04-1968', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (357, to_date('03-04-1971', 'dd-mm-yyyy'), 817554939);
insert into CALLHELP (callid, calldate, dispatcherid)
values (358, to_date('19-10-1980', 'dd-mm-yyyy'), 704212385);
insert into CALLHELP (callid, calldate, dispatcherid)
values (359, to_date('20-08-1987', 'dd-mm-yyyy'), 926360339);
insert into CALLHELP (callid, calldate, dispatcherid)
values (360, to_date('15-01-2013', 'dd-mm-yyyy'), 695265116);
insert into CALLHELP (callid, calldate, dispatcherid)
values (361, to_date('09-12-1953', 'dd-mm-yyyy'), 528422726);
insert into CALLHELP (callid, calldate, dispatcherid)
values (362, to_date('02-01-1958', 'dd-mm-yyyy'), 884753922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (363, to_date('13-03-2002', 'dd-mm-yyyy'), 137968823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (364, to_date('15-10-1980', 'dd-mm-yyyy'), 807055203);
insert into CALLHELP (callid, calldate, dispatcherid)
values (365, to_date('07-02-1959', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (366, to_date('05-09-1973', 'dd-mm-yyyy'), 375359937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (367, to_date('04-10-2006', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (368, to_date('12-03-1973', 'dd-mm-yyyy'), 814124117);
insert into CALLHELP (callid, calldate, dispatcherid)
values (369, to_date('06-01-1976', 'dd-mm-yyyy'), 926360339);
insert into CALLHELP (callid, calldate, dispatcherid)
values (370, to_date('18-12-2016', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (371, to_date('02-05-1971', 'dd-mm-yyyy'), 426330673);
insert into CALLHELP (callid, calldate, dispatcherid)
values (372, to_date('22-04-1952', 'dd-mm-yyyy'), 799583810);
insert into CALLHELP (callid, calldate, dispatcherid)
values (373, to_date('15-01-2004', 'dd-mm-yyyy'), 271819575);
insert into CALLHELP (callid, calldate, dispatcherid)
values (374, to_date('09-05-2014', 'dd-mm-yyyy'), 301528474);
insert into CALLHELP (callid, calldate, dispatcherid)
values (375, to_date('27-10-2000', 'dd-mm-yyyy'), 224854323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (376, to_date('25-08-1985', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (377, to_date('15-05-1988', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (378, to_date('19-01-1951', 'dd-mm-yyyy'), 587382823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (379, to_date('07-01-1985', 'dd-mm-yyyy'), 181286799);
insert into CALLHELP (callid, calldate, dispatcherid)
values (380, to_date('30-10-1991', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (381, to_date('08-04-2012', 'dd-mm-yyyy'), 506241993);
insert into CALLHELP (callid, calldate, dispatcherid)
values (382, to_date('02-11-1996', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (383, to_date('30-01-2009', 'dd-mm-yyyy'), 181286799);
insert into CALLHELP (callid, calldate, dispatcherid)
values (384, to_date('23-08-1994', 'dd-mm-yyyy'), 587026468);
insert into CALLHELP (callid, calldate, dispatcherid)
values (385, to_date('15-10-1953', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (386, to_date('08-06-1988', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (387, to_date('09-07-2012', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (388, to_date('10-09-1949', 'dd-mm-yyyy'), 350254293);
insert into CALLHELP (callid, calldate, dispatcherid)
values (389, to_date('07-01-1975', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (390, to_date('09-05-1996', 'dd-mm-yyyy'), 280412141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (391, to_date('07-09-1992', 'dd-mm-yyyy'), 203687493);
insert into CALLHELP (callid, calldate, dispatcherid)
values (392, to_date('28-06-2007', 'dd-mm-yyyy'), 842065450);
insert into CALLHELP (callid, calldate, dispatcherid)
values (393, to_date('21-10-1971', 'dd-mm-yyyy'), 104860473);
insert into CALLHELP (callid, calldate, dispatcherid)
values (394, to_date('02-04-1960', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (395, to_date('26-09-1960', 'dd-mm-yyyy'), 354589284);
insert into CALLHELP (callid, calldate, dispatcherid)
values (396, to_date('22-01-1989', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (397, to_date('03-01-2000', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (398, to_date('23-10-1976', 'dd-mm-yyyy'), 609785028);
insert into CALLHELP (callid, calldate, dispatcherid)
values (399, to_date('25-02-2010', 'dd-mm-yyyy'), 540162175);
insert into CALLHELP (callid, calldate, dispatcherid)
values (400, to_date('25-01-2018', 'dd-mm-yyyy'), 506241993);
commit;
prompt 400 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (401, to_date('18-03-1950', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (402, to_date('26-01-2016', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (403, to_date('10-09-1993', 'dd-mm-yyyy'), 259605572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (404, to_date('30-05-2005', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (405, to_date('21-12-1982', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (406, to_date('24-04-2002', 'dd-mm-yyyy'), 388876145);
insert into CALLHELP (callid, calldate, dispatcherid)
values (407, to_date('22-11-1960', 'dd-mm-yyyy'), 116452197);
insert into CALLHELP (callid, calldate, dispatcherid)
values (408, to_date('02-05-2002', 'dd-mm-yyyy'), 638446497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (409, to_date('21-07-1996', 'dd-mm-yyyy'), 974180286);
insert into CALLHELP (callid, calldate, dispatcherid)
values (410, to_date('28-05-1971', 'dd-mm-yyyy'), 701434627);
insert into CALLHELP (callid, calldate, dispatcherid)
values (411, to_date('20-01-1988', 'dd-mm-yyyy'), 695265116);
insert into CALLHELP (callid, calldate, dispatcherid)
values (412, to_date('16-01-1982', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (413, to_date('26-02-1999', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (414, to_date('29-08-2016', 'dd-mm-yyyy'), 850950414);
insert into CALLHELP (callid, calldate, dispatcherid)
values (415, to_date('13-09-1976', 'dd-mm-yyyy'), 638446497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (416, to_date('22-10-1985', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (417, to_date('24-08-2017', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (418, to_date('20-03-1951', 'dd-mm-yyyy'), 135607013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (419, to_date('10-08-1996', 'dd-mm-yyyy'), 230513924);
insert into CALLHELP (callid, calldate, dispatcherid)
values (420, to_date('29-07-1985', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (421, to_date('22-10-1974', 'dd-mm-yyyy'), 183388113);
insert into CALLHELP (callid, calldate, dispatcherid)
values (422, to_date('09-11-1982', 'dd-mm-yyyy'), 575647393);
insert into CALLHELP (callid, calldate, dispatcherid)
values (423, to_date('31-03-1949', 'dd-mm-yyyy'), 732124306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (424, to_date('30-01-1967', 'dd-mm-yyyy'), 203687493);
insert into CALLHELP (callid, calldate, dispatcherid)
values (425, to_date('20-01-1967', 'dd-mm-yyyy'), 882974225);
insert into CALLHELP (callid, calldate, dispatcherid)
values (426, to_date('30-05-1953', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (427, to_date('16-10-1991', 'dd-mm-yyyy'), 609785028);
insert into CALLHELP (callid, calldate, dispatcherid)
values (428, to_date('13-06-2017', 'dd-mm-yyyy'), 782429762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (429, to_date('07-09-2006', 'dd-mm-yyyy'), 540162175);
insert into CALLHELP (callid, calldate, dispatcherid)
values (430, to_date('03-08-1950', 'dd-mm-yyyy'), 301528474);
insert into CALLHELP (callid, calldate, dispatcherid)
values (431, to_date('03-08-1993', 'dd-mm-yyyy'), 316665484);
insert into CALLHELP (callid, calldate, dispatcherid)
values (432, to_date('26-04-1985', 'dd-mm-yyyy'), 426330673);
insert into CALLHELP (callid, calldate, dispatcherid)
values (433, to_date('07-08-1948', 'dd-mm-yyyy'), 782429762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (434, to_date('06-05-1988', 'dd-mm-yyyy'), 965774744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (435, to_date('27-02-1969', 'dd-mm-yyyy'), 566353911);
insert into CALLHELP (callid, calldate, dispatcherid)
values (436, to_date('05-06-2009', 'dd-mm-yyyy'), 701434627);
insert into CALLHELP (callid, calldate, dispatcherid)
values (437, to_date('20-07-1961', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (438, to_date('30-09-1979', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (439, to_date('31-08-1975', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (440, to_date('02-10-1971', 'dd-mm-yyyy'), 307513185);
insert into CALLHELP (callid, calldate, dispatcherid)
values (441, to_date('13-11-1959', 'dd-mm-yyyy'), 570675025);
insert into CALLHELP (callid, calldate, dispatcherid)
values (442, to_date('26-04-2002', 'dd-mm-yyyy'), 974180286);
insert into CALLHELP (callid, calldate, dispatcherid)
values (443, to_date('27-11-1978', 'dd-mm-yyyy'), 506241993);
insert into CALLHELP (callid, calldate, dispatcherid)
values (444, to_date('02-02-1963', 'dd-mm-yyyy'), 558486949);
insert into CALLHELP (callid, calldate, dispatcherid)
values (445, to_date('07-09-2011', 'dd-mm-yyyy'), 718359114);
insert into CALLHELP (callid, calldate, dispatcherid)
values (446, to_date('29-11-1991', 'dd-mm-yyyy'), 564352234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (447, to_date('18-10-1975', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (448, to_date('09-03-1961', 'dd-mm-yyyy'), 183388113);
insert into CALLHELP (callid, calldate, dispatcherid)
values (449, to_date('11-09-1995', 'dd-mm-yyyy'), 307513185);
insert into CALLHELP (callid, calldate, dispatcherid)
values (450, to_date('24-01-2017', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (451, to_date('10-05-2013', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (452, to_date('03-05-2017', 'dd-mm-yyyy'), 426330673);
insert into CALLHELP (callid, calldate, dispatcherid)
values (453, to_date('13-05-2018', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (454, to_date('11-11-1981', 'dd-mm-yyyy'), 244818870);
insert into CALLHELP (callid, calldate, dispatcherid)
values (455, to_date('10-03-1960', 'dd-mm-yyyy'), 543717343);
insert into CALLHELP (callid, calldate, dispatcherid)
values (456, to_date('30-06-2015', 'dd-mm-yyyy'), 254746679);
insert into CALLHELP (callid, calldate, dispatcherid)
values (457, to_date('05-09-2007', 'dd-mm-yyyy'), 965774744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (458, to_date('13-04-1981', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (459, to_date('22-06-1966', 'dd-mm-yyyy'), 621340115);
insert into CALLHELP (callid, calldate, dispatcherid)
values (460, to_date('21-11-2011', 'dd-mm-yyyy'), 752603295);
insert into CALLHELP (callid, calldate, dispatcherid)
values (461, to_date('18-05-1995', 'dd-mm-yyyy'), 695265116);
insert into CALLHELP (callid, calldate, dispatcherid)
values (462, to_date('26-01-2013', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (463, to_date('07-06-1956', 'dd-mm-yyyy'), 558486949);
insert into CALLHELP (callid, calldate, dispatcherid)
values (464, to_date('14-02-2003', 'dd-mm-yyyy'), 135607013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (465, to_date('04-09-2007', 'dd-mm-yyyy'), 439634346);
insert into CALLHELP (callid, calldate, dispatcherid)
values (466, to_date('05-02-1982', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (467, to_date('06-05-1953', 'dd-mm-yyyy'), 564352234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (468, to_date('15-10-1986', 'dd-mm-yyyy'), 926360339);
insert into CALLHELP (callid, calldate, dispatcherid)
values (469, to_date('09-07-1996', 'dd-mm-yyyy'), 799010990);
insert into CALLHELP (callid, calldate, dispatcherid)
values (470, to_date('18-03-1997', 'dd-mm-yyyy'), 256855102);
insert into CALLHELP (callid, calldate, dispatcherid)
values (471, to_date('30-12-2012', 'dd-mm-yyyy'), 392516978);
insert into CALLHELP (callid, calldate, dispatcherid)
values (472, to_date('01-08-1954', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (473, to_date('20-04-1955', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (474, to_date('05-08-1952', 'dd-mm-yyyy'), 765542455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (475, to_date('11-09-1981', 'dd-mm-yyyy'), 817554939);
insert into CALLHELP (callid, calldate, dispatcherid)
values (476, to_date('25-11-1961', 'dd-mm-yyyy'), 564352234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (477, to_date('06-02-2003', 'dd-mm-yyyy'), 629649482);
insert into CALLHELP (callid, calldate, dispatcherid)
values (478, to_date('22-08-1977', 'dd-mm-yyyy'), 606650535);
insert into CALLHELP (callid, calldate, dispatcherid)
values (479, to_date('26-09-2014', 'dd-mm-yyyy'), 375359937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (480, to_date('17-12-1985', 'dd-mm-yyyy'), 896500443);
insert into CALLHELP (callid, calldate, dispatcherid)
values (481, to_date('03-06-2005', 'dd-mm-yyyy'), 446253243);
insert into CALLHELP (callid, calldate, dispatcherid)
values (482, to_date('19-04-1955', 'dd-mm-yyyy'), 439634346);
insert into CALLHELP (callid, calldate, dispatcherid)
values (483, to_date('21-05-1983', 'dd-mm-yyyy'), 307513185);
insert into CALLHELP (callid, calldate, dispatcherid)
values (484, to_date('27-05-2004', 'dd-mm-yyyy'), 695265116);
insert into CALLHELP (callid, calldate, dispatcherid)
values (485, to_date('06-06-1955', 'dd-mm-yyyy'), 135607013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (486, to_date('03-12-1980', 'dd-mm-yyyy'), 609785028);
insert into CALLHELP (callid, calldate, dispatcherid)
values (487, to_date('20-05-2002', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (488, to_date('30-05-2006', 'dd-mm-yyyy'), 640480720);
insert into CALLHELP (callid, calldate, dispatcherid)
values (489, to_date('02-09-1963', 'dd-mm-yyyy'), 606650535);
insert into CALLHELP (callid, calldate, dispatcherid)
values (490, to_date('02-09-1961', 'dd-mm-yyyy'), 251883743);
insert into CALLHELP (callid, calldate, dispatcherid)
values (491, to_date('26-11-1989', 'dd-mm-yyyy'), 254746679);
insert into CALLHELP (callid, calldate, dispatcherid)
values (492, to_date('21-04-2008', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (493, to_date('29-04-2000', 'dd-mm-yyyy'), 638446497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (494, to_date('24-04-2012', 'dd-mm-yyyy'), 629649482);
insert into CALLHELP (callid, calldate, dispatcherid)
values (495, to_date('22-01-1988', 'dd-mm-yyyy'), 858098492);
insert into CALLHELP (callid, calldate, dispatcherid)
values (496, to_date('29-08-2001', 'dd-mm-yyyy'), 438813407);
insert into CALLHELP (callid, calldate, dispatcherid)
values (497, to_date('06-12-1965', 'dd-mm-yyyy'), 978779321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (498, to_date('20-08-1991', 'dd-mm-yyyy'), 221845501);
insert into CALLHELP (callid, calldate, dispatcherid)
values (499, to_date('14-11-2019', 'dd-mm-yyyy'), 689213887);
insert into CALLHELP (callid, calldate, dispatcherid)
values (500, to_date('03-12-1977', 'dd-mm-yyyy'), 593421768);
commit;
prompt 500 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (501, to_date('14-08-2018', 'dd-mm-yyyy'), 933776135);
insert into CALLHELP (callid, calldate, dispatcherid)
values (502, to_date('06-04-1979', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (503, to_date('06-10-1986', 'dd-mm-yyyy'), 301528474);
insert into CALLHELP (callid, calldate, dispatcherid)
values (504, to_date('03-07-1957', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (505, to_date('06-11-2005', 'dd-mm-yyyy'), 783665095);
insert into CALLHELP (callid, calldate, dispatcherid)
values (506, to_date('16-01-1965', 'dd-mm-yyyy'), 506205888);
insert into CALLHELP (callid, calldate, dispatcherid)
values (507, to_date('18-07-1966', 'dd-mm-yyyy'), 301528474);
insert into CALLHELP (callid, calldate, dispatcherid)
values (508, to_date('28-05-1951', 'dd-mm-yyyy'), 301528474);
insert into CALLHELP (callid, calldate, dispatcherid)
values (509, to_date('23-08-2016', 'dd-mm-yyyy'), 807055203);
insert into CALLHELP (callid, calldate, dispatcherid)
values (510, to_date('28-11-1974', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (511, to_date('19-11-1975', 'dd-mm-yyyy'), 884753922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (512, to_date('23-04-1999', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (513, to_date('30-04-1966', 'dd-mm-yyyy'), 921040663);
insert into CALLHELP (callid, calldate, dispatcherid)
values (514, to_date('18-03-1985', 'dd-mm-yyyy'), 453085783);
insert into CALLHELP (callid, calldate, dispatcherid)
values (515, to_date('24-04-1989', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (516, to_date('17-03-1996', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (517, to_date('30-09-2013', 'dd-mm-yyyy'), 316665484);
insert into CALLHELP (callid, calldate, dispatcherid)
values (518, to_date('07-08-1985', 'dd-mm-yyyy'), 933776135);
insert into CALLHELP (callid, calldate, dispatcherid)
values (519, to_date('08-09-1998', 'dd-mm-yyyy'), 350254293);
insert into CALLHELP (callid, calldate, dispatcherid)
values (520, to_date('06-07-1955', 'dd-mm-yyyy'), 543717343);
insert into CALLHELP (callid, calldate, dispatcherid)
values (521, to_date('09-01-2011', 'dd-mm-yyyy'), 370717744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (522, to_date('19-05-1974', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (523, to_date('12-03-1969', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (524, to_date('17-08-1988', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (525, to_date('10-10-2001', 'dd-mm-yyyy'), 752603295);
insert into CALLHELP (callid, calldate, dispatcherid)
values (526, to_date('15-05-1958', 'dd-mm-yyyy'), 354589284);
insert into CALLHELP (callid, calldate, dispatcherid)
values (527, to_date('28-10-1979', 'dd-mm-yyyy'), 137968823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (528, to_date('10-02-2001', 'dd-mm-yyyy'), 842443489);
insert into CALLHELP (callid, calldate, dispatcherid)
values (529, to_date('10-11-1967', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (530, to_date('02-04-1957', 'dd-mm-yyyy'), 965774744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (531, to_date('08-05-1972', 'dd-mm-yyyy'), 792593323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (532, to_date('04-04-1969', 'dd-mm-yyyy'), 689213887);
insert into CALLHELP (callid, calldate, dispatcherid)
values (533, to_date('04-08-1976', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (534, to_date('13-06-2012', 'dd-mm-yyyy'), 183388113);
insert into CALLHELP (callid, calldate, dispatcherid)
values (535, to_date('28-10-1972', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (536, to_date('13-03-2005', 'dd-mm-yyyy'), 704212385);
insert into CALLHELP (callid, calldate, dispatcherid)
values (537, to_date('03-07-2008', 'dd-mm-yyyy'), 256855102);
insert into CALLHELP (callid, calldate, dispatcherid)
values (538, to_date('19-06-1984', 'dd-mm-yyyy'), 799583810);
insert into CALLHELP (callid, calldate, dispatcherid)
values (539, to_date('24-07-1993', 'dd-mm-yyyy'), 566353911);
insert into CALLHELP (callid, calldate, dispatcherid)
values (540, to_date('12-07-1994', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (541, to_date('24-07-1969', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (542, to_date('07-10-2002', 'dd-mm-yyyy'), 604239875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (543, to_date('11-08-1975', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (544, to_date('30-05-1958', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (545, to_date('25-11-1959', 'dd-mm-yyyy'), 775003956);
insert into CALLHELP (callid, calldate, dispatcherid)
values (546, to_date('10-02-1984', 'dd-mm-yyyy'), 422066354);
insert into CALLHELP (callid, calldate, dispatcherid)
values (547, to_date('02-10-1987', 'dd-mm-yyyy'), 388876145);
insert into CALLHELP (callid, calldate, dispatcherid)
values (548, to_date('08-03-1988', 'dd-mm-yyyy'), 254746679);
insert into CALLHELP (callid, calldate, dispatcherid)
values (549, to_date('22-01-2007', 'dd-mm-yyyy'), 388876145);
insert into CALLHELP (callid, calldate, dispatcherid)
values (550, to_date('11-06-2019', 'dd-mm-yyyy'), 104860473);
insert into CALLHELP (callid, calldate, dispatcherid)
values (551, to_date('22-12-1961', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (552, to_date('20-06-1968', 'dd-mm-yyyy'), 387721649);
insert into CALLHELP (callid, calldate, dispatcherid)
values (553, to_date('24-09-1983', 'dd-mm-yyyy'), 732124306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (554, to_date('20-03-1973', 'dd-mm-yyyy'), 221845501);
insert into CALLHELP (callid, calldate, dispatcherid)
values (555, to_date('20-06-1973', 'dd-mm-yyyy'), 225742953);
insert into CALLHELP (callid, calldate, dispatcherid)
values (556, to_date('14-10-1952', 'dd-mm-yyyy'), 842065450);
insert into CALLHELP (callid, calldate, dispatcherid)
values (557, to_date('20-12-1997', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (558, to_date('17-04-1951', 'dd-mm-yyyy'), 506241993);
insert into CALLHELP (callid, calldate, dispatcherid)
values (559, to_date('06-02-1985', 'dd-mm-yyyy'), 807055203);
insert into CALLHELP (callid, calldate, dispatcherid)
values (560, to_date('30-08-1967', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (561, to_date('13-12-1959', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (562, to_date('06-04-1981', 'dd-mm-yyyy'), 137968823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (563, to_date('27-05-1992', 'dd-mm-yyyy'), 718359114);
insert into CALLHELP (callid, calldate, dispatcherid)
values (564, to_date('24-03-1965', 'dd-mm-yyyy'), 765542455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (565, to_date('07-03-1981', 'dd-mm-yyyy'), 606650535);
insert into CALLHELP (callid, calldate, dispatcherid)
values (566, to_date('01-05-1985', 'dd-mm-yyyy'), 829531211);
insert into CALLHELP (callid, calldate, dispatcherid)
values (567, to_date('20-01-1993', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (568, to_date('05-05-1996', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (569, to_date('05-04-1950', 'dd-mm-yyyy'), 725530361);
insert into CALLHELP (callid, calldate, dispatcherid)
values (570, to_date('01-09-1973', 'dd-mm-yyyy'), 336547274);
insert into CALLHELP (callid, calldate, dispatcherid)
values (571, to_date('14-11-1996', 'dd-mm-yyyy'), 587026468);
insert into CALLHELP (callid, calldate, dispatcherid)
values (572, to_date('16-03-1956', 'dd-mm-yyyy'), 359849386);
insert into CALLHELP (callid, calldate, dispatcherid)
values (573, to_date('02-02-2013', 'dd-mm-yyyy'), 107574714);
insert into CALLHELP (callid, calldate, dispatcherid)
values (574, to_date('08-04-1954', 'dd-mm-yyyy'), 225742953);
insert into CALLHELP (callid, calldate, dispatcherid)
values (575, to_date('13-04-2004', 'dd-mm-yyyy'), 181286799);
insert into CALLHELP (callid, calldate, dispatcherid)
values (576, to_date('13-06-1982', 'dd-mm-yyyy'), 112802719);
insert into CALLHELP (callid, calldate, dispatcherid)
values (577, to_date('18-08-2013', 'dd-mm-yyyy'), 629649482);
insert into CALLHELP (callid, calldate, dispatcherid)
values (578, to_date('22-04-1991', 'dd-mm-yyyy'), 822031404);
insert into CALLHELP (callid, calldate, dispatcherid)
values (579, to_date('28-04-1953', 'dd-mm-yyyy'), 354589284);
insert into CALLHELP (callid, calldate, dispatcherid)
values (580, to_date('02-10-1993', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (581, to_date('09-02-1983', 'dd-mm-yyyy'), 540162175);
insert into CALLHELP (callid, calldate, dispatcherid)
values (582, to_date('02-01-1980', 'dd-mm-yyyy'), 323695688);
insert into CALLHELP (callid, calldate, dispatcherid)
values (583, to_date('10-02-1995', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (584, to_date('20-12-1952', 'dd-mm-yyyy'), 375359937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (585, to_date('12-10-1949', 'dd-mm-yyyy'), 318648963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (586, to_date('26-12-2001', 'dd-mm-yyyy'), 732124306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (587, to_date('03-11-2017', 'dd-mm-yyyy'), 799583810);
insert into CALLHELP (callid, calldate, dispatcherid)
values (588, to_date('18-09-1990', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (589, to_date('22-02-2005', 'dd-mm-yyyy'), 318648963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (590, to_date('19-02-1965', 'dd-mm-yyyy'), 575647393);
insert into CALLHELP (callid, calldate, dispatcherid)
values (591, to_date('05-04-2003', 'dd-mm-yyyy'), 203687493);
insert into CALLHELP (callid, calldate, dispatcherid)
values (592, to_date('25-06-1957', 'dd-mm-yyyy'), 921040663);
insert into CALLHELP (callid, calldate, dispatcherid)
values (593, to_date('10-09-1978', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (594, to_date('20-12-1967', 'dd-mm-yyyy'), 896500443);
insert into CALLHELP (callid, calldate, dispatcherid)
values (595, to_date('25-08-1991', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (596, to_date('03-04-1988', 'dd-mm-yyyy'), 176774232);
insert into CALLHELP (callid, calldate, dispatcherid)
values (597, to_date('15-02-2017', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (598, to_date('18-06-1948', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (599, to_date('26-04-2015', 'dd-mm-yyyy'), 183388113);
insert into CALLHELP (callid, calldate, dispatcherid)
values (600, to_date('15-08-1991', 'dd-mm-yyyy'), 570675025);
commit;
prompt 600 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (601, to_date('08-02-1980', 'dd-mm-yyyy'), 323695688);
insert into CALLHELP (callid, calldate, dispatcherid)
values (602, to_date('15-06-1985', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (603, to_date('02-08-2000', 'dd-mm-yyyy'), 965774744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (604, to_date('14-05-2007', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (605, to_date('23-06-1956', 'dd-mm-yyyy'), 315830523);
insert into CALLHELP (callid, calldate, dispatcherid)
values (606, to_date('21-06-1956', 'dd-mm-yyyy'), 426330673);
insert into CALLHELP (callid, calldate, dispatcherid)
values (607, to_date('07-04-1998', 'dd-mm-yyyy'), 112802719);
insert into CALLHELP (callid, calldate, dispatcherid)
values (608, to_date('06-08-1992', 'dd-mm-yyyy'), 249969746);
insert into CALLHELP (callid, calldate, dispatcherid)
values (609, to_date('04-01-1957', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (610, to_date('05-02-1992', 'dd-mm-yyyy'), 695265116);
insert into CALLHELP (callid, calldate, dispatcherid)
values (611, to_date('23-08-1950', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (612, to_date('08-05-1972', 'dd-mm-yyyy'), 439634346);
insert into CALLHELP (callid, calldate, dispatcherid)
values (613, to_date('21-08-2007', 'dd-mm-yyyy'), 842065450);
insert into CALLHELP (callid, calldate, dispatcherid)
values (614, to_date('04-11-1998', 'dd-mm-yyyy'), 315830523);
insert into CALLHELP (callid, calldate, dispatcherid)
values (615, to_date('19-12-2002', 'dd-mm-yyyy'), 543717343);
insert into CALLHELP (callid, calldate, dispatcherid)
values (616, to_date('10-09-1978', 'dd-mm-yyyy'), 817554939);
insert into CALLHELP (callid, calldate, dispatcherid)
values (617, to_date('03-03-1995', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (618, to_date('28-06-1978', 'dd-mm-yyyy'), 323695688);
insert into CALLHELP (callid, calldate, dispatcherid)
values (619, to_date('06-06-1991', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (620, to_date('04-05-1994', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (621, to_date('20-07-1985', 'dd-mm-yyyy'), 752603295);
insert into CALLHELP (callid, calldate, dispatcherid)
values (622, to_date('17-12-1991', 'dd-mm-yyyy'), 326146555);
insert into CALLHELP (callid, calldate, dispatcherid)
values (623, to_date('30-08-1979', 'dd-mm-yyyy'), 850950414);
insert into CALLHELP (callid, calldate, dispatcherid)
values (624, to_date('03-10-1972', 'dd-mm-yyyy'), 221845501);
insert into CALLHELP (callid, calldate, dispatcherid)
values (625, to_date('02-08-2006', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (626, to_date('03-09-1983', 'dd-mm-yyyy'), 783665095);
insert into CALLHELP (callid, calldate, dispatcherid)
values (627, to_date('12-09-1971', 'dd-mm-yyyy'), 426330673);
insert into CALLHELP (callid, calldate, dispatcherid)
values (628, to_date('11-10-2006', 'dd-mm-yyyy'), 566353911);
insert into CALLHELP (callid, calldate, dispatcherid)
values (629, to_date('04-03-2015', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (630, to_date('26-05-1970', 'dd-mm-yyyy'), 752603295);
insert into CALLHELP (callid, calldate, dispatcherid)
values (631, to_date('24-06-1953', 'dd-mm-yyyy'), 842443489);
insert into CALLHELP (callid, calldate, dispatcherid)
values (632, to_date('16-09-1997', 'dd-mm-yyyy'), 606650535);
insert into CALLHELP (callid, calldate, dispatcherid)
values (633, to_date('12-01-1977', 'dd-mm-yyyy'), 326146555);
insert into CALLHELP (callid, calldate, dispatcherid)
values (634, to_date('18-08-2018', 'dd-mm-yyyy'), 135607013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (635, to_date('29-10-1974', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (636, to_date('08-12-1976', 'dd-mm-yyyy'), 112802719);
insert into CALLHELP (callid, calldate, dispatcherid)
values (637, to_date('16-12-1986', 'dd-mm-yyyy'), 765542455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (638, to_date('05-06-2010', 'dd-mm-yyyy'), 926155825);
insert into CALLHELP (callid, calldate, dispatcherid)
values (639, to_date('05-12-1983', 'dd-mm-yyyy'), 196424839);
insert into CALLHELP (callid, calldate, dispatcherid)
values (640, to_date('16-01-2000', 'dd-mm-yyyy'), 884753922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (641, to_date('15-07-1997', 'dd-mm-yyyy'), 689213887);
insert into CALLHELP (callid, calldate, dispatcherid)
values (642, to_date('16-10-1989', 'dd-mm-yyyy'), 907807730);
insert into CALLHELP (callid, calldate, dispatcherid)
values (643, to_date('30-04-1990', 'dd-mm-yyyy'), 224854323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (644, to_date('27-05-1973', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (645, to_date('20-05-1948', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (646, to_date('06-07-2009', 'dd-mm-yyyy'), 689213887);
insert into CALLHELP (callid, calldate, dispatcherid)
values (647, to_date('26-05-1980', 'dd-mm-yyyy'), 528422726);
insert into CALLHELP (callid, calldate, dispatcherid)
values (648, to_date('25-04-1989', 'dd-mm-yyyy'), 799010990);
insert into CALLHELP (callid, calldate, dispatcherid)
values (649, to_date('19-11-2007', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (650, to_date('15-07-1982', 'dd-mm-yyyy'), 842443489);
insert into CALLHELP (callid, calldate, dispatcherid)
values (651, to_date('08-05-2017', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (652, to_date('03-08-2017', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (653, to_date('04-06-1991', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (654, to_date('25-10-1969', 'dd-mm-yyyy'), 829531211);
insert into CALLHELP (callid, calldate, dispatcherid)
values (655, to_date('04-09-1949', 'dd-mm-yyyy'), 387721649);
insert into CALLHELP (callid, calldate, dispatcherid)
values (656, to_date('30-08-1961', 'dd-mm-yyyy'), 558486949);
insert into CALLHELP (callid, calldate, dispatcherid)
values (657, to_date('12-02-1972', 'dd-mm-yyyy'), 884753922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (658, to_date('06-09-1968', 'dd-mm-yyyy'), 203687493);
insert into CALLHELP (callid, calldate, dispatcherid)
values (659, to_date('03-03-1952', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (660, to_date('22-03-2007', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (661, to_date('22-01-1996', 'dd-mm-yyyy'), 370717744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (662, to_date('10-09-1993', 'dd-mm-yyyy'), 858806514);
insert into CALLHELP (callid, calldate, dispatcherid)
values (663, to_date('29-05-1955', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (664, to_date('15-04-1967', 'dd-mm-yyyy'), 225742953);
insert into CALLHELP (callid, calldate, dispatcherid)
values (665, to_date('13-01-1982', 'dd-mm-yyyy'), 884753922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (666, to_date('30-12-2017', 'dd-mm-yyyy'), 104860473);
insert into CALLHELP (callid, calldate, dispatcherid)
values (667, to_date('15-09-1979', 'dd-mm-yyyy'), 783665095);
insert into CALLHELP (callid, calldate, dispatcherid)
values (668, to_date('06-11-1999', 'dd-mm-yyyy'), 558486949);
insert into CALLHELP (callid, calldate, dispatcherid)
values (669, to_date('12-10-1949', 'dd-mm-yyyy'), 392516978);
insert into CALLHELP (callid, calldate, dispatcherid)
values (670, to_date('12-03-1991', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (671, to_date('20-08-2005', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (672, to_date('16-12-1961', 'dd-mm-yyyy'), 701434627);
insert into CALLHELP (callid, calldate, dispatcherid)
values (673, to_date('12-09-2000', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (674, to_date('10-09-2005', 'dd-mm-yyyy'), 426330673);
insert into CALLHELP (callid, calldate, dispatcherid)
values (675, to_date('29-12-1956', 'dd-mm-yyyy'), 575647393);
insert into CALLHELP (callid, calldate, dispatcherid)
values (676, to_date('05-05-1992', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (677, to_date('04-02-1979', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (678, to_date('27-07-1963', 'dd-mm-yyyy'), 370717744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (679, to_date('15-04-2012', 'dd-mm-yyyy'), 783665095);
insert into CALLHELP (callid, calldate, dispatcherid)
values (680, to_date('09-07-2018', 'dd-mm-yyyy'), 858098492);
insert into CALLHELP (callid, calldate, dispatcherid)
values (681, to_date('03-12-1965', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (682, to_date('05-12-1967', 'dd-mm-yyyy'), 249969746);
insert into CALLHELP (callid, calldate, dispatcherid)
values (683, to_date('20-09-1948', 'dd-mm-yyyy'), 704212385);
insert into CALLHELP (callid, calldate, dispatcherid)
values (684, to_date('24-05-1988', 'dd-mm-yyyy'), 822031404);
insert into CALLHELP (callid, calldate, dispatcherid)
values (685, to_date('02-01-1949', 'dd-mm-yyyy'), 783665095);
insert into CALLHELP (callid, calldate, dispatcherid)
values (686, to_date('04-10-1998', 'dd-mm-yyyy'), 822031404);
insert into CALLHELP (callid, calldate, dispatcherid)
values (687, to_date('02-09-1966', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (688, to_date('20-05-1962', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (689, to_date('12-10-1965', 'dd-mm-yyyy'), 807055203);
insert into CALLHELP (callid, calldate, dispatcherid)
values (690, to_date('20-04-1953', 'dd-mm-yyyy'), 926360339);
insert into CALLHELP (callid, calldate, dispatcherid)
values (691, to_date('09-09-1970', 'dd-mm-yyyy'), 254746679);
insert into CALLHELP (callid, calldate, dispatcherid)
values (692, to_date('05-01-1994', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (693, to_date('12-07-1998', 'dd-mm-yyyy'), 621340115);
insert into CALLHELP (callid, calldate, dispatcherid)
values (694, to_date('24-11-1978', 'dd-mm-yyyy'), 315830523);
insert into CALLHELP (callid, calldate, dispatcherid)
values (695, to_date('20-12-1970', 'dd-mm-yyyy'), 422066354);
insert into CALLHELP (callid, calldate, dispatcherid)
values (696, to_date('13-01-2015', 'dd-mm-yyyy'), 315830523);
insert into CALLHELP (callid, calldate, dispatcherid)
values (697, to_date('08-02-1982', 'dd-mm-yyyy'), 222389506);
insert into CALLHELP (callid, calldate, dispatcherid)
values (698, to_date('12-05-2018', 'dd-mm-yyyy'), 629649482);
insert into CALLHELP (callid, calldate, dispatcherid)
values (699, to_date('06-05-1949', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (700, to_date('11-01-2013', 'dd-mm-yyyy'), 176774232);
commit;
prompt 700 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (701, to_date('09-03-1996', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (702, to_date('29-10-2007', 'dd-mm-yyyy'), 844295357);
insert into CALLHELP (callid, calldate, dispatcherid)
values (703, to_date('04-10-1981', 'dd-mm-yyyy'), 438813407);
insert into CALLHELP (callid, calldate, dispatcherid)
values (704, to_date('11-07-1997', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (705, to_date('27-12-1993', 'dd-mm-yyyy'), 807055203);
insert into CALLHELP (callid, calldate, dispatcherid)
values (706, to_date('08-02-2007', 'dd-mm-yyyy'), 203687493);
insert into CALLHELP (callid, calldate, dispatcherid)
values (707, to_date('06-04-1969', 'dd-mm-yyyy'), 842443489);
insert into CALLHELP (callid, calldate, dispatcherid)
values (708, to_date('07-08-1970', 'dd-mm-yyyy'), 336547274);
insert into CALLHELP (callid, calldate, dispatcherid)
values (709, to_date('06-07-2003', 'dd-mm-yyyy'), 506241993);
insert into CALLHELP (callid, calldate, dispatcherid)
values (710, to_date('25-07-1974', 'dd-mm-yyyy'), 439634346);
insert into CALLHELP (callid, calldate, dispatcherid)
values (711, to_date('30-06-1985', 'dd-mm-yyyy'), 646453183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (712, to_date('25-12-1973', 'dd-mm-yyyy'), 225742953);
insert into CALLHELP (callid, calldate, dispatcherid)
values (713, to_date('10-04-2009', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (714, to_date('20-06-1978', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (715, to_date('27-08-2016', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (716, to_date('07-09-1996', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (717, to_date('17-07-2018', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (718, to_date('03-11-1980', 'dd-mm-yyyy'), 807055203);
insert into CALLHELP (callid, calldate, dispatcherid)
values (719, to_date('05-01-1958', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (720, to_date('05-02-1959', 'dd-mm-yyyy'), 640480720);
insert into CALLHELP (callid, calldate, dispatcherid)
values (721, to_date('26-01-1952', 'dd-mm-yyyy'), 323695688);
insert into CALLHELP (callid, calldate, dispatcherid)
values (722, to_date('31-10-1985', 'dd-mm-yyyy'), 256855102);
insert into CALLHELP (callid, calldate, dispatcherid)
values (723, to_date('11-11-2010', 'dd-mm-yyyy'), 375359937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (724, to_date('02-08-1989', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (725, to_date('29-04-2007', 'dd-mm-yyyy'), 765542455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (726, to_date('28-07-1976', 'dd-mm-yyyy'), 640480720);
insert into CALLHELP (callid, calldate, dispatcherid)
values (727, to_date('13-01-1968', 'dd-mm-yyyy'), 587026468);
insert into CALLHELP (callid, calldate, dispatcherid)
values (728, to_date('19-08-1985', 'dd-mm-yyyy'), 438813407);
insert into CALLHELP (callid, calldate, dispatcherid)
values (729, to_date('27-03-1982', 'dd-mm-yyyy'), 387721649);
insert into CALLHELP (callid, calldate, dispatcherid)
values (730, to_date('12-07-2000', 'dd-mm-yyyy'), 587382823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (731, to_date('10-11-1979', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (732, to_date('01-06-1971', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (733, to_date('01-06-2007', 'dd-mm-yyyy'), 543717343);
insert into CALLHELP (callid, calldate, dispatcherid)
values (734, to_date('17-05-1971', 'dd-mm-yyyy'), 259605572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (735, to_date('30-08-1992', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (736, to_date('05-12-1955', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (737, to_date('24-11-1950', 'dd-mm-yyyy'), 281175627);
insert into CALLHELP (callid, calldate, dispatcherid)
values (738, to_date('02-05-1979', 'dd-mm-yyyy'), 316665484);
insert into CALLHELP (callid, calldate, dispatcherid)
values (739, to_date('01-10-2019', 'dd-mm-yyyy'), 621340115);
insert into CALLHELP (callid, calldate, dispatcherid)
values (740, to_date('07-08-2011', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (741, to_date('17-05-2015', 'dd-mm-yyyy'), 259605572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (742, to_date('20-01-1958', 'dd-mm-yyyy'), 388876145);
insert into CALLHELP (callid, calldate, dispatcherid)
values (743, to_date('19-11-1948', 'dd-mm-yyyy'), 884753922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (744, to_date('21-05-1997', 'dd-mm-yyyy'), 799583810);
insert into CALLHELP (callid, calldate, dispatcherid)
values (745, to_date('06-12-2007', 'dd-mm-yyyy'), 446253243);
insert into CALLHELP (callid, calldate, dispatcherid)
values (746, to_date('18-12-2003', 'dd-mm-yyyy'), 385229456);
insert into CALLHELP (callid, calldate, dispatcherid)
values (747, to_date('12-04-1966', 'dd-mm-yyyy'), 387721649);
insert into CALLHELP (callid, calldate, dispatcherid)
values (748, to_date('24-05-2006', 'dd-mm-yyyy'), 879708395);
insert into CALLHELP (callid, calldate, dispatcherid)
values (749, to_date('10-04-2018', 'dd-mm-yyyy'), 336547274);
insert into CALLHELP (callid, calldate, dispatcherid)
values (750, to_date('13-02-1980', 'dd-mm-yyyy'), 107574714);
insert into CALLHELP (callid, calldate, dispatcherid)
values (751, to_date('25-01-2013', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (752, to_date('24-12-1953', 'dd-mm-yyyy'), 254746679);
insert into CALLHELP (callid, calldate, dispatcherid)
values (753, to_date('22-06-1985', 'dd-mm-yyyy'), 907807730);
insert into CALLHELP (callid, calldate, dispatcherid)
values (754, to_date('01-08-1988', 'dd-mm-yyyy'), 718359114);
insert into CALLHELP (callid, calldate, dispatcherid)
values (755, to_date('25-04-2002', 'dd-mm-yyyy'), 446253243);
insert into CALLHELP (callid, calldate, dispatcherid)
values (756, to_date('16-05-1962', 'dd-mm-yyyy'), 137968823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (757, to_date('10-03-1953', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (758, to_date('08-04-1983', 'dd-mm-yyyy'), 829531211);
insert into CALLHELP (callid, calldate, dispatcherid)
values (759, to_date('19-06-2004', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (760, to_date('05-10-1957', 'dd-mm-yyyy'), 307513185);
insert into CALLHELP (callid, calldate, dispatcherid)
values (761, to_date('02-06-2005', 'dd-mm-yyyy'), 281175627);
insert into CALLHELP (callid, calldate, dispatcherid)
values (762, to_date('22-04-1963', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (763, to_date('13-05-1969', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (764, to_date('05-12-1991', 'dd-mm-yyyy'), 543717343);
insert into CALLHELP (callid, calldate, dispatcherid)
values (765, to_date('17-09-1954', 'dd-mm-yyyy'), 704212385);
insert into CALLHELP (callid, calldate, dispatcherid)
values (766, to_date('24-11-1954', 'dd-mm-yyyy'), 230513924);
insert into CALLHELP (callid, calldate, dispatcherid)
values (767, to_date('18-09-1992', 'dd-mm-yyyy'), 426330673);
insert into CALLHELP (callid, calldate, dispatcherid)
values (768, to_date('04-05-1992', 'dd-mm-yyyy'), 387721649);
insert into CALLHELP (callid, calldate, dispatcherid)
values (769, to_date('02-12-2006', 'dd-mm-yyyy'), 558486949);
insert into CALLHELP (callid, calldate, dispatcherid)
values (770, to_date('06-09-1997', 'dd-mm-yyyy'), 439634346);
insert into CALLHELP (callid, calldate, dispatcherid)
values (771, to_date('26-01-1975', 'dd-mm-yyyy'), 439634346);
insert into CALLHELP (callid, calldate, dispatcherid)
values (772, to_date('09-10-1948', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (773, to_date('05-06-1954', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (774, to_date('06-08-1991', 'dd-mm-yyyy'), 732124306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (775, to_date('30-04-1969', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (776, to_date('28-05-1960', 'dd-mm-yyyy'), 933776135);
insert into CALLHELP (callid, calldate, dispatcherid)
values (777, to_date('19-11-1993', 'dd-mm-yyyy'), 439634346);
insert into CALLHELP (callid, calldate, dispatcherid)
values (778, to_date('20-03-1980', 'dd-mm-yyyy'), 783665095);
insert into CALLHELP (callid, calldate, dispatcherid)
values (779, to_date('12-09-1992', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (780, to_date('12-06-1999', 'dd-mm-yyyy'), 638446497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (781, to_date('10-06-2000', 'dd-mm-yyyy'), 244818870);
insert into CALLHELP (callid, calldate, dispatcherid)
values (782, to_date('25-08-2006', 'dd-mm-yyyy'), 570675025);
insert into CALLHELP (callid, calldate, dispatcherid)
values (783, to_date('17-03-1951', 'dd-mm-yyyy'), 422066354);
insert into CALLHELP (callid, calldate, dispatcherid)
values (784, to_date('21-03-1967', 'dd-mm-yyyy'), 621340115);
insert into CALLHELP (callid, calldate, dispatcherid)
values (785, to_date('26-06-1994', 'dd-mm-yyyy'), 842065450);
insert into CALLHELP (callid, calldate, dispatcherid)
values (786, to_date('09-11-1973', 'dd-mm-yyyy'), 570675025);
insert into CALLHELP (callid, calldate, dispatcherid)
values (787, to_date('28-08-1964', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (788, to_date('18-10-1970', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (789, to_date('12-11-2000', 'dd-mm-yyyy'), 879708395);
insert into CALLHELP (callid, calldate, dispatcherid)
values (790, to_date('17-07-2013', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (791, to_date('19-02-2012', 'dd-mm-yyyy'), 896500443);
insert into CALLHELP (callid, calldate, dispatcherid)
values (792, to_date('05-02-1956', 'dd-mm-yyyy'), 921040663);
insert into CALLHELP (callid, calldate, dispatcherid)
values (793, to_date('23-08-1948', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (794, to_date('29-06-1995', 'dd-mm-yyyy'), 107574714);
insert into CALLHELP (callid, calldate, dispatcherid)
values (795, to_date('25-12-1977', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (796, to_date('02-07-1993', 'dd-mm-yyyy'), 638446497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (797, to_date('25-04-1971', 'dd-mm-yyyy'), 879708395);
insert into CALLHELP (callid, calldate, dispatcherid)
values (798, to_date('12-06-1977', 'dd-mm-yyyy'), 926155825);
insert into CALLHELP (callid, calldate, dispatcherid)
values (799, to_date('13-04-1954', 'dd-mm-yyyy'), 799010990);
insert into CALLHELP (callid, calldate, dispatcherid)
values (800, to_date('12-12-1991', 'dd-mm-yyyy'), 872649579);
commit;
prompt 800 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (801, to_date('19-07-1955', 'dd-mm-yyyy'), 775003956);
insert into CALLHELP (callid, calldate, dispatcherid)
values (802, to_date('17-06-2011', 'dd-mm-yyyy'), 689213887);
insert into CALLHELP (callid, calldate, dispatcherid)
values (803, to_date('04-11-2007', 'dd-mm-yyyy'), 116452197);
insert into CALLHELP (callid, calldate, dispatcherid)
values (804, to_date('21-07-1993', 'dd-mm-yyyy'), 446253243);
insert into CALLHELP (callid, calldate, dispatcherid)
values (805, to_date('31-05-1994', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (806, to_date('27-09-1954', 'dd-mm-yyyy'), 907807730);
insert into CALLHELP (callid, calldate, dispatcherid)
values (807, to_date('09-09-1987', 'dd-mm-yyyy'), 271819575);
insert into CALLHELP (callid, calldate, dispatcherid)
values (808, to_date('23-09-1968', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (809, to_date('17-02-2017', 'dd-mm-yyyy'), 392516978);
insert into CALLHELP (callid, calldate, dispatcherid)
values (810, to_date('14-01-2005', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (811, to_date('15-01-1949', 'dd-mm-yyyy'), 221845501);
insert into CALLHELP (callid, calldate, dispatcherid)
values (812, to_date('09-10-1975', 'dd-mm-yyyy'), 543717343);
insert into CALLHELP (callid, calldate, dispatcherid)
values (813, to_date('17-04-1963', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (814, to_date('26-06-2016', 'dd-mm-yyyy'), 817554939);
insert into CALLHELP (callid, calldate, dispatcherid)
values (815, to_date('17-10-1969', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (816, to_date('26-12-1964', 'dd-mm-yyyy'), 638446497);
insert into CALLHELP (callid, calldate, dispatcherid)
values (817, to_date('06-08-1997', 'dd-mm-yyyy'), 732124306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (818, to_date('17-12-1971', 'dd-mm-yyyy'), 316665484);
insert into CALLHELP (callid, calldate, dispatcherid)
values (819, to_date('07-07-2007', 'dd-mm-yyyy'), 354589284);
insert into CALLHELP (callid, calldate, dispatcherid)
values (820, to_date('16-04-2019', 'dd-mm-yyyy'), 280412141);
insert into CALLHELP (callid, calldate, dispatcherid)
values (821, to_date('04-02-1973', 'dd-mm-yyyy'), 359849386);
insert into CALLHELP (callid, calldate, dispatcherid)
values (822, to_date('12-12-1955', 'dd-mm-yyyy'), 921040663);
insert into CALLHELP (callid, calldate, dispatcherid)
values (823, to_date('27-11-2012', 'dd-mm-yyyy'), 181286799);
insert into CALLHELP (callid, calldate, dispatcherid)
values (824, to_date('29-04-1951', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (825, to_date('27-11-2014', 'dd-mm-yyyy'), 271819575);
insert into CALLHELP (callid, calldate, dispatcherid)
values (826, to_date('23-11-1987', 'dd-mm-yyyy'), 782429762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (827, to_date('29-10-2011', 'dd-mm-yyyy'), 256855102);
insert into CALLHELP (callid, calldate, dispatcherid)
values (828, to_date('23-01-1985', 'dd-mm-yyyy'), 604239875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (829, to_date('20-06-1992', 'dd-mm-yyyy'), 271819575);
insert into CALLHELP (callid, calldate, dispatcherid)
values (830, to_date('30-01-2004', 'dd-mm-yyyy'), 137968823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (831, to_date('24-09-2011', 'dd-mm-yyyy'), 621340115);
insert into CALLHELP (callid, calldate, dispatcherid)
values (832, to_date('03-12-2001', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (833, to_date('08-04-1968', 'dd-mm-yyyy'), 176774232);
insert into CALLHELP (callid, calldate, dispatcherid)
values (834, to_date('18-12-1987', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (835, to_date('06-09-1948', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (836, to_date('15-05-2015', 'dd-mm-yyyy'), 978779321);
insert into CALLHELP (callid, calldate, dispatcherid)
values (837, to_date('26-01-1967', 'dd-mm-yyyy'), 446253243);
insert into CALLHELP (callid, calldate, dispatcherid)
values (838, to_date('16-01-1961', 'dd-mm-yyyy'), 926155825);
insert into CALLHELP (callid, calldate, dispatcherid)
values (839, to_date('02-11-1962', 'dd-mm-yyyy'), 354589284);
insert into CALLHELP (callid, calldate, dispatcherid)
values (840, to_date('11-01-2002', 'dd-mm-yyyy'), 842443489);
insert into CALLHELP (callid, calldate, dispatcherid)
values (841, to_date('28-08-2001', 'dd-mm-yyyy'), 301528474);
insert into CALLHELP (callid, calldate, dispatcherid)
values (842, to_date('24-03-1978', 'dd-mm-yyyy'), 850950414);
insert into CALLHELP (callid, calldate, dispatcherid)
values (843, to_date('02-06-1994', 'dd-mm-yyyy'), 315830523);
insert into CALLHELP (callid, calldate, dispatcherid)
values (844, to_date('20-04-1953', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (845, to_date('23-01-1995', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (846, to_date('06-09-1983', 'dd-mm-yyyy'), 259605572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (847, to_date('13-03-1996', 'dd-mm-yyyy'), 244818870);
insert into CALLHELP (callid, calldate, dispatcherid)
values (848, to_date('19-06-2003', 'dd-mm-yyyy'), 814124117);
insert into CALLHELP (callid, calldate, dispatcherid)
values (849, to_date('22-04-1959', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (850, to_date('12-03-1959', 'dd-mm-yyyy'), 842065450);
insert into CALLHELP (callid, calldate, dispatcherid)
values (851, to_date('30-06-1970', 'dd-mm-yyyy'), 882974225);
insert into CALLHELP (callid, calldate, dispatcherid)
values (852, to_date('13-04-1986', 'dd-mm-yyyy'), 829531211);
insert into CALLHELP (callid, calldate, dispatcherid)
values (853, to_date('14-08-1998', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (854, to_date('13-01-2005', 'dd-mm-yyyy'), 315830523);
insert into CALLHELP (callid, calldate, dispatcherid)
values (855, to_date('26-08-1974', 'dd-mm-yyyy'), 695265116);
insert into CALLHELP (callid, calldate, dispatcherid)
values (856, to_date('13-02-2004', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (857, to_date('13-03-1993', 'dd-mm-yyyy'), 203687493);
insert into CALLHELP (callid, calldate, dispatcherid)
values (858, to_date('27-04-1993', 'dd-mm-yyyy'), 256855102);
insert into CALLHELP (callid, calldate, dispatcherid)
values (859, to_date('06-01-1951', 'dd-mm-yyyy'), 926831963);
insert into CALLHELP (callid, calldate, dispatcherid)
values (860, to_date('18-07-1993', 'dd-mm-yyyy'), 116452197);
insert into CALLHELP (callid, calldate, dispatcherid)
values (861, to_date('02-06-1971', 'dd-mm-yyyy'), 689213887);
insert into CALLHELP (callid, calldate, dispatcherid)
values (862, to_date('07-11-2017', 'dd-mm-yyyy'), 294766103);
insert into CALLHELP (callid, calldate, dispatcherid)
values (863, to_date('05-06-1957', 'dd-mm-yyyy'), 354589284);
insert into CALLHELP (callid, calldate, dispatcherid)
values (864, to_date('13-06-2015', 'dd-mm-yyyy'), 646453183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (865, to_date('31-07-2018', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (866, to_date('02-07-1984', 'dd-mm-yyyy'), 116452197);
insert into CALLHELP (callid, calldate, dispatcherid)
values (867, to_date('18-03-2006', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (868, to_date('24-08-1973', 'dd-mm-yyyy'), 176774232);
insert into CALLHELP (callid, calldate, dispatcherid)
values (869, to_date('22-02-2010', 'dd-mm-yyyy'), 652554824);
insert into CALLHELP (callid, calldate, dispatcherid)
values (870, to_date('22-01-1998', 'dd-mm-yyyy'), 907807730);
insert into CALLHELP (callid, calldate, dispatcherid)
values (871, to_date('23-08-2015', 'dd-mm-yyyy'), 192929550);
insert into CALLHELP (callid, calldate, dispatcherid)
values (872, to_date('27-12-1985', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (873, to_date('17-06-1961', 'dd-mm-yyyy'), 817554939);
insert into CALLHELP (callid, calldate, dispatcherid)
values (874, to_date('03-08-1961', 'dd-mm-yyyy'), 824940431);
insert into CALLHELP (callid, calldate, dispatcherid)
values (875, to_date('12-12-2017', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (876, to_date('20-12-1967', 'dd-mm-yyyy'), 558486949);
insert into CALLHELP (callid, calldate, dispatcherid)
values (877, to_date('30-12-1985', 'dd-mm-yyyy'), 752603295);
insert into CALLHELP (callid, calldate, dispatcherid)
values (878, to_date('16-04-1972', 'dd-mm-yyyy'), 575647393);
insert into CALLHELP (callid, calldate, dispatcherid)
values (879, to_date('13-10-1975', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (880, to_date('01-11-2012', 'dd-mm-yyyy'), 392516978);
insert into CALLHELP (callid, calldate, dispatcherid)
values (881, to_date('04-02-2006', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (882, to_date('12-11-2001', 'dd-mm-yyyy'), 222389506);
insert into CALLHELP (callid, calldate, dispatcherid)
values (883, to_date('22-03-1999', 'dd-mm-yyyy'), 335052588);
insert into CALLHELP (callid, calldate, dispatcherid)
values (884, to_date('15-03-1984', 'dd-mm-yyyy'), 221845501);
insert into CALLHELP (callid, calldate, dispatcherid)
values (885, to_date('06-03-2008', 'dd-mm-yyyy'), 259605572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (886, to_date('15-05-2013', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (887, to_date('26-03-1955', 'dd-mm-yyyy'), 695265116);
insert into CALLHELP (callid, calldate, dispatcherid)
values (888, to_date('28-02-1977', 'dd-mm-yyyy'), 587026468);
insert into CALLHELP (callid, calldate, dispatcherid)
values (889, to_date('05-07-1978', 'dd-mm-yyyy'), 621340115);
insert into CALLHELP (callid, calldate, dispatcherid)
values (890, to_date('27-07-2010', 'dd-mm-yyyy'), 752603295);
insert into CALLHELP (callid, calldate, dispatcherid)
values (891, to_date('31-08-1981', 'dd-mm-yyyy'), 822031404);
insert into CALLHELP (callid, calldate, dispatcherid)
values (892, to_date('16-11-1991', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (893, to_date('26-05-1951', 'dd-mm-yyyy'), 899832305);
insert into CALLHELP (callid, calldate, dispatcherid)
values (894, to_date('25-10-2019', 'dd-mm-yyyy'), 224854323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (895, to_date('28-09-1961', 'dd-mm-yyyy'), 221845501);
insert into CALLHELP (callid, calldate, dispatcherid)
values (896, to_date('16-09-1971', 'dd-mm-yyyy'), 882974225);
insert into CALLHELP (callid, calldate, dispatcherid)
values (897, to_date('21-12-1953', 'dd-mm-yyyy'), 370717744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (898, to_date('19-05-2004', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (899, to_date('15-01-1975', 'dd-mm-yyyy'), 235298895);
insert into CALLHELP (callid, calldate, dispatcherid)
values (900, to_date('26-10-1989', 'dd-mm-yyyy'), 609785028);
commit;
prompt 900 records committed...
insert into CALLHELP (callid, calldate, dispatcherid)
values (901, to_date('18-05-1991', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (902, to_date('07-05-1999', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (903, to_date('18-12-1996', 'dd-mm-yyyy'), 558486949);
insert into CALLHELP (callid, calldate, dispatcherid)
values (904, to_date('14-04-2008', 'dd-mm-yyyy'), 879708395);
insert into CALLHELP (callid, calldate, dispatcherid)
values (905, to_date('11-07-2000', 'dd-mm-yyyy'), 107574714);
insert into CALLHELP (callid, calldate, dispatcherid)
values (906, to_date('05-12-1962', 'dd-mm-yyyy'), 664144723);
insert into CALLHELP (callid, calldate, dispatcherid)
values (907, to_date('30-09-1998', 'dd-mm-yyyy'), 181286799);
insert into CALLHELP (callid, calldate, dispatcherid)
values (908, to_date('11-09-2001', 'dd-mm-yyyy'), 528422726);
insert into CALLHELP (callid, calldate, dispatcherid)
values (909, to_date('04-05-1988', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (910, to_date('15-05-1992', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (911, to_date('02-12-2015', 'dd-mm-yyyy'), 135607013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (912, to_date('11-04-2013', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (913, to_date('18-06-1994', 'dd-mm-yyyy'), 782429762);
insert into CALLHELP (callid, calldate, dispatcherid)
values (914, to_date('12-04-1968', 'dd-mm-yyyy'), 564352234);
insert into CALLHELP (callid, calldate, dispatcherid)
values (915, to_date('23-04-1969', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (916, to_date('26-06-1999', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (917, to_date('09-07-1950', 'dd-mm-yyyy'), 926155825);
insert into CALLHELP (callid, calldate, dispatcherid)
values (918, to_date('01-07-1995', 'dd-mm-yyyy'), 641986332);
insert into CALLHELP (callid, calldate, dispatcherid)
values (919, to_date('07-07-1958', 'dd-mm-yyyy'), 792593323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (920, to_date('18-02-1967', 'dd-mm-yyyy'), 293770073);
insert into CALLHELP (callid, calldate, dispatcherid)
values (921, to_date('31-10-2011', 'dd-mm-yyyy'), 587382823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (922, to_date('14-06-1984', 'dd-mm-yyyy'), 301528474);
insert into CALLHELP (callid, calldate, dispatcherid)
values (923, to_date('22-11-2019', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (924, to_date('26-12-1970', 'dd-mm-yyyy'), 765542455);
insert into CALLHELP (callid, calldate, dispatcherid)
values (925, to_date('29-08-1993', 'dd-mm-yyyy'), 732124306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (926, to_date('09-01-1957', 'dd-mm-yyyy'), 792593323);
insert into CALLHELP (callid, calldate, dispatcherid)
values (927, to_date('15-01-1997', 'dd-mm-yyyy'), 438813407);
insert into CALLHELP (callid, calldate, dispatcherid)
values (928, to_date('16-11-1971', 'dd-mm-yyyy'), 426330673);
insert into CALLHELP (callid, calldate, dispatcherid)
values (929, to_date('10-12-1999', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (930, to_date('27-11-1996', 'dd-mm-yyyy'), 721900875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (931, to_date('16-10-1955', 'dd-mm-yyyy'), 921040663);
insert into CALLHELP (callid, calldate, dispatcherid)
values (932, to_date('26-04-1987', 'dd-mm-yyyy'), 388876145);
insert into CALLHELP (callid, calldate, dispatcherid)
values (933, to_date('05-07-2012', 'dd-mm-yyyy'), 570675025);
insert into CALLHELP (callid, calldate, dispatcherid)
values (934, to_date('14-06-1988', 'dd-mm-yyyy'), 842065450);
insert into CALLHELP (callid, calldate, dispatcherid)
values (935, to_date('05-09-1991', 'dd-mm-yyyy'), 921040663);
insert into CALLHELP (callid, calldate, dispatcherid)
values (936, to_date('07-08-1958', 'dd-mm-yyyy'), 340163676);
insert into CALLHELP (callid, calldate, dispatcherid)
values (937, to_date('08-11-1952', 'dd-mm-yyyy'), 781552572);
insert into CALLHELP (callid, calldate, dispatcherid)
values (938, to_date('20-01-2008', 'dd-mm-yyyy'), 375359937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (939, to_date('06-12-2005', 'dd-mm-yyyy'), 203687493);
insert into CALLHELP (callid, calldate, dispatcherid)
values (940, to_date('02-06-1982', 'dd-mm-yyyy'), 639408278);
insert into CALLHELP (callid, calldate, dispatcherid)
values (941, to_date('30-04-2000', 'dd-mm-yyyy'), 137968823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (942, to_date('22-12-1999', 'dd-mm-yyyy'), 606650535);
insert into CALLHELP (callid, calldate, dispatcherid)
values (943, to_date('21-12-1953', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (944, to_date('19-12-1970', 'dd-mm-yyyy'), 965774744);
insert into CALLHELP (callid, calldate, dispatcherid)
values (945, to_date('25-11-2014', 'dd-mm-yyyy'), 422066354);
insert into CALLHELP (callid, calldate, dispatcherid)
values (946, to_date('27-09-1960', 'dd-mm-yyyy'), 137968823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (947, to_date('18-05-1990', 'dd-mm-yyyy'), 872649579);
insert into CALLHELP (callid, calldate, dispatcherid)
values (948, to_date('21-07-1964', 'dd-mm-yyyy'), 855275039);
insert into CALLHELP (callid, calldate, dispatcherid)
values (949, to_date('19-05-2008', 'dd-mm-yyyy'), 446253243);
insert into CALLHELP (callid, calldate, dispatcherid)
values (950, to_date('22-12-1983', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (951, to_date('16-05-2006', 'dd-mm-yyyy'), 926155825);
insert into CALLHELP (callid, calldate, dispatcherid)
values (952, to_date('16-09-2016', 'dd-mm-yyyy'), 674951299);
insert into CALLHELP (callid, calldate, dispatcherid)
values (953, to_date('28-02-2008', 'dd-mm-yyyy'), 604239875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (954, to_date('07-10-1949', 'dd-mm-yyyy'), 933776135);
insert into CALLHELP (callid, calldate, dispatcherid)
values (955, to_date('26-10-1999', 'dd-mm-yyyy'), 402498328);
insert into CALLHELP (callid, calldate, dispatcherid)
values (956, to_date('20-10-2011', 'dd-mm-yyyy'), 884753922);
insert into CALLHELP (callid, calldate, dispatcherid)
values (957, to_date('10-06-1961', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (958, to_date('15-07-2010', 'dd-mm-yyyy'), 704212385);
insert into CALLHELP (callid, calldate, dispatcherid)
values (959, to_date('10-09-1981', 'dd-mm-yyyy'), 453085783);
insert into CALLHELP (callid, calldate, dispatcherid)
values (960, to_date('18-02-1991', 'dd-mm-yyyy'), 254746679);
insert into CALLHELP (callid, calldate, dispatcherid)
values (961, to_date('21-12-1967', 'dd-mm-yyyy'), 392516978);
insert into CALLHELP (callid, calldate, dispatcherid)
values (962, to_date('19-05-2001', 'dd-mm-yyyy'), 699369790);
insert into CALLHELP (callid, calldate, dispatcherid)
values (963, to_date('29-01-1995', 'dd-mm-yyyy'), 183388113);
insert into CALLHELP (callid, calldate, dispatcherid)
values (964, to_date('26-07-1979', 'dd-mm-yyyy'), 135607013);
insert into CALLHELP (callid, calldate, dispatcherid)
values (965, to_date('15-04-1977', 'dd-mm-yyyy'), 566353911);
insert into CALLHELP (callid, calldate, dispatcherid)
values (966, to_date('09-12-2006', 'dd-mm-yyyy'), 842443489);
insert into CALLHELP (callid, calldate, dispatcherid)
values (967, to_date('23-08-1958', 'dd-mm-yyyy'), 570675025);
insert into CALLHELP (callid, calldate, dispatcherid)
values (968, to_date('11-08-1960', 'dd-mm-yyyy'), 593421768);
insert into CALLHELP (callid, calldate, dispatcherid)
values (969, to_date('07-06-1958', 'dd-mm-yyyy'), 528422726);
insert into CALLHELP (callid, calldate, dispatcherid)
values (970, to_date('05-10-1996', 'dd-mm-yyyy'), 646453183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (971, to_date('16-08-1982', 'dd-mm-yyyy'), 506205888);
insert into CALLHELP (callid, calldate, dispatcherid)
values (972, to_date('24-01-2000', 'dd-mm-yyyy'), 981597035);
insert into CALLHELP (callid, calldate, dispatcherid)
values (973, to_date('18-03-1966', 'dd-mm-yyyy'), 230513924);
insert into CALLHELP (callid, calldate, dispatcherid)
values (974, to_date('26-02-1969', 'dd-mm-yyyy'), 921040663);
insert into CALLHELP (callid, calldate, dispatcherid)
values (975, to_date('24-04-2005', 'dd-mm-yyyy'), 499031759);
insert into CALLHELP (callid, calldate, dispatcherid)
values (976, to_date('01-02-2014', 'dd-mm-yyyy'), 775003956);
insert into CALLHELP (callid, calldate, dispatcherid)
values (977, to_date('25-11-1959', 'dd-mm-yyyy'), 587026468);
insert into CALLHELP (callid, calldate, dispatcherid)
values (978, to_date('21-07-1955', 'dd-mm-yyyy'), 718359114);
insert into CALLHELP (callid, calldate, dispatcherid)
values (979, to_date('15-01-1974', 'dd-mm-yyyy'), 732124306);
insert into CALLHELP (callid, calldate, dispatcherid)
values (980, to_date('03-11-1973', 'dd-mm-yyyy'), 822031404);
insert into CALLHELP (callid, calldate, dispatcherid)
values (981, to_date('04-07-1950', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (982, to_date('10-05-1957', 'dd-mm-yyyy'), 190928615);
insert into CALLHELP (callid, calldate, dispatcherid)
values (983, to_date('31-08-1994', 'dd-mm-yyyy'), 896500443);
insert into CALLHELP (callid, calldate, dispatcherid)
values (984, to_date('30-07-1970', 'dd-mm-yyyy'), 388876145);
insert into CALLHELP (callid, calldate, dispatcherid)
values (985, to_date('26-06-1972', 'dd-mm-yyyy'), 350254293);
insert into CALLHELP (callid, calldate, dispatcherid)
values (986, to_date('29-04-1959', 'dd-mm-yyyy'), 842065450);
insert into CALLHELP (callid, calldate, dispatcherid)
values (987, to_date('21-07-2017', 'dd-mm-yyyy'), 601145118);
insert into CALLHELP (callid, calldate, dispatcherid)
values (988, to_date('04-04-1997', 'dd-mm-yyyy'), 704212385);
insert into CALLHELP (callid, calldate, dispatcherid)
values (989, to_date('25-12-1951', 'dd-mm-yyyy'), 695265116);
insert into CALLHELP (callid, calldate, dispatcherid)
values (990, to_date('28-05-2019', 'dd-mm-yyyy'), 621340115);
insert into CALLHELP (callid, calldate, dispatcherid)
values (991, to_date('23-01-1996', 'dd-mm-yyyy'), 640480720);
insert into CALLHELP (callid, calldate, dispatcherid)
values (992, to_date('30-08-1950', 'dd-mm-yyyy'), 646453183);
insert into CALLHELP (callid, calldate, dispatcherid)
values (993, to_date('24-07-1975', 'dd-mm-yyyy'), 587382823);
insert into CALLHELP (callid, calldate, dispatcherid)
values (994, to_date('08-02-2003', 'dd-mm-yyyy'), 404274655);
insert into CALLHELP (callid, calldate, dispatcherid)
values (995, to_date('10-07-2013', 'dd-mm-yyyy'), 858806514);
insert into CALLHELP (callid, calldate, dispatcherid)
values (996, to_date('30-12-1997', 'dd-mm-yyyy'), 126597937);
insert into CALLHELP (callid, calldate, dispatcherid)
values (997, to_date('13-06-1951', 'dd-mm-yyyy'), 604239875);
insert into CALLHELP (callid, calldate, dispatcherid)
values (998, to_date('11-05-1970', 'dd-mm-yyyy'), 783665095);
insert into CALLHELP (callid, calldate, dispatcherid)
values (999, to_date('25-09-2018', 'dd-mm-yyyy'), 336547274);
insert into CALLHELP (callid, calldate, dispatcherid)
values (1000, to_date('01-01-2012', 'dd-mm-yyyy'), 301528474);
commit;
prompt 1000 records loaded
prompt Loading DRIVER...
insert into DRIVER (driverid)
values (908089234);
insert into DRIVER (driverid)
values (443429683);
insert into DRIVER (driverid)
values (488848745);
insert into DRIVER (driverid)
values (692033847);
insert into DRIVER (driverid)
values (464254148);
insert into DRIVER (driverid)
values (872263306);
insert into DRIVER (driverid)
values (717029668);
insert into DRIVER (driverid)
values (747675635);
insert into DRIVER (driverid)
values (181904208);
insert into DRIVER (driverid)
values (167740156);
insert into DRIVER (driverid)
values (767340288);
insert into DRIVER (driverid)
values (444383652);
insert into DRIVER (driverid)
values (338863696);
insert into DRIVER (driverid)
values (403572395);
insert into DRIVER (driverid)
values (973586654);
insert into DRIVER (driverid)
values (153284087);
insert into DRIVER (driverid)
values (206068476);
insert into DRIVER (driverid)
values (859486697);
insert into DRIVER (driverid)
values (700503030);
insert into DRIVER (driverid)
values (636779895);
insert into DRIVER (driverid)
values (803965269);
insert into DRIVER (driverid)
values (710362941);
insert into DRIVER (driverid)
values (877579988);
insert into DRIVER (driverid)
values (325751247);
insert into DRIVER (driverid)
values (362030908);
insert into DRIVER (driverid)
values (395587864);
insert into DRIVER (driverid)
values (754357861);
insert into DRIVER (driverid)
values (130019706);
insert into DRIVER (driverid)
values (662127500);
insert into DRIVER (driverid)
values (775965942);
insert into DRIVER (driverid)
values (543717343);
insert into DRIVER (driverid)
values (621340115);
insert into DRIVER (driverid)
values (860455901);
insert into DRIVER (driverid)
values (887348713);
insert into DRIVER (driverid)
values (734777659);
insert into DRIVER (driverid)
values (274719284);
insert into DRIVER (driverid)
values (917310078);
insert into DRIVER (driverid)
values (239898165);
insert into DRIVER (driverid)
values (579875385);
insert into DRIVER (driverid)
values (562992520);
insert into DRIVER (driverid)
values (192929550);
insert into DRIVER (driverid)
values (769449049);
insert into DRIVER (driverid)
values (705182536);
insert into DRIVER (driverid)
values (906997862);
insert into DRIVER (driverid)
values (453472980);
insert into DRIVER (driverid)
values (957206959);
insert into DRIVER (driverid)
values (898173826);
insert into DRIVER (driverid)
values (211857699);
insert into DRIVER (driverid)
values (190928615);
insert into DRIVER (driverid)
values (499031759);
insert into DRIVER (driverid)
values (396257560);
insert into DRIVER (driverid)
values (400991846);
insert into DRIVER (driverid)
values (676287000);
insert into DRIVER (driverid)
values (496193368);
insert into DRIVER (driverid)
values (378946295);
insert into DRIVER (driverid)
values (404710571);
insert into DRIVER (driverid)
values (535638282);
insert into DRIVER (driverid)
values (830156782);
insert into DRIVER (driverid)
values (900165540);
insert into DRIVER (driverid)
values (725530361);
insert into DRIVER (driverid)
values (112802719);
insert into DRIVER (driverid)
values (526303297);
insert into DRIVER (driverid)
values (988874118);
insert into DRIVER (driverid)
values (728648267);
insert into DRIVER (driverid)
values (731042839);
insert into DRIVER (driverid)
values (470978551);
insert into DRIVER (driverid)
values (199871279);
insert into DRIVER (driverid)
values (294766103);
insert into DRIVER (driverid)
values (770798112);
insert into DRIVER (driverid)
values (658708922);
insert into DRIVER (driverid)
values (762078986);
insert into DRIVER (driverid)
values (978580609);
insert into DRIVER (driverid)
values (703098082);
insert into DRIVER (driverid)
values (348530484);
insert into DRIVER (driverid)
values (437910872);
insert into DRIVER (driverid)
values (146697918);
insert into DRIVER (driverid)
values (995758728);
insert into DRIVER (driverid)
values (990692024);
insert into DRIVER (driverid)
values (390467801);
insert into DRIVER (driverid)
values (559419880);
insert into DRIVER (driverid)
values (916377545);
insert into DRIVER (driverid)
values (582288347);
insert into DRIVER (driverid)
values (176774232);
insert into DRIVER (driverid)
values (254746679);
insert into DRIVER (driverid)
values (823922225);
insert into DRIVER (driverid)
values (858098492);
insert into DRIVER (driverid)
values (405724200);
insert into DRIVER (driverid)
values (416584030);
insert into DRIVER (driverid)
values (314282226);
insert into DRIVER (driverid)
values (529078032);
insert into DRIVER (driverid)
values (635885867);
insert into DRIVER (driverid)
values (847641651);
insert into DRIVER (driverid)
values (387617908);
insert into DRIVER (driverid)
values (594117908);
insert into DRIVER (driverid)
values (180330027);
insert into DRIVER (driverid)
values (630702383);
insert into DRIVER (driverid)
values (799285930);
commit;
prompt 97 records loaded
prompt Loading PARAMEDIC...
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (10, 800505817);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (8, 540162175);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (46, 724032270);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (27, 872263306);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (14, 548160391);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (38, 717029668);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (41, 127694387);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (6, 608761880);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (50, 387617908);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (35, 946726018);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (9, 933936995);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (10, 943786572);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (22, 800402035);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (44, 190488653);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (2, 363990311);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (36, 184942157);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 393715774);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (36, 660020838);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 180330027);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (24, 103384022);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (32, 349127247);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (26, 706061824);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (36, 973586654);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (38, 721900875);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (14, 880620403);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (45, 610736791);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (23, 384763687);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (46, 416584030);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (47, 651588900);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (16, 116429875);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (37, 703098082);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (23, 927033834);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (4, 407260966);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 587299495);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (23, 417925256);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 728648267);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (18, 922110846);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (13, 884753922);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (28, 781552572);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (27, 360983983);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (43, 648974390);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (45, 753370607);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (5, 872649579);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (27, 555691338);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (46, 247146261);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (9, 229688953);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (17, 561518796);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (42, 922325953);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (48, 558389833);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 968089050);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (15, 585111831);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (23, 853278241);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (4, 908089234);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (50, 699202105);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (25, 831396788);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (41, 990720667);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (29, 502125849);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (9, 990692024);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (2, 484030461);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (50, 904236564);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (6, 562452670);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (5, 634313584);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 710362941);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (15, 443730958);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (50, 705325083);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (17, 549586947);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (47, 871521301);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (15, 785948646);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (32, 174417979);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (34, 448133232);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (47, 765542455);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (32, 549653270);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 321017966);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 108614791);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (41, 937543521);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (0, 760996111);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (13, 131444269);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (36, 858806514);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (49, 792593323);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (24, 896607930);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (23, 701718916);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (3, 322343561);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 845149407);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (1, 867477632);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (27, 893119524);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (0, 559419880);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (26, 112802719);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (39, 401053950);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (8, 667920628);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (46, 842065450);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (47, 860924791);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (44, 885046351);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (37, 322492683);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (45, 357601745);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (45, 707736586);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (34, 719934083);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (30, 253060937);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (10, 950757025);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (8, 299189594);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (47, 515597665);
commit;
prompt 100 records committed...
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (32, 808935919);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (22, 716936353);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (45, 707562374);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (49, 354589284);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (1, 795573633);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (22, 923469386);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (38, 888659851);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (40, 293770073);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (21, 347065963);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (47, 496193368);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (27, 476938290);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (33, 578410048);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (46, 870409642);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (27, 314282226);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (25, 151224001);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (13, 629817831);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (21, 681890386);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (25, 695997419);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (38, 203221623);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (34, 505893172);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 968414339);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (16, 387721649);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (14, 503328036);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (44, 280412141);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (36, 425149213);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (8, 509412899);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (7, 766186615);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (5, 325534613);
insert into PARAMEDIC (yearsofexperience, paramedicid)
values (50, 396257560);
commit;
prompt 129 records loaded
prompt Loading TEAM...
insert into TEAM (teamid, driverid, ambulanceid)
values (1, 847641651, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (2, 859486697, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (3, 499031759, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (4, 594117908, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (5, 526303297, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (6, 988874118, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (7, 858098492, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (8, 662127500, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (9, 192929550, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (10, 181904208, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (11, 437910872, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (12, 916377545, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (13, 995758728, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (14, 496193368, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (15, 731042839, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (16, 803965269, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (17, 717029668, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (18, 464254148, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (19, 747675635, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (20, 973586654, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (21, 437910872, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (22, 877579988, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (23, 754357861, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (24, 703098082, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (25, 582288347, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (26, 559419880, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (27, 734777659, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (28, 378946295, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (29, 747675635, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (30, 176774232, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (31, 294766103, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (32, 496193368, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (33, 799285930, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (34, 437910872, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (35, 526303297, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (36, 703098082, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (37, 314282226, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (38, 754357861, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (39, 898173826, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (40, 176774232, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (41, 274719284, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (42, 464254148, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (43, 582288347, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (44, 404710571, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (45, 858098492, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (46, 877579988, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (47, 621340115, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (48, 978580609, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (49, 908089234, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (50, 995758728, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (51, 192929550, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (52, 621340115, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (53, 731042839, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (54, 404710571, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (55, 559419880, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (56, 362030908, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (57, 858098492, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (58, 543717343, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (59, 443429683, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (60, 416584030, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (61, 658708922, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (62, 917310078, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (63, 403572395, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (64, 988874118, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (65, 725530361, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (66, 130019706, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (67, 710362941, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (68, 387617908, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (69, 594117908, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (70, 206068476, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (71, 199871279, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (72, 400991846, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (73, 747675635, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (74, 416584030, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (75, 803965269, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (76, 767340288, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (77, 705182536, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (78, 403572395, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (79, 916377545, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (80, 167740156, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (81, 700503030, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (82, 444383652, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (83, 705182536, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (84, 338863696, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (85, 872263306, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (86, 130019706, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (87, 496193368, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (88, 395587864, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (89, 190928615, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (90, 146697918, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (91, 734777659, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (92, 403572395, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (93, 803965269, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (94, 112802719, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (95, 153284087, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (96, 858098492, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (97, 635885867, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (98, 176774232, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (99, 872263306, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (100, 990692024, 90);
commit;
prompt 100 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (101, 400991846, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (102, 274719284, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (103, 594117908, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (104, 635885867, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (105, 898173826, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (106, 900165540, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (107, 180330027, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (108, 906997862, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (109, 676287000, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (110, 167740156, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (111, 180330027, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (112, 658708922, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (113, 254746679, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (114, 437910872, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (115, 900165540, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (116, 274719284, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (117, 543717343, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (118, 488848745, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (119, 378946295, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (120, 443429683, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (121, 803965269, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (122, 348530484, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (123, 403572395, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (124, 416584030, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (125, 325751247, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (126, 717029668, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (127, 859486697, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (128, 662127500, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (129, 559419880, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (130, 916377545, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (131, 803965269, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (132, 294766103, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (133, 988874118, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (134, 444383652, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (135, 692033847, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (136, 314282226, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (137, 658708922, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (138, 543717343, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (139, 396257560, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (140, 176774232, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (141, 190928615, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (142, 636779895, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (143, 437910872, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (144, 362030908, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (145, 211857699, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (146, 978580609, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (147, 404710571, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (148, 767340288, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (149, 167740156, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (150, 470978551, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (151, 206068476, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (152, 180330027, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (153, 582288347, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (154, 872263306, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (155, 734777659, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (156, 747675635, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (157, 146697918, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (158, 562992520, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (159, 916377545, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (160, 206068476, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (161, 274719284, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (162, 582288347, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (163, 630702383, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (164, 274719284, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (165, 378946295, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (166, 847641651, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (167, 582288347, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (168, 676287000, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (169, 877579988, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (170, 453472980, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (171, 453472980, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (172, 559419880, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (173, 405724200, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (174, 437910872, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (175, 499031759, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (176, 900165540, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (177, 990692024, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (178, 325751247, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (179, 662127500, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (180, 470978551, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (181, 754357861, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (182, 239898165, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (183, 630702383, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (184, 823922225, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (185, 579875385, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (186, 658708922, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (187, 877579988, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (188, 437910872, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (189, 799285930, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (190, 830156782, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (191, 488848745, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (192, 464254148, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (193, 847641651, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (194, 978580609, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (195, 847641651, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (196, 658708922, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (197, 995758728, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (198, 526303297, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (199, 112802719, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (200, 700503030, 82);
commit;
prompt 200 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (201, 731042839, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (202, 658708922, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (203, 728648267, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (204, 167740156, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (205, 496193368, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (206, 917310078, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (207, 770798112, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (208, 847641651, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (209, 995758728, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (210, 990692024, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (211, 635885867, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (212, 112802719, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (213, 799285930, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (214, 676287000, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (215, 582288347, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (216, 470978551, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (217, 700503030, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (218, 464254148, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (219, 130019706, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (220, 239898165, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (221, 734777659, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (222, 582288347, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (223, 529078032, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (224, 294766103, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (225, 973586654, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (226, 112802719, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (227, 858098492, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (228, 594117908, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (229, 181904208, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (230, 859486697, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (231, 559419880, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (232, 906997862, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (233, 387617908, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (234, 908089234, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (235, 325751247, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (236, 294766103, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (237, 676287000, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (238, 823922225, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (239, 403572395, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (240, 470978551, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (241, 470978551, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (242, 444383652, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (243, 847641651, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (244, 146697918, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (245, 112802719, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (246, 990692024, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (247, 559419880, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (248, 900165540, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (249, 437910872, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (250, 830156782, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (251, 362030908, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (252, 400991846, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (253, 496193368, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (254, 830156782, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (255, 416584030, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (256, 206068476, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (257, 916377545, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (258, 858098492, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (259, 823922225, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (260, 676287000, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (261, 957206959, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (262, 254746679, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (263, 206068476, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (264, 153284087, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (265, 395587864, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (266, 190928615, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (267, 830156782, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (268, 254746679, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (269, 859486697, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (270, 621340115, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (271, 582288347, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (272, 906997862, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (273, 635885867, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (274, 803965269, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (275, 799285930, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (276, 636779895, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (277, 559419880, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (278, 692033847, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (279, 754357861, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (280, 338863696, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (281, 416584030, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (282, 973586654, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (283, 338863696, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (284, 167740156, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (285, 400991846, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (286, 404710571, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (287, 526303297, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (288, 762078986, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (289, 767340288, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (290, 767340288, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (291, 803965269, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (292, 403572395, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (293, 700503030, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (294, 636779895, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (295, 725530361, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (296, 769449049, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (297, 799285930, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (298, 526303297, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (299, 775965942, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (300, 767340288, 96);
commit;
prompt 300 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (301, 872263306, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (302, 717029668, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (303, 747675635, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (304, 859486697, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (305, 775965942, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (306, 662127500, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (307, 443429683, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (308, 636779895, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (309, 906997862, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (310, 192929550, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (311, 437910872, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (312, 594117908, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (313, 728648267, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (314, 146697918, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (315, 973586654, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (316, 636779895, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (317, 190928615, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (318, 762078986, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (319, 443429683, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (320, 635885867, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (321, 543717343, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (322, 206068476, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (323, 453472980, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (324, 199871279, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (325, 437910872, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (326, 387617908, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (327, 917310078, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (328, 830156782, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (329, 916377545, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (330, 181904208, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (331, 754357861, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (332, 206068476, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (333, 180330027, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (334, 199871279, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (335, 239898165, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (336, 692033847, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (337, 348530484, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (338, 254746679, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (339, 700503030, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (340, 887348713, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (341, 731042839, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (342, 543717343, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (343, 206068476, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (344, 167740156, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (345, 775965942, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (346, 437910872, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (347, 916377545, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (348, 877579988, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (349, 416584030, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (350, 395587864, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (351, 700503030, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (352, 676287000, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (353, 717029668, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (354, 859486697, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (355, 769449049, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (356, 239898165, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (357, 594117908, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (358, 153284087, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (359, 635885867, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (360, 362030908, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (361, 199871279, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (362, 348530484, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (363, 830156782, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (364, 717029668, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (365, 488848745, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (366, 908089234, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (367, 400991846, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (368, 192929550, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (369, 400991846, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (370, 728648267, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (371, 594117908, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (372, 453472980, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (373, 582288347, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (374, 917310078, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (375, 676287000, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (376, 703098082, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (377, 562992520, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (378, 470978551, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (379, 416584030, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (380, 559419880, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (381, 769449049, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (382, 526303297, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (383, 404710571, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (384, 900165540, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (385, 877579988, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (386, 499031759, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (387, 859486697, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (388, 470978551, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (389, 995758728, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (390, 717029668, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (391, 180330027, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (392, 362030908, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (393, 762078986, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (394, 176774232, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (395, 731042839, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (396, 872263306, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (397, 396257560, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (398, 767340288, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (399, 496193368, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (400, 630702383, 22);
commit;
prompt 400 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (401, 167740156, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (402, 731042839, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (403, 443429683, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (404, 900165540, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (405, 725530361, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (406, 499031759, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (407, 325751247, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (408, 917310078, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (409, 978580609, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (410, 775965942, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (411, 274719284, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (412, 559419880, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (413, 464254148, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (414, 496193368, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (415, 990692024, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (416, 562992520, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (417, 405724200, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (418, 703098082, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (419, 908089234, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (420, 362030908, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (421, 211857699, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (422, 803965269, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (423, 898173826, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (424, 199871279, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (425, 734777659, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (426, 437910872, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (427, 747675635, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (428, 112802719, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (429, 464254148, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (430, 621340115, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (431, 658708922, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (432, 728648267, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (433, 700503030, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (434, 767340288, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (435, 395587864, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (436, 181904208, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (437, 858098492, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (438, 176774232, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (439, 176774232, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (440, 658708922, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (441, 887348713, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (442, 294766103, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (443, 453472980, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (444, 239898165, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (445, 635885867, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (446, 180330027, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (447, 146697918, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (448, 957206959, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (449, 562992520, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (450, 146697918, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (451, 898173826, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (452, 692033847, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (453, 830156782, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (454, 887348713, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (455, 728648267, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (456, 314282226, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (457, 395587864, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (458, 636779895, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (459, 762078986, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (460, 400991846, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (461, 562992520, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (462, 325751247, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (463, 496193368, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (464, 404710571, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (465, 995758728, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (466, 190928615, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (467, 416584030, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (468, 898173826, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (469, 348530484, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (470, 995758728, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (471, 803965269, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (472, 762078986, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (473, 396257560, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (474, 973586654, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (475, 199871279, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (476, 858098492, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (477, 676287000, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (478, 167740156, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (479, 731042839, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (480, 830156782, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (481, 239898165, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (482, 770798112, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (483, 579875385, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (484, 325751247, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (485, 176774232, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (486, 211857699, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (487, 594117908, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (488, 396257560, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (489, 734777659, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (490, 717029668, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (491, 658708922, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (492, 437910872, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (493, 294766103, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (494, 199871279, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (495, 582288347, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (496, 973586654, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (497, 444383652, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (498, 378946295, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (499, 274719284, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (500, 900165540, 78);
commit;
prompt 500 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (501, 728648267, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (502, 594117908, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (503, 562992520, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (504, 526303297, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (505, 390467801, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (506, 803965269, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (507, 146697918, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (508, 847641651, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (509, 404710571, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (510, 917310078, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (511, 254746679, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (512, 990692024, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (513, 199871279, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (514, 416584030, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (515, 559419880, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (516, 662127500, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (517, 130019706, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (518, 529078032, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (519, 338863696, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (520, 734777659, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (521, 995758728, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (522, 676287000, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (523, 769449049, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (524, 725530361, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (525, 710362941, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (526, 978580609, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (527, 900165540, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (528, 872263306, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (529, 728648267, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (530, 130019706, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (531, 860455901, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (532, 499031759, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (533, 859486697, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (534, 130019706, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (535, 995758728, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (536, 529078032, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (537, 908089234, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (538, 294766103, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (539, 703098082, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (540, 906997862, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (541, 630702383, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (542, 400991846, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (543, 443429683, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (544, 239898165, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (545, 562992520, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (546, 594117908, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (547, 872263306, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (548, 405724200, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (549, 403572395, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (550, 153284087, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (551, 767340288, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (552, 396257560, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (553, 908089234, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (554, 464254148, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (555, 957206959, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (556, 496193368, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (557, 378946295, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (558, 978580609, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (559, 444383652, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (560, 636779895, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (561, 973586654, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (562, 416584030, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (563, 978580609, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (564, 400991846, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (565, 325751247, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (566, 858098492, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (567, 529078032, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (568, 662127500, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (569, 973586654, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (570, 988874118, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (571, 582288347, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (572, 499031759, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (573, 594117908, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (574, 499031759, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (575, 443429683, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (576, 823922225, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (577, 314282226, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (578, 348530484, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (579, 731042839, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (580, 180330027, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (581, 635885867, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (582, 594117908, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (583, 444383652, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (584, 734777659, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (585, 988874118, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (586, 362030908, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (587, 658708922, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (588, 887348713, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (589, 400991846, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (590, 325751247, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (591, 416584030, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (592, 762078986, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (593, 378946295, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (594, 416584030, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (595, 348530484, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (596, 803965269, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (597, 594117908, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (598, 973586654, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (599, 470978551, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (600, 978580609, 78);
commit;
prompt 600 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (601, 396257560, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (602, 734777659, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (603, 400991846, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (604, 396257560, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (605, 387617908, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (606, 396257560, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (607, 692033847, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (608, 464254148, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (609, 995758728, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (610, 579875385, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (611, 453472980, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (612, 658708922, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (613, 769449049, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (614, 274719284, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (615, 112802719, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (616, 906997862, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (617, 988874118, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (618, 167740156, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (619, 662127500, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (620, 630702383, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (621, 710362941, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (622, 767340288, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (623, 703098082, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (624, 872263306, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (625, 444383652, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (626, 488848745, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (627, 916377545, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (628, 239898165, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (629, 703098082, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (630, 978580609, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (631, 767340288, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (632, 453472980, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (633, 199871279, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (634, 917310078, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (635, 535638282, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (636, 767340288, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (637, 731042839, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (638, 443429683, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (639, 957206959, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (640, 847641651, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (641, 416584030, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (642, 362030908, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (643, 898173826, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (644, 535638282, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (645, 988874118, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (646, 112802719, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (647, 860455901, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (648, 731042839, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (649, 153284087, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (650, 348530484, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (651, 378946295, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (652, 978580609, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (653, 847641651, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (654, 562992520, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (655, 470978551, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (656, 176774232, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (657, 543717343, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (658, 362030908, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (659, 526303297, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (660, 444383652, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (661, 636779895, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (662, 676287000, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (663, 535638282, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (664, 847641651, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (665, 562992520, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (666, 396257560, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (667, 180330027, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (668, 973586654, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (669, 464254148, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (670, 294766103, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (671, 387617908, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (672, 176774232, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (673, 734777659, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (674, 529078032, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (675, 872263306, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (676, 362030908, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (677, 916377545, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (678, 362030908, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (679, 803965269, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (680, 167740156, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (681, 725530361, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (682, 988874118, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (683, 973586654, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (684, 181904208, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (685, 130019706, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (686, 957206959, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (687, 594117908, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (688, 908089234, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (689, 823922225, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (690, 916377545, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (691, 767340288, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (692, 770798112, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (693, 877579988, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (694, 294766103, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (695, 470978551, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (696, 416584030, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (697, 348530484, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (698, 559419880, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (699, 180330027, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (700, 348530484, 12);
commit;
prompt 700 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (701, 130019706, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (702, 400991846, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (703, 192929550, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (704, 775965942, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (705, 499031759, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (706, 130019706, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (707, 762078986, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (708, 731042839, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (709, 211857699, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (710, 488848745, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (711, 898173826, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (712, 181904208, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (713, 731042839, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (714, 705182536, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (715, 529078032, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (716, 390467801, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (717, 464254148, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (718, 858098492, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (719, 338863696, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (720, 294766103, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (721, 348530484, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (722, 325751247, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (723, 769449049, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (724, 978580609, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (725, 180330027, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (726, 830156782, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (727, 877579988, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (728, 621340115, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (729, 908089234, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (730, 535638282, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (731, 872263306, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (732, 860455901, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (733, 582288347, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (734, 658708922, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (735, 630702383, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (736, 181904208, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (737, 387617908, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (738, 769449049, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (739, 775965942, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (740, 908089234, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (741, 579875385, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (742, 594117908, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (743, 830156782, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (744, 877579988, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (745, 325751247, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (746, 872263306, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (747, 908089234, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (748, 405724200, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (749, 775965942, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (750, 453472980, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (751, 387617908, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (752, 621340115, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (753, 877579988, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (754, 877579988, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (755, 692033847, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (756, 443429683, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (757, 390467801, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (758, 405724200, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (759, 860455901, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (760, 562992520, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (761, 294766103, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (762, 274719284, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (763, 630702383, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (764, 211857699, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (765, 579875385, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (766, 658708922, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (767, 717029668, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (768, 710362941, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (769, 496193368, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (770, 978580609, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (771, 176774232, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (772, 762078986, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (773, 378946295, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (774, 860455901, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (775, 754357861, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (776, 917310078, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (777, 499031759, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (778, 294766103, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (779, 437910872, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (780, 830156782, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (781, 579875385, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (782, 775965942, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (783, 453472980, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (784, 676287000, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (785, 978580609, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (786, 437910872, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (787, 900165540, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (788, 900165540, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (789, 274719284, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (790, 957206959, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (791, 621340115, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (792, 526303297, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (793, 526303297, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (794, 387617908, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (795, 762078986, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (796, 767340288, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (797, 529078032, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (798, 877579988, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (799, 621340115, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (800, 908089234, 26);
commit;
prompt 800 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (801, 192929550, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (802, 559419880, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (803, 470978551, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (804, 396257560, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (805, 325751247, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (806, 731042839, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (807, 957206959, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (808, 112802719, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (809, 823922225, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (810, 348530484, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (811, 559419880, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (812, 192929550, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (813, 405724200, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (814, 762078986, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (815, 635885867, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (816, 754357861, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (817, 692033847, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (818, 767340288, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (819, 717029668, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (820, 559419880, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (821, 676287000, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (822, 898173826, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (823, 995758728, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (824, 978580609, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (825, 176774232, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (826, 562992520, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (827, 378946295, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (828, 621340115, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (829, 830156782, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (830, 710362941, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (831, 728648267, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (832, 594117908, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (833, 405724200, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (834, 676287000, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (835, 860455901, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (836, 775965942, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (837, 847641651, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (838, 770798112, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (839, 192929550, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (840, 543717343, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (841, 443429683, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (842, 529078032, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (843, 464254148, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (844, 767340288, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (845, 725530361, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (846, 621340115, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (847, 416584030, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (848, 731042839, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (849, 181904208, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (850, 762078986, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (851, 725530361, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (852, 877579988, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (853, 957206959, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (854, 775965942, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (855, 404710571, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (856, 731042839, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (857, 988874118, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (858, 488848745, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (859, 387617908, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (860, 499031759, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (861, 823922225, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (862, 858098492, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (863, 636779895, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (864, 405724200, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (865, 535638282, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (866, 799285930, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (867, 526303297, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (868, 662127500, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (869, 705182536, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (870, 898173826, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (871, 378946295, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (872, 464254148, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (873, 582288347, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (874, 338863696, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (875, 496193368, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (876, 199871279, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (877, 526303297, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (878, 529078032, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (879, 338863696, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (880, 338863696, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (881, 338863696, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (882, 274719284, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (883, 470978551, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (884, 728648267, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (885, 396257560, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (886, 900165540, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (887, 348530484, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (888, 728648267, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (889, 496193368, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (890, 734777659, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (891, 470978551, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (892, 130019706, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (893, 453472980, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (894, 199871279, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (895, 274719284, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (896, 559419880, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (897, 860455901, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (898, 378946295, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (899, 112802719, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (900, 529078032, 12);
commit;
prompt 900 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (901, 762078986, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (902, 395587864, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (903, 112802719, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (904, 731042839, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (905, 400991846, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (906, 400991846, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (907, 762078986, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (908, 239898165, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (909, 395587864, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (910, 900165540, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (911, 988874118, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (912, 860455901, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (913, 526303297, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (914, 443429683, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (915, 635885867, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (916, 973586654, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (917, 734777659, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (918, 395587864, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (919, 199871279, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (920, 859486697, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (921, 274719284, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (922, 700503030, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (923, 294766103, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (924, 400991846, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (925, 662127500, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (926, 621340115, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (927, 990692024, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (928, 488848745, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (929, 754357861, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (930, 176774232, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (931, 112802719, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (932, 823922225, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (933, 747675635, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (934, 535638282, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (935, 378946295, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (936, 754357861, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (937, 898173826, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (938, 404710571, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (939, 206068476, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (940, 658708922, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (941, 167740156, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (942, 294766103, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (943, 978580609, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (944, 859486697, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (945, 887348713, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (946, 314282226, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (947, 543717343, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (948, 464254148, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (949, 176774232, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (950, 192929550, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (951, 387617908, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (952, 594117908, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (953, 338863696, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (954, 900165540, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (955, 130019706, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (956, 239898165, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (957, 404710571, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (958, 348530484, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (959, 192929550, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (960, 464254148, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (961, 703098082, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (962, 762078986, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (963, 700503030, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (964, 181904208, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (965, 630702383, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (966, 859486697, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (967, 900165540, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (968, 803965269, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (969, 917310078, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (970, 314282226, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (971, 348530484, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (972, 705182536, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (973, 847641651, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (974, 146697918, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (975, 314282226, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (976, 559419880, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (977, 710362941, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (978, 400991846, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (979, 908089234, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (980, 405724200, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (981, 338863696, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (982, 957206959, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (983, 239898165, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (984, 594117908, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (985, 403572395, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (986, 254746679, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (987, 314282226, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (988, 710362941, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (989, 348530484, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (990, 636779895, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (991, 274719284, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (992, 731042839, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (993, 887348713, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (994, 130019706, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (995, 444383652, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (996, 437910872, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (997, 877579988, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (998, 167740156, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (999, 803965269, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1000, 747675635, 2);
commit;
prompt 1000 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1001, 338863696, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1002, 211857699, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1003, 112802719, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1004, 496193368, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1005, 858098492, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1006, 199871279, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1007, 594117908, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1008, 470978551, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1009, 499031759, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1010, 526303297, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1011, 705182536, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1012, 499031759, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1013, 830156782, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1014, 717029668, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1015, 747675635, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1016, 562992520, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1017, 529078032, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1018, 676287000, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1019, 887348713, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1020, 470978551, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1021, 400991846, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1022, 167740156, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1023, 692033847, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1024, 529078032, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1025, 635885867, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1026, 314282226, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1027, 898173826, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1028, 887348713, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1029, 559419880, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1030, 830156782, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1031, 747675635, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1032, 762078986, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1033, 416584030, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1034, 957206959, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1035, 444383652, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1036, 775965942, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1037, 877579988, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1038, 190928615, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1039, 529078032, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1040, 562992520, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1041, 199871279, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1042, 859486697, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1043, 775965942, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1044, 594117908, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1045, 823922225, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1046, 167740156, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1047, 274719284, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1048, 146697918, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1049, 662127500, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1050, 769449049, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1051, 378946295, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1052, 900165540, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1053, 176774232, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1054, 153284087, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1055, 747675635, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1056, 167740156, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1057, 112802719, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1058, 636779895, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1059, 404710571, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1060, 499031759, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1061, 908089234, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1062, 700503030, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1063, 700503030, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1064, 325751247, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1065, 444383652, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1066, 754357861, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1067, 823922225, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1068, 700503030, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1069, 404710571, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1070, 496193368, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1071, 692033847, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1072, 314282226, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1073, 957206959, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1074, 769449049, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1075, 396257560, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1076, 404710571, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1077, 582288347, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1078, 770798112, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1079, 176774232, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1080, 146697918, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1081, 754357861, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1082, 404710571, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1083, 559419880, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1084, 973586654, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1085, 314282226, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1086, 887348713, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1087, 562992520, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1088, 658708922, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1089, 348530484, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1090, 443429683, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1091, 594117908, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1092, 636779895, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1093, 775965942, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1094, 728648267, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1095, 703098082, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1096, 180330027, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1097, 906997862, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1098, 830156782, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1099, 348530484, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1100, 630702383, 71);
commit;
prompt 1100 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1101, 658708922, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1102, 769449049, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1103, 254746679, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1104, 734777659, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1105, 176774232, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1106, 176774232, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1107, 130019706, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1108, 405724200, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1109, 728648267, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1110, 130019706, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1111, 734777659, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1112, 579875385, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1113, 206068476, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1114, 130019706, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1115, 725530361, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1116, 199871279, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1117, 153284087, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1118, 254746679, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1119, 206068476, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1120, 535638282, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1121, 847641651, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1122, 211857699, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1123, 453472980, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1124, 725530361, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1125, 898173826, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1126, 908089234, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1127, 710362941, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1128, 400991846, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1129, 995758728, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1130, 860455901, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1131, 405724200, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1132, 470978551, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1133, 703098082, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1134, 847641651, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1135, 153284087, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1136, 403572395, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1137, 872263306, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1138, 636779895, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1139, 488848745, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1140, 348530484, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1141, 199871279, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1142, 957206959, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1143, 630702383, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1144, 582288347, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1145, 499031759, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1146, 767340288, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1147, 470978551, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1148, 582288347, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1149, 775965942, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1150, 153284087, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1151, 348530484, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1152, 658708922, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1153, 692033847, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1154, 387617908, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1155, 767340288, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1156, 700503030, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1157, 400991846, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1158, 499031759, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1159, 860455901, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1160, 978580609, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1161, 860455901, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1162, 199871279, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1163, 988874118, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1164, 396257560, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1165, 630702383, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1166, 700503030, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1167, 594117908, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1168, 847641651, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1169, 378946295, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1170, 906997862, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1171, 562992520, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1172, 803965269, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1173, 535638282, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1174, 206068476, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1175, 872263306, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1176, 830156782, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1177, 167740156, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1178, 582288347, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1179, 443429683, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1180, 190928615, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1181, 754357861, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1182, 847641651, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1183, 582288347, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1184, 562992520, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1185, 973586654, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1186, 464254148, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1187, 710362941, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1188, 725530361, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1189, 762078986, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1190, 199871279, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1191, 488848745, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1192, 658708922, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1193, 898173826, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1194, 872263306, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1195, 526303297, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1196, 443429683, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1197, 799285930, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1198, 190928615, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1199, 676287000, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1200, 728648267, 43);
commit;
prompt 1200 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1201, 767340288, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1202, 582288347, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1203, 239898165, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1204, 535638282, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1205, 803965269, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1206, 396257560, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1207, 859486697, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1208, 917310078, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1209, 180330027, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1210, 400991846, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1211, 823922225, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1212, 146697918, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1213, 130019706, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1214, 206068476, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1215, 775965942, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1216, 700503030, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1217, 725530361, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1218, 725530361, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1219, 734777659, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1220, 559419880, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1221, 535638282, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1222, 543717343, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1223, 400991846, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1224, 995758728, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1225, 416584030, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1226, 403572395, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1227, 762078986, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1228, 529078032, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1229, 725530361, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1230, 906997862, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1231, 769449049, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1232, 906997862, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1233, 731042839, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1234, 254746679, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1235, 403572395, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1236, 705182536, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1237, 762078986, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1238, 314282226, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1239, 859486697, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1240, 973586654, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1241, 769449049, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1242, 898173826, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1243, 703098082, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1244, 717029668, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1245, 146697918, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1246, 464254148, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1247, 775965942, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1248, 582288347, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1249, 717029668, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1250, 146697918, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1251, 860455901, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1252, 443429683, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1253, 176774232, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1254, 579875385, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1255, 775965942, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1256, 404710571, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1257, 396257560, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1258, 176774232, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1259, 872263306, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1260, 325751247, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1261, 314282226, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1262, 823922225, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1263, 579875385, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1264, 658708922, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1265, 453472980, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1266, 395587864, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1267, 167740156, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1268, 830156782, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1269, 499031759, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1270, 799285930, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1271, 153284087, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1272, 973586654, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1273, 799285930, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1274, 325751247, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1275, 274719284, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1276, 630702383, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1277, 453472980, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1278, 692033847, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1279, 325751247, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1280, 579875385, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1281, 860455901, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1282, 416584030, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1283, 700503030, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1284, 526303297, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1285, 496193368, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1286, 636779895, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1287, 717029668, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1288, 416584030, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1289, 211857699, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1290, 274719284, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1291, 180330027, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1292, 877579988, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1293, 636779895, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1294, 176774232, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1295, 957206959, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1296, 403572395, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1297, 180330027, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1298, 908089234, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1299, 847641651, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1300, 167740156, 5);
commit;
prompt 1300 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1301, 859486697, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1302, 731042839, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1303, 705182536, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1304, 916377545, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1305, 898173826, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1306, 725530361, 29);
insert into TEAM (teamid, driverid, ambulanceid)
values (1307, 703098082, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1308, 562992520, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1309, 395587864, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1310, 582288347, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1311, 437910872, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1312, 973586654, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1313, 400991846, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1314, 535638282, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1315, 325751247, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1316, 274719284, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1317, 635885867, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1318, 395587864, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1319, 437910872, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1320, 858098492, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1321, 325751247, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1322, 767340288, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1323, 444383652, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1324, 239898165, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1325, 747675635, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1326, 658708922, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1327, 529078032, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1328, 900165540, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1329, 847641651, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1330, 887348713, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1331, 900165540, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1332, 130019706, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1333, 988874118, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1334, 872263306, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1335, 112802719, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1336, 635885867, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1337, 314282226, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1338, 988874118, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1339, 338863696, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1340, 957206959, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1341, 579875385, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1342, 562992520, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1343, 995758728, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1344, 112802719, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1345, 443429683, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1346, 294766103, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1347, 872263306, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1348, 973586654, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1349, 499031759, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1350, 860455901, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1351, 526303297, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1352, 582288347, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1353, 705182536, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1354, 703098082, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1355, 734777659, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1356, 453472980, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1357, 860455901, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1358, 464254148, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1359, 662127500, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1360, 662127500, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1361, 887348713, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1362, 437910872, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1363, 395587864, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1364, 770798112, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1365, 692033847, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1366, 404710571, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1367, 676287000, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1368, 192929550, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1369, 830156782, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1370, 526303297, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1371, 799285930, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1372, 496193368, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1373, 775965942, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1374, 387617908, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1375, 453472980, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1376, 725530361, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1377, 239898165, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1378, 734777659, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1379, 769449049, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1380, 206068476, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1381, 872263306, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1382, 705182536, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1383, 338863696, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1384, 579875385, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1385, 799285930, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1386, 710362941, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1387, 990692024, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1388, 906997862, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1389, 717029668, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1390, 731042839, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1391, 734777659, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1392, 830156782, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1393, 562992520, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1394, 908089234, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1395, 734777659, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1396, 700503030, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1397, 762078986, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1398, 582288347, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1399, 130019706, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1400, 499031759, 29);
commit;
prompt 1400 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1401, 872263306, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1402, 403572395, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1403, 167740156, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1404, 130019706, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1405, 294766103, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1406, 635885867, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1407, 153284087, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1408, 973586654, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1409, 190928615, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1410, 529078032, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1411, 192929550, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1412, 858098492, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1413, 378946295, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1414, 176774232, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1415, 594117908, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1416, 579875385, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1417, 717029668, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1418, 294766103, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1419, 559419880, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1420, 112802719, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1421, 830156782, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1422, 470978551, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1423, 444383652, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1424, 206068476, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1425, 900165540, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1426, 464254148, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1427, 404710571, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1428, 990692024, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1429, 274719284, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1430, 437910872, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1431, 636779895, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1432, 470978551, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1433, 767340288, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1434, 847641651, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1435, 705182536, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1436, 396257560, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1437, 190928615, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1438, 464254148, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1439, 378946295, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1440, 499031759, 4);
insert into TEAM (teamid, driverid, ambulanceid)
values (1441, 957206959, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1442, 908089234, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1443, 887348713, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1444, 594117908, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1445, 775965942, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1446, 181904208, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1447, 167740156, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1448, 529078032, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1449, 167740156, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1450, 900165540, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1451, 692033847, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1452, 898173826, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1453, 898173826, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1454, 239898165, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1455, 858098492, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1456, 847641651, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1457, 470978551, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1458, 338863696, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1459, 582288347, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1460, 582288347, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1461, 582288347, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1462, 190928615, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1463, 254746679, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1464, 988874118, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1465, 146697918, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1466, 767340288, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1467, 395587864, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1468, 192929550, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1469, 635885867, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1470, 362030908, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1471, 378946295, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1472, 877579988, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1473, 526303297, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1474, 453472980, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1475, 703098082, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1476, 734777659, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1477, 146697918, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1478, 314282226, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1479, 348530484, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1480, 621340115, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1481, 978580609, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1482, 725530361, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1483, 621340115, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1484, 348530484, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1485, 378946295, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1486, 239898165, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1487, 153284087, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1488, 717029668, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1489, 535638282, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1490, 978580609, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1491, 860455901, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1492, 405724200, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1493, 754357861, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1494, 769449049, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1495, 444383652, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1496, 239898165, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1497, 274719284, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1498, 847641651, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1499, 872263306, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1500, 887348713, 98);
commit;
prompt 1500 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1501, 769449049, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1502, 348530484, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1503, 775965942, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1504, 767340288, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1505, 900165540, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1506, 562992520, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1507, 705182536, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1508, 395587864, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1509, 348530484, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1510, 887348713, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1511, 239898165, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1512, 636779895, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1513, 416584030, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1514, 988874118, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1515, 390467801, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1516, 898173826, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1517, 416584030, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1518, 499031759, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1519, 762078986, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1520, 387617908, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1521, 535638282, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1522, 725530361, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1523, 211857699, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1524, 348530484, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1525, 464254148, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1526, 859486697, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1527, 872263306, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1528, 444383652, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1529, 562992520, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1530, 180330027, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1531, 378946295, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1532, 529078032, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1533, 199871279, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1534, 488848745, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1535, 636779895, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1536, 153284087, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1537, 325751247, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1538, 803965269, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1539, 211857699, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1540, 767340288, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1541, 362030908, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1542, 728648267, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1543, 658708922, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1544, 562992520, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1545, 348530484, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1546, 858098492, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1547, 176774232, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1548, 405724200, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1549, 916377545, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1550, 582288347, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1551, 725530361, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1552, 325751247, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1553, 338863696, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1554, 703098082, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1555, 908089234, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1556, 190928615, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1557, 559419880, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1558, 470978551, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1559, 488848745, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1560, 543717343, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1561, 199871279, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1562, 443429683, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1563, 995758728, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1564, 692033847, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1565, 470978551, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1566, 703098082, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1567, 416584030, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1568, 470978551, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1569, 526303297, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1570, 898173826, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1571, 700503030, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1572, 830156782, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1573, 396257560, 52);
insert into TEAM (teamid, driverid, ambulanceid)
values (1574, 274719284, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1575, 770798112, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1576, 488848745, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1577, 978580609, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1578, 978580609, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1579, 717029668, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1580, 211857699, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1581, 314282226, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1582, 770798112, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1583, 167740156, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1584, 823922225, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1585, 594117908, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1586, 917310078, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1587, 995758728, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1588, 906997862, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1589, 453472980, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1590, 692033847, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1591, 830156782, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1592, 294766103, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1593, 395587864, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1594, 444383652, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1595, 594117908, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1596, 390467801, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1597, 378946295, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1598, 405724200, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1599, 775965942, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1600, 700503030, 34);
commit;
prompt 1600 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1601, 153284087, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1602, 747675635, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1603, 767340288, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1604, 988874118, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1605, 717029668, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1606, 877579988, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1607, 404710571, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1608, 192929550, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1609, 211857699, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1610, 416584030, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1611, 860455901, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1612, 488848745, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1613, 180330027, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1614, 470978551, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1615, 294766103, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1616, 180330027, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1617, 747675635, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1618, 180330027, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1619, 464254148, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1620, 206068476, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1621, 767340288, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1622, 470978551, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1623, 725530361, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1624, 877579988, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1625, 769449049, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1626, 404710571, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1627, 900165540, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1628, 112802719, 69);
insert into TEAM (teamid, driverid, ambulanceid)
values (1629, 559419880, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1630, 728648267, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1631, 496193368, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1632, 211857699, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1633, 562992520, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1634, 444383652, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1635, 872263306, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1636, 957206959, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1637, 731042839, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1638, 130019706, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1639, 437910872, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1640, 153284087, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1641, 635885867, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1642, 662127500, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1643, 146697918, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1644, 396257560, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1645, 167740156, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1646, 900165540, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1647, 636779895, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1648, 180330027, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1649, 470978551, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1650, 130019706, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1651, 700503030, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1652, 453472980, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1653, 973586654, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1654, 803965269, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1655, 206068476, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1656, 153284087, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1657, 770798112, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1658, 847641651, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1659, 705182536, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1660, 167740156, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1661, 403572395, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1662, 190928615, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1663, 872263306, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1664, 725530361, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1665, 877579988, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1666, 594117908, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1667, 747675635, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1668, 190928615, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1669, 543717343, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1670, 995758728, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1671, 443429683, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1672, 444383652, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1673, 325751247, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1674, 181904208, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1675, 348530484, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1676, 803965269, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1677, 900165540, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1678, 496193368, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1679, 112802719, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1680, 400991846, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1681, 362030908, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1682, 775965942, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1683, 314282226, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1684, 562992520, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1685, 710362941, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1686, 378946295, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1687, 900165540, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1688, 635885867, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1689, 416584030, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1690, 443429683, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1691, 957206959, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1692, 338863696, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1693, 453472980, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1694, 403572395, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1695, 898173826, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1696, 916377545, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1697, 978580609, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1698, 803965269, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1699, 211857699, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1700, 769449049, 44);
commit;
prompt 1700 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1701, 130019706, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1702, 754357861, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1703, 130019706, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1704, 239898165, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1705, 582288347, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1706, 770798112, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1707, 405724200, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1708, 900165540, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1709, 464254148, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1710, 176774232, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1711, 362030908, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1712, 496193368, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1713, 400991846, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1714, 395587864, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1715, 973586654, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1716, 775965942, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1717, 803965269, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1718, 254746679, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1719, 190928615, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1720, 754357861, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1721, 872263306, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1722, 176774232, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1723, 635885867, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1724, 559419880, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1725, 799285930, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1726, 499031759, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1727, 294766103, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1728, 199871279, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1729, 130019706, 92);
insert into TEAM (teamid, driverid, ambulanceid)
values (1730, 703098082, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1731, 582288347, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1732, 636779895, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1733, 747675635, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1734, 898173826, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1735, 146697918, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1736, 775965942, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1737, 917310078, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1738, 916377545, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1739, 717029668, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1740, 906997862, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1741, 754357861, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1742, 167740156, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1743, 725530361, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1744, 700503030, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1745, 211857699, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1746, 728648267, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1747, 747675635, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1748, 978580609, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1749, 362030908, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1750, 190928615, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1751, 770798112, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1752, 153284087, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1753, 453472980, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1754, 978580609, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1755, 860455901, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1756, 404710571, 58);
insert into TEAM (teamid, driverid, ambulanceid)
values (1757, 859486697, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1758, 916377545, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1759, 858098492, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1760, 594117908, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1761, 957206959, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1762, 470978551, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1763, 387617908, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1764, 799285930, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1765, 453472980, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1766, 453472980, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1767, 594117908, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1768, 957206959, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1769, 146697918, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1770, 274719284, 74);
insert into TEAM (teamid, driverid, ambulanceid)
values (1771, 239898165, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1772, 703098082, 90);
insert into TEAM (teamid, driverid, ambulanceid)
values (1773, 887348713, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1774, 767340288, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1775, 957206959, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1776, 254746679, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1777, 274719284, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1778, 636779895, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1779, 403572395, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1780, 190928615, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1781, 762078986, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1782, 444383652, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1783, 662127500, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1784, 559419880, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1785, 728648267, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1786, 877579988, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1787, 192929550, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1788, 799285930, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1789, 762078986, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1790, 378946295, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1791, 192929550, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1792, 294766103, 27);
insert into TEAM (teamid, driverid, ambulanceid)
values (1793, 153284087, 63);
insert into TEAM (teamid, driverid, ambulanceid)
values (1794, 887348713, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1795, 823922225, 77);
insert into TEAM (teamid, driverid, ambulanceid)
values (1796, 362030908, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1797, 705182536, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1798, 453472980, 98);
insert into TEAM (teamid, driverid, ambulanceid)
values (1799, 496193368, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1800, 978580609, 60);
commit;
prompt 1800 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1801, 803965269, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1802, 499031759, 20);
insert into TEAM (teamid, driverid, ambulanceid)
values (1803, 877579988, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1804, 437910872, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1805, 830156782, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1806, 180330027, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1807, 176774232, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1808, 710362941, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1809, 988874118, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1810, 314282226, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1811, 799285930, 23);
insert into TEAM (teamid, driverid, ambulanceid)
values (1812, 199871279, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1813, 754357861, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1814, 112802719, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1815, 112802719, 15);
insert into TEAM (teamid, driverid, ambulanceid)
values (1816, 658708922, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1817, 769449049, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1818, 338863696, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1819, 859486697, 97);
insert into TEAM (teamid, driverid, ambulanceid)
values (1820, 630702383, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1821, 378946295, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1822, 579875385, 88);
insert into TEAM (teamid, driverid, ambulanceid)
values (1823, 180330027, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1824, 206068476, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1825, 906997862, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1826, 239898165, 99);
insert into TEAM (teamid, driverid, ambulanceid)
values (1827, 314282226, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1828, 470978551, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1829, 754357861, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1830, 799285930, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1831, 499031759, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1832, 700503030, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1833, 167740156, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1834, 199871279, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1835, 803965269, 31);
insert into TEAM (teamid, driverid, ambulanceid)
values (1836, 908089234, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1837, 535638282, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1838, 488848745, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1839, 464254148, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1840, 700503030, 16);
insert into TEAM (teamid, driverid, ambulanceid)
values (1841, 692033847, 89);
insert into TEAM (teamid, driverid, ambulanceid)
values (1842, 908089234, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1843, 900165540, 44);
insert into TEAM (teamid, driverid, ambulanceid)
values (1844, 535638282, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1845, 146697918, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1846, 973586654, 79);
insert into TEAM (teamid, driverid, ambulanceid)
values (1847, 754357861, 91);
insert into TEAM (teamid, driverid, ambulanceid)
values (1848, 378946295, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1849, 582288347, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1850, 211857699, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1851, 176774232, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1852, 728648267, 34);
insert into TEAM (teamid, driverid, ambulanceid)
values (1853, 314282226, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1854, 662127500, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1855, 705182536, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1856, 314282226, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1857, 294766103, 96);
insert into TEAM (teamid, driverid, ambulanceid)
values (1858, 728648267, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1859, 112802719, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1860, 636779895, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1861, 898173826, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1862, 176774232, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1863, 872263306, 60);
insert into TEAM (teamid, driverid, ambulanceid)
values (1864, 700503030, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1865, 167740156, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1866, 496193368, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1867, 636779895, 32);
insert into TEAM (teamid, driverid, ambulanceid)
values (1868, 636779895, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1869, 403572395, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1870, 582288347, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1871, 404710571, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1872, 314282226, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1873, 400991846, 66);
insert into TEAM (teamid, driverid, ambulanceid)
values (1874, 180330027, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1875, 338863696, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1876, 146697918, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1877, 917310078, 13);
insert into TEAM (teamid, driverid, ambulanceid)
values (1878, 181904208, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1879, 747675635, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1880, 734777659, 9);
insert into TEAM (teamid, driverid, ambulanceid)
values (1881, 153284087, 73);
insert into TEAM (teamid, driverid, ambulanceid)
values (1882, 900165540, 85);
insert into TEAM (teamid, driverid, ambulanceid)
values (1883, 847641651, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1884, 239898165, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1885, 636779895, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1886, 957206959, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1887, 594117908, 62);
insert into TEAM (teamid, driverid, ambulanceid)
values (1888, 658708922, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1889, 190928615, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1890, 395587864, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1891, 916377545, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1892, 443429683, 1);
insert into TEAM (teamid, driverid, ambulanceid)
values (1893, 559419880, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1894, 692033847, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1895, 988874118, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1896, 543717343, 48);
insert into TEAM (teamid, driverid, ambulanceid)
values (1897, 338863696, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1898, 872263306, 41);
insert into TEAM (teamid, driverid, ambulanceid)
values (1899, 621340115, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1900, 917310078, 93);
commit;
prompt 1900 records committed...
insert into TEAM (teamid, driverid, ambulanceid)
values (1901, 860455901, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1902, 325751247, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1903, 803965269, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1904, 990692024, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1905, 734777659, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1906, 496193368, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1907, 443429683, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1908, 717029668, 42);
insert into TEAM (teamid, driverid, ambulanceid)
values (1909, 453472980, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1910, 181904208, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1911, 338863696, 95);
insert into TEAM (teamid, driverid, ambulanceid)
values (1912, 662127500, 86);
insert into TEAM (teamid, driverid, ambulanceid)
values (1913, 635885867, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1914, 488848745, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1915, 700503030, 21);
insert into TEAM (teamid, driverid, ambulanceid)
values (1916, 990692024, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1917, 403572395, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1918, 917310078, 5);
insert into TEAM (teamid, driverid, ambulanceid)
values (1919, 594117908, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1920, 900165540, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1921, 658708922, 8);
insert into TEAM (teamid, driverid, ambulanceid)
values (1922, 404710571, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1923, 404710571, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1924, 496193368, 71);
insert into TEAM (teamid, driverid, ambulanceid)
values (1925, 662127500, 81);
insert into TEAM (teamid, driverid, ambulanceid)
values (1926, 916377545, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1927, 799285930, 70);
insert into TEAM (teamid, driverid, ambulanceid)
values (1928, 769449049, 43);
insert into TEAM (teamid, driverid, ambulanceid)
values (1929, 734777659, 45);
insert into TEAM (teamid, driverid, ambulanceid)
values (1930, 887348713, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1931, 387617908, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1932, 437910872, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1933, 190928615, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1934, 543717343, 49);
insert into TEAM (teamid, driverid, ambulanceid)
values (1935, 180330027, 11);
insert into TEAM (teamid, driverid, ambulanceid)
values (1936, 499031759, 40);
insert into TEAM (teamid, driverid, ambulanceid)
values (1937, 799285930, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1938, 978580609, 28);
insert into TEAM (teamid, driverid, ambulanceid)
values (1939, 847641651, 80);
insert into TEAM (teamid, driverid, ambulanceid)
values (1940, 400991846, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1941, 728648267, 57);
insert into TEAM (teamid, driverid, ambulanceid)
values (1942, 464254148, 39);
insert into TEAM (teamid, driverid, ambulanceid)
values (1943, 146697918, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1944, 176774232, 12);
insert into TEAM (teamid, driverid, ambulanceid)
values (1945, 180330027, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1946, 496193368, 22);
insert into TEAM (teamid, driverid, ambulanceid)
values (1947, 830156782, 83);
insert into TEAM (teamid, driverid, ambulanceid)
values (1948, 995758728, 6);
insert into TEAM (teamid, driverid, ambulanceid)
values (1949, 731042839, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (1950, 658708922, 67);
insert into TEAM (teamid, driverid, ambulanceid)
values (1951, 747675635, 33);
insert into TEAM (teamid, driverid, ambulanceid)
values (1952, 823922225, 26);
insert into TEAM (teamid, driverid, ambulanceid)
values (1953, 453472980, 53);
insert into TEAM (teamid, driverid, ambulanceid)
values (1954, 700503030, 50);
insert into TEAM (teamid, driverid, ambulanceid)
values (1955, 153284087, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1956, 396257560, 100);
insert into TEAM (teamid, driverid, ambulanceid)
values (1957, 206068476, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1958, 978580609, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1959, 747675635, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1960, 112802719, 64);
insert into TEAM (teamid, driverid, ambulanceid)
values (1961, 636779895, 35);
insert into TEAM (teamid, driverid, ambulanceid)
values (1962, 823922225, 93);
insert into TEAM (teamid, driverid, ambulanceid)
values (1963, 294766103, 55);
insert into TEAM (teamid, driverid, ambulanceid)
values (1964, 858098492, 38);
insert into TEAM (teamid, driverid, ambulanceid)
values (1965, 636779895, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1966, 562992520, 19);
insert into TEAM (teamid, driverid, ambulanceid)
values (1967, 153284087, 87);
insert into TEAM (teamid, driverid, ambulanceid)
values (1968, 594117908, 10);
insert into TEAM (teamid, driverid, ambulanceid)
values (1969, 859486697, 75);
insert into TEAM (teamid, driverid, ambulanceid)
values (1970, 348530484, 25);
insert into TEAM (teamid, driverid, ambulanceid)
values (1971, 916377545, 54);
insert into TEAM (teamid, driverid, ambulanceid)
values (1972, 898173826, 17);
insert into TEAM (teamid, driverid, ambulanceid)
values (1973, 176774232, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1974, 167740156, 37);
insert into TEAM (teamid, driverid, ambulanceid)
values (1975, 830156782, 56);
insert into TEAM (teamid, driverid, ambulanceid)
values (1976, 348530484, 47);
insert into TEAM (teamid, driverid, ambulanceid)
values (1977, 662127500, 94);
insert into TEAM (teamid, driverid, ambulanceid)
values (1978, 877579988, 2);
insert into TEAM (teamid, driverid, ambulanceid)
values (1979, 562992520, 72);
insert into TEAM (teamid, driverid, ambulanceid)
values (1980, 898173826, 30);
insert into TEAM (teamid, driverid, ambulanceid)
values (1981, 799285930, 82);
insert into TEAM (teamid, driverid, ambulanceid)
values (1982, 705182536, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1983, 803965269, 3);
insert into TEAM (teamid, driverid, ambulanceid)
values (1984, 464254148, 51);
insert into TEAM (teamid, driverid, ambulanceid)
values (1985, 717029668, 18);
insert into TEAM (teamid, driverid, ambulanceid)
values (1986, 630702383, 61);
insert into TEAM (teamid, driverid, ambulanceid)
values (1987, 973586654, 78);
insert into TEAM (teamid, driverid, ambulanceid)
values (1988, 582288347, 59);
insert into TEAM (teamid, driverid, ambulanceid)
values (1989, 594117908, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1990, 400991846, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1991, 167740156, 14);
insert into TEAM (teamid, driverid, ambulanceid)
values (1992, 325751247, 84);
insert into TEAM (teamid, driverid, ambulanceid)
values (1993, 621340115, 24);
insert into TEAM (teamid, driverid, ambulanceid)
values (1994, 130019706, 7);
insert into TEAM (teamid, driverid, ambulanceid)
values (1995, 705182536, 36);
insert into TEAM (teamid, driverid, ambulanceid)
values (1996, 898173826, 68);
insert into TEAM (teamid, driverid, ambulanceid)
values (1997, 395587864, 65);
insert into TEAM (teamid, driverid, ambulanceid)
values (1998, 747675635, 76);
insert into TEAM (teamid, driverid, ambulanceid)
values (1999, 130019706, 46);
insert into TEAM (teamid, driverid, ambulanceid)
values (2000, 543717343, 88);
commit;
prompt 2000 records loaded
prompt Loading PARTICIPANTPARAMEDIC...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (764, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (253, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (161, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (25, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (386, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1292, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (254, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (707, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (892, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (402, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1594, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1101, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (680, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (623, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (538, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (579, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1427, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (30, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1936, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (626, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1133, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (175, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1511, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1984, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (316, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1819, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1354, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (837, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1868, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1312, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1589, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (517, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1535, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (672, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (822, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1022, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (896, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (305, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (968, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1725, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1876, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (978, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (162, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1085, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (630, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (140, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1805, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (141, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (991, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1310, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (277, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1428, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1899, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1556, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1167, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1312, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (442, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1960, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1919, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1794, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1409, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1076, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1446, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1426, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1814, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (191, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (260, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (435, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1349, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1271, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1878, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1019, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1616, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1425, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (457, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (276, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1586, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (259, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (747, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (208, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1010, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (513, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1201, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1633, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1305, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1573, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (35, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1076, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1551, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1470, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1647, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1293, 923469386);
commit;
prompt 100 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (946, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1760, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1423, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1686, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1115, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (355, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (36, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1372, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1972, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1613, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (857, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1607, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (478, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (746, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (374, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (797, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1508, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1508, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (135, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1145, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (971, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1302, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1234, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1836, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (258, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1172, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (433, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1996, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1933, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1334, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1880, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1167, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1631, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1096, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1142, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1204, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (357, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (557, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1468, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1438, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (388, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1891, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (277, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1693, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (473, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (667, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (75, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (660, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1768, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (557, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1386, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (738, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1993, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1443, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (174, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (322, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (541, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (790, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (399, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (540, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (178, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (39, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1720, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1368, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1004, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (246, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (422, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (573, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (184, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1345, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (953, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (304, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1033, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (94, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1212, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (350, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1280, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1751, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (437, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1315, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (471, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (374, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (891, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (430, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1163, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1000, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (418, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (18, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1471, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1919, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (474, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (972, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (85, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (453, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (868, 484030461);
commit;
prompt 200 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (902, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (459, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1633, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (688, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1291, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1695, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (755, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (178, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1975, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (170, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1219, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1830, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (550, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (339, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1908, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1486, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (613, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1050, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1641, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1568, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (531, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1242, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (936, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1825, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (297, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1242, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1363, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1180, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (973, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1203, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (648, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (85, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (668, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (340, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (92, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1342, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1733, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (98, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1704, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (910, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1249, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (668, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (887, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (143, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (643, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1489, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1206, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1030, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1370, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (928, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1587, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1838, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1986, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1129, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1703, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1773, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (849, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1497, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (987, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (278, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (438, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (802, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1269, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (947, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1310, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1913, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1036, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (72, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1667, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1148, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1318, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1807, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (559, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (259, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1204, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1964, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (708, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1034, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (975, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (429, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (958, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (531, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (866, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (207, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (344, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (931, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1453, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1088, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1801, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (19, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1668, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1940, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1476, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (290, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (430, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1630, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1689, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (677, 858806514);
commit;
prompt 300 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1910, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1498, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (912, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (418, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (849, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (904, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (500, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (914, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1105, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (673, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (329, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1145, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1861, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1785, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (899, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1406, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1612, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (510, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1927, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1480, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1103, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (78, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1885, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (135, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (570, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (40, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1591, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (435, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (404, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1000, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1990, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (670, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1473, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1102, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (527, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1788, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1928, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1369, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1605, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (84, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1440, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (443, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1734, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1054, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (744, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (482, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1175, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1200, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (472, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (692, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (262, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1319, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (799, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1045, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (733, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1601, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1076, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1197, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (681, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1366, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1095, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (33, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1127, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1416, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1832, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (224, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1018, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (658, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1060, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1074, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1507, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (85, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1790, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1184, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (516, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (917, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1744, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1535, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (835, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (939, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (962, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1284, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1888, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (73, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1093, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (89, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1842, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1012, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1313, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (56, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1480, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1312, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1825, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (123, 151224001);
commit;
prompt 400 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (253, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1210, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1588, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (17, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (978, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1147, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (307, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1805, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (16, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1016, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1307, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (462, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (826, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1281, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1677, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1031, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (674, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (433, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1869, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (708, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1521, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (254, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1822, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1303, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (691, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (579, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1944, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1179, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (169, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (284, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1160, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1781, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1255, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1395, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1416, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (428, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (393, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (693, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1824, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1736, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (612, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1949, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (416, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1655, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (608, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (773, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1536, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (140, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1439, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (100, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (850, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (443, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (848, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (293, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1981, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1033, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1218, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1873, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (773, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (136, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1140, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1179, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (905, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (615, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (833, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (769, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1212, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1880, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1375, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1867, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (67, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1853, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1463, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (317, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (660, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (209, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1245, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1866, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (28, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (535, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (177, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1352, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (388, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (463, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (869, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (767, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (488, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (755, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1420, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (169, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (186, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (782, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (617, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (46, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (801, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (485, 112802719);
commit;
prompt 500 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1633, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1561, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (158, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (624, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1118, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1371, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (201, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (768, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1278, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1664, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (516, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (936, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1614, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1885, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1512, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (986, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (958, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1593, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (744, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (969, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1194, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1176, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1209, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1700, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1298, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1067, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (406, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (803, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (694, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1479, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (494, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (351, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (961, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1422, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1521, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1289, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1694, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1406, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1507, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (364, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1836, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1604, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1536, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (795, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1018, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1398, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1879, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (271, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (798, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (817, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1955, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1264, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1824, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (179, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (675, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1795, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1634, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (263, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (642, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (409, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1162, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1096, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1972, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1783, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (884, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1374, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1748, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (954, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (569, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (503, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1089, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (180, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (675, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1273, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1356, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1141, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (967, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1413, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1099, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (159, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (469, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (986, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1510, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (539, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1763, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (582, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (678, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1819, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (343, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1447, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1244, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1107, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (736, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (268, 349127247);
commit;
prompt 600 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1298, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (374, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (172, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1626, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (487, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (720, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (444, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (383, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1682, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (79, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (386, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1689, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1269, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (542, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (979, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (68, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1302, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1081, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1448, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (878, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1234, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1783, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (512, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (641, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1090, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (744, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1239, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1326, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1029, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1798, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (908, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1548, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (870, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1816, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (284, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1591, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (992, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (810, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1071, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (212, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (860, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1333, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1421, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1427, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (841, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (425, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1870, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (499, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (462, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1204, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (941, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (523, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1643, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (951, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1967, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1884, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (696, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (371, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (201, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (320, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (152, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1069, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1674, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1323, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1396, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (157, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (305, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (182, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (760, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (480, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1488, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1386, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1716, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1732, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1546, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1855, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (109, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1925, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1392, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (215, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1673, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1438, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (527, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (483, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1785, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (972, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (699, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (148, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1566, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1290, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (239, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1532, 946726018);
commit;
prompt 700 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (328, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (773, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1718, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (254, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (729, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (394, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1778, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1981, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (867, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1306, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (345, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (224, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1568, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (12, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1486, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1242, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1507, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1686, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1222, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (526, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1691, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (838, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1663, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1540, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1018, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1509, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (556, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1047, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1338, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1081, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (174, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (398, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1027, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1626, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (248, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (171, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1571, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (154, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1926, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (171, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (661, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (520, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1550, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1782, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (697, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1582, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1538, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1279, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1732, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (164, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1896, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1284, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1382, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (17, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (849, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (387, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (135, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (849, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (194, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (195, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (742, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1455, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (189, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1508, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1852, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (721, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1678, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1889, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (798, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1736, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1823, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (4, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (130, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (868, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1337, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (311, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1734, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1855, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (526, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (555, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1914, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (516, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1787, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1979, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (805, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (41, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1952, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1323, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1167, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1459, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (139, 562452670);
commit;
prompt 800 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (723, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (863, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1655, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (46, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1030, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1965, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1000, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (865, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (767, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (487, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (620, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (831, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (695, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (736, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1278, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (19, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (298, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1886, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1965, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (207, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1637, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1644, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1435, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (443, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (332, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1801, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (116, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (699, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1927, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1040, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (458, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (435, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1416, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (490, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (336, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1345, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (367, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (964, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1197, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (545, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (228, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1439, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1484, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (866, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1910, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1112, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (252, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1815, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1370, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1164, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (492, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (76, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (122, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1989, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (953, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (588, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1808, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (286, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1440, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (98, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (617, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1433, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1849, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (752, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (551, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1219, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (181, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1434, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1507, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (933, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (957, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (232, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1906, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (346, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (493, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (55, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1046, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1264, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1702, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1283, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1325, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1396, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1297, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (296, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1426, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (644, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1047, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1324, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1717, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1248, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1697, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (887, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (626, 937543521);
commit;
prompt 900 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (850, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1630, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (491, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (465, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (167, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1524, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1212, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (240, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (477, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (863, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (976, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (418, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1517, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1793, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (305, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (962, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (743, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1298, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1146, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (278, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (667, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1665, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (769, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1674, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (851, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1798, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1318, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1894, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (753, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (574, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (393, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (977, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (150, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1065, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1774, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (286, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1231, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (958, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (916, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1198, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (770, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (760, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1922, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1613, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (916, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1613, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1152, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (95, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (609, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (753, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1454, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1630, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1630, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (577, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1017, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1015, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1261, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1347, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (855, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1868, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1583, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1510, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (907, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1266, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1393, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1650, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (774, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (8, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (744, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (62, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1069, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (497, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (118, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1951, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1402, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (256, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (216, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (256, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1065, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (374, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (99, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1846, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1720, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1612, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (858, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (722, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (421, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1870, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1503, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (782, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (430, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1752, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1473, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (584, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1351, 872649579);
commit;
prompt 1000 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1438, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1475, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1427, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (317, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1284, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (972, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1897, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1307, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1755, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1858, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1997, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1802, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1658, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1878, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (209, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1563, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (975, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (387, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1541, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1699, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1718, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1740, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (191, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1373, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1410, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (846, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (119, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1188, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1072, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (590, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1798, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (538, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1976, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1458, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (168, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1723, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1597, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (83, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (377, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1330, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1061, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (320, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (892, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1257, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (227, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (27, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (863, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (169, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (844, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (795, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (339, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1323, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1692, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (361, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1222, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (580, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (884, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1930, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (373, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (37, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (776, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1124, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1345, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1298, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1516, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (557, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (734, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (350, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1209, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (35, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1165, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (85, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (711, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (378, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (892, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (427, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1046, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (32, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (102, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1449, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (338, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1419, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (20, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (37, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1841, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (85, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1096, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1002, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1366, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (844, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1006, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1958, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1631, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1727, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (777, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (928, 845149407);
commit;
prompt 1100 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1638, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (953, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1222, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1419, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (515, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (34, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (750, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1045, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (367, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1113, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1779, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1977, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1503, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1723, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1785, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1023, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1179, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (966, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1318, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1646, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (582, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (537, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1655, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (126, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (466, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1646, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1431, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1666, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (50, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1225, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1938, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (131, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (627, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (991, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1324, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1591, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1480, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1888, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (526, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1540, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (42, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1726, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (797, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1071, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (778, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (42, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (791, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (650, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (720, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (798, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (52, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1128, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (757, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (705, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1111, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (379, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1561, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1175, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (224, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1555, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (120, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1890, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (720, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (983, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (914, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (6, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (988, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1667, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1704, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (976, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1079, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (432, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1951, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (997, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1936, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (681, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1857, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1089, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (783, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (38, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (787, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1948, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (87, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1811, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1473, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1282, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (556, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (116, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1319, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (575, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (29, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1058, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1867, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1567, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1110, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (74, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (221, 610736791);
commit;
prompt 1200 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (725, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (233, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1014, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (120, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1173, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1441, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1591, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (357, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (507, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (428, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (161, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (291, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (482, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (121, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (251, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1776, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (97, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1474, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1178, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (496, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (490, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1760, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (911, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (599, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (564, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (610, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (596, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1890, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (967, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1525, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (346, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (661, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (698, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1010, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1664, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1338, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (482, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (539, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1891, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (934, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (816, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1300, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (392, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1129, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1932, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1514, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (105, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1110, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1836, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (241, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1533, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1356, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (30, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (84, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1471, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1772, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (576, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1631, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (870, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1894, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1683, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (260, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (136, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1959, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1384, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1238, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (151, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (284, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (367, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (548, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (561, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1998, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (760, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1925, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (778, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (969, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (600, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (636, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (571, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (603, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1841, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (631, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (189, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1120, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (905, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1098, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (646, 870409642);
commit;
prompt 1300 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (897, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (644, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1842, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (432, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (870, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1991, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1082, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (921, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (881, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (428, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1263, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (872, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (792, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (911, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1578, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (494, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (909, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1548, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (26, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (838, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (857, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1234, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1262, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (790, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1851, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (740, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1691, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (12, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (758, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (334, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1485, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (548, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (231, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1206, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (33, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1055, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (472, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1504, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1008, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1656, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (615, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1009, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1073, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1421, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1746, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (421, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (205, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (475, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1531, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1284, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1639, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (727, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (481, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (523, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1449, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1223, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1843, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1615, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1740, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (133, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1103, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (381, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1480, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1347, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1131, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1406, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (941, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1715, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1078, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1782, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (895, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (62, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1260, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (740, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1838, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (585, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1581, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (959, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1894, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (765, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (352, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (939, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (537, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (298, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (115, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1108, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1726, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1207, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1803, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (25, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (884, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1541, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (198, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (502, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (58, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1539, 103384022);
commit;
prompt 1400 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (369, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1426, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (732, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (437, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (433, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (618, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (258, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (456, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (273, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (972, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1942, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (658, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1211, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (87, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1617, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1555, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1041, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1593, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (187, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (683, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1383, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1043, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (796, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1799, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1663, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1418, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (618, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1707, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1721, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (268, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1278, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (707, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1041, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (475, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1893, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (668, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (603, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (633, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (743, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (728, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1370, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1069, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1559, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (621, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1385, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1470, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (445, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1620, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1510, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (154, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1419, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1117, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1776, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (583, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (365, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (913, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (578, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1214, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (454, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1826, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (250, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1120, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (489, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (666, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (241, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (957, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1954, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (276, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1537, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (983, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (665, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1875, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1390, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (699, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1763, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1716, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (268, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (987, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1853, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (991, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1027, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1654, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1344, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1144, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (229, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1876, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1690, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1852, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (379, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (776, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1020, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (899, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1125, 549653270);
commit;
prompt 1500 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (679, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (938, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1633, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1464, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (638, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1538, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1268, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1110, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (640, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (747, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1116, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1930, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (721, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (569, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (835, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1611, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1875, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1000, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (125, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1625, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (130, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (870, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1172, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (358, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (685, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (991, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1939, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (870, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1849, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (198, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1240, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1751, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (427, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (19, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1439, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (602, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (736, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1965, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (774, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (138, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1238, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1453, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1309, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (802, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (343, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (505, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (720, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (592, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (111, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (420, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (476, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1580, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1638, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (534, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (927, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1631, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (196, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1824, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (507, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1666, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (702, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1793, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1774, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1852, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (993, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (815, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1292, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1129, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (975, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1329, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (615, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (182, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (474, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1966, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (297, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (987, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1808, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1902, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (780, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (977, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1985, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1837, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (907, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1835, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1605, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (58, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (915, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (927, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (401, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1910, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1280, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1707, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1637, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1827, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (373, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1132, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (423, 112802719);
commit;
prompt 1600 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1868, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1311, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1531, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1672, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1427, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (799, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1242, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (833, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1493, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1678, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (187, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1241, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (536, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (88, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1076, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (104, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (23, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1265, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (226, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1103, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1547, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1958, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (13, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1624, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1596, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1468, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (617, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1937, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1323, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1363, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1072, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1626, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1564, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (761, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1126, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (648, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1670, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (742, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1793, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (94, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1584, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1322, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (462, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (435, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (448, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (173, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1339, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (230, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1194, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (628, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (370, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (374, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1835, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1014, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1601, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1157, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (569, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1952, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (940, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1690, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (910, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (228, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1442, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1484, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (149, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1754, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1660, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1619, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (637, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (413, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (444, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1227, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1656, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1508, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1357, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1441, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1768, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1534, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1500, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1889, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (279, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1274, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (593, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (462, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1776, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1401, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1824, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (224, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1966, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (621, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (582, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1837, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (996, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1017, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1702, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (718, 540162175);
commit;
prompt 1700 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (134, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (965, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1581, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1660, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1313, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1710, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (542, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1717, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1297, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1560, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1805, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (722, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (477, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1714, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1097, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1417, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (288, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (882, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1218, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1251, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (505, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1219, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1601, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1641, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1159, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1236, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1115, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (780, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1178, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1241, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (16, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (958, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (450, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1452, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (532, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1971, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (747, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (292, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1311, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1660, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (113, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (865, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (903, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (959, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (591, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1517, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1027, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (903, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (11, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1616, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (86, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1433, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1704, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (517, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1223, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1846, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (728, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (622, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (496, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (192, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1503, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (41, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (65, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1732, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (235, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1343, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1484, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1368, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1904, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (354, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (998, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (636, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (685, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (997, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1581, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1602, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (177, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1058, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (984, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1930, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (260, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (397, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1586, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (572, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1824, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1747, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1162, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (620, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (10, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1614, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1821, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (505, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1474, 416584030);
commit;
prompt 1800 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1773, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (875, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (281, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (607, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (363, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (985, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1932, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1680, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (982, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1983, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1361, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (595, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (317, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (725, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (717, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1597, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1138, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (74, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (360, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (459, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1986, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (48, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1080, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (536, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1120, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1877, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (155, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1678, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1468, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1730, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (618, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1773, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1197, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1071, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (137, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (919, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1919, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1642, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1531, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (214, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (508, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1063, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (906, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1174, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (554, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1070, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1418, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1777, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1435, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (362, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (654, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1131, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1018, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (91, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1652, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (766, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1981, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1958, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1533, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (551, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1764, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (949, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1760, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1242, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (691, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (33, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1642, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (425, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1429, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1792, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (402, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (283, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (634, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1359, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (433, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (193, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (232, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (698, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1954, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1514, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (460, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1802, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (153, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (188, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (347, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (704, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1488, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (63, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1116, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (600, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1840, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (434, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1688, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1857, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1653, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1724, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (895, 515597665);
commit;
prompt 1900 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1522, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1260, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (191, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1550, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (547, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1876, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1904, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (942, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1988, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1614, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1732, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (594, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1053, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (567, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (199, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1652, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1765, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1502, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (964, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1897, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (257, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (183, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (926, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (381, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (690, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1328, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1688, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (173, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1254, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1822, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (51, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1324, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1719, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1452, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1354, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (583, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (382, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1955, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1700, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1594, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1644, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (504, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (289, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1915, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (556, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (707, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1465, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (587, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1394, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1124, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1661, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1231, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1301, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (186, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (356, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1788, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1547, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1741, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (645, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (865, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1217, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1438, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (724, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1709, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (419, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1286, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (880, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (901, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (947, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1830, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (337, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (885, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (234, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (873, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (442, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1361, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (220, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1084, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (363, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1856, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (642, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (315, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1196, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (351, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (954, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1558, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (699, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1553, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (864, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (514, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (641, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (770, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1512, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (793, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (787, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1433, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1252, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (741, 724032270);
commit;
prompt 2000 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1503, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (226, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (80, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1885, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (984, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1853, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (670, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1012, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1113, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1418, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (44, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1864, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1938, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (445, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1865, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (463, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (780, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (507, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1357, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (63, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1962, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (492, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (845, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1721, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1166, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1490, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1924, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (500, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (411, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1303, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (253, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1286, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1662, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (581, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (971, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (247, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1056, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (585, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (741, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1900, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1763, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (577, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (418, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1811, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1459, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (824, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (345, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (441, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1242, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (263, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1502, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (348, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1653, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1862, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (712, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1523, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1675, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1946, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1814, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (992, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (231, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (225, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (991, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1065, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (689, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1733, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1797, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (575, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1620, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1873, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1229, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (724, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1187, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (84, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1431, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1573, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1155, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (134, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1014, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1139, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1035, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (7, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1129, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (592, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (429, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1298, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (922, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1567, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (492, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (425, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1630, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (470, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (423, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1922, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1777, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (982, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1914, 354589284);
commit;
prompt 2100 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (61, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1996, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1194, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (833, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (97, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (282, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1731, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1426, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (99, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1785, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (555, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (332, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (848, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1540, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (207, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (76, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (284, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (214, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (315, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (574, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1333, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1276, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (789, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1109, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1411, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (791, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (651, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (941, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1568, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1833, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (480, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (537, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1244, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1535, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (487, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1422, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (658, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (751, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (215, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (664, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (820, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (352, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1863, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1980, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1168, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1234, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1461, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (404, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (313, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1934, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1506, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (65, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1462, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1938, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1987, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1491, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1244, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1332, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (287, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1903, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1876, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1523, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1406, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1421, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (302, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (325, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (718, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1733, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (890, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1434, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (979, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1386, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1756, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (541, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (967, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1707, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (719, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (55, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1744, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1341, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (868, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (463, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (541, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1424, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1765, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (310, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (269, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1373, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (269, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (803, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (659, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1304, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (983, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1042, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1020, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1079, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (333, 701718916);
commit;
prompt 2200 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1876, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (628, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1966, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (261, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (382, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (738, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (941, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1554, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (974, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (218, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1600, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (793, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (815, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1702, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1745, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (38, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1343, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1456, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (122, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1670, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1739, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (294, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1564, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1908, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (654, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1181, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1615, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1120, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (438, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (772, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (910, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1237, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (692, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1334, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (656, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (759, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1570, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1075, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (739, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1396, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1686, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (86, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (456, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (330, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (666, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1864, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (96, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (311, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (789, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1769, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (102, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (392, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (390, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (323, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1759, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1068, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (352, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (263, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1245, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1925, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (313, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (760, 990720667);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1894, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1651, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1616, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1900, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (205, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (324, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (637, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1795, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1476, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (330, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1730, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (306, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1075, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1909, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1803, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1316, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1320, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (521, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (148, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1977, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1636, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (122, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (290, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (436, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (159, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (876, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (508, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1432, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (469, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (149, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1260, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (450, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1112, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (263, 502125849);
commit;
prompt 2300 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (737, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (757, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1058, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (600, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1933, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (398, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1354, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1451, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (338, 549586947);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1610, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1016, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1448, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (796, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1860, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1907, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (655, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (207, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (272, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1561, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1173, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (665, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (45, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1634, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (372, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (218, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1975, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (745, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1254, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1728, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (328, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (390, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (517, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (921, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1657, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (113, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (740, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1255, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1091, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1163, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1905, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (446, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (502, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1582, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (136, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1920, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (704, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1188, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (204, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1275, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1182, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1669, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1339, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (7, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (639, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (935, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1982, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (48, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1156, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (826, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (270, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1427, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (209, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1370, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (252, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1794, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (372, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (766, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1570, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1213, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (64, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1595, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1704, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1888, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1436, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1991, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1167, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (142, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1881, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1432, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (331, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1024, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1174, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1158, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1876, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1540, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (233, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1214, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (865, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (503, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1504, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (118, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (443, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1022, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (973, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1156, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1161, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1601, 933936995);
commit;
prompt 2400 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1805, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1296, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1924, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1873, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1603, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (735, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (566, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (951, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1295, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1064, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (52, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (414, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1648, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (62, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (298, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1911, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1116, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1621, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1387, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1038, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1259, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1817, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1944, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (149, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1844, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (854, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1321, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (473, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1831, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1203, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1994, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (513, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1711, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1781, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1913, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1807, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (43, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1531, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1854, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (628, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (615, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1401, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (420, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (296, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1244, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1549, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1329, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (124, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1938, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1589, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (500, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (706, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1441, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (744, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (8, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (970, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (869, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1449, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1696, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1931, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (470, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1375, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1275, 558389833);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (606, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (465, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1542, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (183, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1591, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (674, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (612, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (999, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1607, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1436, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1739, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (149, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1436, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (411, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (766, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1716, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (925, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (863, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1200, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1622, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (228, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (58, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (912, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1115, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (825, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (459, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (151, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (155, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1035, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1723, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1863, 766186615);
commit;
prompt 2500 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (376, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (43, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (20, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1726, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1691, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (299, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1604, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1122, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1285, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (849, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (419, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (188, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1479, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1426, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1740, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (582, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (776, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (26, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1861, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1527, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1071, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1502, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (222, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1810, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (774, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (530, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (415, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (192, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1535, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (789, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (257, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (977, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1949, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1819, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (671, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (431, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (113, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1376, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (146, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (145, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1564, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (147, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1533, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (598, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1168, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1679, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1752, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (190, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1390, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (490, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1983, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (562, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1984, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (566, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (97, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1083, 387617908);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1020, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (376, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (815, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (529, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (16, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (788, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1056, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (970, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1104, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (264, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1923, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1283, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (821, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1693, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1307, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (288, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (531, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (829, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1117, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1509, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1465, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1135, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1563, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (389, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1677, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1498, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (168, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1899, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (48, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1802, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1784, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1336, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1720, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (833, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (871, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (333, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (418, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (777, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (979, 229688953);
commit;
prompt 2600 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1555, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (929, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (253, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (614, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (62, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1842, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1584, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1246, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1833, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1012, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1596, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (800, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1007, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (830, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1763, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1636, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1095, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (520, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (72, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1345, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1107, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1228, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (854, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1360, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (101, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (385, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1311, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1342, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (787, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (559, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1529, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (200, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1326, 562452670);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (321, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1883, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1407, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1379, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (240, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (667, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1988, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1648, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (704, 707736586);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1341, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1252, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1873, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (422, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (164, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (899, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (958, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (687, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (27, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1061, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (908, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (670, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1007, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1849, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1411, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1775, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1263, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1518, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (32, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (619, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1535, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1261, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (38, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (640, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1292, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (629, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1849, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (323, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (487, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (111, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (59, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (946, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1098, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (395, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1624, 706061824);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1379, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (591, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1523, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (286, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (18, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1701, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1514, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1532, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (877, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (904, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1161, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (427, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1639, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1230, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1596, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1171, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1222, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1281, 190488653);
commit;
prompt 2700 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1821, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (654, 515597665);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1027, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (123, 174417979);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1282, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (352, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1767, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1883, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1406, 860924791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1995, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (39, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1708, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1349, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (788, 922110846);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1086, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1101, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1056, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (512, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (802, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1218, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1496, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (227, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1504, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1177, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (71, 360983983);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (210, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1908, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (355, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (519, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (511, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (619, 540162175);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1635, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (487, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1218, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1583, 509412899);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1639, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1298, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (509, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1158, 795573633);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1579, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1336, 253060937);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1316, 753370607);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (816, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (742, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1053, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (619, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1466, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (591, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1615, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1361, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1404, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1500, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1153, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (995, 476938290);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1884, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (107, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (659, 634313584);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (652, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (323, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1293, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1491, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (930, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1120, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (791, 116429875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (515, 705325083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (315, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (109, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (415, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (862, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (224, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (628, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1912, 871521301);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (319, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (670, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1226, 937543521);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1450, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1337, 950757025);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (561, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (981, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (716, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (669, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (611, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (449, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (650, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (634, 396257560);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (888, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (244, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1802, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (978, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1230, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1308, 922325953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (500, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (783, 721900875);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (353, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (499, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (964, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1935, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1131, 393715774);
commit;
prompt 2800 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1082, 448133232);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1838, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1488, 247146261);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (239, 325534613);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (795, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (341, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (945, 357601745);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1620, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1300, 190488653);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1026, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (448, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1933, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1693, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1129, 872649579);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1569, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1439, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1226, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (81, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1026, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1345, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1197, 585111831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (679, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1886, 893119524);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (459, 393715774);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (873, 765542455);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (385, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (467, 842065450);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (557, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (192, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (382, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1810, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (494, 505893172);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (780, 904236564);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1430, 229688953);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (895, 496193368);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1112, 203221623);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1068, 923469386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (477, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1897, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1106, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (66, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1187, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1203, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (662, 716936353);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (279, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (895, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1137, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (717, 559419880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1254, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1176, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (321, 667920628);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1847, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1743, 131444269);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (46, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (650, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (778, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (502, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1785, 648974390);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (903, 112802719);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (520, 845149407);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1702, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (391, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (972, 549653270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (136, 608761880);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (978, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (648, 908089234);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (712, 384763687);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (120, 990692024);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (93, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (828, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1430, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1416, 127694387);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (234, 108614791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1016, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1984, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (50, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1927, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1058, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1518, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1394, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1583, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (136, 180330027);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (813, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (51, 781552572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (663, 867477632);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1965, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (271, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1370, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1472, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1622, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (518, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (577, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1580, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1990, 587299495);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1639, 502125849);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1544, 808935919);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (858, 853278241);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1835, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1025, 968089050);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1169, 322343561);
commit;
prompt 2900 records committed...
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1155, 884753922);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1505, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1863, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1393, 416584030);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (583, 888659851);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (253, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (235, 503328036);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (832, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (439, 946726018);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1188, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (852, 322492683);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (43, 660020838);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (747, 703098082);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1849, 561518796);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1406, 387721649);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (408, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (428, 933936995);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (401, 973586654);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1553, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (647, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (88, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1464, 151224001);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (520, 766186615);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (953, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1441, 717029668);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1560, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1332, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (756, 880620403);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1350, 943786572);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (185, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1668, 425149213);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (109, 800402035);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (495, 831396788);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (513, 484030461);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1344, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (699, 896607930);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (665, 321017966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1717, 184942157);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (416, 443730958);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (483, 555691338);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (678, 578410048);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (917, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1910, 724032270);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1953, 800505817);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (923, 280412141);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (759, 968414339);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1183, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (18, 610736791);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (527, 701718916);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (608, 927033834);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1894, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1522, 103384022);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1150, 728648267);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1379, 548160391);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (619, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (372, 858806514);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1400, 872263306);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1980, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (74, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (309, 322343561);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1880, 417925256);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1391, 710362941);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (975, 707562374);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1289, 885046351);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (852, 870409642);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (359, 363990311);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (519, 293770073);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1495, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (533, 681890386);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (725, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1484, 760996111);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (977, 347065963);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (11, 695997419);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (375, 719934083);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1965, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (909, 349127247);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (789, 354589284);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1809, 651588900);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1729, 792593323);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (481, 699202105);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (953, 407260966);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (343, 314282226);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1190, 299189594);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1405, 785948646);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1962, 401053950);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1936, 629817831);
insert into PARTICIPANTPARAMEDIC (teamid, paramedicid)
values (1022, 888659851);
commit;
prompt 2987 records loaded
prompt Loading VOLUNTEER...
insert into VOLUNTEER (volunteerid)
values (977504353);
insert into VOLUNTEER (volunteerid)
values (114114500);
insert into VOLUNTEER (volunteerid)
values (973586654);
insert into VOLUNTEER (volunteerid)
values (426434083);
insert into VOLUNTEER (volunteerid)
values (701718916);
insert into VOLUNTEER (volunteerid)
values (347065963);
insert into VOLUNTEER (volunteerid)
values (990692024);
insert into VOLUNTEER (volunteerid)
values (629129802);
insert into VOLUNTEER (volunteerid)
values (540162175);
insert into VOLUNTEER (volunteerid)
values (803965269);
insert into VOLUNTEER (volunteerid)
values (404567886);
insert into VOLUNTEER (volunteerid)
values (730641660);
insert into VOLUNTEER (volunteerid)
values (546599903);
insert into VOLUNTEER (volunteerid)
values (521268241);
insert into VOLUNTEER (volunteerid)
values (115254599);
insert into VOLUNTEER (volunteerid)
values (570675025);
insert into VOLUNTEER (volunteerid)
values (648666893);
insert into VOLUNTEER (volunteerid)
values (385229456);
insert into VOLUNTEER (volunteerid)
values (151879743);
insert into VOLUNTEER (volunteerid)
values (609785028);
insert into VOLUNTEER (volunteerid)
values (395506050);
insert into VOLUNTEER (volunteerid)
values (298592274);
insert into VOLUNTEER (volunteerid)
values (718616310);
insert into VOLUNTEER (volunteerid)
values (524183716);
insert into VOLUNTEER (volunteerid)
values (439634346);
insert into VOLUNTEER (volunteerid)
values (608761880);
insert into VOLUNTEER (volunteerid)
values (331550903);
insert into VOLUNTEER (volunteerid)
values (646029885);
insert into VOLUNTEER (volunteerid)
values (204535135);
insert into VOLUNTEER (volunteerid)
values (806488394);
insert into VOLUNTEER (volunteerid)
values (495654372);
insert into VOLUNTEER (volunteerid)
values (541080003);
insert into VOLUNTEER (volunteerid)
values (261117033);
insert into VOLUNTEER (volunteerid)
values (662127500);
insert into VOLUNTEER (volunteerid)
values (203658694);
insert into VOLUNTEER (volunteerid)
values (299189594);
insert into VOLUNTEER (volunteerid)
values (120452310);
insert into VOLUNTEER (volunteerid)
values (978802240);
insert into VOLUNTEER (volunteerid)
values (568287785);
insert into VOLUNTEER (volunteerid)
values (990042258);
insert into VOLUNTEER (volunteerid)
values (261847692);
insert into VOLUNTEER (volunteerid)
values (558776292);
insert into VOLUNTEER (volunteerid)
values (584907526);
insert into VOLUNTEER (volunteerid)
values (600321613);
insert into VOLUNTEER (volunteerid)
values (386933318);
insert into VOLUNTEER (volunteerid)
values (618968432);
insert into VOLUNTEER (volunteerid)
values (723873340);
insert into VOLUNTEER (volunteerid)
values (664144723);
insert into VOLUNTEER (volunteerid)
values (142491783);
insert into VOLUNTEER (volunteerid)
values (651588900);
insert into VOLUNTEER (volunteerid)
values (808356977);
insert into VOLUNTEER (volunteerid)
values (889666287);
insert into VOLUNTEER (volunteerid)
values (929094223);
insert into VOLUNTEER (volunteerid)
values (370237930);
insert into VOLUNTEER (volunteerid)
values (712830556);
insert into VOLUNTEER (volunteerid)
values (101190138);
insert into VOLUNTEER (volunteerid)
values (702962303);
insert into VOLUNTEER (volunteerid)
values (445696364);
insert into VOLUNTEER (volunteerid)
values (566353911);
insert into VOLUNTEER (volunteerid)
values (713656231);
insert into VOLUNTEER (volunteerid)
values (436154619);
insert into VOLUNTEER (volunteerid)
values (107860119);
insert into VOLUNTEER (volunteerid)
values (365347969);
insert into VOLUNTEER (volunteerid)
values (842443489);
insert into VOLUNTEER (volunteerid)
values (103011704);
insert into VOLUNTEER (volunteerid)
values (281175627);
insert into VOLUNTEER (volunteerid)
values (108074581);
insert into VOLUNTEER (volunteerid)
values (162894044);
insert into VOLUNTEER (volunteerid)
values (699202105);
insert into VOLUNTEER (volunteerid)
values (272662109);
insert into VOLUNTEER (volunteerid)
values (234936322);
insert into VOLUNTEER (volunteerid)
values (931077989);
insert into VOLUNTEER (volunteerid)
values (316108918);
insert into VOLUNTEER (volunteerid)
values (805462072);
insert into VOLUNTEER (volunteerid)
values (780133243);
insert into VOLUNTEER (volunteerid)
values (908169400);
insert into VOLUNTEER (volunteerid)
values (413193508);
insert into VOLUNTEER (volunteerid)
values (326146555);
insert into VOLUNTEER (volunteerid)
values (921040663);
insert into VOLUNTEER (volunteerid)
values (965774744);
insert into VOLUNTEER (volunteerid)
values (435380711);
insert into VOLUNTEER (volunteerid)
values (456084373);
insert into VOLUNTEER (volunteerid)
values (831509485);
insert into VOLUNTEER (volunteerid)
values (553883245);
insert into VOLUNTEER (volunteerid)
values (116884473);
insert into VOLUNTEER (volunteerid)
values (515597665);
insert into VOLUNTEER (volunteerid)
values (728690569);
insert into VOLUNTEER (volunteerid)
values (915470929);
insert into VOLUNTEER (volunteerid)
values (129533152);
insert into VOLUNTEER (volunteerid)
values (214921244);
insert into VOLUNTEER (volunteerid)
values (263179821);
insert into VOLUNTEER (volunteerid)
values (744494592);
insert into VOLUNTEER (volunteerid)
values (353702355);
insert into VOLUNTEER (volunteerid)
values (349048325);
insert into VOLUNTEER (volunteerid)
values (570259258);
commit;
prompt 95 records loaded
prompt Loading PARTICIPANTVOLUNTEER...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (393, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (541, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (547, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1292, 730641660);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1037, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (237, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (432, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (188, 261117033);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (827, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1889, 281175627);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (612, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1746, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1461, 929094223);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (484, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (625, 386933318);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (92, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (101, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (870, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (784, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (955, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (190, 151879743);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1143, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (843, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (364, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (928, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1656, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1289, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (971, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1383, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1662, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1266, 990692024);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (3, 806488394);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1221, 456084373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1568, 151879743);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1111, 651588900);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (834, 558776292);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (56, 651588900);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (829, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1526, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (189, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1438, 977504353);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1454, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1369, 701718916);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (959, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1451, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1146, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (73, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (660, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1951, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (61, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (691, 515597665);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1500, 570675025);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (414, 445696364);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1199, 977504353);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1558, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (85, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (423, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (412, 281175627);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (590, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (734, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (770, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (42, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (201, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (439, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1185, 129533152);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (182, 261847692);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (842, 990692024);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1431, 316108918);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (696, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1563, 261117033);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1172, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1381, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (605, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (67, 456084373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (852, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1228, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (99, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (864, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1961, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (623, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (472, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (169, 929094223);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1040, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1009, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1989, 349048325);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (635, 298592274);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1757, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (312, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1361, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (361, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (207, 151879743);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1275, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1855, 272662109);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1529, 386933318);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (821, 977504353);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1400, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (18, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (668, 977504353);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (916, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (524, 281175627);
commit;
prompt 100 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1039, 445696364);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (537, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1860, 108074581);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (20, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (725, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1641, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (865, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1620, 316108918);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (111, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1363, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1405, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1864, 664144723);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (685, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (731, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (259, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (174, 349048325);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (247, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (799, 921040663);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1182, 298592274);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (553, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1388, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (663, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1192, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (912, 272662109);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (597, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1098, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1492, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (16, 929094223);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1991, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1815, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1013, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (59, 540162175);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1670, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (353, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (581, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (864, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (695, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (588, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1710, 540162175);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1706, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (698, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (869, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (19, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (763, 540162175);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (112, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1784, 261847692);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1278, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (189, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1022, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1540, 990042258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (72, 456084373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (812, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (649, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (982, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1097, 101190138);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (463, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1456, 921040663);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (222, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1078, 316108918);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1918, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1878, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (909, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1310, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (478, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1673, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (108, 386933318);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (825, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1166, 204535135);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1910, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1819, 808356977);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (189, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1552, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1569, 808356977);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (106, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1919, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (200, 651588900);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (775, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1866, 413193508);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1522, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (747, 114114500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (649, 261847692);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1210, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1167, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1596, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1792, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1479, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1977, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1246, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1391, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (877, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (946, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1236, 114114500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (947, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1737, 921040663);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (484, 114114500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (724, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (632, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1404, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (581, 439634346);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (683, 977504353);
commit;
prompt 200 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (267, 261847692);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (747, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1607, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1727, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (933, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (298, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1720, 439634346);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1557, 298592274);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1195, 803965269);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (13, 808356977);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (920, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (42, 261117033);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1961, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (656, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1708, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1911, 831509485);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1963, 965774744);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (816, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (383, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1080, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1861, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1538, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (960, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (602, 730641660);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (972, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (587, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1713, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (242, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (631, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (339, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (341, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1671, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (163, 977504353);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1284, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1764, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1299, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1498, 456084373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1170, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (538, 701718916);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (715, 129533152);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (393, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1763, 558776292);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1900, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (768, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (293, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1230, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1434, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1262, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (808, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (156, 558776292);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1367, 101190138);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (283, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (824, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1178, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1485, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1147, 570675025);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (224, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (246, 915470929);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (675, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (973, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (254, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1513, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1094, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (886, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (495, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1842, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (965, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1837, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (474, 413193508);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (947, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1987, 558776292);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (54, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1891, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1152, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1389, 114114500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (117, 806488394);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1478, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (779, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (587, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1655, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (475, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1160, 990042258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (484, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1673, 114114500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (739, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1272, 540162175);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1387, 114114500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (500, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1474, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1548, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1363, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (585, 806488394);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (26, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (331, 413193508);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1584, 558776292);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (658, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1334, 570259258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (11, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1409, 115254599);
commit;
prompt 300 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1569, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (353, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (184, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (455, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1711, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (719, 990042258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (815, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1782, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1850, 349048325);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1655, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1906, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1596, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1609, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1992, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1786, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (570, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (566, 570675025);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1796, 664144723);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (31, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (794, 445696364);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1994, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1638, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1009, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (353, 413193508);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1207, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1477, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (42, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1520, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (549, 298592274);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1170, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (206, 803965269);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (584, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (992, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (613, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1742, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1300, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (373, 349048325);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1499, 261847692);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (106, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1959, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (244, 990692024);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (707, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (631, 831509485);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (91, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1356, 965774744);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1312, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1824, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (790, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1764, 456084373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1223, 386933318);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1283, 803965269);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (659, 515597665);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1555, 803965269);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1446, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (236, 921040663);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1388, 664144723);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (206, 204535135);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1966, 114114500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (717, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (951, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (565, 129533152);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1264, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1352, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (430, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1451, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1777, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (468, 261847692);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (900, 413193508);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1030, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1689, 730641660);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1338, 570259258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1994, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1283, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (503, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (646, 965774744);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1365, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (283, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1653, 803965269);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (653, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (291, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (529, 261847692);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1506, 730641660);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1226, 263179821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (428, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (211, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (908, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (411, 651588900);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (164, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (93, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1347, 263179821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (631, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1602, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (28, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1751, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (515, 515597665);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (161, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1093, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1906, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (341, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (813, 646029885);
commit;
prompt 400 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1350, 108074581);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (493, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1115, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (932, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1235, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1762, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1267, 272662109);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1780, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (567, 990692024);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (825, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (977, 990042258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (607, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1187, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1568, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (126, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1386, 965774744);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1219, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1201, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1865, 349048325);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (167, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (957, 651588900);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1421, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1818, 129533152);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1057, 831509485);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (373, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (208, 281175627);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (908, 316108918);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (825, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (262, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (242, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1800, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (133, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (995, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1944, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (982, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1394, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (911, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1149, 456084373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (459, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1248, 664144723);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (326, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1392, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1081, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1670, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1173, 261117033);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (832, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1489, 965774744);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1699, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (260, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1793, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (693, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1797, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (157, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (930, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (267, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1712, 730641660);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (24, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (176, 214921244);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1652, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (183, 108074581);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1401, 263179821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (225, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1382, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1002, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1972, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1132, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (214, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1161, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1903, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (916, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (223, 261117033);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1907, 540162175);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (781, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (939, 263179821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (961, 990042258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1165, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1947, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1139, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1618, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1862, 214921244);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (339, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1139, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1794, 456084373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (364, 808356977);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (234, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1305, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1957, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1002, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1389, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1353, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (582, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (498, 445696364);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1498, 129533152);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1582, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (909, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1002, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (260, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (724, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1335, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1764, 299189594);
commit;
prompt 500 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1081, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (431, 151879743);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1419, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1424, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (398, 651588900);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (374, 515597665);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1526, 272662109);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (931, 108074581);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (630, 831509485);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1978, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (83, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1086, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (746, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (777, 570259258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (467, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (713, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (474, 439634346);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1391, 151879743);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1520, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1445, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (115, 730641660);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1137, 261847692);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1682, 570259258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1149, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1999, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (253, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (753, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1964, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1558, 808356977);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (760, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1282, 101190138);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (974, 701718916);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (23, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1939, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1577, 929094223);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1494, 281175627);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (750, 413193508);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (433, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (342, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (995, 915470929);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1169, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (987, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (940, 316108918);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1643, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (358, 570675025);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1795, 701718916);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1276, 977504353);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1468, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (244, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (481, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1313, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (156, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (421, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (712, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (208, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1468, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (609, 445696364);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1418, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1070, 108074581);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (285, 349048325);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (719, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (656, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1352, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (271, 108074581);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (559, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (85, 515597665);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (858, 929094223);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (171, 990042258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1154, 965774744);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (76, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1384, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (723, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1695, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1438, 439634346);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1976, 456084373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (210, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (118, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1776, 101190138);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1819, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (618, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1299, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (472, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (748, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (437, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (877, 921040663);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (287, 730641660);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1384, 114114500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (72, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (709, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1597, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (898, 272662109);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1893, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1938, 651588900);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1244, 439634346);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (394, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (898, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1697, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (18, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1925, 263179821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (7, 385229456);
commit;
prompt 600 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1429, 570675025);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (761, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1127, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1981, 701718916);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (839, 990692024);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1102, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1480, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1965, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1469, 101190138);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (805, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (198, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (655, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1895, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1758, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1738, 977504353);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (91, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (551, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (572, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (936, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (75, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (180, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1813, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1774, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1215, 915470929);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1908, 316108918);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1860, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1759, 730641660);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (592, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (941, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1383, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1940, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (54, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1893, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (448, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (545, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1133, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1732, 965774744);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (250, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (238, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (586, 558776292);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (355, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1466, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1011, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (568, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (788, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1238, 151879743);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (694, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1420, 806488394);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1011, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (775, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1088, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1092, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1402, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1587, 261117033);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1735, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1179, 298592274);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1821, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (337, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1295, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1596, 831509485);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (298, 445696364);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (327, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (565, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1867, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1365, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1595, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1112, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1044, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (4, 701718916);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1654, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1536, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (250, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1219, 990692024);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (843, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1358, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1847, 101190138);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1235, 272662109);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (307, 803965269);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (528, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1229, 664144723);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (325, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (606, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (565, 445696364);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1239, 439634346);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1257, 831509485);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (940, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1318, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1213, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1371, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1010, 990042258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1353, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (649, 349048325);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (273, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1496, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1962, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1497, 204535135);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1164, 540162175);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1161, 701718916);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (804, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1080, 151879743);
commit;
prompt 700 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1787, 114114500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (586, 540162175);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1163, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1636, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1004, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (520, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (839, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (483, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (990, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (863, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (653, 204535135);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (819, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1062, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (272, 281175627);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (591, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1130, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1126, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (393, 108074581);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1561, 977504353);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1244, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (752, 570259258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (711, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (781, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (991, 803965269);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1872, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (36, 263179821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (793, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1497, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1107, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (606, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (95, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1106, 261847692);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1712, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (817, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1406, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1920, 730641660);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1154, 386933318);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (580, 272662109);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1553, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (966, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (310, 566353911);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1300, 558776292);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (981, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1992, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (290, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (485, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (890, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1882, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (889, 108074581);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (969, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (2000, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1701, 803965269);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (656, 651588900);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (776, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (931, 929094223);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (362, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (601, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1595, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (220, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (920, 651588900);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1512, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1888, 101190138);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1959, 456084373);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1488, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (908, 413193508);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (618, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1051, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (781, 648666893);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1612, 558776292);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1608, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (99, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (287, 570259258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1950, 915470929);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (517, 540162175);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1923, 214921244);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1053, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1578, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (451, 129533152);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1688, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1110, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (927, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (188, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (672, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1511, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (279, 395506050);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1038, 386933318);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1650, 803965269);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1004, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (467, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (319, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1906, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1319, 929094223);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1199, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1466, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1872, 439634346);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1090, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1008, 808356977);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (761, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1385, 921040663);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (397, 114114500);
commit;
prompt 800 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (821, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (687, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1579, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1934, 990042258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1167, 515597665);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1909, 436154619);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (393, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (803, 808356977);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (994, 386933318);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1881, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1709, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (927, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (120, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (73, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (115, 263179821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (102, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1311, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1831, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1289, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1655, 570675025);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1974, 445696364);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (854, 120452310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (13, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (746, 806488394);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1486, 129533152);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (300, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1807, 977504353);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1277, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (141, 965774744);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (518, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (196, 316108918);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1445, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1725, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1402, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1590, 204535135);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1900, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1716, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1373, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1801, 413193508);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (545, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1106, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (983, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (178, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1951, 990042258);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1851, 515597665);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1144, 316108918);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1366, 263179821);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1401, 600321613);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1948, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1989, 990692024);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (698, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1557, 439634346);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (129, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (346, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1201, 204535135);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1754, 570675025);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (190, 298592274);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1847, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (240, 204535135);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1916, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (939, 646029885);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1659, 831509485);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1771, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1103, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1768, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1837, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (233, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (673, 281175627);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1853, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1306, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (61, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (82, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (983, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (466, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (818, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1296, 915470929);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (2000, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (424, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1961, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1837, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (882, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (847, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1225, 445696364);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (450, 702962303);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (437, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (443, 990692024);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (635, 214921244);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1396, 931077989);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1631, 349048325);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (68, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (145, 712830556);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1371, 234936322);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (533, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (457, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (896, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1048, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (892, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (575, 915470929);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (107, 570675025);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1245, 718616310);
commit;
prompt 900 records committed...
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (335, 629129802);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (603, 806488394);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1584, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1717, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (192, 116884473);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1540, 718616310);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1856, 973586654);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (577, 608761880);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (947, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1433, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1939, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (336, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1306, 214921244);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (237, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (721, 204535135);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (573, 780133243);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (905, 103011704);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1290, 618968432);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1976, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1224, 214921244);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (627, 524183716);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1422, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (996, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (507, 831509485);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (553, 151879743);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1683, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (860, 151879743);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1459, 413193508);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1540, 921040663);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (701, 699202105);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (313, 808356977);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1104, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (416, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (662, 662127500);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1283, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (252, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (803, 404567886);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1913, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (15, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1910, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1573, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (194, 584907526);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1835, 908169400);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (328, 558776292);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (915, 728690569);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (495, 701718916);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1535, 435380711);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (667, 365347969);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (38, 515597665);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1535, 541080003);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1385, 162894044);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1292, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (495, 204535135);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (866, 521268241);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (769, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (690, 546599903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1131, 347065963);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (608, 349048325);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1449, 331550903);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1012, 744494592);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (657, 713656231);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1799, 426434083);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (449, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (243, 805462072);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1852, 568287785);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1379, 723873340);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (569, 570675025);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (991, 831509485);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1384, 299189594);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1794, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (520, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1909, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1260, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1226, 386933318);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (688, 664144723);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1738, 806488394);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1901, 385229456);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (453, 842443489);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (518, 203658694);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1972, 261117033);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (843, 889666287);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (323, 142491783);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1525, 515597665);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (152, 214921244);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1055, 281175627);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1861, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1937, 978802240);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1785, 609785028);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (897, 553883245);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1004, 107860119);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (949, 495654372);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (887, 326146555);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1686, 370237930);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1952, 990692024);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (614, 115254599);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (1150, 353702355);
insert into PARTICIPANTVOLUNTEER (teamid, volunteerid)
values (901, 568287785);
commit;
prompt 997 records loaded
prompt Loading PERSON...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (553453494, 'Joe', 'Hector', '0559063998', 'joe@pioneerdatasyste', '79 Spader RoadGaza', to_date('21-05-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (265489613, 'Azucar', 'Hawthorne', '0553611107', 'ahawthorne@lemproduc', '84 Luis StreetIstanb', to_date('03-09-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (467905241, 'Dionne', 'Blaine', '0529589003', 'dblaine@circuitcitys', '536 Naha RoadBeavert', to_date('30-07-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (106628587, 'Wade', 'Rooker', '0585623763', 'wade.rooker@accessus', '33rd StreetMacclesfi', to_date('07-05-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (299189594, 'Miranda', 'McCracken', '0586960256', 'mmccracken@ibm.com', '31 Wills BlvdLake Fo', to_date('21-04-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (792593323, 'Ritchie', 'Ferry', '0525039590', 'r.ferry@priorityleas', '23 Levy RoadCrete', to_date('11-03-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (241236093, 'Lucinda', 'Ingram', '0537789055', 'l.ingram@universalso', '95 København AveDeba', to_date('27-09-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (570675025, 'Davis', 'Tripplehorn', '0529951443', 'dtripplehorn@swp.ca', '20 Prague StreetKana', to_date('19-06-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (416584030, 'Kitty', 'Hughes', '0545528919', 'kitty.hughes@terrafi', '29 Kurtwood StreetMi', to_date('05-03-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (221845501, 'Tara', 'Brooke', '0547811931', 'tara@baesch.de', '72 Gore AveOyten', to_date('06-03-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (129532841, 'Mark', 'Hawthorne', '0574580361', 'mark.hawthorne@prosu', '61st StreetGlasgow', to_date('06-02-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (137968823, 'Miles', 'Pepper', '0569778538', 'mpepper@nestle.com', '73 Sorocaba StreetSa', to_date('28-07-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (478778668, 'Rosie', 'Boorem', '0539354048', 'rboorem@cis.de', '19 Spring City Stree', to_date('29-04-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (679528668, 'Mili', 'Krumholtz', '0573918773', 'm.krumholtz@usphysic', '19 Buddy DriveEbersb', to_date('16-05-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (387706821, 'Jean-Claude', 'Carlton', '0522864098', 'jeanclaude.carlton@m', '20 Lodi AveBuenos Ai', to_date('26-08-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (121432021, 'LeVar', 'Lynch', '0572232025', 'levar.lynch@datapris', '74 Cartlidge StreetR', to_date('11-04-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (209956422, 'Leelee', 'Carlyle', '0562695914', 'leelee@waltdisney.co', '62 Sandoval StreetSw', to_date('11-07-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (579875385, 'Kitty', 'Bonneville', '0540654482', 'kitty.bonneville@mid', '337 GaleckiHelsingbo', to_date('20-02-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (944146416, 'Jonathan', 'Nicholas', '0575180999', 'jonathan.n@marsinc.d', '17 Marlboro DriveWür', to_date('08-03-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (108074581, 'Samantha', 'Ripley', '0539216853', 'samantha.ripley@educ', '53 Winwood AveNagasa', to_date('29-01-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (675089553, 'Clive', 'Huston', '0594105199', 'clive.huston@oriserv', '75 Jake StreetChaam', to_date('23-06-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (712830556, 'Joy', 'Witherspoon', '0562494744', 'joy.witherspoon@cura', '21st StreetBirmingha', to_date('04-08-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (790871361, 'Jay', 'Brandt', '0592500592', 'jay.brandt@kingston.', '89 Crowe StreetColum', to_date('12-08-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (263667753, 'Tal', 'Kinney', '0530731615', 'tal.kinney@exinomtec', '61st StreetBrasília', to_date('11-09-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (301528474, 'Andie', 'Bryson', '0550244162', 'abryson@ksj.ca', '70 Clooney RoadNanai', to_date('11-08-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (417925256, 'Elvis', 'Magnuson', '0576916220', 'emagnuson@novartis.f', '34 Andy StreetDardil', to_date('18-05-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (786874961, 'Taylor', 'O''Neal', '0521158815', 'taylor.o@wendysinter', '74 Cornell StreetBon', to_date('01-01-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (103011704, 'Joshua', 'McGinley', '0545225259', 'joshua.mcginley@demo', '25 Meerbusch AveBern', to_date('04-11-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (597776655, 'Pierce', 'Potter', '0546458260', 'pierce.potter@bps.co', '80 Lenexa RoadAshlan', to_date('18-08-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (958424148, 'Minnie', 'Gaines', '0536783410', 'minnie.gaines@mag.de', '826 Hamilton StreetH', to_date('20-06-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (297249698, 'Lila', 'Giannini', '0551466614', 'lila.giannini@street', '71st StreetAmarillo', to_date('14-03-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (700503030, 'Davis', 'McCain', '0533652508', 'davis.mccain@glmt.co', '108 Avon RoadWichita', to_date('06-06-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (558389833, 'Meredith', 'Jackson', '0565953260', 'meredith.jackson@kwr', '71 Sihung-si RoadPas', to_date('09-04-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (998222156, 'Heather', 'Whitford', '0562034689', 'heather@peerlessmanu', '63 Wolf RoadHochwald', to_date('04-01-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (637772618, 'Illeana', 'Wiedlin', '0590673604', 'i.wiedlin@nsd.com', '64 MurrayAllen', to_date('18-03-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (628012441, 'Anthony', 'Parish', '0595712069', 'anthonyp@columbiaban', '38 Ford DriveNew Hop', to_date('12-12-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (147409607, 'Juliette', 'Heston', '0546817988', 'jheston@gagwear.com', '67 Spector RoadCarli', to_date('17-03-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (884753922, 'Rosie', 'Donovan', '0538509294', 'rosie.donovan@quaker', '5 Caviezel RoadBuffa', to_date('04-05-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (704212385, 'Lennie', 'Cocker', '0568066460', 'lennie.cocker@bps.de', '39 Franz DriveWörth', to_date('20-06-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (294766103, 'Vonda', 'Browne', '0582157953', 'vonda.browne@arkidat', '12 Kanata RoadPalo A', to_date('29-11-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (315830523, 'Robert', 'Choice', '0524911873', 'robert.choice@captec', '76 Barbara DriveMend', to_date('13-11-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (889507928, 'Keanu', 'Cazale', '0520897164', 'keanu.cazale@walmart', '91 Flanagan RoadRedh', to_date('29-01-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (385956911, 'Saul', 'Guest', '0520540311', 'saul.guest@capellaed', '64 Balin RoadTaoyuan', to_date('07-02-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (212840674, 'Tony', 'Postlethwaite', '0523431898', 'tony.postlethwaite@p', '39 Donna BlvdHartfor', to_date('28-04-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (363085777, 'Simon', 'Lillard', '0523132355', 'slillard@perfectorde', '64 Birmingham RoadSa', to_date('17-03-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (501254336, 'First', 'Kattan', '0526132520', 'first.kattan@alohany', '56 ParajuEl Paso', to_date('01-07-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (222389506, 'Cledus', 'McCracken', '0585300106', 'c.mccracken@qestrel.', '83rd StreetHerdecke', to_date('11-05-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (531651796, 'Kathy', 'Playboys', '0521383285', 'kplayboys@arkidata.c', '5 Tate StreetCypress', to_date('26-04-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (621846895, 'Val', 'Blige', '0534272880', 'val.blige@hcoa.com', '54 England StreetElk', to_date('16-05-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (514630588, 'Davis', 'Hawthorne', '0540192806', 'davis.hawthorne@fns.', '41 Adelaide StreetLa', to_date('03-11-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (981597035, 'Janice', 'Eder', '0531723997', 'j.eder@uem.fr', '87 Darmstadt BlvdNan', to_date('15-02-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (184692113, 'Jude', 'Osbourne', '0592451991', 'jude.osbourne@manhat', '42nd StreetCaguas', to_date('05-09-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (977504353, 'Madeline', 'Thurman', '0568824426', 'madeline.thurman@cns', '92 Meerbusch RoadWin', to_date('09-03-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (675824581, 'Frankie', 'Dukakis', '0551632397', 'frankie.dukakis@sere', '50 Dick StreetSihung', to_date('09-04-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (701703448, 'Tom', 'Kidman', '0578179320', 'tom.kidman@at.com', '88 Ball StreetKaysvi', to_date('21-11-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (752769070, 'Tramaine', 'Nielsen', '0588094956', 't.nielsen@fiberlink.', '85 Crouch RoadEschbo', to_date('28-04-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (103384022, 'Jose', 'Herrmann', '0575573906', 'jose@activeservices.', '6 Rochester StreetBa', to_date('16-09-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (753370607, 'Pam', 'Roth', '0581979996', 'pam@chipssolutions.u', '3 Stevenson RoadSant', to_date('18-03-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (924943361, 'Maggie', 'England', '0526472094', 'maggie.england@tilso', '756 Maxine RoadTilst', to_date('06-11-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (288911277, 'Jarvis', 'Waite', '0559620806', 'jarvis.waite@nobrain', '63rd StreetKochi', to_date('20-02-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (454362824, 'Anjelica', 'MacNeil', '0568185160', 'anjelica@coadvantage', '39 Alston RoadUniver', to_date('12-05-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (638392081, 'Luke', 'Briscoe', '0536361270', 'luke.briscoe@mre.de', '94 Warburton StreetC', to_date('25-03-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (398779765, 'Rosie', 'Driver', '0586929755', 'r.driver@shufflemast', '95 CeCeEl Paso', to_date('23-03-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (272662109, 'Samantha', 'Chaykin', '0552120645', 'samantha.chaykin@ext', '572 West ChesterSant', to_date('16-01-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (751114685, 'Emma', 'Diffie', '0560775769', 'emma.diffie@northhig', '92nd StreetFuchstal-', to_date('03-10-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (444383652, 'Wayne', 'Carnes', '0533978232', 'wayne.carnes@randomw', '857 Patrick StreetHe', to_date('11-08-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (794866787, 'Carolyn', 'Baranski', '0575720950', 'carolyn.baranski@int', '88 Harrison AveKarls', to_date('18-09-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (277089467, 'Rhett', 'Knight', '0584793247', 'rhett.k@gdatechnolog', '86 Lawrence AveColor', to_date('19-09-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (548160391, 'Joanna', 'Pearce', '0541798617', 'joanna.pearce@dbprof', '65 Birch DriveWageni', to_date('07-11-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (634024511, 'Wallace', 'Rudd', '0587872726', 'wallace@democracydat', '47 McNarland DriveBu', to_date('22-06-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (338863696, 'Fiona', 'Tolkan', '0569640493', 'fionat@clubone.jp', '32 IstanbulTokushima', to_date('10-06-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (728648267, 'Thin', 'Hunt', '0593553881', 'thin@capitalbank.uk', '74 Downey DriveManch', to_date('31-08-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (480058041, 'Barbara', 'Jordan', '0556981148', 'barbara.jordan@tps.d', '21 Woods AveImmensta', to_date('22-01-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (274322012, 'Ricky', 'Hart', '0598138607', 'ricky@streetglow.com', '92nd StreetMayfield ', to_date('23-03-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (194000282, 'Devon', 'Costner', '0576284381', 'devon.costner@simply', '645 Wagner BlvdNew b', to_date('01-10-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (624589374, 'Mena', 'O''Keefe', '0550963149', 'mena.okeefe@lms.com', '12 Seongnam-si RoadN', to_date('13-01-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (331446407, 'Lynn', 'Perry', '0579297649', 'lynn.perry@cima.de', '80 Taylor DriveUlm', to_date('04-08-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (561518796, 'Nik', 'Uggams', '0582708615', 'nik.uggams@scooterst', '40 New Hope RoadChar', to_date('15-04-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (607491680, 'Merle', 'Lauper', '0593511401', 'mlauper@qls.com', '44 Saga BlvdSeoul', to_date('21-03-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (116884473, 'Davis', 'Curry', '0559909400', 'davis@securitycheck.', '71 AlbuquerqueKing o', to_date('26-03-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (885581878, 'Suzi', 'Stanley', '0580093575', 'sstanley@nobrainerbl', '656 Scorsese BlvdCon', to_date('14-07-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (781488958, 'Clarence', 'Gleeson', '0561064728', 'c.gleeson@sfmai.ca', '30 MetcalfFort McMur', to_date('15-09-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (160172059, 'Edie', 'Adler', '0528451066', 'edie.adler@bioanalyt', '8 Cervine DriveMacau', to_date('27-09-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (679802027, 'Janeane', 'Palmieri', '0571851573', 'janeane.palmieri@inf', '51 Alannah StreetMai', to_date('03-01-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (290015466, 'Philip', 'Wheel', '0557884981', 'pwheel@gdi.hk', '938 Rush StreetNorth', to_date('27-01-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (338095723, 'Merle', 'Hoskins', '0580290313', 'mhoskins@doctorsasso', '59 Macclesfield Road', to_date('30-09-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (719373126, 'Devon', 'Idol', '0530584406', 'devon.idol@stonebrew', '37 JoannaFrankfurt', to_date('24-08-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (953129956, 'Night', 'Charles', '0553257102', 'nightc@3tsystems.com', '86 Silver Spring Dri', to_date('04-04-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (689848446, 'Mos', 'Patton', '0596215778', 'mosp@clubone.de', '148 Gaynor BlvdMönch', to_date('08-01-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (498008587, 'Lily', 'Camp', '0598038812', 'lily@cima.com', '27 Reinhold StreetAr', to_date('07-04-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (140751048, 'Frankie', 'Shepherd', '0573269335', 'frankie@capitalbank.', '99 Pryce BlvdLos Ala', to_date('13-10-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (648666893, 'Stephanie', 'Curtis-Hall', '0523928132', 'stephanie@callhenry.', '9 Grier StreetWinnip', to_date('08-11-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (386933318, 'Miles', 'Pearce', '0530104352', 'miles.pearce@glaxosm', '24 Pepper StreetLexi', to_date('29-08-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (215247731, 'Stellan', 'Dalton', '0563861533', 's.dalton@wellsfinanc', '87 Oklahoma city Str', to_date('20-10-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (492216730, 'Oro', 'Costner', '0564073771', 'oro.costner@marsinc.', '89 Davey StreetNaha', to_date('19-04-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (896607930, 'Dick', 'Turturro', '0529381834', 'dick.turturro@portos', '45 Kimball RoadRockl', to_date('23-11-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (709270607, 'Ted', 'Ratzenberger', '0552470587', 'tedr@logisticare.at', '66 Oro DrivePottendo', to_date('29-12-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (111499297, 'Candice', 'Russell', '0570858651', 'candicer@allegiantba', '457 Clayton RoadElki', to_date('17-08-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (803965269, 'Albertina', 'Ness', '0535547284', 'albertina@jma.com', '11 Ottawa RoadShorel', to_date('13-06-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (487309045, 'Jeffery', 'Andrews', '0569485532', 'jeffery.andrews@sbc.', '67 Khan DriveFukui', to_date('24-05-2000', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (824122503, 'Boyd', 'Blanchett', '0536365654', 'boyd.blanchett@nrae.', '6 Oxford RoadSale', to_date('01-07-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (361935803, 'Domingo', 'Rains', '0568063093', 'domingo.rains@oss.de', '10 Hurt DrivePulheim', to_date('17-06-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (302019623, 'Arturo', 'Sherman', '0522473320', 'arturos@prp.uk', '42 Rhames RoadKnutsf', to_date('17-06-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (111189767, 'Rawlins', 'Assante', '0577001056', 'rawlins.assante@webg', '343 Aniston AveMason', to_date('27-03-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (466250910, 'Noah', 'MacPherson', '0538823173', 'noah.macpherson@ccfh', '46 Tori DriveGroton', to_date('07-07-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (146697918, 'Joely', 'Belushi', '0580460075', 'joely.belushi@random', '162 Giamatti AveLahr', to_date('30-03-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (380651410, 'Debi', 'Kudrow', '0574333272', 'debi.kudrow@base.com', '484 Graham AveLos Al', to_date('19-02-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (904084063, 'Robin', 'Alexander', '0553628693', 'robin@stmaryland.uk', '96 Koblenz AveDoncas', to_date('07-06-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (570259258, 'Penelope', 'Koyana', '0575140637', 'penelopek@bis.com', '85 Waite Park Street', to_date('12-12-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (703626260, 'Praga', 'Clark', '0551399061', 'pragac@oriservices.j', '82nd StreetYamagata', to_date('07-06-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (867824239, 'Kelli', 'Heston', '0545860423', 'kheston@hondamotor.c', '65 AndrewHuntsville', to_date('08-11-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (635885867, 'Natasha', 'Ermey', '0589013747', 'natasha.ermey@stonet', '44 Dysart StreetLeag', to_date('29-01-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (190928615, 'Edie', 'Nugent', '0548710681', 'e.nugent@procurement', '379 KirkwoodMaryvill', to_date('20-04-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (724807773, 'Judge', 'Condition', '0571680886', 'judge.condition@powe', '45 N. ft. Myers Road', to_date('08-01-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (535638282, 'Gino', 'Astin', '0598559213', 'gino@priorityleasing', '6 Lakeville AveTelfo', to_date('16-12-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (780119049, 'Warren', 'Barnett', '0555599427', 'warren@actechnologie', '36 Silverdale Street', to_date('18-07-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (540427129, 'Larenz', 'Blackmore', '0522298544', 'larenz.blackmore@wav', '11 Kiefer AveKanazaw', to_date('22-03-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (619936911, 'Chanté', 'Balaban', '0555969653', 'chant.balaban@traine', '81 Sellers StreetAra', to_date('18-02-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (674762695, 'Robin', 'Matheson', '0543209300', 'rmatheson@knightsbri', '72nd StreetTaoyuan', to_date('22-05-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (958850187, 'Herbie', 'Bugnon', '0565437979', 'herbie.bugnon@kimber', '25 Meyer RoadPlymout', to_date('06-05-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (629039902, 'Grace', 'Vaughn', '0525466970', 'grace.vaughn@priorit', '54 Tinsley RoadAuror', to_date('11-02-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (210629388, 'Rosco', 'Gugino', '0571185678', 'rosco@anheuserbusch.', '21st StreetMobile', to_date('28-07-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (654684755, 'Cheech', 'Goldberg', '0592748145', 'cheech.goldberg@ogio', '437 Leguizamo Street', to_date('28-07-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (584907526, 'Cloris', 'Weisberg', '0537670522', 'cloris.weisberg@http', '91 Cape town RoadPus', to_date('04-04-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (325751247, 'Davy', 'Englund', '0562960669', 'davy.englund@bluffci', '87 Kyunnam StreetBra', to_date('29-12-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (702932048, 'Ving', 'Forrest', '0546480133', 'ving.forrest@tropica', '949 Bartlett StreetM', to_date('22-12-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (473100732, 'Philip', 'Brooke', '0571432856', 'philip.b@caliber.com', '11 Thin DriveGreen b', to_date('19-10-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (205237633, 'Night', 'Nivola', '0525726204', 'night.nivola@unicru.', '56 Harrisburg DriveM', to_date('16-06-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (760996111, 'Pamela', 'Coe', '0545774678', 'pamela.coe@scheringp', '39 Mac AveEdinburgh', to_date('05-07-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (990042258, 'Dwight', 'Feuerstein', '0598929564', 'dwight.feuerstein@ad', '23 AdlerTelford', to_date('24-09-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (884501879, 'Christian', 'Dupree', '0544721802', 'christian.dupree@pri', '12 Alan RoadVerdun', to_date('29-10-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (201425552, 'Cesar', 'Scorsese', '0589809625', 'cesar.s@usdairyprodu', '36 Tilda StreetZuric', to_date('11-04-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (731132643, 'Jeffrey', 'Aniston', '0526869516', 'jeffreya@lfg.it', '38 Conroy RoadFirenz', to_date('17-04-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (564098359, 'Karon', 'Rosas', '0552352722', 'karon.rosas@fnb.se', '88 Meg DriveKarlstad', to_date('17-12-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (636779895, 'Curt', 'Leachman', '0546873646', 'curt.l@seafoxboat.fr', '151 King StreetLe ch', to_date('12-12-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (471651915, 'Cary', 'Sedgwick', '0527774830', 'cary.sedgwick@altern', '22 Elvis BlvdHolderb', to_date('26-02-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (437910872, 'Ice', 'Duvall', '0599730408', 'ice.duvall@magnet.at', '6 Lynn StreetWien', to_date('17-02-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (682812323, 'Tom', 'Harary', '0598354285', 'tom@tracertechnologi', '31 Dortmund AveRedmo', to_date('29-09-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (441250445, 'Jeremy', 'Bachman', '0567253680', 'jeremy@sfmai.com', '51 West Chester AveC', to_date('13-03-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (563435782, 'Bette', 'Garofalo', '0585685227', 'betteg@conquest.com', '20 Barnett StreetLex', to_date('21-01-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (703632956, 'Kylie', 'Baranski', '0552399291', 'kylie.baranski@phili', '663 Fonda RoadRothen', to_date('27-08-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (116236219, 'Lonnie', 'Rossellini', '0545617820', 'lrossellini@kis.com', '91 Royston RoadBeave', to_date('08-10-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (116429875, 'Maxine', 'Holiday', '0572155932', 'maxine.h@johnkeeler.', '32 Moss DriveDublin', to_date('19-07-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (701718916, 'Gerald', 'Waite', '0597853716', 'gerald.w@entelligenc', '56 AgoncilloCanberra', to_date('14-05-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (456084373, 'Lydia', 'Ford', '0595202489', 'lydia@staffforce.dk', '236 Saudarkrokur Roa', to_date('22-01-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (946726018, 'Cornell', 'Folds', '0588796475', 'cornell.folds@intras', '6 Eckhart RoadLeimen', to_date('13-01-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (558486949, 'Ritchie', 'Nelligan', '0534135785', 'rnelligan@homedepot.', '139 Gerald DriveNant', to_date('20-12-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (443429683, 'Frances', 'Summer', '0521081598', 'frances.s@supplycore', '950 Barnett DriveNil', to_date('31-08-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (808356977, 'Ernest', 'Khan', '0574310473', 'ernest.khan@telesynt', '72 Moreno Valley Str', to_date('12-03-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (692335651, 'Stevie', 'Jordan', '0559274344', 's.jordan@adolph.com', '2 Carlos StreetAkron', to_date('11-07-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (461400921, 'Jane', 'Cockburn', '0532259670', 'j.cockburn@fds.be', '263 Wright RoadLumme', to_date('12-09-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (426330673, 'Charlize', 'Tsettos', '0575735107', 'c.tsettos@intel.com', '786 Wheel RoadRoanok', to_date('17-08-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (692033847, 'Jay', 'Bradford', '0587704754', 'jay.bradford@otbd.co', '24 LinneyFoster City', to_date('09-05-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (581023422, 'Wayne', 'Tyler', '0563643098', 'waynet@advertisingve', '779 McKellen DriveSt', to_date('01-01-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (695265116, 'Vin', 'Klein', '0580763072', 'vin.klein@gltg.com', '23 Mary StreetBoston', to_date('27-09-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (426204194, 'Roger', 'Rhodes', '0533605927', 'roger.rhodes@educati', '97 Elizabeth StreetR', to_date('17-08-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (898173826, 'Lucy', 'Tyler', '0525308377', 'lucy.tyler@manhattan', '60 RorschachEttlinge', to_date('29-10-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (453492562, 'Julianne', 'Cooper', '0522985204', 'j.cooper@accucode.co', '318 Lindley RoadCary', to_date('07-05-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (405724200, 'Colm', 'Miles', '0539266970', 'colmm@news.com', '49 Mechanicsburg Blv', to_date('13-08-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (776927413, 'Marie', 'Gambon', '0571750728', 'marie.gambon@mms.de', '63 Marlon RoadGiesse', to_date('20-01-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (992390686, 'Jose', 'LaBelle', '0583797413', 'jose.labelle@conques', '31 GatesBattle Creek', to_date('23-02-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (908169400, 'Owen', 'Osborne', '0592081553', 'owen.osborne@asa.dk', '72nd StreetBergen', to_date('26-03-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (153284087, 'Crystal', 'Aglukark', '0543315975', 'crystal.aglukark@ips', '62 Wesley DriveFarnh', to_date('01-11-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (718616310, 'Heather', 'Sharp', '0585739679', 'heather.sharp@axis.u', '42 Boyle AveRuncorn', to_date('22-08-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (371440964, 'Mika', 'Balk', '0541545520', 'mika.balk@tilsonland', '90 Berkshire RoadFou', to_date('29-12-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (181449371, 'Vertical', 'McConaughey', '0581698072', 'vertical.mcconaughey', '73rd StreetSeattle', to_date('16-09-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (460178579, 'Miranda', 'Penders', '0582693238', 'm.penders@ccb.ca', '82 Fats RoadLongueui', to_date('10-05-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (364038888, 'Alec', 'James', '0542660077', 'ajames@americanland.', '78 Mitchell AveOffen', to_date('03-08-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (267188685, 'Marisa', 'Vance', '0594634860', 'marisa.vance@tmareso', '72 MacNeil StreetDul', to_date('11-05-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (668372330, 'Shelby', 'Spears', '0585507588', 'shelby.spears@epamsy', '37 Javon DriveHaywar', to_date('18-01-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (443817073, 'France', 'McKellen', '0529423159', 'francem@mss.com', '68 Craddock DriveNew', to_date('19-07-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (162894044, 'Viggo', 'Connery', '0527555168', 'viggo.c@wyeth.ch', '54 Askew BlvdChur', to_date('15-10-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (685243370, 'Jose', 'Carrington', '0561270883', 'jose.carrington@form', '43 Garth DriveOrlean', to_date('18-03-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (566353911, 'Leslie', 'Walsh', '0589168246', 'leslie.w@tlsserviceb', '6 DuschelConshohocke', to_date('03-09-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (191091628, 'Lynn', 'Bachman', '0524152765', 'lbachman@integratele', '47 AthensMariano Com', to_date('04-08-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (933776135, 'Keith', 'Harmon', '0598453293', 'keith.harmon@keith.i', '30 Larter RoadMilan', to_date('23-12-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (338693917, 'Rupert', 'Spacek', '0536740234', 'rupert.spacek@consul', '86 Jackson DriveTuls', to_date('13-03-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (719243894, 'Lari', 'McNeice', '0562170834', 'lari.mcneice@callhen', '66 Miles RoadHunt Va', to_date('30-07-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (629817831, 'Salma', 'Cervine', '0584212567', 'salma.c@bowman.com', '55 Brothers DriveMad', to_date('18-04-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (858806514, 'Alec', 'Irving', '0573492932', 'a.irving@bestbuy.br', '38 Oklahoma city Dri', to_date('26-05-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (788640432, 'Rich', 'Iglesias', '0567068723', 'rich.iglesias@cws.dk', '11st StreetTilst', to_date('13-08-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (707438357, 'Peabo', 'Suchet', '0591155827', 'peabo.suchet@flavorx', '6 Avril BlvdPlymouth', to_date('30-08-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (978696310, 'Curtis', 'Rosas', '0526770023', 'curtis.rosas@advance', '53 Lapointe RoadHave', to_date('07-04-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (747675635, 'Jon', 'Redgrave', '0566692465', 'j.redgrave@linksys.g', '57 BrandtKozani', to_date('27-11-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (419022250, 'Clay', 'Tisdale', '0533715165', 'clay.tisdale@capital', '20 Coppell RoadItu', to_date('18-04-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (438942309, 'Alicia', 'Close', '0546526722', 'alicia.close@reckitt', '64 Janssen AveConsho', to_date('18-02-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (703740588, 'John', 'Gambon', '0557931784', 'j.gambon@educational', '38 Roth StreetNarrow', to_date('28-06-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (107306053, 'Barry', 'Kristofferson', '0572299718', 'barry.kristofferson@', '95 Yaphet DriveKöln', to_date('27-11-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (327683507, 'Tom', 'Tanon', '0564884233', 'ttanon@fmb.de', '15 Huntsville DriveH', to_date('15-01-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (752319975, 'Kim', 'Easton', '0521103475', 'kim.e@tilia.fr', '3 Chaplin RoadVelizy', to_date('29-12-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (652554824, 'Antonio', 'Coe', '0581305888', 'antonio.coe@hospital', '44 Bosco RoadSao roq', to_date('25-04-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (705325083, 'Breckin', 'Platt', '0587819413', 'b.platt@insurmark.gr', '24 Jena AveKozani', to_date('07-11-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (256448019, 'Edie', 'Statham', '0587832356', 'edie.statham@techboo', '65 Rucker DriveIpswi', to_date('24-05-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (880596510, 'Leon', 'Fehr', '0540586029', 'leon@smi.jp', '52 Fred StreetKyoto', to_date('14-11-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (616254917, 'Clive', 'Richardson', '0595383561', 'clive.richardson@kia', '12 Toronto RoadBillu', to_date('14-07-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (225742953, 'Ted', 'Lonsdale', '0569480852', 'ted.lonsdale@lfg.dk', '53 Westerberg Street', to_date('10-01-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (984606868, 'Nikka', 'Pride', '0524571480', 'nikka@medsource.de', '96 Tom DriveOffenbur', to_date('27-02-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (362030908, 'Dorry', 'McNeice', '0561255031', 'dorry.mcneice@sht.co', '91 Hobson DriveIssaq', to_date('20-07-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (647476376, 'Talvin', 'Womack', '0539565980', 'talvin.womack@valley', '66 Rodney DriveSan R', to_date('30-06-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (699369790, 'Mary Beth', 'Washington', '0588728427', 'marybeth.washington@', '46 Sharp RoadGotebor', to_date('13-11-1957', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (201391183, 'Gordon', 'Puckett', '0553598185', 'gordonp@safeway.de', '596 Keitel RoadFreis', to_date('18-06-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (342446178, 'Dionne', 'Thompson', '0580792382', 'dionne.thompson@amer', '488 McIntosh RoadKøb', to_date('23-07-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (847641651, 'Michael', 'Bentley', '0594397983', 'mbentley@cws.fr', '15 Giannini StreetMa', to_date('24-05-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (464254148, 'Renee', 'Linney', '0550832332', 'reneel@colgatepalmol', '14 Zappacosta Street', to_date('12-07-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (725559397, 'Tori', 'McCabe', '0586437375', 'tori.mccabe@scjohnso', '9 Pony AveShenzhen', to_date('10-11-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (453085783, 'Avril', 'Harry', '0571094190', 'avril.harry@circuitc', '66 Rod DriveWaco', to_date('30-08-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (649781971, 'Tom', 'Minogue', '0555737775', 'tom.minogue@its.it', '96 Meniketti StreetD', to_date('06-11-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (521268241, 'Remy', 'Brando', '0594569222', 'remy.b@trc.pt', '23 Clea RoadLisbon', to_date('27-07-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (886380600, 'Fisher', 'Marin', '0582388298', 'fisher.marin@sbc.no', '59 Sylvian RoadOslo', to_date('20-03-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (795573633, 'Taye', 'Brickell', '0582151547', 'taye.brickell@terraf', '41 Chambers RoadMant', to_date('24-03-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (420497356, 'Natasha', 'Matheson', '0523425511', 'natasha@tps.it', '95 Presley StreetDi ', to_date('28-12-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (293770073, 'Lou', 'Kennedy', '0587732647', 'l.kennedy@mls.com', '995 Beatty RoadVirgi', to_date('02-11-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (601145118, 'Devon', 'Hampton', '0522788165', 'devon@marketfirst.uk', '6 WinwoodGlasgow', to_date('14-07-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (354589284, 'Hugo', 'Wong', '0557393700', 'hugo.wong@spd.com', '35 Plowright RoadFor', to_date('25-08-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (853278241, 'Chazz', 'Chapman', '0580146329', 'chazz.chapman@mse.au', '44 Neil RoadBalmoral', to_date('18-11-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (241167242, 'Ali', 'McGill', '0536517065', 'ali@epamsystems.br', '50 Cornell RoadGoian', to_date('30-01-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (676287000, 'Swoosie', 'Sanchez', '0536843794', 'swoosie.sanchez@prio', '78 Brentwood RoadBro', to_date('10-10-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (916870189, 'Saul', 'Prowse', '0535268187', 'saul.prowse@tigris.d', '14 Vendetta StreetDu', to_date('14-02-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (350834624, 'Marty', 'May', '0574928277', 'marty.may@kroger.com', '92 Cruz BlvdDouble O', to_date('09-01-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (740419700, 'Millie', 'Hughes', '0558768835', 'millieh@kiamotors.co', '16 Kattan RoadRome', to_date('13-10-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (817554939, 'Hookah', 'Holy', '0543213235', 'hookah@prahs.dk', '100 Athens RoadVejle', to_date('31-01-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (275434089, 'Janeane', 'El-Saher', '0595673457', 'janeane@logisticare.', '45 Casselberry Stree', to_date('07-05-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (913896726, 'Allan', 'Peet', '0549460540', 'allan.peet@mathis.co', '779 ReeseDublin', to_date('10-03-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (470978551, 'Danny', 'Hamilton', '0579022785', 'dhamilton@trx.de', '15 Phoenix RoadKarls', to_date('06-01-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (608761880, 'Crystal', 'Fonda', '0537008257', 'crystal.fonda@faef.f', '33 Martin StreetToul', to_date('03-03-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (203221623, 'Jeff', 'Boothe', '0554972996', 'jeff.boothe@anheuser', '97 Phoebe BlvdStanfo', to_date('12-08-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (978802240, 'Garland', 'Child', '0592791880', 'garland.child@nmr.co', '4 Ponty StreetMelros', to_date('25-11-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (785948646, 'Hector', 'Bush', '0537116806', 'hector.bush@sensorte', '812 Betty RoadMaiden', to_date('04-11-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (281122235, 'Holland', 'Guinness', '0575303662', 'holland.guinness@chi', '58 Miles StreetHorse', to_date('16-10-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (499031759, 'Harry', 'Torn', '0537562154', 'harry.torn@ezecastle', '22 Liotta RoadFort w', to_date('16-10-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (260693022, 'Gladys', 'Dushku', '0552485384', 'gladys.dushku@vfs.uk', '78 Ricardo StreetTel', to_date('22-12-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (750703598, 'Pete', 'Calle', '0590877410', 'pcalle@sht.at', '8 Peachtree City Roa', to_date('17-11-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (465912542, 'Rascal', 'Franklin', '0566808903', 'rascal.franklin@oris', '56 Martin RoadSamran', to_date('02-03-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (968414339, 'Sam', 'Steenburgen', '0529902502', 'sams@dillards.com', '68 Salzburg AveArlin', to_date('15-02-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (660179126, 'Elle', 'Harris', '0573926132', 'elle.harris@bradleyp', '45 Ricardo AveLongue', to_date('16-12-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (387721649, 'Vivica', 'Weisz', '0591996008', 'vivica.w@scjohnson.z', '51 Cagle BlvdHalfway', to_date('29-08-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (639636977, 'Rosie', 'Jeffreys', '0551992817', 'rosie.jeffreys@fab.b', '36 Jeter StreetSanta', to_date('29-11-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (646029885, 'Kyle', 'Griffith', '0522120889', 'kyle.griffith@nike.c', '39 Meppel AveFort Sa', to_date('21-06-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (546157490, 'Emerson', 'Gooding', '0565568298', 'emerson.gooding@mre.', '85 Ann Arbor BlvdPor', to_date('05-06-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (384763687, 'Isaiah', 'Zane', '0540865731', 'isaiah.zane@coldston', '96 Hatchet StreetLun', to_date('16-04-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (407260966, 'Giovanni', 'Quinn', '0525945672', 'giovanni@bestbuy.com', '63 Weir RoadMooresto', to_date('29-08-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (390467801, 'Miguel', 'Chaykin', '0531893531', 'm.chaykin@hotmail.mx', '73 Weisz DriveGuadal', to_date('12-08-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (434080880, 'Machine', 'Parish', '0597270592', 'machine.parish@base.', '27 DeVita StreetNew ', to_date('26-03-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (131444269, 'Rosanne', 'Shannon', '0569532030', 'rosanne.shannon@danc', '317 Avital RoadVeliz', to_date('07-09-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (426434083, 'Shelby', 'Stevens', '0592848785', 'shelby.stevens@gapin', '62 DubaiDenver', to_date('02-09-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (129173918, 'Merle', 'Sawa', '0556071173', 'merle@americanpan.uk', '73 Denny StreetThame', to_date('18-05-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (877579988, 'Naomi', 'Kleinenberg', '0544997109', 'n.kleinenberg@diageo', '47 Bebe BlvdTottori', to_date('01-12-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (460880122, 'Ernie', 'Krumholtz', '0548767287', 'e.krumholtz@democrac', '76 RedgraveNashua', to_date('30-11-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (130975134, 'Helen', 'Briscoe', '0545705619', 'helen@vesta.it', '795 Eastwood DriveRi', to_date('09-09-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (495663392, 'Kenneth', 'Sutherland', '0573563770', 'kenneth.s@smartronix', '78 Streamwood Street', to_date('16-01-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (693372378, 'Maureen', 'Pacino', '0530458217', 'maureen.pacino@abs.c', '279 Harris StreetTem', to_date('29-04-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (809396059, 'Raul', 'Wright', '0558839056', 'raulw@astafunding.yu', '35 Percy RoadBelgrad', to_date('27-06-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (497922116, 'Hex', 'Rispoli', '0588637351', 'hex.rispoli@morganre', '68 Schneider RoadBie', to_date('11-03-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (365276966, 'Guy', 'Crimson', '0552151290', 'guyc@labradanutritio', '82nd StreetOshkosh', to_date('07-08-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (142491783, 'Alannah', 'Bancroft', '0577527279', 'alannah@johnson.uk', '574 Heath RoadEdenbr', to_date('05-03-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (435380711, 'Julio', 'Hubbard', '0547641886', 'julio.hubbard@gltg.c', '89 Roddy StreetBarbe', to_date('18-12-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (896500443, 'Tony', 'Ellis', '0549120625', 'tony.ellis@blueocean', '44 Cyndi StreetMount', to_date('30-05-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (933936995, 'Jaime', 'Trejo', '0554182103', 'jaime.trejo@hcoa.fr', '94 Charleston BlvdGe', to_date('12-09-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (989698420, 'Clarence', 'Heatherly', '0597769280', 'clarence@campbellsou', '42 Carter AvePomona', to_date('10-10-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (685145455, 'Maceo', 'Reid', '0597369999', 'maceo.reid@younginno', '79 Russo BlvdEiksmar', to_date('21-11-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (721900875, 'Tom', 'Westerberg', '0552226261', 'tom@swp.jp', '67 Broadbent RoadNah', to_date('18-02-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (900775022, 'Val', 'Duschel', '0558191337', 'val.duschel@myricom.', '44 Dunn BlvdHorsham', to_date('16-06-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (104860473, 'Edgar', 'Margulies', '0532439574', 'edgar.margulies@stm.', '58 Garfunkel StreetC', to_date('22-07-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (365770822, 'Rosanne', 'Diaz', '0572370278', 'rosanne@americanpan.', '86 Jonny Lee RoadFai', to_date('09-07-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (203064236, 'Leonardo', 'Seagal', '0589368602', 'leonardo.seagal@cali', '46 Roy Parnell Drive', to_date('08-11-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (839081007, 'King', 'Saxon', '0567946769', 'king@northhighland.c', '4 Harry AveRorschach', to_date('17-10-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (371664671, 'Trace', 'Eastwood', '0529448135', 'teastwood@credopetro', '70 South Weber RoadM', to_date('13-06-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (261117033, 'Geraldine', 'Patton', '0525696180', 'geraldinep@advancedn', '77 Henstridge RoadMe', to_date('15-08-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (734777659, 'Spencer', 'Connelly', '0550231060', 'spencer@eastmankodak', '43 Neustadt RoadOhts', to_date('24-04-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (194256299, 'Allison', 'Sinatra', '0583177687', 'allison.sinatra@fetc', '26 Stanley RoadPortl', to_date('21-08-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (957683913, 'Percy', 'Depp', '0572650388', 'percy.depp@processpl', '55 Joy BlvdHeubach', to_date('25-11-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (720412635, 'Lee', 'Lauper', '0569281047', 'lee.lauper@kiamotors', '82 Woodland Hills Bl', to_date('25-02-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (576217816, 'Cliff', 'Cassel', '0554982204', 'cliff.cassel@typhoon', '83 Grant AveSouthamp', to_date('31-03-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (573661810, 'Allan', 'Carlton', '0590043407', 'a.carlton@gdi.de', '32 Voight StreetBerl', to_date('24-12-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (404274655, 'Loren', 'Tankard', '0564219727', 'l.tankard@hotmail.co', '470 Caguas DriveLake', to_date('02-10-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (542837730, 'Cheech', 'Brando', '0535213939', 'cheech.brando@ssi.uk', '82nd StreetSouthend ', to_date('22-02-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (524261918, 'Lonnie', 'Mewes', '0573001861', 'lonnie.m@balchem.com', '26 Billerica BlvdAlp', to_date('22-10-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (633598644, 'Armin', 'Wopat', '0538395219', 'armin.wopat@navigato', '91 Gooding RoadAllen', to_date('19-12-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (775769452, 'Stanley', 'Berkley', '0521143671', 'stanley.berkley@fibe', '94 Dennis RoadToulou', to_date('25-04-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (448133232, 'Albert', 'Swayze', '0534655929', 'albert.swayze@its.br', '54 Sean DriveSao jos', to_date('07-11-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (271339271, 'Noah', 'Duschel', '0586191199', 'noah.duschel@randomw', '39 Collin StreetRoma', to_date('01-09-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (502335955, 'Praga', 'Mac', '0541813994', 'praga@hersheyfoods.i', '60 VondiePiacenza', to_date('10-07-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (303401239, 'Henry', 'Bedelia', '0586946033', 'henry.bedelia@qas.pt', '81st StreetPaço de A', to_date('01-02-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (473822197, 'Phoebe', 'Wiest', '0579040730', 'phoebe.w@hewlettpack', '46 Holliday StreetIt', to_date('16-04-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (559419880, 'Carla', 'Charles', '0561944888', 'carla@generalelectri', '306 LyonNew Haven', to_date('09-04-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (371627721, 'Nanci', 'Woodward', '0548097164', 'nwoodward@innovative', '62 Tobolowsky DriveP', to_date('13-08-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (606650535, 'Gerald', 'Mazzello', '0543558097', 'gerald.mazzello@gna.', '12 Hagar StreetFried', to_date('21-09-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (888659851, 'Domingo', 'Dutton', '0561309218', 'domingo.dutton@mms.c', '73 Kuopio DriveMedia', to_date('17-04-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (871521301, 'Stephanie', 'Sheen', '0525310033', 'stephanie.sheen@visa', '95 Close AveGrapevin', to_date('25-02-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (404567886, 'Christmas', 'Cruz', '0578939792', 'christmas@pioneermor', '32nd StreetSapulpa', to_date('06-09-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (872263306, 'Robin', 'Kennedy', '0588798636', 'robin.kennedy@royalg', '45 Liam StreetWest P', to_date('12-06-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (591293571, 'Belinda', 'Torres', '0543363698', 'btorres@naturescure.', '47 Johor Bahru Drive', to_date('29-11-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (882974225, 'Junior', 'Monk', '0546651593', 'junior.monk@wrgservi', '86 Robinson StreetOx', to_date('26-10-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (235969912, 'Don', 'Polley', '0580827486', 'don.polley@carteretm', '62nd StreetThörishau', to_date('24-04-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (486015176, 'Geoff', 'Colin Young', '0534402057', 'geoff.colinyoung@atl', '19 Monroe AveHerne', to_date('27-10-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (703098082, 'Meredith', 'Griffin', '0537198795', 'meredith.g@microsoft', '90 Des Plaines RoadH', to_date('08-10-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (315701849, 'Ralph', 'Daniels', '0598549453', 'ralph.daniels@surmod', '444 Hutton StreetCam', to_date('23-07-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (827436691, 'Mae', 'Newman', '0587532283', 'mae.newman@pepsico.c', '63 Farina AveBoulder', to_date('29-12-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (939404255, 'Linda', 'McNarland', '0550071231', 'lmcnarland@tilsonhr.', '57 Elizabeth StreetW', to_date('31-08-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (198509929, 'Veruca', 'Azaria', '0564620597', 'vazaria@hersheyfoods', '98 Eisenhüttenstadt ', to_date('19-12-1962', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (729605756, 'Roddy', 'Vincent', '0533450292', 'roddy.v@stonebrewing', '28 Encinitas StreetL', to_date('23-08-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (479217158, 'Bryan', 'Venora', '0529568033', 'bryan.v@sfmai.de', '30 Edward RoadLeinfe', to_date('11-07-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (144485492, 'Patricia', 'Santana', '0555238569', 'patricia.santana@bat', '34 Holts Summit Blvd', to_date('12-08-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (829553068, 'Willie', 'Curtis-Hall', '0598572208', 'willie.curtishall@ba', '11 Thames Ditton Roa', to_date('24-11-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (586308885, 'Taryn', 'Rea', '0586241205', 'trea@ceb.it', '203 Augst RoadRimini', to_date('15-05-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (256855102, 'Gaby', 'Adams', '0586783525', 'gaby.a@consultants.c', '686 Auckland RoadTuc', to_date('26-02-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (998379122, 'Carla', 'Wagner', '0594568222', 'cwagner@newmedia.com', '95 Lucinda DriveAlba', to_date('10-08-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (752842781, 'Elizabeth', 'Collette', '0575102248', 'elizabeth.collette@t', '39 Hutch DriveVilniu', to_date('05-04-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (703001500, 'Jonny Lee', 'Worrell', '0534323241', 'j.worrell@homedepot.', '10 GersthofenKuraby', to_date('18-09-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (887348713, 'Andrae', 'Ward', '0548805790', 'andrae.ward@sfb.uk', '8 Kirkwood AveNortha', to_date('13-07-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (554870829, 'Martin', 'Wagner', '0589968469', 'martin.wagner@commwo', '52 Jerry DriveNeuchâ', to_date('08-11-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (957206959, 'Lena', 'Henstridge', '0529946846', 'lenah@bis.com', '82 Beck BlvdSacramen', to_date('01-04-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (488441791, 'Debby', 'Dunst', '0571654809', 'debby.dunst@democrac', '32nd StreetKøbenhavn', to_date('08-11-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (943336257, 'Isaac', 'Feore', '0560032647', 'isaac.feore@horizono', '21st StreetFukushima', to_date('10-01-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (533618858, 'Nicole', 'Conners', '0578719143', 'nicole.c@smg.de', '36 Steyr DriveLeinfe', to_date('08-12-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (302998445, 'Merillee', 'Heron', '0574290824', 'mheron@vms.com', '46 Garcia RoadMonroe', to_date('09-07-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (391400868, 'Davey', 'Ryan', '0582779526', 'davey.ryan@scripnet.', '33 Sheena DriveTotto', to_date('23-02-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (285063136, 'Toni', 'Bracco', '0576079942', 'toni.bracco@usainstr', '15 LongviewHerdecke', to_date('10-07-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (214697145, 'Cheryl', 'Senior', '0567448236', 'c.senior@gapinc.uk', '7 Penelope DriveShef', to_date('28-10-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (334992313, 'Cledus', 'Barnett', '0550648867', 'cledus.barnett@bradl', '61 Shannon AveMassag', to_date('14-10-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (705182536, 'Liv', 'Haynes', '0596057718', 'liv.haynes@wrgservic', '16 Johnny RoadNewbur', to_date('21-04-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (775965942, 'Katie', 'Cagle', '0542457510', 'k.cagle@fra.com', '70 Keith StreetVirgi', to_date('30-10-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (370237930, 'Christian', 'Randal', '0574359806', 'christianr@trc.ar', '14 Gord RoadNeuquen', to_date('02-11-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (643670399, 'Joely', 'Davies', '0538305107', 'joely.davies@meritag', '13 Winstone RoadObfe', to_date('02-09-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (681890386, 'Vienna', 'Hutton', '0530745366', 'vienna.hutton@perfec', '2 Hawkins RoadSaga', to_date('29-03-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (116452197, 'Henry', 'Speaks', '0552103033', 'h.speaks@allstar.ie', '94 Linda StreetDubli', to_date('19-03-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (907807730, 'Javon', 'Rudd', '0588933768', 'javon.rudd@generalel', '32 Travolta DriveHer', to_date('18-05-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (185170475, 'Lloyd', 'Pigott-Smith', '0590349003', 'lloyd.pigottsmith@hu', '33 Tommy StreetSihun', to_date('24-02-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (524183716, 'Nina', 'Mulroney', '0528034969', 'nina@powerlight.de', '3 FiorentinoSulzbach', to_date('10-10-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (540162175, 'Hugo', 'Bello', '0566522405', 'h.bello@pib.il', '31 Dabney StreetJeru', to_date('20-06-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (273387694, 'Talvin', 'Moorer', '0551331615', 'talvin.moorer@capita', '47 Beals BlvdRocklan', to_date('19-10-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (199871279, 'Emerson', 'Hall', '0521882762', 'emerson.hall@catamou', '57 Wilkinson DriveSo', to_date('05-02-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (186509516, 'Delbert', 'Griffiths', '0530955657', 'delbert.griffiths@ma', '66 McGoohan DriveLex', to_date('14-02-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (384263072, 'Udo', 'Chambers', '0566802162', 'udo.chambers@circuit', '17 Beckinsale RoadRa', to_date('08-04-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (174417979, 'Mitchell', 'Phillippe', '0566172986', 'mitchellp@conquestsy', '496 East Providence ', to_date('29-05-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (630702383, 'Heather', 'McConaughey', '0561430665', 'hmcconaughey@dancor.', '79 Virginia Beach Av', to_date('04-02-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (350989302, 'Oro', 'Henriksen', '0591994245', 'oro@waltdisney.it', '327 Golden DrivePado', to_date('01-10-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (488122574, 'Cole', 'Vai', '0574006982', 'c.vai@hersheyfoods.p', '52nd StreetWarszawa', to_date('16-11-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (154218863, 'Sammy', 'Mason', '0533939199', 'sammy.mason@procurem', '316 Warsaw RoadCharl', to_date('12-04-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (899832305, 'Doug', 'Thorton', '0539615281', 'doug.thorton@airmeth', '35 Marin DriveOr-yeh', to_date('26-01-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (725889894, 'Andrea', 'Nugent', '0530343758', 'andrea.nugent@scheri', '62 Hauser DriveHears', to_date('15-03-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (845149407, 'Sandra', 'Dooley', '0564781257', 'sandra.d@jewettcamer', '41 Tanon RoadToulous', to_date('26-12-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (600321613, 'Louise', 'Idle', '0571256516', 'louise.idle@owm.com', '72nd StreetLaurel', to_date('11-12-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (230188744, 'Chris', 'Shepherd', '0567325073', 'chris.shepherd@owm.c', '91 Getty RoadGuelph', to_date('25-10-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (277549875, 'Freddy', 'Connelly', '0596981856', 'fconnelly@afs.il', '80 Rauhofer DriveNet', to_date('19-01-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (792876632, 'Larnelle', 'Schiavelli', '0574657611', 'larnelle.schiavelli@', '26 RatzenbergerOshaw', to_date('08-08-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (387617908, 'Melba', 'Fiorentino', '0577851995', 'melba.f@daimlerchrys', '19 Quinones StreetCe', to_date('07-03-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (167740156, 'Meg', 'Curry', '0584053981', 'mcurry@vitacostcom.e', '79 Nicosia StreetAgo', to_date('11-03-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (646453183, 'Rip', 'Borgnine', '0531169656', 'rip@jlphor.tr', '21st StreetIstanbul', to_date('29-08-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (916377545, 'Victor', 'Chao', '0523611827', 'vchao@fpf.com', '4 SydneyMonterey', to_date('22-05-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (842068459, 'Colin', 'Arkenstone', '0528551399', 'colin.arkenstone@tel', '99 Peabo DriveOttawa', to_date('18-09-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (127694387, 'Madeleine', 'Gibson', '0584310575', 'madeleine@vfs.ch', '50 Doucette RoadAniè', to_date('18-03-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (919397096, 'Joely', 'Neville', '0534703918', 'jneville@naturescure', '53rd StreetEden prai', to_date('25-10-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (101622732, 'Marlon', 'Levert', '0575530645', 'marlon.levert@mwp.ca', '95 Lerner StreetRich', to_date('20-03-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (780133243, 'Mary', 'Wells', '0561189445', 'mary@kimberlyclark.c', '578 Naestved RoadExe', to_date('17-08-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (908089234, 'Shannyn', 'Lizzy', '0561676836', 'shannyn.lizzy@3tsyst', '293 RufusLefkosa', to_date('20-05-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (514482762, 'Billy', 'McCann', '0555528345', 'billy@gna.br', '57 Thornton RoadArar', to_date('10-12-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (638919531, 'Miles', 'Ryan', '0564527120', 'm.ryan@aoe.com', '68 Neneh StreetEncin', to_date('28-05-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (578410048, 'Treat', 'Malkovich', '0570548303', 'treat.malkovich@smar', '11st StreetCape town', to_date('23-12-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (915470929, 'Forest', 'McCormack', '0520567023', 'forest@simplycertifi', '90 Brando DriveSprin', to_date('04-12-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (990692024, 'Eileen', 'Weiland', '0598456331', 'eileen.weiland@fflcb', '85 Holiday StreetMon', to_date('21-11-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (558776292, 'Debi', 'Wakeling', '0539983767', 'debi.w@appriss.de', '22 Rhys-DaviesLeinfe', to_date('09-01-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (202411364, 'Ike', 'Wilson', '0546944525', 'ike.w@printingforles', '61st StreetBanbury', to_date('04-11-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (718359114, 'Will', 'Sarsgaard', '0567254519', 'will@gtp.com', '30 Fishburne BlvdMur', to_date('26-07-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (476841194, 'Gladys', 'Kretschmann', '0563824064', 'gkretschmann@sm.com', '60 Soda RoadNew York', to_date('01-12-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (629649482, 'Kelli', 'Rawls', '0520733562', 'kelli.rawls@clorox.c', '16 WangWilmington', to_date('26-05-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (660020838, 'Ice', 'Summer', '0586497261', 'isummer@ctg.de', '24 LaMond StreetEber', to_date('04-09-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (699202105, 'Lonnie', 'Moraz', '0573955290', 'lonnie.moraz@jollyen', '94 Bologna DriveKana', to_date('03-01-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (192929550, 'Balthazar', 'Stiller', '0531631977', 'balthazar.stiller@mc', '20 Lineback RoadPaço', to_date('07-08-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (604239875, 'Rodney', 'Vaughn', '0531024350', 'rodney.vaughn@parksi', '72 HustonBolton', to_date('19-09-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (988379951, 'Debby', 'Milsap', '0546078530', 'dmilsap@genghisgrill', '53 OakenfoldOldenbur', to_date('19-10-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (889666287, 'Suzy', 'McBride', '0541396980', 'suzy.m@colgatepalmol', '12 Flack StreetBerke', to_date('08-01-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (319242556, 'Tamala', 'Winans', '0538166640', 'tamala@socketinterne', '75 Renfro StreetHoch', to_date('10-12-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (252811379, 'Beverley', 'Magnuson', '0568786096', 'beverley.magnuson@gc', '30 ChesnuttBrussel', to_date('05-07-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (775003956, 'Famke', 'Hobson', '0581536504', 'famke.hobson@hencie.', '733 Pigott-Smith Str', to_date('20-04-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (830156782, 'Powers', 'Vince', '0579624303', 'powers.vince@atlanti', '92 MilesSantana do p', to_date('23-07-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (917310078, 'Kristin', 'Weiss', '0529190851', 'kristin.weiss@canter', '803 Biel StreetKaysv', to_date('15-03-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (253179847, 'Liev', 'Peniston', '0548330629', 'lpeniston@officedepo', '33rd StreetUden', to_date('30-03-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (873309406, 'Diamond', 'Holmes', '0594518192', 'diamond.holmes@homed', '20 Vertical StreetKu', to_date('27-09-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (402498328, 'Toshiro', 'Sevigny', '0561735124', 'toshiro.s@ogi.uk', '83 Purefoy Drivedurh', to_date('28-07-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (554383270, 'Crystal', 'Brock', '0548519632', 'crystalb@democracyda', '51 Anthony RoadBelle', to_date('30-06-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (641909087, 'Gin', 'Basinger', '0576711463', 'ginb@ositissoftware.', '92 Duchovny StreetSu', to_date('12-02-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (931077989, 'Marty', 'Carlisle', '0525628675', 'marty@aco.com', '53rd StreetWarrenton', to_date('24-07-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (153980246, 'Nathan', 'Jane', '0539122941', 'njane@toyotamotor.dk', '3 Breslin StreetLyng', to_date('28-07-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (664144723, 'Trick', 'Lopez', '0543092610', 'trick.lopez@hondamot', '8 Balthazar AveIrvin', to_date('20-11-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (972077642, 'Norm', 'Plimpton', '0594583583', 'norm.plimpton@lynksy', '74 Fichtner RoadChap', to_date('20-08-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (206068476, 'Connie', 'Briscoe', '0592736170', 'connie.briscoe@kello', '95 Syracuse RoadSmyr', to_date('08-04-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (696973762, 'Derrick', 'Raye', '0564050548', 'derrick.raye@electri', '44 Millie AveGranada', to_date('30-05-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (514069249, 'Crystal', 'Pride', '0537246531', 'cpride@hudsonriverba', '86 Lillard AveSaitam', to_date('30-10-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (936250315, 'Claude', 'Ruffalo', '0536028904', 'clauder@yashtechnolo', '388 Salem DriveSnoqu', to_date('04-10-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (354141519, 'Candice', 'Parsons', '0599620753', 'candice.parsons@pfiz', '31st StreetLengdorf', to_date('17-04-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (555691338, 'Lari', 'Moody', '0548322522', 'lari@homedepot.at', '84 Rawls StreetVienn', to_date('14-01-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (610736791, 'Uma', 'Shannon', '0553579020', 'uma@saralee.uk', '82nd StreetBerkshire', to_date('02-08-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (995758728, 'Quentin', 'Crimson', '0572411256', 'quentin.crimson@at.c', '77 Jean StreetLakewo', to_date('21-10-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (107197897, 'Miguel', 'Cube', '0552945046', 'miguelc@epiqsystems.', '10 Sydney BlvdSouth ', to_date('06-12-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (510169398, 'Terry', 'Holiday', '0579132134', 'terry.holiday@primus', '9 MadsenMilpitas', to_date('20-02-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (894992721, 'Debra', 'Craven', '0598714233', 'debrac@signalperfect', '51st StreetKagoshima', to_date('14-09-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (502125849, 'Chris', 'Candy', '0539930873', 'chris.candy@meridian', '99 Brothers RoadKist', to_date('03-12-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (991973927, 'Hilary', 'Renfro', '0589153803', 'hilary.renfro@gha.fi', '91 Head StreetOulu', to_date('23-04-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (850038369, 'Jeffrey', 'Atlas', '0567042309', 'jeffrey.atlas@smartr', '26 Gordie StreetRoan', to_date('15-06-1953', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (251883743, 'Seann', 'Brickell', '0532365145', 'seann.brickell@newvi', '54 Lenny StreetHarsu', to_date('07-06-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (294515886, 'Oded', 'Apple', '0570182796', 'oded.apple@nsd.com', '32nd StreetEden prai', to_date('30-09-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (423868293, 'Loren', 'Murray', '0535723833', 'loren.murray@jollyen', '653 Long Island City', to_date('12-05-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (115254599, 'Brittany', 'Weller', '0564415159', 'brittany.weller@john', '13rd StreetLublin', to_date('19-01-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (349048325, 'Nicholas', 'Birch', '0531885470', 'nicholas.birch@capel', '96 Duisburg RoadQuéb', to_date('10-09-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (825444918, 'Suzanne', 'Patton', '0565288640', 'suzanne.patton@nike.', '60 Ismaning StreetFa', to_date('24-02-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (982868283, 'Tanya', 'Dorn', '0555542612', 'tanyad@digitalmotorw', '97 Bradley RoadSaras', to_date('23-08-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (215808039, 'Jude', 'Bosco', '0592294035', 'jude@heartlab.com', '89 Iglesias StreetMo', to_date('20-04-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (336547274, 'Woody', 'Moraz', '0584025779', 'wmoraz@dancor.com', '49 Masur DriveRaleig', to_date('21-10-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (927033834, 'Patty', 'Mantegna', '0543075591', 'patty.mantegna@merit', '9 Louisville DriveEx', to_date('21-06-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (472476534, 'Jeremy', 'Cara', '0549634187', 'jeremy.cara@networkd', '507 Vanessa RoadSeou', to_date('15-05-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (220618963, 'Paul', 'Pastore', '0555861264', 'p.pastore@printtech.', '13rd StreetSeatle', to_date('02-05-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (506241993, 'Juliette', 'Wopat', '0532365830', 'j.wopat@fds.za', '42nd StreetGauteng', to_date('27-11-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (353362258, 'Carlene', 'Jamal', '0583785424', 'carlene.jamal@esofts', '63 San Antonio Stree', to_date('26-02-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (701434627, 'Randy', 'Holiday', '0545791082', 'randy.holiday@worldc', '51 Negbaur RoadHermi', to_date('04-09-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (488848745, 'Trick', 'Gaines', '0539884482', 'trickg@cns.it', '415 Feore BlvdMarian', to_date('15-05-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (384650735, 'Robert', 'Brando', '0549168704', 'robert@kimberlyclark', '30 Cromwell StreetBe', to_date('03-07-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (549653270, 'Halle', 'Crystal', '0535845912', 'halle@trx.lt', '8 Day DriveKaunas', to_date('20-03-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (639408278, 'Wayne', 'Assante', '0537794405', 'wayne.assante@meridi', '94 MacNeil StreetObf', to_date('25-09-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (389821471, 'Bonnie', 'Blanchett', '0539068409', 'bonnieb@procter.cz', '29 Rhea DrivePrague', to_date('11-08-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (198104143, 'Busta', 'Pollak', '0545239788', 'busta.p@pioneermortg', '481 Alexander DriveL', to_date('13-12-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (860924791, 'Selma', 'Warwick', '0583900334', 'selma.warwick@north.', '83rd StreetBethesda', to_date('14-04-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (309162583, 'Rutger', 'Schiavelli', '0520536542', 'rutgers@gha.br', '34 St. LouisBelo Hor', to_date('31-07-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (692379185, 'Cuba', 'Hoffman', '0538679835', 'cuba.h@networkdispla', '71 Storrington Stree', to_date('29-02-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (393715774, 'Lea', 'Boorem', '0544029655', 'lea@nha.de', '39 Louise StreetBaut', to_date('23-08-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (904236564, 'Bradley', 'Harrison', '0560140605', 'bradley.harrison@kel', '208 Kansas City Stre', to_date('02-10-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (650144986, 'Olympia', 'Saucedo', '0557299082', 'olympia@mai.br', '12 Herrmann DriveItu', to_date('09-07-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (299940335, 'Rick', 'Ellis', '0582313254', 'ricke@ass.jp', '71 ElizaSaga', to_date('19-11-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (797655959, 'Darius', 'Osbourne', '0567331776', 'd.osbourne@ufs.se', '39 Rudd RoadGoteborg', to_date('02-05-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (391473947, 'Vincent', 'Paxton', '0539470925', 'vincentp@sfmai.uk', '55 Avon RoadEdinburg', to_date('21-08-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (141382644, 'Howard', 'Richter', '0577487272', 'howard.richter@ameri', '14 Wallace RoadAbbot', to_date('20-01-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (984560760, 'Woody', 'Rowlands', '0568994853', 'wrowlands@ahl.com', '948 Davy StreetChape', to_date('20-10-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (475098452, 'Carlene', 'Lucien', '0571027530', 'carlene.lucien@ubp.d', '26 LunchDarmstadt', to_date('06-10-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (484236775, 'Dick', 'Coughlan', '0549437316', 'dick.coughlan@medami', '16 Witt StreetRua et', to_date('07-12-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (372708523, 'Neil', 'Piven', '0590994094', 'neil@alogent.de', '63 Foxx RoadDuisburg', to_date('11-08-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (498476379, 'Rip', 'Apple', '0549355100', 'rip@tracertechnologi', '13 Horsham RoadSheff', to_date('20-09-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (148599779, 'Seann', 'Shaw', '0545503415', 'seanns@logisticare.d', '9 Cross StreetRegens', to_date('26-06-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (141458148, 'Davis', 'Utada', '0576658727', 'd.utada@cocacola.be', '89 Rosanne RoadAntwe', to_date('05-09-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (757023457, 'Dean', 'Meyer', '0538768459', 'deanm@ait.be', '832 Carol DriveDroge', to_date('05-12-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (675965990, 'Frank', 'Choice', '0552386605', 'frank.choice@bps.com', '14 Lexington DriveRe', to_date('07-12-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (959607055, 'Bonnie', 'Cassel', '0540932663', 'b.cassel@hondamotor.', '6 Lathrop RoadSacram', to_date('15-03-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (857803315, 'Andrae', 'Gray', '0590959575', 'andraeg@jlphor.de', '55 DeGraw StreetNord', to_date('09-02-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (274719284, 'Nigel', 'Brothers', '0527610843', 'nigel.brothers@banfe', '72nd StreetSpringvil', to_date('20-04-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (105091769, 'Carolyn', 'Hatfield', '0544908102', 'carolyn.hatfield@mwp', '32 Brickell AveLeime', to_date('21-09-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (244818870, 'Mary', 'Byrd', '0537193707', 'mary@mms.com', '40 Liquid RoadHuntin', to_date('06-07-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (978580609, 'Stockard', 'Mohr', '0542563201', 'stockard.m@fiberlink', '752 Sledge DriveWars', to_date('17-07-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (418495420, 'Suzy', 'Lunch', '0578477019', 'slunch@volkswagen.it', '63 Richards StreetZa', to_date('04-06-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (496193368, 'Robbie', 'Matarazzo', '0561025395', 'robbie@fmi.de', '49 Leary AveLuedensc', to_date('03-12-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (705043382, 'Belinda', 'McDiarmid', '0529864703', 'belinda.mcdiarmid@ai', '8 Leslie AveBorger', to_date('01-07-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (911485014, 'Angela', 'Rock', '0552120837', 'angela@prp.com', '23 Kyoto StreetBatav', to_date('27-01-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (324495750, 'Jeremy', 'Coe', '0589681023', 'jeremy.c@vertexsolut', '96 Linney StreetMalm', to_date('13-04-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (203687493, 'Stanley', 'Bradford', '0570726226', 's.bradford@blueocean', '288 Stiers DriveEngl', to_date('11-05-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (247146261, 'Kenneth', 'Heald', '0564296625', 'kenneth.heald@parker', '57 Sissy RoadMönchen', to_date('17-06-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (187666594, 'Rhea', 'Bergen', '0538772221', 'rhea@serentec.es', '424 Thorton RoadPalm', to_date('13-10-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (606861856, 'Samantha', 'McDowell', '0534552443', 'samantha.mcdowell@ms', '47 Robby RoadShawnee', to_date('01-05-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (667920628, 'Bill', 'Hector', '0545374198', 'bill.hector@integram', '77 Busey RoadBham', to_date('27-08-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (928227440, 'Hilton', 'Holmes', '0571849665', 'hilton.holmes@traine', '73 Avon DriveSpringf', to_date('23-05-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (536860289, 'Tzi', 'Paymer', '0566611113', 'tzi.paymer@gentrasys', '36 Walter RoadJuazei', to_date('21-08-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (407234457, 'Jonny', 'Guest', '0583840930', 'jonnyg@toyotamotor.a', '79 Sheen RoadSydney', to_date('17-01-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (230513924, 'Chanté', 'Danes', '0536873719', 'chant@globalwireless', '73 Runcorn StreetGäv', to_date('25-12-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (582288347, 'Neve', 'Wiest', '0557302183', 'neve.wiest@tmt.de', '65 Langella StreetIs', to_date('02-12-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (421244276, 'Millie', 'Twilley', '0585815773', 'millie.twilley@mls.f', '27 Curtis-Hall RoadS', to_date('17-05-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (807055203, 'Harvey', 'Harnes', '0594148336', 'h.harnes@mss.dk', '12nd StreetHillerød', to_date('09-02-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (472544307, 'Kitty', 'LaPaglia', '0588807441', 'kitty.lapaglia@sfgo.', '72 Goran RoadMariano', to_date('21-08-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (937543521, 'William', 'Malone', '0522406511', 'william.malone@hardw', '38 Chubby RoadFuerth', to_date('11-03-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (622599338, 'Aimee', 'Yulin', '0578426913', 'aimee.yulin@typhoon.', '42 Henry DriveEdenbr', to_date('31-01-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (702962303, 'Neve', 'Gibson', '0585411672', 'neve@mai.es', '36 Shannon BlvdBarce', to_date('31-01-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (102084283, 'Edgar', 'Hayek', '0537856138', 'edgar.hayek@fmt.br', '39 Dylan RoadParaju', to_date('16-09-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (195423150, 'Vertical', 'Ferrell', '0593114816', 'vertical@pscinfogrou', '2 Wells StreetMason', to_date('25-01-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (666780922, 'Cyndi', 'Payne', '0546987102', 'cyndi.payne@netnumin', '48 Neneh DriveOldenb', to_date('15-07-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (464839790, 'Chet', 'O''Donnell', '0546939319', 'cheto@mindiq.de', '48 Ticotin StreetBie', to_date('09-02-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (593660229, 'Giancarlo', 'Dzundza', '0554416928', 'giancarlo.dzundza@le', '17 Galecki StreetRad', to_date('28-06-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (842065450, 'Kyra', 'Chesnutt', '0548695212', 'kyra.chesnutt@webgro', '66 McCormack DriveSa', to_date('01-06-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (973586654, 'Madeline', 'Depp', '0582914540', 'madeline@smi.com', '11 Morioka AveRedmon', to_date('19-02-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (453774149, 'Jessica', 'Weston', '0597445605', 'j.weston@bristolmyer', '536 Walsh BlvdWehrhe', to_date('25-12-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (814124117, 'Morgan', 'Astin', '0543689734', 'morgan.astin@nestle.', '95 Vertical BlvdLued', to_date('20-11-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (349127247, 'Gordon', 'Webb', '0589982784', 'gordon.webb@bestever', '13rd StreetOosterhou', to_date('22-10-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (971746858, 'Kay', 'Osment', '0549425031', 'kay@fetchlogistics.n', '76 Vaughn BlvdKongse', to_date('05-10-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (404860253, 'Forest', 'Cash', '0527935550', 'forest.cash@glmt.jp', '28 WellsOsaka', to_date('25-10-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (609785028, 'Kid', 'Alda', '0563723018', 'kid.alda@bioreliance', '36 Warley DriveMadri', to_date('27-03-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (751017080, 'Steve', 'McKennitt', '0581645236', 'stevem@newviewgifts.', '989 Sharp StreetPais', to_date('12-03-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (314282226, 'Zooey', 'Goodall', '0579500016', 'zooey.goodall@ach.pl', '896 Nik StreetGdansk', to_date('01-07-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (296717047, 'Loren', 'Mirren', '0561727735', 'loren@elmco.com', '91 Andie DriveRockli', to_date('14-05-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (360501923, 'Jamie', 'Bedelia', '0586643689', 'jamie.bedelia@ois.co', '683 Nancy DriveSouth', to_date('21-05-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (592136743, 'Terence', 'Davison', '0564825177', 'terenced@ass.de', '13rd StreetDarmstadt', to_date('19-02-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (151879743, 'Julio', 'Hopper', '0591633286', 'julio@cendant.com', '12nd StreetBozeman', to_date('04-04-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (988874118, 'Carla', 'Martin', '0523745269', 'carla.m@solipsys.uk', '53 MarisaSale', to_date('09-03-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (754868548, 'Olympia', 'Houston', '0555394031', 'olympia.houston@sfma', '43 Sawa AveCaliforni', to_date('14-02-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (731042839, 'Debbie', 'Isaacs', '0566162928', 'debbie.isaacs@active', '95 Torino DriveBad O', to_date('03-10-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (992822454, 'Bobbi', 'McConaughey', '0545008788', 'bobbi.mcconaughey@af', '94 Beaverton AveNant', to_date('24-03-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (316108918, 'Natacha', 'Vicious', '0579563834', 'natacha.vicious@safe', '947 Gano RoadPrincet', to_date('29-04-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (811145027, 'Geena', 'Davison', '0573399198', 'geena.d@bestever.it', '74 Eat World StreetC', to_date('06-01-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (335052588, 'Kieran', 'Pleasence', '0534522734', 'kieran.pleasence@jsa', '9 Amanda StreetNorth', to_date('26-04-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (621340115, 'Denny', 'Pollack', '0594677055', 'd.pollack@saltgroup.', '53 Keanu AveHiroshim', to_date('30-01-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (593421768, 'Lydia', 'Bonham', '0542260145', 'lydia.bonham@serente', '41 Mason RoadAnnanda', to_date('11-09-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (978779321, 'Danni', 'Senior', '0558080458', 'dsenior@jlphor.uk', '31 Brickell StreetWo', to_date('29-04-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (623637951, 'Edie', 'Pony', '0534977073', 'edie.pony@cima.ca', '95 Blue bell StreetB', to_date('03-05-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (973318116, 'Robbie', 'DeGraw', '0556036075', 'robbie.degraw@fnb.co', '37 Dan DriveHuntingt', to_date('04-12-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (395613343, 'Connie', 'Redford', '0540260637', 'connie.redford@alden', '69 Coppell StreetWel', to_date('11-10-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (298592274, 'Julio', 'Arnold', '0542364633', 'julioa@nrae.pl', '24 Brandt RoadWarsaw', to_date('15-09-1965', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (730641660, 'Edgar', 'Haslam', '0594139424', 'edgar@dynacqinternat', '1 Charlie StreetGree', to_date('08-04-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (353702355, 'Wendy', 'Eder', '0554570908', 'wendy.e@servicelink.', '889 Allison DriveNep', to_date('14-01-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (108614791, 'Rick', 'Cara', '0537099471', 'rick.cara@cooktek.es', '60 Cornell StreetAlc', to_date('23-05-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (503264588, 'Jeroen', 'Posey', '0555777944', 'jeroenp@nha.de', '79 HestonIsmaning', to_date('21-07-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (385229456, 'Pablo', 'Brothers', '0587125841', 'pablo.brothers@spotf', '24 Sewell AveBreda', to_date('30-04-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (542300980, 'Jeroen', 'Pigott-Smith', '0570067546', 'jeroen.pigottsmith@h', '38 Meerbusch DriveEd', to_date('12-04-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (732124306, 'Suzi', 'Costner', '0585636924', 'suzi@aquickdelivery.', '854 Gellar AveCedar ', to_date('10-09-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (841014012, 'Rosie', 'Polley', '0529035336', 'rosie.p@ufs.uk', '3 Isaac RoadHorsham', to_date('19-06-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (335324017, 'Cledus', 'Clinton', '0569343281', 'cledus.clinton@primu', '12 Wichita BlvdAberd', to_date('18-05-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (800505817, 'Stevie', 'Kenoly', '0596531340', 'stevie.kenoly@united', '88 Terry RoadSpringf', to_date('09-10-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (620727981, 'Nanci', 'Marin', '0526208911', 'nanci.marin@merck.de', '920 Grant StreetAach', to_date('06-02-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (745967116, 'Elle', 'Underwood', '0555545688', 'eunderwood@integrate', '15 Ramirez DriveSan ', to_date('20-09-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (791159937, 'Tony', 'Chapman', '0542987990', 'tony.chapman@valleyo', '78 BullockZurich', to_date('20-05-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (961032170, 'Edgar', 'Washington', '0550678496', 'ewashington@tilsonla', '277 Beatty DriveBaru', to_date('25-09-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (445696364, 'Shannyn', 'Drive', '0539206398', 'shannyn.drive@bigdou', '45 Irving DriveBanbu', to_date('09-08-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (252802676, 'Saffron', 'McElhone', '0553892474', 'saffronm@gcd.com', '667 Dillon RoadLas V', to_date('18-09-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (371461722, 'Carol', 'Condition', '0530962275', 'carol.condition@free', '80 Saul RoadLowell', to_date('07-09-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (309172033, 'Ani', 'Atkinson', '0582466364', 'ani.atkinson@scripne', '21 Bristol StreetMas', to_date('26-02-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (275380062, 'Seann', 'Cleese', '0599049180', 'seann.cleese@tropica', '98 WingerCanberra', to_date('04-04-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (428510094, 'Jennifer', 'Tempest', '0569515278', 'jennifer.tempest@car', '447 Watson StreetPad', to_date('21-04-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (314058878, 'Harry', 'Spears', '0593243114', 'harry.spears@advance', '50 Northampton Stree', to_date('08-02-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (511016409, 'Leelee', 'Rifkin', '0588654735', 'leelee.rifkin@gillet', '47 Rupert BlvdBuenos', to_date('12-03-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (395681098, 'Laurence', 'Vinton', '0522367706', 'laurence.vinton@serv', '432 Baker DriveImmen', to_date('26-09-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (648974390, 'Roddy', 'Gough', '0581244757', 'roddy.g@generalelect', '88 Shannyn DriveGlen', to_date('15-07-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (678943065, 'Brenda', 'Smith', '0592492755', 'brenda.smith@diamond', '6 Crispin StreetRock', to_date('28-12-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (181286799, 'Marina', 'Zappacosta', '0545683435', 'marina@noodles.com', '5 Snow StreetHarahan', to_date('09-06-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (523548994, 'Kurtwood', 'Loring', '0552595339', 'kurtwood.loring@toyo', '48 Kenny BlvdReston', to_date('27-09-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (271819575, 'Moe', 'Lange', '0557266054', 'mlange@serentec.it', '4 Collins AveMoglian', to_date('24-08-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (331550903, 'Veruca', 'Shalhoub', '0529446256', 'veruca.shalhoub@suns', '930 Eddie StreetArar', to_date('11-10-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (164007318, 'Randall', 'Kirshner', '0537135059', 'rkirshner@spenser.co', '144 Murray StreetLea', to_date('09-11-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (255981589, 'Sophie', 'Lane', '0524124576', 'slane@avr.uk', '82 Manning RoadCobha', to_date('27-10-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (322492683, 'Ernest', 'Holbrook', '0544661237', 'ernest.holbrook@hori', '9 Storrington Street', to_date('15-12-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (596585911, 'Praga', 'Cattrall', '0544397891', 'praga@spenser.jp', '88 Tobolowsky RoadOk', to_date('05-10-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (438080728, 'Juan', 'Finn', '0581992604', 'juan@portosan.com', '6 Chanté StreetPrinc', to_date('28-08-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (321017966, 'Curtis', 'McDowell', '0549631779', 'curtis@eastmankodak.', '74 Vicious RoadRunco', to_date('18-07-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (138244272, 'Frankie', 'Leachman', '0521354262', 'frankie.leachman@dis', '949 Jaime StreetSalt', to_date('20-06-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (638446497, 'Joely', 'Ramirez', '0578376035', 'j.ramirez@meridiango', '12 McKennitt DriveGa', to_date('30-12-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (795069193, 'Minnie', 'Feuerstein', '0528673245', 'minnie@gulfmarkoffsh', '17 McGoohan RoadCham', to_date('03-11-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (837695409, 'Warren', 'Stuart', '0574077249', 'warren.stuart@fetchl', '78 Ralph RoadExeter', to_date('09-11-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (695997419, 'Adam', 'Kelly', '0567879455', 'a.kelly@bioanalytica', '954 Koufu BlvdLondon', to_date('13-10-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (993049007, 'Lin', 'Guzman', '0588462320', 'lin.guzman@randomwal', '1 Olin AveHines', to_date('04-01-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (202486846, 'Shelby', 'Gryner', '0582597798', 'shelby.gryner@timber', '45 Bellevue StreetSu', to_date('07-03-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (184942157, 'Rolando', 'Janssen', '0595959686', 'rolando.janssen@nat.', '85 Wright StreetKist', to_date('07-03-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (840301021, 'Nicole', 'Francis', '0538074268', 'nicole@authoria.com', '87 RotterdamSchenect', to_date('25-10-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (922110846, 'Victor', 'Palmer', '0542957223', 'victor.palmer@toyota', '10 Hudson RoadHerdec', to_date('15-03-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (301840741, 'Jackson', 'Channing', '0528513761', 'jchanning@bat.de', '59 Edwardstown AveGu', to_date('15-05-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (613399958, 'Kim', 'Sorvino', '0570168487', 'kims@quakercitybanco', '17 Abbotsford RoadVa', to_date('05-03-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (743769683, 'Miki', 'Carlisle', '0553051760', 'm.carlisle@nexxtwork', '46 St. Louis DriveBe', to_date('23-06-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (341267393, 'Brian', 'Lane', '0599504423', 'brian@hersheyfoods.d', '43rd StreetKöln', to_date('07-12-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (104424575, 'Domingo', 'Cronin', '0524753310', 'domingo.cronin@marri', '79 Downey BlvdGlasgo', to_date('13-03-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (858952494, 'Lynn', 'Harry', '0564085075', 'lynn.harry@monarchca', '84 Holmes AveWinnipe', to_date('12-10-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (151224001, 'Karen', 'Rundgren', '0524236711', 'karen.rundgren@bps.d', '82nd StreetMarburg', to_date('04-06-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (926831963, 'Jon', 'McKennitt', '0561333667', 'jon@safehomesecurity', '88 Platt StreetGävle', to_date('18-09-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (166288431, 'Jean', 'Ferrer', '0555387687', 'jean@morganresearch.', '94 Jacksonville Road', to_date('15-06-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (388876145, 'Raul', 'Young', '0568769643', 'raul.young@clubone.d', '40 Ben-Gurion Street', to_date('01-07-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (370186686, 'James', 'Bullock', '0543829097', 'j.bullock@travizon.c', '47 Brian RoadAmherst', to_date('23-12-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (239869442, 'Ewan', 'Shatner', '0544105942', 'ewan.shatner@bashen.', '512 Sorvino AveOoste', to_date('30-07-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (809976518, 'Arturo', 'Rio', '0572406999', 'arturor@jma.com', '99 Carlsbad RoadBoze', to_date('05-02-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (281175627, 'Tony', 'Donovan', '0559095648', 't.donovan@streetglow', '62 Balk DriveWest Mo', to_date('03-05-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (931351452, 'Benicio', 'Chaykin', '0584861391', 'b.chaykin@pharmacia.', '67 Goteborg StreetBu', to_date('25-10-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (548456727, 'Bobbi', 'Peet', '0597448192', 'bobbi.peet@adeasolut', '48 Morse RoadMiddleb', to_date('15-12-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (353900096, 'Rory', 'Carlyle', '0542515344', 'rory.carlyle@primuss', '192 Pollack DriveBra', to_date('14-04-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (472599952, 'Jennifer', 'Chappelle', '0557870221', 'jennifer@homedepot.c', '63 Bugnon StreetBarb', to_date('27-11-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (181904208, 'Emilio', 'Guinness', '0569892748', 'emilio.guinness@king', '75 Moe BlvdSummersid', to_date('16-01-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (151006133, 'Mark', 'Dzundza', '0520578414', 'mark.d@ptg.au', '99 Bugnon DriveAbbot', to_date('09-12-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (883957475, 'Chaka', 'Brandt', '0565003547', 'chaka.brandt@unicru.', '66 Nigel DriveBouche', to_date('23-07-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (618209593, 'Mint', 'Oszajca', '0550456350', 'm.oszajca@avs.at', '58 Guilfoyle RoadPot', to_date('06-05-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (434934018, 'Samuel', 'Cronin', '0534257479', 'samuel.cronin@msdw.c', '161 Bloemfontein Str', to_date('30-03-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (106549734, 'Mandy', 'Arkenstone', '0529339193', 'mandy.arkenstone@ber', '254 Monroe AveEchiro', to_date('12-11-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (416478396, 'Robert', 'Bacon', '0580985824', 'robert.bacon@hewlett', '802 Garcia BlvdPomon', to_date('10-04-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (111170131, 'Giovanni', 'Rispoli', '0580106401', 'giovanni.rispoli@com', '66 Liv DriveSouthamp', to_date('12-09-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (234936322, 'Ceili', 'Frampton', '0559672699', 'ceili.frampton@shar.', '431 Vaughn StreetHou', to_date('09-06-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (543717343, 'Trace', 'Utada', '0569463597', 'trace.utada@quicksil', '80 Benicio RoadHille', to_date('01-03-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (419411309, 'Busta', 'Vega', '0566564388', 'bvega@printingforles', '3 Bradford StreetDre', to_date('16-08-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (249969746, 'Avenged', 'Diehl', '0551629936', 'adiehl@solutionbuild', '219 McConaughey Stre', to_date('12-03-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (926155825, 'Brooke', 'Connery', '0568682447', 'b.connery@heritagemi', '62 Franco StreetMari', to_date('31-01-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (180703333, 'Andre', 'Kline', '0532807903', 'a.kline@qssgroup.com', '15 Offenburg StreetG', to_date('03-06-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (769449049, 'Saul', 'Duvall', '0521815658', 'saul.duvall@tigris.p', '79 Brooks StreetChor', to_date('25-03-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (858968428, 'Rosario', 'Stevenson', '0576544097', 'rosario.stevenson@sa', '99 Ulsteinvik Street', to_date('14-06-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (916632425, 'Goldie', 'Penn', '0568788045', 'goldie.p@palmbeachta', '97 Brussel RoadGoian', to_date('20-02-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (575647393, 'Robbie', 'Leachman', '0570010614', 'robbie.leachman@lina', '36 Brolin StreetMurr', to_date('19-08-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (720378100, 'Alannah', 'Schwimmer', '0575538340', 'a.schwimmer@oss.com', '67 Newton-le-willows', to_date('26-06-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (325770520, 'Jamie', 'Stowe', '0546402814', 'jamie.stowe@kroger.s', '11 DiBiasio StreetGo', to_date('15-07-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (418424370, 'Arturo', 'Winter', '0521164992', 'arturo.winter@linacs', '4 VoightTakamatsu', to_date('26-02-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (594117908, 'Chaka', 'Lofgren', '0529742726', 'chaka@procurementcen', '19 Westport RoadMayf', to_date('27-04-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (642361492, 'Isabella', 'Bancroft', '0524167290', 'isabella.b@spinnaker', '27 Day-Lewis AveS. B', to_date('30-05-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (187828708, 'Harrison', 'Smurfit', '0550970627', 'harrison@prosperityb', '86 Palminteri Street', to_date('10-07-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (897030283, 'Will', 'Sherman', '0593505358', 'will@mms.ch', '816 James StreetRhei', to_date('13-05-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (505893172, 'Debra', 'Heron', '0587104142', 'debra.heron@appriss.', '36 Adams AveEspoo', to_date('21-06-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (363990311, 'Laurie', 'Levine', '0564889630', 'lauriel@smartronix.c', '75 Petach-Tikva Road', to_date('26-06-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (316665484, 'Avril', 'Quinn', '0577621536', 'avril.quinn@csi.jp', '11 HalleKochi', to_date('10-01-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (799285930, 'Sara', 'Beckinsale', '0573189739', 'sarab@tropicaloasis.', '26 Brickell AveHyder', to_date('03-03-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (129533152, 'Davis', 'Jenkins', '0588641112', 'davis.jenkins@toyota', '35 Runcorn BlvdPotte', to_date('01-10-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (230973874, 'Bette', 'Douglas', '0581859095', 'betted@sunstream.de', '773 Coslada DriveWal', to_date('01-04-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (808663921, 'Giancarlo', 'Keaton', '0552640942', 'gkeaton@carteretmort', '97 Nicks RoadAurora', to_date('15-10-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (695833455, 'Celia', 'Ramirez', '0573188935', 'celia.r@telecheminte', '60 MidlerAurora', to_date('11-03-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (201896443, 'Keith', 'Gary', '0589700028', 'keith.gary@connected', '62 Taylor RoadNoumea', to_date('22-10-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (279333399, 'Meredith', 'Magnuson', '0539512488', 'meredith.magnuson@en', '63 Junior DriveThess', to_date('17-02-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (406338313, 'Davis', 'Kelly', '0591658327', 'dkelly@evergreenreso', '2 Lake Bluff StreetT', to_date('22-02-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (775083620, 'Aimee', 'Landau', '0534314623', 'aimee.landau@adolph.', '630 Roth RoadGliwice', to_date('06-10-1979', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (443155356, 'Maxine', 'Esposito', '0587382775', 'maxine.esposito@safe', '24 Dreyfuss StreetTu', to_date('02-03-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (292210755, 'Delbert', 'Vaughan', '0540892229', 'delbert.vaughan@mont', '26 RebekaBonn', to_date('17-03-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (914191859, 'Isaiah', 'Bogguss', '0544096680', 'isaiah.bogguss@elite', '86 Boyle RoadEttling', to_date('30-08-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (818154584, 'Owen', 'Chilton', '0532053994', 'owen.chilton@unit.de', '32 PorterLahr', to_date('12-10-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (889173244, 'Debra', 'Kirkwood', '0560187940', 'debra.kirkwood@tps.c', '94 Koyana StreetSolo', to_date('27-06-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (129616802, 'Xander', 'Napolitano', '0568526234', 'xander.napolitano@ai', '609 Azaria RoadHermi', to_date('09-04-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (317936986, 'Mekhi', 'Vance', '0571076347', 'mekhi.vance@gna.jp', '725 Posener StreetTo', to_date('11-10-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (922325953, 'Heath', 'Kleinenberg', '0544040134', 'heath.kleinenberg@sa', '143 Chilton DriveHav', to_date('04-06-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (443142543, 'Rolando', 'Pollack', '0585048249', 'rolando.pollack@unit', '41 Brock RoadIstanbu', to_date('28-08-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (628276102, 'Maggie', 'Kennedy', '0558369844', 'maggie.kennedy@nbs.c', '17 Wade RoadSparrows', to_date('01-06-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (348530484, 'Leon', 'Shatner', '0581534915', 'leon@dvdt.com', '9 Frankie DriveDerwo', to_date('16-05-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (380576741, 'Jimmy', 'Mahoney', '0575722148', 'jimmy.mahoney@carter', '88 Cartlidge AveKopp', to_date('12-05-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (223298492, 'Loreena', 'Macht', '0590336011', 'l.macht@labradanutri', '4 JulietteParamus', to_date('08-08-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (857454070, 'Frankie', 'Coolidge', '0599401027', 'frankiec@oriservices', '26 Dushku AveWoodbri', to_date('16-04-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (338431454, 'Patrick', 'Visnjic', '0592030898', 'patrick.visnjic@aco.', '83 Lewin DriveO''fall', to_date('26-11-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (211857699, 'Lennie', 'Dutton', '0594298723', 'lennie.dutton@iss.co', '65 Martinez StreetLe', to_date('15-05-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (399567816, 'Art', 'Wainwright', '0569215035', 'art.wainwright@spinn', '20 Everett RoadDubli', to_date('01-04-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (938077612, 'Julia', 'Jenkins', '0563761036', 'jjenkins@noodles.be', '26 Hopkins StreetMec', to_date('17-04-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (585111831, 'Victoria', 'Goldberg', '0538732095', 'vgoldberg@astafundin', '664 Atkinson RoadFar', to_date('21-09-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (808181547, 'Jonny Lee', 'Houston', '0583570146', 'jonnylee@paisley.de', '60 Meg BlvdMarburg', to_date('09-07-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (859486697, 'Tyrone', 'Schiavelli', '0557675710', 'tyrone@pfizer.com', '28 Penelope AveFrank', to_date('25-06-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (606084738, 'Patti', 'Luongo', '0559622996', 'patti.luongo@emt.de', '52 Shelby DriveBautz', to_date('10-04-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (833753034, 'Paul', 'Buckingham', '0573456350', 'paul.buckingham@shir', '67 Palma de Mallorca', to_date('19-03-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (719934083, 'Alicia', 'Russo', '0537108587', 'alicia.russo@pis.es', '77 Mantegna AveAgonc', to_date('03-08-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (238840263, 'Terri', 'Van Damme', '0547613216', 't.vandamme@atxforms.', '79 Waldorf StreetLos', to_date('21-08-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (668708923, 'Victor', 'Cassidy', '0520456082', 'victor.cassidy@glaci', '65 Sigourney StreetY', to_date('03-12-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (929094223, 'Samantha', 'Foley', '0577956812', 'samantha.foley@cis.c', '54 Fort worth DriveS', to_date('26-03-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (598632809, 'Louise', 'Zappacosta', '0562979330', 'louise.z@hewlettpack', '32nd StreetHuntsvill', to_date('29-03-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (877474114, 'Andrew', 'Caan', '0576077207', 'andrew.caan@its.ca', '28 Lennox DriveMontr', to_date('07-01-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (533316403, 'Reese', 'Spears', '0543154475', 'reese.spears@anworth', '18 Sean RoadFoster C', to_date('11-02-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (203468049, 'Tobey', 'Wilkinson', '0539149393', 'tobey.wilkinson@baes', '68 BuddyVeenendaal', to_date('19-04-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (350254293, 'Lisa', 'Hawkins', '0590114031', 'lisa.hawkins@boldtec', '39 Pointe-claire Dri', to_date('12-04-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (107860119, 'Uma', 'Armatrading', '0582451025', 'uma@northhighland.li', '71 Matarazzo RoadEsc', to_date('03-05-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (980883703, 'Franco', 'O''Neill', '0541538202', 'franco.oneill@y2mark', '71 Tom DriveKaohsiun', to_date('16-12-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (598289147, 'Vendetta', 'Leachman', '0554770704', 'vendetta.leachman@ge', '45 Moriarty DrivePor', to_date('11-02-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (740417844, 'Mira', 'Haynes', '0587856924', 'mira@merck.com', '51 Cherry DriveReno', to_date('17-04-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (805462072, 'Manu', 'Cox', '0547244231', 'manu.cox@restaurantp', '34 Reeve DriveVista', to_date('13-06-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (839669889, 'Collin', 'Rickles', '0548060158', 'collin.rickles@speak', '63rd StreetFukui', to_date('28-08-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (641986332, 'Sheryl', 'Brooke', '0532042322', 'sheryl.brooke@infovi', '82nd StreetPretoria', to_date('02-11-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (925679545, 'Parker', 'Blackmore', '0553492165', 'parker.blackmore@til', '42 Kopavogur BlvdQué', to_date('04-06-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (157239088, 'Cesar', 'Whitford', '0545221950', 'cesar.whitford@enter', '48 D''Onofrio RoadBru', to_date('30-05-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (323695688, 'Jimmy', 'Dawson', '0581328175', 'jimmy.dawson@blueoce', '36 Feuerstein DriveL', to_date('22-04-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (820250465, 'Rod', 'Ali', '0572281754', 'rod.ali@midwestmedia', '91 Firenze DriveFrie', to_date('11-07-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (404710571, 'Grant', 'Dysart', '0576294776', 'grant.dysart@venoco.', '48 Birmingham Street', to_date('05-10-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (806488394, 'Davey', 'Barnett', '0562056047', 'daveyb@interfacesoft', '76 Lofgren StreetHäs', to_date('23-11-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (280019417, 'Jessica', 'Llewelyn', '0523455386', 'jessica@capitalautom', '94 Arkenstone BlvdRi', to_date('19-08-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (229688953, 'Victor', 'Trejo', '0556433645', 'victor.t@nexxtworks.', '26 Mandrell RoadAmar', to_date('27-02-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (135607013, 'Julianne', 'Baker', '0536362820', 'julianne.baker@ahl.c', '9 Bismarck RoadWest ', to_date('16-02-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (253060937, 'Miriam', 'Clooney', '0598507380', 'miriam.clooney@baesc', '8 Courbevoie DriveGo', to_date('17-10-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (403778173, 'Solomon', 'Ingram', '0537179645', 's.ingram@maverick.ca', '71 Hartmannsdorf Dri', to_date('23-12-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (792128686, 'Amanda', 'Tarantino', '0582786371', 'amanda.tarantino@htt', '635 Bellevue RoadCar', to_date('21-12-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (226149117, 'Elisabeth', 'Bracco', '0596863959', 'elisabethb@wci.at', '98 Thompson AveSalzb', to_date('14-03-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (562452670, 'Beverley', 'Rush', '0545603963', 'beverley.rush@hfn.uk', '21 Sonny RoadMableth', to_date('02-03-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (142650344, 'Leelee', 'Sampson', '0535045533', 'leelee.s@alohanysyst', '473 Getty StreetSeat', to_date('26-05-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (604783619, 'Anthony', 'Forrest', '0579198334', 'aforrest@usphysicalt', '87 Detmer RoadFort w', to_date('26-10-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (291812678, 'Sandra', 'Calle', '0599959238', 'sandra.calle@onstaff', '616 Himmelman RoadTu', to_date('04-12-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (950757025, 'Betty', 'Olin', '0560177902', 'b.olin@tigris.jp', '42 Valencia AveHiros', to_date('11-11-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (220760679, 'Ray', 'Phillips', '0558869426', 'ray.p@marketbased.dk', '85 Trenton RoadOdens', to_date('29-09-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (508525659, 'Marina', 'Schock', '0598465210', 'marina.s@astafunding', '21st StreetPortland', to_date('02-01-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (586263101, 'Mira', 'Napolitano', '0524081318', 'mira.napolitano@midw', '52 SpinerHerndon', to_date('01-09-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (163164956, 'Grant', 'Womack', '0574134930', 'grant.womack@priorit', '31st StreetBollensen', to_date('01-11-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (893838480, 'Marc', 'Steiger', '0593544593', 'marc.steiger@lynksys', '18 Reeve RoadColombe', to_date('01-04-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (589465140, 'Suzi', 'Donovan', '0538398675', 'suzi.donovan@aquickd', '72 Rutger StreetEind', to_date('27-02-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (214921244, 'Candice', 'Lithgow', '0528612536', 'candicel@aristotle.e', '114 Hoskins StreetTa', to_date('31-12-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (741341188, 'Ewan', 'Tippe', '0552078515', 'etippe@hotmail.ch', '91 Heron AveNeuchâte', to_date('02-12-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (587299495, 'Marie', 'Collette', '0574299257', 'marie.collette@progr', '71 Nantes RoadOdense', to_date('12-08-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (823922225, 'Daryl', 'Buckingham', '0524414653', 'daryl@computersource', '3 Ryder RoadWest Che', to_date('03-11-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (183388113, 'Giovanni', 'Gandolfini', '0553602239', 'giovanni.gandolfini@', '90 Clarence StreetMo', to_date('17-01-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (860455901, 'Demi', 'Hornsby', '0529483526', 'demih@hewlettpackard', '32 Akins AveOhtsu', to_date('26-10-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (710362941, 'Steve', 'Hyde', '0587326669', 'steve.h@csi.it', '99 Aiken RoadDalmine', to_date('19-07-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (462464893, 'Elvis', 'Hagar', '0589841494', 'elvis@caliber.de', '58 Charlottesville R', to_date('08-04-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (840620122, 'Janice', 'Palminteri', '0573646988', 'janice.palminteri@su', '75 Olin AveMiddlebur', to_date('17-01-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (700291020, 'Mary', 'Bullock', '0547917714', 'mary.bullock@extreme', '68 Parsippany RoadMe', to_date('16-09-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (851294584, 'Mary-Louise', 'Brosnan', '0545581179', 'marylouise@emt.com', '49 Mifune BlvdCary', to_date('18-07-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (783665095, 'Marianne', 'Browne', '0540415133', 'marianne.browne@jsa.', '95 Thame RoadBarbeng', to_date('16-01-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (510142246, 'Suzy', 'Walken', '0520581506', 'suzy.walken@mds.com', '46 Montreal DriveNew', to_date('12-08-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (425043233, 'Sonny', 'Ryan', '0559982275', 'sonny.ryan@lms.com', '4 Omar StreetBlue be', to_date('27-01-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (325534613, 'Christmas', 'Lennox', '0529415382', 'christmas@surmodics.', '46 Ittigen RoadSanta', to_date('02-10-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (114114500, 'Christmas', 'Sedaka', '0584895179', 'christmas.sedaka@blu', '36 DaveVejle', to_date('11-05-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (136668839, 'Susan', 'Callow', '0541231965', 'scallow@wrgservices.', '72nd StreetDreieich', to_date('08-10-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (856092118, 'Rascal', 'Luongo', '0569664345', 'rascal.luongo@gdi.co', '707 NatalieEden prai', to_date('02-12-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (247556202, 'Lesley', 'Harris', '0576186903', 'lesley.harris@freedo', '80 Reed DriveFoster ', to_date('07-06-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (724032270, 'Deborah', 'Harrelson', '0532028344', 'deborah@kis.com', '42nd StreetSnoqualmi', to_date('06-03-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (921040663, 'Brendan', 'McConaughey', '0565484179', 'brendanm@captechvent', '498 Eddie RoadNaha', to_date('30-05-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (484532261, 'Kyra', 'Hayes', '0529976772', 'kyra.h@kelmooreinves', '42 Jolie StreetJacks', to_date('07-05-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (513622934, 'Breckin', 'Makowicz', '0559187021', 'breckin.makowicz@mag', '7 Holbrook AveWaco', to_date('16-04-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (618635357, 'Davey', 'Van Der Beek', '0571859940', 'davey@flavorx.de', '75 Bradley AveHerdec', to_date('19-04-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (717029668, 'Chubby', 'Adams', '0553848972', 'chubby.adams@team.au', '62nd StreetKuraby', to_date('26-10-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (992808103, 'Adam', 'Tilly', '0529436696', 'adam@mission.com', '672 Thalwil AveCarmi', to_date('08-01-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (489157227, 'Gates', 'Boyle', '0586097717', 'gates.boyle@career.z', '833 Savage AveGauten', to_date('06-05-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (263311536, 'Chuck', 'Dean', '0556276657', 'chuck.d@hotmail.lt', '63rd StreetKaunas', to_date('13-02-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (640480720, 'Colin', 'Melvin', '0547538838', 'c.melvin@air.it', '9 Wilder RoadTreviso', to_date('01-09-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (587026468, 'Luis', 'Albright', '0522687191', 'luis.albright@cynerg', '26 Amsterdam AveMexi', to_date('30-08-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (509412899, 'Lin', 'Tyson', '0560703553', 'ltyson@denaliventure', '17 Juneau DriveJacks', to_date('01-11-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (765542455, 'Veruca', 'Crudup', '0526374267', 'veruca@prahs.com', '66 Gertner DriveNew ', to_date('02-04-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (705859809, 'Patrick', 'Chilton', '0591296629', 'patrick.chilton@auth', '30 Kershaw DriveKobe', to_date('06-06-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (882296829, 'Scarlett', 'Coughlan', '0538401382', 'scoughlan@procter.it', '82 Tony StreetSantor', to_date('30-03-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (564352234, 'Lee', 'Haslam', '0574953145', 'lee.h@grayhawksystem', '23 Hingle RoadOlympi', to_date('10-05-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (911742539, 'Lily', 'Belles', '0557797334', 'lily.belles@cowlitzb', '22 Bruce AveSan Mate', to_date('22-08-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (629129802, 'Scott', 'Albright', '0597956482', 'salbright@ibfh.br', '26 Eder AveVarzea gr', to_date('08-04-1961', 'dd-mm-yyyy'));
commit;
prompt 700 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (375359937, 'Jaime', 'Dunn', '0541539784', 'jaimed@progressivede', '42nd StreetMontreal', to_date('06-06-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (965854496, 'Avenged', 'Whitford', '0553515582', 'avenged@ibm.dk', '98 Rooker BlvdTilst', to_date('20-06-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (740926081, 'Pam', 'McElhone', '0558102379', 'p.mcelhone@callhenry', '52nd StreetWarsaw', to_date('01-08-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (789556231, 'Kevn', 'Blanchett', '0566438165', 'kevn.blanchett@accur', '51st StreetAvon', to_date('09-07-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (276108508, 'Dean', 'Rourke', '0564425256', 'deanr@pragmatechsoft', '17 Ismaning RoadKyot', to_date('24-07-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (681789157, 'Tea', 'Garner', '0541895939', 'tea.garner@vertexsol', '78 Celia StreetTorin', to_date('09-10-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (612576150, 'Lucinda', 'Pesci', '0552125280', 'lucinda.p@uem.at', '4 Maguire StreetZipf', to_date('15-09-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (284487650, 'Gavin', 'Conley', '0555128612', 'gavinc@spinnakerexpl', '86 Vanderbijlpark Dr', to_date('25-02-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (422066354, 'Julie', 'Langella', '0521152168', 'julie.langella@als.c', '36 Takapuna StreetPo', to_date('03-12-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (413193508, 'Rascal', 'Belles', '0561082502', 'r.belles@teoco.com', '78 Pesci RoadAlmaty', to_date('22-02-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (286889168, 'Penelope', 'Harrelson', '0562631689', 'p.harrelson@inzone.c', '90 Whitford DriveNil', to_date('07-12-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (589519506, 'Gordie', 'Braugher', '0532279880', 'gordie.braugher@park', '67 Carlton StreetSum', to_date('10-01-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (438813407, 'Sinead', 'Hall', '0520498285', 'sinead.hall@tilia.it', '55 St-bruno RoadParm', to_date('21-12-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (674590522, 'Pamela', 'Berkeley', '0587638161', 'pamela.berkeley@cowl', '85 Kagoshima DriveCo', to_date('30-04-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (652332082, 'Forest', 'Hauser', '0521298099', 'forest.hauser@advert', '51 Miami StreetHouma', to_date('24-07-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (439634346, 'Chazz', 'Pitt', '0597504593', 'chazz.p@clubone.es', '43rd StreetAlcobenda', to_date('31-07-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (968089050, 'Joshua', 'Hayes', '0537956744', 'joshua.hayes@hitechp', '34 Plowright StreetG', to_date('09-05-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (528422726, 'Gene', 'Lerner', '0586332803', 'genel@knightsbridge.', '69 Crosby DriveNagas', to_date('13-07-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (452822716, 'Kris', 'Griggs', '0522652138', 'kris@mse.br', '75 Branch RoadCuriti', to_date('07-10-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (808935919, 'Heather', 'Jackman', '0532255632', 'heather.jackman@reck', '5 Burt DriveOldham', to_date('28-06-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (965774744, 'Beth', 'Vaughan', '0563277733', 'beth.v@bayer.de', '93 Pastore AveDreiei', to_date('25-08-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (518198982, 'Jason', 'Burmester', '0558312792', 'jason.burmester@sara', '632 Mykelti DriveLov', to_date('05-07-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (707562374, 'Horace', 'Durning', '0580059580', 'horace.durning@prome', '93 Lexington BlvdBan', to_date('16-01-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (423738747, 'Samuel', 'Carmen', '0570733114', 'samuel.carmen@americ', '82nd StreetBraintree', to_date('01-05-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (557957141, 'Marie', 'Paul', '0564754026', 'marie.paul@peerlessm', '11 Tokushima StreetM', to_date('18-02-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (966917930, 'Darren', 'Dutton', '0577370639', 'darren.dutton@mwp.co', '4 Barrymore StreetPu', to_date('20-08-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (395778759, 'Judge', 'Dooley', '0573245394', 'judge@timevision.au', '9 Kevin RoadSt Kilda', to_date('12-06-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (267577315, 'Jake', 'Caan', '0540090026', 'j.caan@powerlight.dk', '21 Johannesburg Stre', to_date('08-08-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (942288467, 'Timothy', 'Thomson', '0544868046', 'tthomson@interfaceso', '14 HolmGuadalajara', to_date('09-02-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (393634100, 'Pete', 'Gallant', '0590906148', 'pete.g@keymark.br', '41st StreetPirapora ', to_date('10-06-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (799010990, 'Danni', 'Pesci', '0556950808', 'danni.pesci@security', '21 Kenny DriveBirmin', to_date('26-02-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (752603295, 'Blair', 'Thomson', '0555432286', 'blair@portageenviron', '349 Lopez StreetBerk', to_date('12-07-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (880620403, 'Luis', 'McDonnell', '0585386669', 'luis.mcdonnell@hitec', '60 PaderbornTowson', to_date('30-08-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (360983983, 'Gilbert', 'Tolkan', '0561105136', 'gilbert.tolkan@qestr', '92 Rhett RoadRichmon', to_date('27-11-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (355394599, 'Vertical', 'Herndon', '0554033937', 'vertical.herndon@scj', '42 Thomson StreetAll', to_date('25-02-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (897137436, 'Cole', 'Kutcher', '0539574635', 'cole.kutcher@csi.com', '69 Olga StreetWebste', to_date('15-07-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (651588900, 'Cloris', 'Cleese', '0561411440', 'cloris.cleese@elite.', '36 Williamstown Road', to_date('24-05-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (781552572, 'Gerald', 'Wiest', '0539308718', 'gerald.wiest@deutsch', '59 Lyngby StreetHerm', to_date('17-12-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (885046351, 'Emmylou', 'McGinley', '0522317202', 'emmylou.m@dvdt.com', '70 Elvis RoadAnnanda', to_date('11-10-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (376616036, 'Giovanni', 'Apple', '0532648747', 'gapple@atg.uk', '709 Sizemore DriveEs', to_date('11-12-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (820392133, 'Natalie', 'Stanley', '0585737154', 'nstanley@trusecure.c', '11 Preston StreetBer', to_date('03-02-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (480421861, 'Gord', 'Mason', '0597325809', 'gord.mason@authoria.', '84 Oak Park BlvdAdam', to_date('27-07-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (662127500, 'Anne', 'Skerritt', '0589131575', 'a.skerritt@gbas.nc', '91st StreetNoumea', to_date('12-06-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (789931364, 'Alana', 'Worrell', '0553947754', 'aworrell@millersyste', '74 Algermissen Stree', to_date('13-01-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (900165540, 'Judy', 'Rea', '0549901467', 'jrea@hfg.com', '308 Easton DriveArli', to_date('29-10-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (855275039, 'Juan', 'Strathairn', '0547624342', 'juan.strathairn@soft', '82 Liev StreetEisenh', to_date('17-09-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (519165459, 'Claire', 'Dzundza', '0577193396', 'cdzundza@balchem.com', '886 Rick StreetEast ', to_date('31-03-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (395506050, 'Andrew', 'Steiger', '0582694673', 'andrew.s@escalade.co', '84 Borger RoadBattle', to_date('03-03-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (254966441, 'Liv', 'Swayze', '0579626200', 'lswayze@wyeth.com', '60 Sparrows Point Ro', to_date('17-05-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (470819789, 'Jackson', 'Shannon', '0522518293', 'jackson.shannon@sfma', '69 Cagle RoadCesena', to_date('16-09-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (646226975, 'Tony', 'Brooke', '0553392847', 'tonyb@hardwoodwholes', '297 Mifune RoadSprin', to_date('26-11-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (597200807, 'April', 'Keen', '0541344819', 'april.keen@securityc', '10 Logue BlvdBrisban', to_date('27-10-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (515597665, 'Suzy', 'Harry', '0545644529', 'suzy.harry@otbd.se', '30 Zane DriveGotebor', to_date('01-10-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (658708922, 'Stockard', 'Schwimmer', '0596438856', 'stockard@sps.nl', '83rd StreetZaandam', to_date('19-12-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (615324903, 'Rick', 'Mann', '0527454518', 'rick.mann@refinery.c', '51 Wilmington Street', to_date('24-03-1950', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (489121115, 'Lucinda', 'Kinney', '0535146074', 'lucinda.kinney@natur', '34 WhitmanSpring Cit', to_date('06-04-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (713656231, 'Belinda', 'Chan', '0559547654', 'belindac@ogiointerna', '94 Boz StreetThalwil', to_date('28-07-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (831396788, 'Night', 'Charles', '0595066171', 'night.c@newmedia.jp', '37 DaviesOsaka', to_date('19-04-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (473060959, 'Marlon', 'Cruz', '0550726550', 'mcruz@coridiantechno', '79 El Masnou RoadKar', to_date('07-03-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (176774232, 'Paula', 'Balaban', '0566208960', 'paula.balaban@global', '31 Colton StreetSant', to_date('21-01-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (403572395, 'Kimberly', 'Flemyng', '0565563854', 'kimberly.f@processpl', '8 Diggs BlvdMilano', to_date('27-05-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (376533828, 'Michael', 'Valentin', '0536186068', 'mvalentin@priorityex', '41 Spector RoadChamb', to_date('07-07-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (235298895, 'Sissy', 'Bean', '0567161359', 'sissyb@aquascapedesi', '49 Burr Ridge Street', to_date('02-05-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (749803138, 'Vonda', 'Manning', '0551170469', 'vonda.manning@lynksy', '41 Byrne StreetBiel', to_date('12-02-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (770798112, 'Gerald', 'Fox', '0527727075', 'gfox@authoria.br', '63 O''Donnell DriveRe', to_date('29-12-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (765540874, 'Cuba', 'Gooding', '0537358535', 'c.gooding@horizon.de', '12 MacIsaac StreetLe', to_date('08-02-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (822031404, 'Cary', 'Boyle', '0585188659', 'cary@greenmountain.c', '603 Lucas BlvdRoches', to_date('30-08-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (546599903, 'Winona', 'Mellencamp', '0594851137', 'wmellencamp@base.uk', '25 Green bay StreetO', to_date('02-08-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (357601745, 'Barbara', 'Coburn', '0586352676', 'barbara.coburn@vspan', '22 Janeane BlvdJohor', to_date('08-09-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (263179821, 'Nikki', 'Folds', '0577022877', 'nikki.folds@tilia.co', '99 Van Der Beek Stre', to_date('16-04-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (101190138, 'Frankie', 'Stone', '0588630732', 'frankie.stone@techrx', '4 Summerside StreetT', to_date('06-05-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (278675897, 'Alicia', 'Stone', '0534954725', 'a.stone@unilever.com', '679 Spencer StreetBo', to_date('23-09-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (855635262, 'Crystal', 'Hatosy', '0530188087', 'crystal.hatosy@lms.c', '88 Queen DriveGrand ', to_date('13-03-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (217345151, 'Jim', 'Wolf', '0568585060', 'jimw@airmethods.de', '85 Luis StreetMünche', to_date('03-12-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (687855134, 'Jimmie', 'Winstone', '0582153769', 'jimmie.winstone@mai.', '30 West Windsor Stre', to_date('11-04-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (142800868, 'Nicolas', 'McDonnell', '0538182831', 'n.mcdonnell@ssci.com', '50 Ruffalo DriveZagr', to_date('24-07-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (347863968, 'Christian', 'Rowlands', '0522667979', 'christian@pra.com', '82 King StreetEast P', to_date('24-01-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (396898235, 'Trick', 'Rickles', '0527844712', 'trick@mss.de', '96 Bradenton StreetU', to_date('23-08-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (990720667, 'Marty', 'Connery', '0551949963', 'm.connery@verizon.co', '32 Fisher BlvdLexing', to_date('26-12-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (656390592, 'Raymond', 'Tobolowsky', '0556584873', 'raymond.tobolowsky@s', '21 Lake Bluff Street', to_date('28-05-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (725530361, 'Pelvic', 'Quaid', '0523069058', 'pelvic.quaid@innovat', '7 Colin DriveTokyo', to_date('28-07-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (287161405, 'Julio', 'Linney', '0595364988', 'julio.l@gbas.uk', '51 Andrews RoadBurge', to_date('06-01-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (455218666, 'Carla', 'Molina', '0594032480', 'carla.molina@learnin', '76 NicoleOldenburg', to_date('23-03-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (328254649, 'Vivica', 'Buscemi', '0533695847', 'vivica.buscemi@prosu', '58 Stiles DriveCagua', to_date('26-06-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (207822589, 'Dean', 'Condition', '0579089986', 'dean.condition@horiz', '81 Giannini StreetKw', to_date('26-07-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (384887635, 'Randy', 'Domino', '0527956739', 'randy.d@formatech.ca', '83 Burns StreetSumme', to_date('11-09-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (317913039, 'Jesse', 'Uggams', '0542399750', 'jesseu@bis.com', '43 Pacino DrivePhila', to_date('28-10-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (113445331, 'Karen', 'Coleman', '0541914371', 'karenc@networkdispla', '99 Alda BlvdCle Elum', to_date('02-11-2003', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (236335176, 'Rebecca', 'Blanchett', '0581207589', 'rebecca.blanchett@de', '1 Potsdam RoadCoppel', to_date('20-03-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (347065963, 'Denise', 'Peniston', '0580277681', 'denise.peniston@ente', '41st StreetSlidel', to_date('04-06-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (498521291, 'Gerald', 'Madsen', '0572886687', 'gerald.madsen@sfmai.', '68 Warszawa AveColom', to_date('03-01-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (180330027, 'Denzel', 'Vaughan', '0533014048', 'denzel.vaughan@aloha', '24 Milpitas StreetGl', to_date('14-01-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (627921589, 'Todd', 'Ripley', '0582006320', 'todd.ripley@ads.com', '46 Kline RoadBatavia', to_date('14-10-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (872198220, 'Alannah', 'Jane', '0585355227', 'alannah.jane@ass.uk', '14 Albright RoadNort', to_date('03-10-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (178640550, 'Isaiah', 'Robbins', '0577223602', 'isaiahr@verizon.com', '41st StreetForest Pa', to_date('08-10-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (790737233, 'Mili', 'Guilfoyle', '0580832346', 'mili.guilfoyle@elite', '225 Teena RoadMarbur', to_date('17-01-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (610881982, 'Gates', 'Hersh', '0579937595', 'gates.h@trx.com', '72 Luongo RoadAlexan', to_date('30-03-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (514238809, 'Talvin', 'Mewes', '0525352565', 'talvin.mewes@grt.com', '76 Holliston StreetS', to_date('25-08-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (721908268, 'Wesley', 'Sisto', '0546225733', 'wesleys@electricalso', '62 FogertyRedwood Sh', to_date('25-08-2000', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (541080003, 'Trini', 'Lynne', '0543303420', 't.lynne@accucode.au', '78 Nelly RoadAdelaid', to_date('14-08-1987', 'dd-mm-yyyy'));
commit;
prompt 800 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (433823167, 'Val', 'Ammons', '0590544645', 'vammons@usainstrumen', '67 Warsaw StreetMurr', to_date('10-05-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (614060957, 'Reese', 'Curtis', '0586949647', 'reesec@gna.uk', '32 Runcorn StreetEde', to_date('23-05-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (782429762, 'Harriet', 'Sizemore', '0564304319', 'hsizemore@calence.de', '37 Salzburg StreetAl', to_date('18-05-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (728800085, 'Regina', 'Rivers', '0539099941', 'regina.rivers@fordmo', '88 Chung RoadChennai', to_date('31-07-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (113747735, 'Patricia', 'Davison', '0523442080', 'patricia.davison@bra', '59 Loveland StreetGr', to_date('23-06-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (258952693, 'Hugo', 'Favreau', '0564780715', 'hugo.favreau@usenerg', '904 Ann Arbor AveRom', to_date('18-07-1952', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (294928991, 'Kay', 'Ledger', '0591362737', 'kay.ledger@lynksyste', '51 Rosario RoadAlcob', to_date('27-02-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (648695073, 'Thin', 'Peniston', '0521798734', 'thin@outsourcegroup.', '33rd StreetChinnor', to_date('31-10-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (853888595, 'Carrie', 'Dukakis', '0543128901', 'cdukakis@smartdrawco', '3 Adelaide StreetFai', to_date('06-04-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (671935128, 'Chuck', 'Richter', '0555566861', 'chuck.richter@cendan', '111 Birch StreetStel', to_date('19-04-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (171382190, 'Lindsey', 'Aniston', '0554142516', 'laniston@escalade.co', '94 Jack AveBristol', to_date('04-06-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (799706432, 'Gaby', 'Anderson', '0574821149', 'gaby.anderson@onstaf', '25 Stanley StreetCer', to_date('17-01-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (318648963, 'Rhett', 'Dickinson', '0558686429', 'rhett@conagra.uk', '22nd StreetGlasgow', to_date('25-02-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (706061824, 'Ned', 'Holland', '0572955037', 'ned.holland@shirtfac', '27 Rudd StreetBretzf', to_date('05-03-1963', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (425541827, 'Rascal', 'Winger', '0529538264', 'rascal.winger@gagwea', '574 Vienna AveHanove', to_date('09-07-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (126597937, 'Dennis', 'Khan', '0571625993', 'dennis.khan@gsat.ch', '4 Ferraz  vasconcelo', to_date('29-05-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (254746679, 'Bobbi', 'Shatner', '0594310622', 'bobbi.shatner@boldte', '36 Koteas RoadMonume', to_date('16-04-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (390542828, 'Alicia', 'Church', '0557505168', 'alicia.church@abs.dk', '5 Newbury RoadCopenh', to_date('17-10-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (821987828, 'Lauren', 'Crewson', '0581263202', 'lauren@oss.de', '4 Brooke AveOppenhei', to_date('30-05-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (906997862, 'Uma', 'Skarsgard', '0524876583', 'uma.skarsgard@sbc.ch', '28 Tucson StreetSurs', to_date('02-06-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (181009027, 'Boyd', 'Kirshner', '0575765974', 'boyd.kirshner@adeaso', '17 Lisbon RoadMantov', to_date('19-04-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (654943176, 'Timothy', 'Weiland', '0524506723', 'timothy.weiland@inve', '5 Mueller-Stahl Driv', to_date('26-01-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (370717744, 'Ronny', 'Statham', '0559841454', 'ronny.statham@questa', '89 Rueben RoadHarris', to_date('29-08-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (235756058, 'Gordie', 'Allan', '0579601171', 'gordie.allan@fns.ca', '82 Montreal StreetBr', to_date('29-08-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (550243897, 'Gena', 'Scott', '0591248101', 'gena.scott@actechnol', '48 Witt BlvdNara', to_date('03-05-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (943786572, 'Jodie', 'Gilley', '0524555150', 'jodie.gilley@spas.co', '89 Todd StreetLake O', to_date('24-01-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (553883245, 'Benicio', 'Ribisi', '0527574590', 'bribisi@ksj.ar', '35 BoscoBuenos Aires', to_date('17-09-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (172537510, 'Richard', 'Cassel', '0550701291', 'richardc@glacierbanc', '819 Fox DriveGraz', to_date('09-01-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (858098492, 'Bebe', 'Murray', '0537986879', 'bebe.murray@mindwork', '85 Leachman AveSanto', to_date('16-05-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (333973430, 'Kitty', 'McGinley', '0540808487', 'kitty.mcginley@bps.u', '80 Fort Lewis RoadPa', to_date('06-05-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (178297018, 'Edgar', 'Laurie', '0576349472', 'e.laurie@gapinc.de', '38 Beth StreetWuerzb', to_date('07-03-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (495654372, 'Mint', 'Fonda', '0550286204', 'mfonda@socketinterne', '85 Leeds StreetBount', to_date('30-06-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (716936353, 'Eliza', 'Sevigny', '0564949999', 'eliza.sevigny@ceom.u', '9 Arkenstone DriveMa', to_date('06-12-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (950676199, 'Geoff', 'Devine', '0596261114', 'geoff.devine@keymark', '99 Seattle StreetBri', to_date('05-01-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (494301370, 'Halle', 'Sedaka', '0588788346', 'halle.sedaka@primuss', '623 MarshallEnglewoo', to_date('11-06-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (910066603, 'Lloyd', 'Quinones', '0563053229', 'l.quinones@biorelian', '14 Carla RoadRichard', to_date('13-06-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (955654834, 'John', 'Hartnett', '0547958660', 'john.h@venoco.it', '44 Brussel DriveGuam', to_date('28-03-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (802010471, 'Garry', 'Liotta', '0573366592', 'garry.liotta@learnin', '1000 BloemfonteinSal', to_date('15-04-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (139323807, 'Miko', 'Platt', '0546457807', 'mplatt@apexsystems.c', '87 Madsen RoadSchene', to_date('11-03-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (824940431, 'Jena', 'Biggs', '0547612377', 'jena.biggs@newtonint', '89 Koppl StreetMonum', to_date('23-07-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (518251926, 'Powers', 'Sisto', '0577095938', 'powers.sisto@johnson', '61 Ryder AveFort Lew', to_date('01-12-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (196429514, 'Vincent', 'Goldberg', '0590841235', 'vincent.goldberg@spe', '96 Rhona AveWürzburg', to_date('02-05-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (340163676, 'Kathy', 'MacDowell', '0586380268', 'k.macdowell@cendant.', '34 Eric DriveShrevep', to_date('20-04-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (700116319, 'Albert', 'Flanagan', '0599824803', 'albert.f@anheuserbus', '45 Holeman DriveThör', to_date('16-10-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (945620464, 'Grant', 'Gere', '0529149194', 'grant.gere@provident', '779 AthensNewnan', to_date('01-05-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (594432781, 'Maria', 'Conway', '0555250837', 'maria@diageo.de', '39 Mahood BlvdEschbo', to_date('18-02-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (463934742, 'Isaiah', 'Zappacosta', '0520876856', 'isaiah.zappacosta@af', '4 Bates DrivePusan-c', to_date('05-06-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (652702601, 'Roddy', 'Aiken', '0545159389', 'roddy.aiken@american', '59 Hartmannsdorf Roa', to_date('19-02-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (697707101, 'Jackson', 'Miles', '0594100500', 'jackson.m@toyotamoto', '44 Sutton StreetCamp', to_date('07-08-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (497949420, 'Chris', 'Redford', '0536072857', 'chris@kramontrealty.', '77 Flanagan DriveNah', to_date('07-11-1966', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (939632086, 'Isaiah', 'Pleasence', '0566738538', 'isaiah.pleasence@ext', '70 Foley RoadVantaa', to_date('07-04-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (264030101, 'Simon', 'Kretschmann', '0579102857', 'simon@pds.be', '38 McCormack RoadWav', to_date('23-11-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (201262859, 'Miki', 'Palmieri', '0521332285', 'miki.palmieri@wci.co', '68 Ripley AveMonmout', to_date('23-02-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (829531211, 'Solomon', 'Sayer', '0527474135', 'solomon.s@telwares.c', '17 Tara RoadThalwil', to_date('24-05-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (768798021, 'Tori', 'Affleck', '0520237902', 'tori.affleck@pepsico', '53rd StreetBirmingha', to_date('07-03-1990', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (512613182, 'Rowan', 'Torn', '0571634318', 'rowant@deutschetelek', '48 CraddockGeneva', to_date('20-05-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (397645494, 'Olympia', 'Giamatti', '0585524101', 'o.giamatti@scooterst', '4 Framingaham RoadDu', to_date('04-01-1994', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (307513185, 'Armin', 'Giamatti', '0558415957', 'armin.giamatti@lfg.d', '81st StreetHannover', to_date('02-12-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (510051487, 'Nikka', 'Herndon', '0558110083', 'nikka@qssgroup.ca', '38 Plimpton RoadKana', to_date('17-03-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (867477632, 'Patty', 'Idol', '0596543360', 'patty.idol@paisley.c', '75 Rio RoadSchaumbur', to_date('20-06-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (689213887, 'Stanley', 'Diddley', '0570436216', 'stanley.diddley@soft', '19 Nathan RoadSaint ', to_date('06-12-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (767958743, 'Chris', 'Ripley', '0580003901', 'chris.r@meghasystems', '81 Johansson AveLagu', to_date('06-09-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (177674959, 'Frank', 'Mitchell', '0530972488', 'fmitchell@shufflemas', '6 Blacksburg StreetE', to_date('20-04-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (588669554, 'Charlize', 'Cromwell', '0593455638', 'charlize.cromwell@sw', '52nd StreetProtvino', to_date('17-12-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (365584736, 'Charlize', 'Mason', '0583492897', 'charlize.mason@execu', '61st StreetMinneapol', to_date('22-08-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (674951299, 'James', 'Davies', '0571155862', 'james@hps.se', '231 Holland RoadGävl', to_date('19-11-1967', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (875796577, 'Devon', 'Keen', '0582025186', 'devon.keen@noodles.d', '2 Chaplin BlvdSoroe', to_date('23-03-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (566400290, 'Rosanne', 'Shannon', '0565543856', 'rshannon@mainstreetb', '14 Nathan DriveFremo', to_date('17-10-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (553342605, 'Neve', 'Brandt', '0596394517', 'n.brandt@bioreferenc', '975 Arlington RoadSa', to_date('15-10-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (940066953, 'Courtney', 'Dourif', '0523846628', 'courtney.dourif@ulti', '52 The Woodlands Ave', to_date('28-04-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (831509485, 'Davis', 'Singletary', '0537127002', 'davis.singletary@efc', '95 Birmensdorf Drive', to_date('26-11-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (392529197, 'Keanu', 'Moraz', '0544544344', 'keanu.moraz@nat.es', '91 BriscoeEl Masnou', to_date('05-05-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (330906930, 'Herbie', 'Paymer', '0528546643', 'herbie.paymer@smartr', '22 Monmouth StreetSa', to_date('16-01-1993', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (345193506, 'Barry', 'Anderson', '0522442762', 'barry.a@keith.au', '39 Nunn AveEdwardsto', to_date('29-07-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (844295357, 'Ben', 'Soda', '0547162501', 'ben.soda@asapstaffin', '70 Ramis RoadAngers', to_date('15-07-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (842443489, 'Desmond', 'Rauhofer', '0593341871', 'd.rauhofer@royalgold', '699 Ithaca RoadCerri', to_date('21-11-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (630970432, 'Samantha', 'Nivola', '0575393323', 'samantha.nivola@soft', '96 JohanssonSan Jose', to_date('30-07-1951', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (537279137, 'Suzanne', 'Day-Lewis', '0567575048', 'suzanne.daylewis@pro', '657 Talvin StreetGai', to_date('07-03-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (549586947, 'Lennie', 'Jonze', '0558353894', 'lennie.jonze@tlsserv', '9 Skerritt AveIpswic', to_date('14-10-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (872649579, 'Lena', 'Bedelia', '0567683092', 'lena.bedelia@timevis', '37 Womack BlvdBristo', to_date('30-03-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (761674211, 'Samantha', 'Byrne', '0545282925', 's.byrne@trainersoft.', '76 Foxx RoadKarlsruh', to_date('28-04-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (751330587, 'Terence', 'Weisberg', '0520415442', 'terence@diamondgroup', '12 Nara StreetTowson', to_date('02-10-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (526303297, 'Tobey', 'Oates', '0568948925', 'tobey.oates@telechem', '57 Erpe-Mere StreetR', to_date('18-06-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (923469386, 'Jesus', 'Gates', '0556833041', 'jesus.gates@outsourc', '53 Danes DriveMilwau', to_date('11-06-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (425149213, 'Harry', 'Cassel', '0566815093', 'hcassel@yashtechnolo', '89 Maxwell RoadNynäs', to_date('02-04-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (767340288, 'Ahmad', 'Sinatra', '0537989226', 'ahmad.sinatra@cis.co', '55 Elizabeth StreetS', to_date('14-04-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (239898165, 'Madeline', 'Cheadle', '0587510109', 'm.cheadle@wyeth.ca', '82 Gunton DriveBross', to_date('04-12-1968', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (251957968, 'Benicio', 'Field', '0579742026', 'benicio.field@market', '36 Duvall StreetBell', to_date('15-10-1976', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (503328036, 'Phoebe', 'Dillane', '0574522867', 'pdillane@sunstream.b', '44 Bautzen AveSao jo', to_date('04-10-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (618968432, 'Lydia', 'Day', '0536970254', 'lydia.day@virbac.br', '94 Martha RoadSao ca', to_date('12-11-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (224854323, 'Rene', 'Henriksen', '0549115225', 'rene.henriksen@unive', '38 Geoffrey AveCedar', to_date('01-02-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (835111181, 'Jimmie', 'Sample', '0532102683', 'jimmie.sample@credop', '62nd StreetBarnegat', to_date('13-07-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (369517254, 'Elle', 'Randal', '0529017700', 'e.randal@biosite.com', '84 Faye RoadTooele', to_date('28-07-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (571831897, 'Ruth', 'Mandrell', '0557684573', 'ruth.m@caliber.jp', '88 Arkenstone AveKum', to_date('14-08-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (416502601, 'Jonny', 'Daniels', '0587169815', 'jdaniels@walmartstor', '647 Hannah RoadTampa', to_date('06-07-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (400991846, 'Tommy', 'Pollak', '0546474538', 'tommy@baesch.ht', '51 DurningPétion-vil', to_date('26-07-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (484030461, 'Junior', 'Jamal', '0577320755', 'junior.jamal@capitol', '3 Jesus StreetKingst', to_date('19-09-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (228780416, 'Moe', 'Midler', '0594438780', 'mmidler@virbac.uk', '69 McDormand StreetC', to_date('19-03-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (897763123, 'Hex', 'McKennitt', '0553799911', 'hex.mckennitt@scripn', '74 May BlvdStorringt', to_date('06-11-1977', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (567129411, 'Ernie', 'Myles', '0564336590', 'ernie@fnb.com', '576 Chalee StreetBer', to_date('29-12-1955', 'dd-mm-yyyy'));
commit;
prompt 900 records committed...
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (634313584, 'Alan', 'Firth', '0549534724', 'alanf@advertisingven', '38 EllenCaguas', to_date('09-08-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (799583810, 'Kurtwood', 'Tilly', '0525141877', 'ktilly@gcd.se', '86 Rachel RoadGothen', to_date('07-02-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (987672459, 'Max', 'Bale', '0569427452', 'max.bale@volkswagen.', '27 Parm RoadTrento', to_date('04-11-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (107574714, 'Jack', 'Shearer', '0586834685', 'j.shearer@newmedia.c', '792 West Windsor Ave', to_date('20-06-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (815348401, 'Gabriel', 'Lipnicki', '0573756608', 'g.lipnicki@ait.de', '41st StreetOldenburg', to_date('26-06-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (754357861, 'Thomas', 'Taylor', '0545924340', 'thomas.taylor@abatix', '88 John StreetBischo', to_date('04-10-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (346483795, 'Alannah', 'Chao', '0523585508', 'alannah.chao@mindiq.', '24 La Plata DriveMan', to_date('28-09-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (260081706, 'Dave', 'Nugent', '0589479185', 'dave.n@dbprofessiona', '928 Barnett AveSaint', to_date('18-02-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (130019706, 'Darius', 'Steagall', '0525546354', 'd.steagall@noodles.d', '62nd StreetHanover', to_date('02-06-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (362352366, 'Tal', 'Diggs', '0534108061', 'tal.diggs@maverick.c', '71 Jimmie BlvdColumb', to_date('17-04-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (850950414, 'Willie', 'Chilton', '0522035761', 'willie.chilton@seiaa', '171 Zane StreetThalw', to_date('06-05-1955', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (112707222, 'Willem', 'Price', '0540201843', 'willem.price@simplyc', '36 Dawson StreetMase', to_date('27-07-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (930947131, 'Keith', 'Madsen', '0535808207', 'keith.madsen@prp.uk', '407 Lisbon RoadGlasg', to_date('02-07-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (926360339, 'Geena', 'Thomas', '0586989051', 'geena.thomas@ositiss', '286 Levine StreetSan', to_date('27-01-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (913347384, 'Lili', 'Cumming', '0579999845', 'lili.cumming@gha.se', '99 Larry StreetSunds', to_date('26-03-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (553242873, 'Richard', 'Flemyng', '0572875690', 'richard.flemyng@aop.', '89 Oliver DriveDeerf', to_date('10-01-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (396257560, 'Demi', 'Watley', '0530021255', 'demi@hps.de', '70 Pétion-ville Blvd', to_date('08-02-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (866945472, 'Harry', 'Buscemi', '0545623686', 'harry.buscemi@its.cn', '96 Marshall StreetSh', to_date('30-03-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (861246633, 'Arturo', 'Cube', '0586401456', 'arturo.cube@gdatechn', '81 Carl StreetWoodla', to_date('22-06-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (506205888, 'Richie', 'Rickman', '0583059982', 'richie.rickman@nlx.a', '896 Malone DriveCamp', to_date('04-02-1997', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (436154619, 'Susan', 'Rubinek', '0527664507', 'susan.rubinek@bioana', '27 Leguizamo StreetI', to_date('08-09-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (879708395, 'Marty', 'Chao', '0533815988', 'marty@perfectorder.c', '79 Sara StreetColumb', to_date('16-09-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (893119524, 'Demi', 'Cara', '0597456708', 'dcara@vertexsolution', '891 Elvis DriveZüric', to_date('01-05-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (401053950, 'Wade', 'Redford', '0598064138', 'wade.redford@prahs.c', '890 Anderson AveAnch', to_date('15-09-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (269814706, 'Pete', 'Boyle', '0579855513', 'pete.boyle@cyberthin', '14 Eastwood AveTucso', to_date('21-04-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (190488653, 'Madeleine', 'Baker', '0591878077', 'madeleine.baker@telw', '74 Zeta-Jones Street', to_date('02-12-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (692877730, 'Red', 'Farrell', '0542070063', 'red.farrell@onesourc', '74 Shocked DriveDubl', to_date('09-04-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (855709661, 'Joanna', 'Davis', '0535322829', 'j.davis@meghasystems', '34 Sweet RoadMonmout', to_date('28-06-1981', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (870409642, 'Tia', 'Rucker', '0531007047', 'tiar@genextechnologi', '58 George StreetWuer', to_date('11-01-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (395587864, 'Miranda', 'Lewis', '0598024469', 'miranda.lewis@gdatec', '98 Paquin DriveChamb', to_date('05-11-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (611405787, 'Ming-Na', 'Gary', '0560769768', 'm.gary@ghrsystems.br', '47 Allison StreetIra', to_date('10-06-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (476938290, 'Joey', 'Curfman', '0521714406', 'joey.c@extremepizza.', '85 Bailey DriveTotto', to_date('31-07-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (800402035, 'Kathleen', 'Patton', '0589125560', 'kathleen@staffforce.', '24 Denny DriveMonume', to_date('02-05-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (529078032, 'Tommy', 'Camp', '0593431329', 'tommy.camp@visionary', '98 Mueller-Stahl Blv', to_date('20-08-1975', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (453472980, 'Chrissie', 'Winans', '0535321306', 'chrissiew@ssi.com', '42 Kinnear AveBarneg', to_date('07-09-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (411452088, 'Loreena', 'Charles', '0521213507', 'loreena.charles@usen', '28 Lane DriveBarksda', to_date('13-06-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (365347969, 'Clea', 'Tomei', '0569200954', 'clea.t@generalmotors', '32 Cooper DriveJacks', to_date('26-11-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (196424839, 'Sandra', 'Mitchell', '0596316384', 'sandra.mitchell@jewe', '933 Cooper BlvdDearb', to_date('30-08-1974', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (108475484, 'Jerry', 'Frampton', '0580053778', 'jerry@glmt.it', '58 Weisberg DrivePor', to_date('31-03-1991', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (587382823, 'Cary', 'Gambon', '0532025838', 'caryg@hfg.com', '10 Mito BlvdCincinna', to_date('02-09-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (322343561, 'Cary', 'Richter', '0584362015', 'cary.richter@sms.at', '77 Bartlett RoadSalz', to_date('10-12-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (978944908, 'Alan', 'Slater', '0564338878', 'a.slater@visainterna', '28 Jamal StreetKerav', to_date('15-03-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (670502457, 'Ice', 'Dysart', '0545548487', 'idysart@nhhc.com', '41 Melrose park Road', to_date('13-02-2001', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (204535135, 'Andrae', 'Haysbert', '0555919521', 'andrae@fsffinancial.', '34 Kenoly StreetHerm', to_date('10-10-1984', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (803454243, 'Jonny Lee', 'Lowe', '0585433664', 'jonnylee@intrasphere', '60 North Wales Drive', to_date('31-07-1982', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (112802719, 'Patricia', 'Quinn', '0561300667', 'patricia.quinn@dcgro', '47 Chestnut StreetCh', to_date('03-12-1957', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (203658694, 'Campbell', 'Vassar', '0554573119', 'cvassar@summitenergy', '53 DeGraw DriveOkaya', to_date('29-05-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (712996310, 'Ed', 'Hubbard', '0557542630', 'ed.hubbard@generalmi', '13 Eldard RoadBronx', to_date('29-07-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (562992520, 'Dionne', 'Broadbent', '0592550469', 'dionne.broadbent@ext', '11 GordonKanata', to_date('22-04-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (573207102, 'Avril', 'Diggs', '0579892827', 'avrild@privatebancor', '72 Pasadena BlvdRege', to_date('08-08-1965', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (147874593, 'Marc', 'Pesci', '0543167726', 'marc.pesci@canterbur', '11 SnowSan Mateo', to_date('06-10-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (446253243, 'Art', 'Twilley', '0582583049', 'artt@mms.de', '99 Rockford DriveKoe', to_date('12-11-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (820641428, 'Vienna', 'Tempest', '0540240850', 'vienna.tempest@commw', '25 Paymer AveWestfie', to_date('10-08-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (223188715, 'Goran', 'Farina', '0588703839', 'goran@cardinalcartri', '14 Holeman RoadUnion', to_date('06-05-1972', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (308749394, 'Hank', 'Carr', '0581026269', 'hcarr@democracydata.', '77 FoleySacramento', to_date('02-01-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (531918762, 'Rik', 'Beals', '0532150012', 'rik.beals@apexsystem', '133 Reese RoadUnionv', to_date('17-04-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (562578453, 'Edie', 'Elliott', '0544024300', 'edie.elliott@mse.de', '83 Waterloo AveOyten', to_date('02-10-1989', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (396565361, 'Petula', 'Mewes', '0527075436', 'petula.mewes@actechn', '5 Regina StreetCarac', to_date('30-04-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (280412141, 'Connie', 'Moss', '0561253070', 'cmoss@trusecure.ca', '844 Goodman StreetSt', to_date('21-10-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (723873340, 'Edward', 'Idle', '0562798786', 'edward@pib.it', '78 Bugnon BlvdMilan', to_date('14-05-1999', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (766186615, 'Kimberly', 'Hedaya', '0579032930', 'kimberly.hedaya@bash', '59 Sheffield AveCeda', to_date('18-12-1960', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (483830574, 'Eileen', 'Carlisle', '0591308839', 'eileen@procter.com', '40 Harnes DriveHappy', to_date('21-10-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (339239511, 'Toni', 'Head', '0532212535', 'thead@trekequipment.', '827 Whitehouse Stati', to_date('04-01-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (240645939, 'Jude', 'Day-Lewis', '0576817286', 'jude@mitsubishimotor', '14 Diffie RoadParamu', to_date('08-03-1988', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (982130621, 'Janeane', 'Winstone', '0594903326', 'j.winstone@priorityl', '92 Shand RoadPeachtr', to_date('06-12-1953', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (792534211, 'Nik', 'Rudd', '0583562590', 'nikr@capitalbank.fr', '17 Jacksonville AveR', to_date('26-01-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (544536849, 'Ricky', 'Carradine', '0591145253', 'rcarradine@marketfir', '35 Faye RoadOak Park', to_date('14-11-1985', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (762078986, 'Gilberto', 'Wahlberg', '0547764745', 'gilbertow@multimedia', '43 El-Saher RoadGraz', to_date('03-03-1962', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (443730958, 'Luke', 'Aaron', '0597731812', 'luke@educationaldeve', '384 Slater RoadGenev', to_date('23-02-1969', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (645334165, 'Tanya', 'Heald', '0596450970', 'tanyah@sensortechnol', '439 Cate RoadPompeia', to_date('16-06-1949', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (643175010, 'Julie', 'Winslet', '0520590948', 'julie.winslet@aquasc', '24 Maria RoadWakayam', to_date('22-11-1956', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (995372257, 'Geena', 'Rea', '0586347359', 'g.rea@tmaresources.j', '1 Riverdale RoadFuku', to_date('20-10-1971', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (744494592, 'Gordon', 'Rock', '0540265272', 'gordon.rock@masterca', '22 Catherine StreetC', to_date('09-10-1970', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (378946295, 'Rickie', 'Mueller-Stahl', '0578820765', 'rickie.muellerstahl@', '15 McGoohan RoadSao ', to_date('03-11-2004', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (756464314, 'Carol', 'Lithgow', '0531313623', 'clithgow@questarcapi', '33 Sweet RoadEnglewo', to_date('31-05-1995', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (582817844, 'Heather', 'Gracie', '0594590991', 'heather.gracie@ubp.d', '71st StreetEschborn', to_date('09-04-1961', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (974180286, 'Lorraine', 'Caine', '0551720920', 'lorraine.caine@keith', '16 Roscoe DriveVenic', to_date('12-11-1992', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (120452310, 'Will', 'Sinatra', '0567236433', 'will.sinatra@ogioint', '141 Hudson DriveYama', to_date('16-10-1979', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (728690569, 'Michelle', 'Eldard', '0581427160', 'michelle.eldard@stik', '71st StreetCourbevoi', to_date('16-10-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (326146555, 'Adrien', 'Lerner', '0557704680', 'adrien@freedommedica', '78 Tobolowsky BlvdLo', to_date('11-02-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (891726473, 'Marty', 'Curry', '0528001563', 'marty.curry@toyotamo', '93rd StreetParaju', to_date('30-07-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (755759370, 'Bo', 'Tanon', '0530153902', 'b.tanon@unica.de', '90 Paul DriveLübeck', to_date('01-08-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (631536152, 'Armand', 'Levine', '0561224684', 'armand.levine@worono', '59 RonnyArlington', to_date('12-12-1996', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (777950562, 'Breckin', 'Collins', '0575078488', 'breckin.collins@line', '902 Negbaur DriveKan', to_date('24-11-1987', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (772398077, 'Kris', 'Foster', '0553902099', 'krisf@abatix.com', '95 Saint Ouen Street', to_date('08-08-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (259605572, 'Marlon', 'Geldof', '0576173186', 'marlon.geldof@zaiqte', '7 Halle RoadRimini', to_date('17-08-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (496445164, 'Jeroen', 'MacLachlan', '0554145086', 'jeroen@universalsolu', '53 Hector StreetFuch', to_date('22-01-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (545662329, 'Jane', 'Westerberg', '0567520157', 'jane.westerberg@dena', '70 Sutton BlvdVander', to_date('25-01-1964', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (255393242, 'Joan', 'Abraham', '0567898958', 'joan@entelligence.de', '100 Sevigny RoadMarb', to_date('17-03-2002', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (646833159, 'Liv', 'Carlyle', '0585929161', 'liv@travizon.com', '22 Statham StreetEde', to_date('24-02-1973', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (245127103, 'Teri', 'Cube', '0528093942', 'teri.cube@investment', '82 BooneBedfordshire', to_date('29-04-1958', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (182034330, 'Chet', 'Foxx', '0575420006', 'chet.foxx@mqsoftware', '62nd StreetAdamstown', to_date('14-07-1948', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (306787209, 'Heath', 'Barry', '0560588501', 'heath.b@microsoft.uk', '79 WürzburgSlough', to_date('27-11-1959', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (568287785, 'Sal', 'Gill', '0520465317', 's.gill@proclarity.co', '945 Rita StreetKejae', to_date('12-06-1978', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (392516978, 'Nils', 'Shannon', '0536425542', 'nils.shannon@diageo.', '18 Waterloo RoadSara', to_date('29-05-1998', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (261847692, 'Cuba', 'Utada', '0567016881', 'cuba.utada@jma.com', '82 Folds DriveMurray', to_date('24-02-1980', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (288230393, 'John', 'Palmieri', '0566696391', 'john@ntas.jp', '60 Farmington Hills ', to_date('16-01-1986', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (707736586, 'Shannon', 'Burke', '0599172283', 'shannonb@businessplu', '59 Brussel StreetZwo', to_date('29-11-1954', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (359849386, 'Gino', 'Guilfoyle', '0551088944', 'gino@daimlerchrysler', '216 Lindley StreetWi', to_date('17-01-1983', 'dd-mm-yyyy'));
insert into PERSON (personid, firstname, lastname, phone, mail, address, birthdate)
values (852757155, 'Yolanda', 'Yulin', '0577369577', 'yolanda.yulin@vms.hu', '64 New Hope RoadPecs', to_date('12-05-1990', 'dd-mm-yyyy'));
commit;
prompt 1000 records loaded
prompt Loading SENDTEAM...
insert into SENDTEAM (callid, teamid)
values (577, 381);
insert into SENDTEAM (callid, teamid)
values (777, 541);
insert into SENDTEAM (callid, teamid)
values (228, 176);
insert into SENDTEAM (callid, teamid)
values (181, 1977);
insert into SENDTEAM (callid, teamid)
values (866, 651);
insert into SENDTEAM (callid, teamid)
values (653, 1917);
insert into SENDTEAM (callid, teamid)
values (715, 656);
insert into SENDTEAM (callid, teamid)
values (246, 1688);
insert into SENDTEAM (callid, teamid)
values (851, 44);
insert into SENDTEAM (callid, teamid)
values (107, 1399);
insert into SENDTEAM (callid, teamid)
values (862, 1311);
insert into SENDTEAM (callid, teamid)
values (757, 575);
insert into SENDTEAM (callid, teamid)
values (108, 1051);
insert into SENDTEAM (callid, teamid)
values (920, 339);
insert into SENDTEAM (callid, teamid)
values (869, 329);
insert into SENDTEAM (callid, teamid)
values (643, 496);
insert into SENDTEAM (callid, teamid)
values (750, 1566);
insert into SENDTEAM (callid, teamid)
values (691, 1366);
insert into SENDTEAM (callid, teamid)
values (936, 23);
insert into SENDTEAM (callid, teamid)
values (455, 697);
insert into SENDTEAM (callid, teamid)
values (180, 487);
insert into SENDTEAM (callid, teamid)
values (845, 518);
insert into SENDTEAM (callid, teamid)
values (606, 248);
insert into SENDTEAM (callid, teamid)
values (918, 1263);
insert into SENDTEAM (callid, teamid)
values (713, 1952);
insert into SENDTEAM (callid, teamid)
values (214, 1010);
insert into SENDTEAM (callid, teamid)
values (168, 447);
insert into SENDTEAM (callid, teamid)
values (37, 193);
insert into SENDTEAM (callid, teamid)
values (260, 188);
insert into SENDTEAM (callid, teamid)
values (172, 614);
insert into SENDTEAM (callid, teamid)
values (122, 318);
insert into SENDTEAM (callid, teamid)
values (763, 101);
insert into SENDTEAM (callid, teamid)
values (75, 999);
insert into SENDTEAM (callid, teamid)
values (339, 675);
insert into SENDTEAM (callid, teamid)
values (712, 1105);
insert into SENDTEAM (callid, teamid)
values (229, 536);
insert into SENDTEAM (callid, teamid)
values (570, 1862);
insert into SENDTEAM (callid, teamid)
values (841, 747);
insert into SENDTEAM (callid, teamid)
values (515, 1520);
insert into SENDTEAM (callid, teamid)
values (546, 1933);
insert into SENDTEAM (callid, teamid)
values (184, 668);
insert into SENDTEAM (callid, teamid)
values (143, 854);
insert into SENDTEAM (callid, teamid)
values (99, 279);
insert into SENDTEAM (callid, teamid)
values (156, 1189);
insert into SENDTEAM (callid, teamid)
values (320, 1069);
insert into SENDTEAM (callid, teamid)
values (427, 1377);
insert into SENDTEAM (callid, teamid)
values (734, 1279);
insert into SENDTEAM (callid, teamid)
values (756, 860);
insert into SENDTEAM (callid, teamid)
values (344, 463);
insert into SENDTEAM (callid, teamid)
values (556, 566);
insert into SENDTEAM (callid, teamid)
values (175, 1384);
insert into SENDTEAM (callid, teamid)
values (778, 1986);
insert into SENDTEAM (callid, teamid)
values (643, 599);
insert into SENDTEAM (callid, teamid)
values (575, 1677);
insert into SENDTEAM (callid, teamid)
values (505, 845);
insert into SENDTEAM (callid, teamid)
values (437, 542);
insert into SENDTEAM (callid, teamid)
values (750, 804);
insert into SENDTEAM (callid, teamid)
values (798, 1731);
insert into SENDTEAM (callid, teamid)
values (35, 345);
insert into SENDTEAM (callid, teamid)
values (333, 1507);
insert into SENDTEAM (callid, teamid)
values (529, 1844);
insert into SENDTEAM (callid, teamid)
values (439, 1907);
insert into SENDTEAM (callid, teamid)
values (276, 664);
insert into SENDTEAM (callid, teamid)
values (627, 569);
insert into SENDTEAM (callid, teamid)
values (425, 400);
insert into SENDTEAM (callid, teamid)
values (817, 1545);
insert into SENDTEAM (callid, teamid)
values (963, 974);
insert into SENDTEAM (callid, teamid)
values (768, 1448);
insert into SENDTEAM (callid, teamid)
values (771, 176);
insert into SENDTEAM (callid, teamid)
values (119, 1790);
insert into SENDTEAM (callid, teamid)
values (152, 1754);
insert into SENDTEAM (callid, teamid)
values (792, 840);
insert into SENDTEAM (callid, teamid)
values (162, 1628);
insert into SENDTEAM (callid, teamid)
values (726, 851);
insert into SENDTEAM (callid, teamid)
values (370, 339);
insert into SENDTEAM (callid, teamid)
values (180, 1000);
insert into SENDTEAM (callid, teamid)
values (893, 321);
insert into SENDTEAM (callid, teamid)
values (100, 888);
insert into SENDTEAM (callid, teamid)
values (833, 1082);
insert into SENDTEAM (callid, teamid)
values (271, 1934);
insert into SENDTEAM (callid, teamid)
values (454, 1906);
insert into SENDTEAM (callid, teamid)
values (239, 522);
insert into SENDTEAM (callid, teamid)
values (728, 147);
insert into SENDTEAM (callid, teamid)
values (253, 1226);
insert into SENDTEAM (callid, teamid)
values (94, 1730);
insert into SENDTEAM (callid, teamid)
values (687, 974);
insert into SENDTEAM (callid, teamid)
values (551, 934);
insert into SENDTEAM (callid, teamid)
values (703, 1486);
insert into SENDTEAM (callid, teamid)
values (439, 1065);
insert into SENDTEAM (callid, teamid)
values (112, 1827);
insert into SENDTEAM (callid, teamid)
values (513, 112);
insert into SENDTEAM (callid, teamid)
values (696, 1428);
insert into SENDTEAM (callid, teamid)
values (182, 1962);
insert into SENDTEAM (callid, teamid)
values (445, 411);
insert into SENDTEAM (callid, teamid)
values (7, 296);
insert into SENDTEAM (callid, teamid)
values (474, 564);
insert into SENDTEAM (callid, teamid)
values (831, 732);
insert into SENDTEAM (callid, teamid)
values (578, 814);
insert into SENDTEAM (callid, teamid)
values (138, 1333);
insert into SENDTEAM (callid, teamid)
values (679, 1532);
commit;
prompt 100 records committed...
insert into SENDTEAM (callid, teamid)
values (515, 52);
insert into SENDTEAM (callid, teamid)
values (634, 522);
insert into SENDTEAM (callid, teamid)
values (311, 225);
insert into SENDTEAM (callid, teamid)
values (149, 42);
insert into SENDTEAM (callid, teamid)
values (863, 1696);
insert into SENDTEAM (callid, teamid)
values (785, 679);
insert into SENDTEAM (callid, teamid)
values (891, 1670);
insert into SENDTEAM (callid, teamid)
values (273, 454);
insert into SENDTEAM (callid, teamid)
values (934, 1889);
insert into SENDTEAM (callid, teamid)
values (648, 1972);
insert into SENDTEAM (callid, teamid)
values (916, 1227);
insert into SENDTEAM (callid, teamid)
values (913, 976);
insert into SENDTEAM (callid, teamid)
values (221, 1289);
insert into SENDTEAM (callid, teamid)
values (232, 145);
insert into SENDTEAM (callid, teamid)
values (876, 1116);
insert into SENDTEAM (callid, teamid)
values (884, 484);
insert into SENDTEAM (callid, teamid)
values (705, 1591);
insert into SENDTEAM (callid, teamid)
values (453, 1135);
insert into SENDTEAM (callid, teamid)
values (557, 628);
insert into SENDTEAM (callid, teamid)
values (4, 977);
insert into SENDTEAM (callid, teamid)
values (983, 758);
insert into SENDTEAM (callid, teamid)
values (211, 1834);
insert into SENDTEAM (callid, teamid)
values (945, 1175);
insert into SENDTEAM (callid, teamid)
values (694, 1651);
insert into SENDTEAM (callid, teamid)
values (451, 877);
insert into SENDTEAM (callid, teamid)
values (25, 475);
insert into SENDTEAM (callid, teamid)
values (191, 1953);
insert into SENDTEAM (callid, teamid)
values (155, 591);
insert into SENDTEAM (callid, teamid)
values (556, 641);
insert into SENDTEAM (callid, teamid)
values (239, 644);
insert into SENDTEAM (callid, teamid)
values (641, 237);
insert into SENDTEAM (callid, teamid)
values (95, 106);
insert into SENDTEAM (callid, teamid)
values (98, 449);
insert into SENDTEAM (callid, teamid)
values (782, 918);
insert into SENDTEAM (callid, teamid)
values (930, 298);
insert into SENDTEAM (callid, teamid)
values (29, 1668);
insert into SENDTEAM (callid, teamid)
values (613, 143);
insert into SENDTEAM (callid, teamid)
values (499, 124);
insert into SENDTEAM (callid, teamid)
values (132, 948);
insert into SENDTEAM (callid, teamid)
values (131, 494);
insert into SENDTEAM (callid, teamid)
values (802, 1359);
insert into SENDTEAM (callid, teamid)
values (31, 229);
insert into SENDTEAM (callid, teamid)
values (981, 1706);
insert into SENDTEAM (callid, teamid)
values (657, 1740);
insert into SENDTEAM (callid, teamid)
values (32, 510);
insert into SENDTEAM (callid, teamid)
values (276, 848);
insert into SENDTEAM (callid, teamid)
values (149, 1592);
insert into SENDTEAM (callid, teamid)
values (930, 328);
insert into SENDTEAM (callid, teamid)
values (896, 389);
insert into SENDTEAM (callid, teamid)
values (397, 1384);
insert into SENDTEAM (callid, teamid)
values (585, 545);
insert into SENDTEAM (callid, teamid)
values (878, 396);
insert into SENDTEAM (callid, teamid)
values (833, 402);
insert into SENDTEAM (callid, teamid)
values (397, 789);
insert into SENDTEAM (callid, teamid)
values (924, 1463);
insert into SENDTEAM (callid, teamid)
values (147, 368);
insert into SENDTEAM (callid, teamid)
values (820, 1423);
insert into SENDTEAM (callid, teamid)
values (264, 949);
insert into SENDTEAM (callid, teamid)
values (950, 876);
insert into SENDTEAM (callid, teamid)
values (770, 1657);
insert into SENDTEAM (callid, teamid)
values (114, 1273);
insert into SENDTEAM (callid, teamid)
values (664, 1698);
insert into SENDTEAM (callid, teamid)
values (129, 237);
insert into SENDTEAM (callid, teamid)
values (397, 988);
insert into SENDTEAM (callid, teamid)
values (65, 826);
insert into SENDTEAM (callid, teamid)
values (213, 1452);
insert into SENDTEAM (callid, teamid)
values (194, 1837);
insert into SENDTEAM (callid, teamid)
values (94, 349);
insert into SENDTEAM (callid, teamid)
values (990, 741);
insert into SENDTEAM (callid, teamid)
values (296, 1474);
insert into SENDTEAM (callid, teamid)
values (809, 1352);
insert into SENDTEAM (callid, teamid)
values (696, 562);
insert into SENDTEAM (callid, teamid)
values (106, 814);
insert into SENDTEAM (callid, teamid)
values (459, 1758);
insert into SENDTEAM (callid, teamid)
values (278, 1009);
insert into SENDTEAM (callid, teamid)
values (731, 483);
insert into SENDTEAM (callid, teamid)
values (529, 1965);
insert into SENDTEAM (callid, teamid)
values (362, 543);
insert into SENDTEAM (callid, teamid)
values (327, 1380);
insert into SENDTEAM (callid, teamid)
values (897, 1829);
insert into SENDTEAM (callid, teamid)
values (339, 834);
insert into SENDTEAM (callid, teamid)
values (289, 1446);
insert into SENDTEAM (callid, teamid)
values (946, 1798);
insert into SENDTEAM (callid, teamid)
values (113, 1623);
insert into SENDTEAM (callid, teamid)
values (693, 1021);
insert into SENDTEAM (callid, teamid)
values (225, 230);
insert into SENDTEAM (callid, teamid)
values (292, 1402);
insert into SENDTEAM (callid, teamid)
values (124, 273);
insert into SENDTEAM (callid, teamid)
values (23, 934);
insert into SENDTEAM (callid, teamid)
values (496, 1183);
insert into SENDTEAM (callid, teamid)
values (660, 806);
insert into SENDTEAM (callid, teamid)
values (670, 1266);
insert into SENDTEAM (callid, teamid)
values (272, 275);
insert into SENDTEAM (callid, teamid)
values (971, 1137);
insert into SENDTEAM (callid, teamid)
values (505, 387);
insert into SENDTEAM (callid, teamid)
values (218, 498);
insert into SENDTEAM (callid, teamid)
values (213, 1142);
insert into SENDTEAM (callid, teamid)
values (823, 1099);
insert into SENDTEAM (callid, teamid)
values (541, 1208);
insert into SENDTEAM (callid, teamid)
values (259, 1217);
commit;
prompt 200 records committed...
insert into SENDTEAM (callid, teamid)
values (821, 1760);
insert into SENDTEAM (callid, teamid)
values (855, 1515);
insert into SENDTEAM (callid, teamid)
values (892, 559);
insert into SENDTEAM (callid, teamid)
values (165, 602);
insert into SENDTEAM (callid, teamid)
values (702, 839);
insert into SENDTEAM (callid, teamid)
values (393, 1159);
insert into SENDTEAM (callid, teamid)
values (306, 125);
insert into SENDTEAM (callid, teamid)
values (608, 1961);
insert into SENDTEAM (callid, teamid)
values (601, 550);
insert into SENDTEAM (callid, teamid)
values (732, 1641);
insert into SENDTEAM (callid, teamid)
values (441, 780);
insert into SENDTEAM (callid, teamid)
values (541, 552);
insert into SENDTEAM (callid, teamid)
values (954, 135);
insert into SENDTEAM (callid, teamid)
values (153, 1546);
insert into SENDTEAM (callid, teamid)
values (200, 3);
insert into SENDTEAM (callid, teamid)
values (748, 1039);
insert into SENDTEAM (callid, teamid)
values (515, 134);
insert into SENDTEAM (callid, teamid)
values (498, 193);
insert into SENDTEAM (callid, teamid)
values (143, 1921);
insert into SENDTEAM (callid, teamid)
values (945, 559);
insert into SENDTEAM (callid, teamid)
values (41, 1243);
insert into SENDTEAM (callid, teamid)
values (308, 1027);
insert into SENDTEAM (callid, teamid)
values (943, 1981);
insert into SENDTEAM (callid, teamid)
values (455, 1426);
insert into SENDTEAM (callid, teamid)
values (43, 1793);
insert into SENDTEAM (callid, teamid)
values (526, 623);
insert into SENDTEAM (callid, teamid)
values (926, 238);
insert into SENDTEAM (callid, teamid)
values (438, 1453);
insert into SENDTEAM (callid, teamid)
values (588, 1855);
insert into SENDTEAM (callid, teamid)
values (759, 1332);
insert into SENDTEAM (callid, teamid)
values (657, 1275);
insert into SENDTEAM (callid, teamid)
values (686, 1902);
insert into SENDTEAM (callid, teamid)
values (183, 1973);
insert into SENDTEAM (callid, teamid)
values (105, 1535);
insert into SENDTEAM (callid, teamid)
values (596, 747);
insert into SENDTEAM (callid, teamid)
values (981, 1058);
insert into SENDTEAM (callid, teamid)
values (701, 517);
insert into SENDTEAM (callid, teamid)
values (542, 1532);
insert into SENDTEAM (callid, teamid)
values (813, 545);
insert into SENDTEAM (callid, teamid)
values (14, 1429);
insert into SENDTEAM (callid, teamid)
values (387, 1663);
insert into SENDTEAM (callid, teamid)
values (876, 1056);
insert into SENDTEAM (callid, teamid)
values (770, 596);
insert into SENDTEAM (callid, teamid)
values (870, 568);
insert into SENDTEAM (callid, teamid)
values (912, 1);
insert into SENDTEAM (callid, teamid)
values (261, 408);
insert into SENDTEAM (callid, teamid)
values (161, 1275);
insert into SENDTEAM (callid, teamid)
values (70, 1525);
insert into SENDTEAM (callid, teamid)
values (499, 1765);
insert into SENDTEAM (callid, teamid)
values (270, 1216);
insert into SENDTEAM (callid, teamid)
values (818, 448);
insert into SENDTEAM (callid, teamid)
values (179, 920);
insert into SENDTEAM (callid, teamid)
values (110, 685);
insert into SENDTEAM (callid, teamid)
values (534, 829);
insert into SENDTEAM (callid, teamid)
values (674, 1144);
insert into SENDTEAM (callid, teamid)
values (977, 642);
insert into SENDTEAM (callid, teamid)
values (691, 474);
insert into SENDTEAM (callid, teamid)
values (945, 319);
insert into SENDTEAM (callid, teamid)
values (797, 1845);
insert into SENDTEAM (callid, teamid)
values (190, 1172);
insert into SENDTEAM (callid, teamid)
values (485, 1926);
insert into SENDTEAM (callid, teamid)
values (420, 128);
insert into SENDTEAM (callid, teamid)
values (479, 1406);
insert into SENDTEAM (callid, teamid)
values (788, 535);
insert into SENDTEAM (callid, teamid)
values (403, 651);
insert into SENDTEAM (callid, teamid)
values (225, 1320);
insert into SENDTEAM (callid, teamid)
values (390, 593);
insert into SENDTEAM (callid, teamid)
values (838, 873);
insert into SENDTEAM (callid, teamid)
values (461, 1432);
insert into SENDTEAM (callid, teamid)
values (865, 476);
insert into SENDTEAM (callid, teamid)
values (799, 260);
insert into SENDTEAM (callid, teamid)
values (926, 643);
insert into SENDTEAM (callid, teamid)
values (277, 1199);
insert into SENDTEAM (callid, teamid)
values (536, 199);
insert into SENDTEAM (callid, teamid)
values (846, 132);
insert into SENDTEAM (callid, teamid)
values (141, 444);
insert into SENDTEAM (callid, teamid)
values (634, 641);
insert into SENDTEAM (callid, teamid)
values (136, 1256);
insert into SENDTEAM (callid, teamid)
values (890, 229);
insert into SENDTEAM (callid, teamid)
values (618, 462);
insert into SENDTEAM (callid, teamid)
values (99, 433);
insert into SENDTEAM (callid, teamid)
values (844, 336);
insert into SENDTEAM (callid, teamid)
values (911, 909);
insert into SENDTEAM (callid, teamid)
values (645, 1549);
insert into SENDTEAM (callid, teamid)
values (712, 94);
insert into SENDTEAM (callid, teamid)
values (258, 1439);
insert into SENDTEAM (callid, teamid)
values (977, 1533);
insert into SENDTEAM (callid, teamid)
values (335, 1919);
insert into SENDTEAM (callid, teamid)
values (733, 1464);
insert into SENDTEAM (callid, teamid)
values (94, 887);
insert into SENDTEAM (callid, teamid)
values (772, 1760);
insert into SENDTEAM (callid, teamid)
values (856, 1472);
insert into SENDTEAM (callid, teamid)
values (451, 812);
insert into SENDTEAM (callid, teamid)
values (452, 1960);
insert into SENDTEAM (callid, teamid)
values (192, 1463);
insert into SENDTEAM (callid, teamid)
values (228, 1746);
insert into SENDTEAM (callid, teamid)
values (59, 1566);
insert into SENDTEAM (callid, teamid)
values (643, 1159);
insert into SENDTEAM (callid, teamid)
values (993, 1277);
insert into SENDTEAM (callid, teamid)
values (680, 1490);
commit;
prompt 300 records committed...
insert into SENDTEAM (callid, teamid)
values (589, 1668);
insert into SENDTEAM (callid, teamid)
values (574, 90);
insert into SENDTEAM (callid, teamid)
values (512, 1759);
insert into SENDTEAM (callid, teamid)
values (568, 1860);
insert into SENDTEAM (callid, teamid)
values (911, 1555);
insert into SENDTEAM (callid, teamid)
values (703, 982);
insert into SENDTEAM (callid, teamid)
values (448, 1188);
insert into SENDTEAM (callid, teamid)
values (860, 1249);
insert into SENDTEAM (callid, teamid)
values (791, 763);
insert into SENDTEAM (callid, teamid)
values (550, 1815);
insert into SENDTEAM (callid, teamid)
values (697, 1981);
insert into SENDTEAM (callid, teamid)
values (179, 1731);
insert into SENDTEAM (callid, teamid)
values (17, 1162);
insert into SENDTEAM (callid, teamid)
values (775, 1090);
insert into SENDTEAM (callid, teamid)
values (264, 1733);
insert into SENDTEAM (callid, teamid)
values (413, 1140);
insert into SENDTEAM (callid, teamid)
values (581, 804);
insert into SENDTEAM (callid, teamid)
values (816, 208);
insert into SENDTEAM (callid, teamid)
values (225, 889);
insert into SENDTEAM (callid, teamid)
values (880, 764);
insert into SENDTEAM (callid, teamid)
values (932, 410);
insert into SENDTEAM (callid, teamid)
values (89, 1488);
insert into SENDTEAM (callid, teamid)
values (758, 1034);
insert into SENDTEAM (callid, teamid)
values (67, 673);
insert into SENDTEAM (callid, teamid)
values (280, 473);
insert into SENDTEAM (callid, teamid)
values (753, 1803);
insert into SENDTEAM (callid, teamid)
values (234, 1814);
insert into SENDTEAM (callid, teamid)
values (920, 668);
insert into SENDTEAM (callid, teamid)
values (977, 989);
insert into SENDTEAM (callid, teamid)
values (38, 1837);
insert into SENDTEAM (callid, teamid)
values (371, 474);
insert into SENDTEAM (callid, teamid)
values (703, 852);
insert into SENDTEAM (callid, teamid)
values (945, 1809);
insert into SENDTEAM (callid, teamid)
values (128, 975);
insert into SENDTEAM (callid, teamid)
values (452, 33);
insert into SENDTEAM (callid, teamid)
values (417, 1835);
insert into SENDTEAM (callid, teamid)
values (178, 1627);
insert into SENDTEAM (callid, teamid)
values (618, 1817);
insert into SENDTEAM (callid, teamid)
values (606, 70);
insert into SENDTEAM (callid, teamid)
values (784, 550);
insert into SENDTEAM (callid, teamid)
values (305, 1578);
insert into SENDTEAM (callid, teamid)
values (526, 311);
insert into SENDTEAM (callid, teamid)
values (145, 146);
insert into SENDTEAM (callid, teamid)
values (792, 1713);
insert into SENDTEAM (callid, teamid)
values (205, 1471);
insert into SENDTEAM (callid, teamid)
values (866, 1514);
insert into SENDTEAM (callid, teamid)
values (971, 1848);
insert into SENDTEAM (callid, teamid)
values (801, 885);
insert into SENDTEAM (callid, teamid)
values (700, 648);
insert into SENDTEAM (callid, teamid)
values (793, 984);
insert into SENDTEAM (callid, teamid)
values (44, 1453);
insert into SENDTEAM (callid, teamid)
values (214, 1182);
insert into SENDTEAM (callid, teamid)
values (302, 1458);
insert into SENDTEAM (callid, teamid)
values (297, 1786);
insert into SENDTEAM (callid, teamid)
values (910, 1222);
insert into SENDTEAM (callid, teamid)
values (706, 1593);
insert into SENDTEAM (callid, teamid)
values (20, 1368);
insert into SENDTEAM (callid, teamid)
values (471, 1132);
insert into SENDTEAM (callid, teamid)
values (290, 1322);
insert into SENDTEAM (callid, teamid)
values (27, 930);
insert into SENDTEAM (callid, teamid)
values (234, 1691);
insert into SENDTEAM (callid, teamid)
values (338, 642);
insert into SENDTEAM (callid, teamid)
values (742, 363);
insert into SENDTEAM (callid, teamid)
values (350, 1404);
insert into SENDTEAM (callid, teamid)
values (636, 940);
insert into SENDTEAM (callid, teamid)
values (236, 230);
insert into SENDTEAM (callid, teamid)
values (368, 571);
insert into SENDTEAM (callid, teamid)
values (197, 1823);
insert into SENDTEAM (callid, teamid)
values (219, 812);
insert into SENDTEAM (callid, teamid)
values (773, 1617);
insert into SENDTEAM (callid, teamid)
values (602, 1578);
insert into SENDTEAM (callid, teamid)
values (920, 418);
insert into SENDTEAM (callid, teamid)
values (345, 793);
insert into SENDTEAM (callid, teamid)
values (335, 1467);
insert into SENDTEAM (callid, teamid)
values (45, 839);
insert into SENDTEAM (callid, teamid)
values (745, 1288);
insert into SENDTEAM (callid, teamid)
values (864, 1383);
insert into SENDTEAM (callid, teamid)
values (171, 147);
insert into SENDTEAM (callid, teamid)
values (374, 682);
insert into SENDTEAM (callid, teamid)
values (380, 479);
insert into SENDTEAM (callid, teamid)
values (303, 1961);
insert into SENDTEAM (callid, teamid)
values (24, 117);
insert into SENDTEAM (callid, teamid)
values (307, 1964);
insert into SENDTEAM (callid, teamid)
values (185, 1680);
insert into SENDTEAM (callid, teamid)
values (110, 1255);
insert into SENDTEAM (callid, teamid)
values (333, 1941);
insert into SENDTEAM (callid, teamid)
values (632, 376);
insert into SENDTEAM (callid, teamid)
values (904, 1549);
insert into SENDTEAM (callid, teamid)
values (965, 456);
insert into SENDTEAM (callid, teamid)
values (3, 1921);
insert into SENDTEAM (callid, teamid)
values (299, 1354);
insert into SENDTEAM (callid, teamid)
values (961, 663);
insert into SENDTEAM (callid, teamid)
values (159, 943);
insert into SENDTEAM (callid, teamid)
values (723, 1361);
insert into SENDTEAM (callid, teamid)
values (574, 1622);
insert into SENDTEAM (callid, teamid)
values (316, 87);
insert into SENDTEAM (callid, teamid)
values (21, 643);
insert into SENDTEAM (callid, teamid)
values (860, 1455);
insert into SENDTEAM (callid, teamid)
values (259, 1365);
insert into SENDTEAM (callid, teamid)
values (885, 1581);
commit;
prompt 400 records committed...
insert into SENDTEAM (callid, teamid)
values (422, 1007);
insert into SENDTEAM (callid, teamid)
values (908, 1794);
insert into SENDTEAM (callid, teamid)
values (965, 1015);
insert into SENDTEAM (callid, teamid)
values (525, 1419);
insert into SENDTEAM (callid, teamid)
values (332, 618);
insert into SENDTEAM (callid, teamid)
values (501, 508);
insert into SENDTEAM (callid, teamid)
values (458, 676);
insert into SENDTEAM (callid, teamid)
values (576, 1837);
insert into SENDTEAM (callid, teamid)
values (448, 1420);
insert into SENDTEAM (callid, teamid)
values (993, 25);
insert into SENDTEAM (callid, teamid)
values (66, 161);
insert into SENDTEAM (callid, teamid)
values (969, 113);
insert into SENDTEAM (callid, teamid)
values (873, 1576);
insert into SENDTEAM (callid, teamid)
values (593, 458);
insert into SENDTEAM (callid, teamid)
values (138, 1663);
insert into SENDTEAM (callid, teamid)
values (896, 1263);
insert into SENDTEAM (callid, teamid)
values (868, 947);
insert into SENDTEAM (callid, teamid)
values (65, 617);
insert into SENDTEAM (callid, teamid)
values (580, 1049);
insert into SENDTEAM (callid, teamid)
values (43, 362);
insert into SENDTEAM (callid, teamid)
values (663, 1195);
insert into SENDTEAM (callid, teamid)
values (997, 645);
insert into SENDTEAM (callid, teamid)
values (445, 1774);
insert into SENDTEAM (callid, teamid)
values (386, 498);
insert into SENDTEAM (callid, teamid)
values (327, 519);
insert into SENDTEAM (callid, teamid)
values (621, 282);
insert into SENDTEAM (callid, teamid)
values (586, 1429);
insert into SENDTEAM (callid, teamid)
values (544, 347);
insert into SENDTEAM (callid, teamid)
values (709, 1004);
insert into SENDTEAM (callid, teamid)
values (209, 748);
insert into SENDTEAM (callid, teamid)
values (373, 904);
insert into SENDTEAM (callid, teamid)
values (706, 1365);
insert into SENDTEAM (callid, teamid)
values (427, 608);
insert into SENDTEAM (callid, teamid)
values (15, 259);
insert into SENDTEAM (callid, teamid)
values (475, 186);
insert into SENDTEAM (callid, teamid)
values (106, 622);
insert into SENDTEAM (callid, teamid)
values (939, 1761);
insert into SENDTEAM (callid, teamid)
values (796, 1158);
insert into SENDTEAM (callid, teamid)
values (697, 771);
insert into SENDTEAM (callid, teamid)
values (73, 1242);
insert into SENDTEAM (callid, teamid)
values (658, 602);
insert into SENDTEAM (callid, teamid)
values (887, 685);
insert into SENDTEAM (callid, teamid)
values (889, 714);
insert into SENDTEAM (callid, teamid)
values (636, 483);
insert into SENDTEAM (callid, teamid)
values (143, 828);
insert into SENDTEAM (callid, teamid)
values (836, 1355);
insert into SENDTEAM (callid, teamid)
values (910, 290);
insert into SENDTEAM (callid, teamid)
values (696, 1437);
insert into SENDTEAM (callid, teamid)
values (342, 180);
insert into SENDTEAM (callid, teamid)
values (608, 974);
insert into SENDTEAM (callid, teamid)
values (660, 292);
insert into SENDTEAM (callid, teamid)
values (755, 348);
insert into SENDTEAM (callid, teamid)
values (908, 1545);
insert into SENDTEAM (callid, teamid)
values (349, 279);
insert into SENDTEAM (callid, teamid)
values (166, 948);
insert into SENDTEAM (callid, teamid)
values (214, 1567);
insert into SENDTEAM (callid, teamid)
values (567, 688);
insert into SENDTEAM (callid, teamid)
values (711, 191);
insert into SENDTEAM (callid, teamid)
values (744, 1460);
insert into SENDTEAM (callid, teamid)
values (230, 125);
insert into SENDTEAM (callid, teamid)
values (557, 606);
insert into SENDTEAM (callid, teamid)
values (742, 711);
insert into SENDTEAM (callid, teamid)
values (210, 179);
insert into SENDTEAM (callid, teamid)
values (136, 1931);
insert into SENDTEAM (callid, teamid)
values (124, 511);
insert into SENDTEAM (callid, teamid)
values (335, 1425);
insert into SENDTEAM (callid, teamid)
values (163, 1391);
insert into SENDTEAM (callid, teamid)
values (419, 1595);
insert into SENDTEAM (callid, teamid)
values (85, 1433);
insert into SENDTEAM (callid, teamid)
values (243, 1644);
insert into SENDTEAM (callid, teamid)
values (322, 740);
insert into SENDTEAM (callid, teamid)
values (274, 1882);
insert into SENDTEAM (callid, teamid)
values (447, 451);
insert into SENDTEAM (callid, teamid)
values (655, 165);
insert into SENDTEAM (callid, teamid)
values (937, 1268);
insert into SENDTEAM (callid, teamid)
values (702, 781);
insert into SENDTEAM (callid, teamid)
values (97, 1551);
insert into SENDTEAM (callid, teamid)
values (337, 658);
insert into SENDTEAM (callid, teamid)
values (249, 85);
insert into SENDTEAM (callid, teamid)
values (186, 207);
insert into SENDTEAM (callid, teamid)
values (547, 1102);
insert into SENDTEAM (callid, teamid)
values (328, 677);
insert into SENDTEAM (callid, teamid)
values (26, 1660);
insert into SENDTEAM (callid, teamid)
values (921, 326);
insert into SENDTEAM (callid, teamid)
values (747, 1965);
insert into SENDTEAM (callid, teamid)
values (207, 297);
insert into SENDTEAM (callid, teamid)
values (148, 1740);
insert into SENDTEAM (callid, teamid)
values (609, 1500);
insert into SENDTEAM (callid, teamid)
values (955, 223);
insert into SENDTEAM (callid, teamid)
values (922, 376);
insert into SENDTEAM (callid, teamid)
values (267, 1894);
insert into SENDTEAM (callid, teamid)
values (818, 1866);
insert into SENDTEAM (callid, teamid)
values (675, 533);
insert into SENDTEAM (callid, teamid)
values (170, 442);
insert into SENDTEAM (callid, teamid)
values (519, 679);
insert into SENDTEAM (callid, teamid)
values (899, 533);
insert into SENDTEAM (callid, teamid)
values (653, 113);
insert into SENDTEAM (callid, teamid)
values (359, 203);
insert into SENDTEAM (callid, teamid)
values (309, 1434);
insert into SENDTEAM (callid, teamid)
values (472, 408);
commit;
prompt 500 records committed...
insert into SENDTEAM (callid, teamid)
values (941, 1341);
insert into SENDTEAM (callid, teamid)
values (113, 688);
insert into SENDTEAM (callid, teamid)
values (145, 698);
insert into SENDTEAM (callid, teamid)
values (467, 640);
insert into SENDTEAM (callid, teamid)
values (16, 989);
insert into SENDTEAM (callid, teamid)
values (352, 1001);
insert into SENDTEAM (callid, teamid)
values (551, 1252);
insert into SENDTEAM (callid, teamid)
values (736, 701);
insert into SENDTEAM (callid, teamid)
values (968, 79);
insert into SENDTEAM (callid, teamid)
values (932, 716);
insert into SENDTEAM (callid, teamid)
values (28, 1789);
insert into SENDTEAM (callid, teamid)
values (217, 81);
insert into SENDTEAM (callid, teamid)
values (747, 359);
insert into SENDTEAM (callid, teamid)
values (841, 1885);
insert into SENDTEAM (callid, teamid)
values (84, 1205);
insert into SENDTEAM (callid, teamid)
values (674, 1615);
insert into SENDTEAM (callid, teamid)
values (476, 1414);
insert into SENDTEAM (callid, teamid)
values (970, 673);
insert into SENDTEAM (callid, teamid)
values (328, 1517);
insert into SENDTEAM (callid, teamid)
values (985, 427);
insert into SENDTEAM (callid, teamid)
values (818, 394);
insert into SENDTEAM (callid, teamid)
values (431, 623);
insert into SENDTEAM (callid, teamid)
values (622, 1409);
insert into SENDTEAM (callid, teamid)
values (2, 512);
insert into SENDTEAM (callid, teamid)
values (420, 369);
insert into SENDTEAM (callid, teamid)
values (453, 1541);
insert into SENDTEAM (callid, teamid)
values (299, 396);
insert into SENDTEAM (callid, teamid)
values (973, 929);
insert into SENDTEAM (callid, teamid)
values (403, 1310);
insert into SENDTEAM (callid, teamid)
values (829, 7);
insert into SENDTEAM (callid, teamid)
values (443, 1618);
insert into SENDTEAM (callid, teamid)
values (521, 1627);
insert into SENDTEAM (callid, teamid)
values (928, 1695);
insert into SENDTEAM (callid, teamid)
values (930, 1515);
insert into SENDTEAM (callid, teamid)
values (228, 1260);
insert into SENDTEAM (callid, teamid)
values (191, 895);
insert into SENDTEAM (callid, teamid)
values (818, 737);
insert into SENDTEAM (callid, teamid)
values (282, 231);
insert into SENDTEAM (callid, teamid)
values (326, 593);
insert into SENDTEAM (callid, teamid)
values (556, 435);
insert into SENDTEAM (callid, teamid)
values (240, 1245);
insert into SENDTEAM (callid, teamid)
values (705, 380);
insert into SENDTEAM (callid, teamid)
values (371, 641);
insert into SENDTEAM (callid, teamid)
values (890, 63);
insert into SENDTEAM (callid, teamid)
values (457, 1096);
insert into SENDTEAM (callid, teamid)
values (15, 1262);
insert into SENDTEAM (callid, teamid)
values (490, 1479);
insert into SENDTEAM (callid, teamid)
values (396, 32);
insert into SENDTEAM (callid, teamid)
values (640, 1350);
insert into SENDTEAM (callid, teamid)
values (284, 1883);
insert into SENDTEAM (callid, teamid)
values (892, 144);
insert into SENDTEAM (callid, teamid)
values (3, 981);
insert into SENDTEAM (callid, teamid)
values (734, 974);
insert into SENDTEAM (callid, teamid)
values (669, 1220);
insert into SENDTEAM (callid, teamid)
values (527, 1183);
insert into SENDTEAM (callid, teamid)
values (726, 1508);
insert into SENDTEAM (callid, teamid)
values (401, 199);
insert into SENDTEAM (callid, teamid)
values (801, 107);
insert into SENDTEAM (callid, teamid)
values (799, 1819);
insert into SENDTEAM (callid, teamid)
values (582, 1374);
insert into SENDTEAM (callid, teamid)
values (14, 500);
insert into SENDTEAM (callid, teamid)
values (735, 748);
insert into SENDTEAM (callid, teamid)
values (346, 1746);
insert into SENDTEAM (callid, teamid)
values (73, 322);
insert into SENDTEAM (callid, teamid)
values (718, 1204);
insert into SENDTEAM (callid, teamid)
values (465, 1851);
insert into SENDTEAM (callid, teamid)
values (882, 1542);
insert into SENDTEAM (callid, teamid)
values (232, 529);
insert into SENDTEAM (callid, teamid)
values (554, 717);
insert into SENDTEAM (callid, teamid)
values (997, 1391);
insert into SENDTEAM (callid, teamid)
values (103, 1718);
insert into SENDTEAM (callid, teamid)
values (233, 678);
insert into SENDTEAM (callid, teamid)
values (645, 383);
insert into SENDTEAM (callid, teamid)
values (992, 999);
insert into SENDTEAM (callid, teamid)
values (652, 382);
insert into SENDTEAM (callid, teamid)
values (554, 1660);
insert into SENDTEAM (callid, teamid)
values (442, 961);
insert into SENDTEAM (callid, teamid)
values (965, 1970);
insert into SENDTEAM (callid, teamid)
values (147, 1535);
insert into SENDTEAM (callid, teamid)
values (717, 1897);
insert into SENDTEAM (callid, teamid)
values (35, 1734);
insert into SENDTEAM (callid, teamid)
values (46, 901);
insert into SENDTEAM (callid, teamid)
values (277, 1985);
insert into SENDTEAM (callid, teamid)
values (578, 290);
insert into SENDTEAM (callid, teamid)
values (530, 234);
insert into SENDTEAM (callid, teamid)
values (313, 953);
insert into SENDTEAM (callid, teamid)
values (950, 892);
insert into SENDTEAM (callid, teamid)
values (185, 796);
insert into SENDTEAM (callid, teamid)
values (477, 605);
insert into SENDTEAM (callid, teamid)
values (673, 741);
insert into SENDTEAM (callid, teamid)
values (517, 1939);
insert into SENDTEAM (callid, teamid)
values (202, 624);
insert into SENDTEAM (callid, teamid)
values (375, 577);
insert into SENDTEAM (callid, teamid)
values (320, 838);
insert into SENDTEAM (callid, teamid)
values (47, 119);
insert into SENDTEAM (callid, teamid)
values (884, 61);
insert into SENDTEAM (callid, teamid)
values (231, 1076);
insert into SENDTEAM (callid, teamid)
values (741, 1919);
insert into SENDTEAM (callid, teamid)
values (669, 1158);
insert into SENDTEAM (callid, teamid)
values (630, 1922);
commit;
prompt 600 records committed...
insert into SENDTEAM (callid, teamid)
values (178, 450);
insert into SENDTEAM (callid, teamid)
values (302, 520);
insert into SENDTEAM (callid, teamid)
values (976, 1556);
insert into SENDTEAM (callid, teamid)
values (85, 622);
insert into SENDTEAM (callid, teamid)
values (168, 1328);
insert into SENDTEAM (callid, teamid)
values (378, 423);
insert into SENDTEAM (callid, teamid)
values (495, 1253);
insert into SENDTEAM (callid, teamid)
values (811, 877);
insert into SENDTEAM (callid, teamid)
values (715, 101);
insert into SENDTEAM (callid, teamid)
values (57, 1670);
insert into SENDTEAM (callid, teamid)
values (213, 926);
insert into SENDTEAM (callid, teamid)
values (521, 27);
insert into SENDTEAM (callid, teamid)
values (708, 1022);
insert into SENDTEAM (callid, teamid)
values (405, 1201);
insert into SENDTEAM (callid, teamid)
values (168, 1905);
insert into SENDTEAM (callid, teamid)
values (871, 1988);
insert into SENDTEAM (callid, teamid)
values (282, 945);
insert into SENDTEAM (callid, teamid)
values (292, 1111);
insert into SENDTEAM (callid, teamid)
values (108, 715);
insert into SENDTEAM (callid, teamid)
values (823, 820);
insert into SENDTEAM (callid, teamid)
values (756, 672);
insert into SENDTEAM (callid, teamid)
values (780, 542);
insert into SENDTEAM (callid, teamid)
values (204, 245);
insert into SENDTEAM (callid, teamid)
values (558, 1935);
insert into SENDTEAM (callid, teamid)
values (627, 940);
insert into SENDTEAM (callid, teamid)
values (73, 1190);
insert into SENDTEAM (callid, teamid)
values (828, 1542);
insert into SENDTEAM (callid, teamid)
values (963, 913);
insert into SENDTEAM (callid, teamid)
values (637, 1021);
insert into SENDTEAM (callid, teamid)
values (32, 445);
insert into SENDTEAM (callid, teamid)
values (400, 225);
insert into SENDTEAM (callid, teamid)
values (673, 1956);
insert into SENDTEAM (callid, teamid)
values (891, 1957);
insert into SENDTEAM (callid, teamid)
values (251, 153);
insert into SENDTEAM (callid, teamid)
values (287, 1534);
insert into SENDTEAM (callid, teamid)
values (682, 1961);
insert into SENDTEAM (callid, teamid)
values (42, 414);
insert into SENDTEAM (callid, teamid)
values (696, 1000);
insert into SENDTEAM (callid, teamid)
values (775, 1993);
insert into SENDTEAM (callid, teamid)
values (511, 220);
insert into SENDTEAM (callid, teamid)
values (543, 1160);
insert into SENDTEAM (callid, teamid)
values (907, 526);
insert into SENDTEAM (callid, teamid)
values (91, 1706);
insert into SENDTEAM (callid, teamid)
values (938, 1742);
insert into SENDTEAM (callid, teamid)
values (954, 176);
insert into SENDTEAM (callid, teamid)
values (757, 758);
insert into SENDTEAM (callid, teamid)
values (504, 1271);
insert into SENDTEAM (callid, teamid)
values (297, 203);
insert into SENDTEAM (callid, teamid)
values (319, 379);
insert into SENDTEAM (callid, teamid)
values (786, 1480);
insert into SENDTEAM (callid, teamid)
values (470, 1330);
insert into SENDTEAM (callid, teamid)
values (335, 523);
insert into SENDTEAM (callid, teamid)
values (595, 1985);
insert into SENDTEAM (callid, teamid)
values (82, 1109);
insert into SENDTEAM (callid, teamid)
values (857, 729);
insert into SENDTEAM (callid, teamid)
values (627, 1062);
insert into SENDTEAM (callid, teamid)
values (159, 1484);
insert into SENDTEAM (callid, teamid)
values (737, 1214);
insert into SENDTEAM (callid, teamid)
values (218, 1316);
insert into SENDTEAM (callid, teamid)
values (565, 1445);
insert into SENDTEAM (callid, teamid)
values (359, 1247);
insert into SENDTEAM (callid, teamid)
values (858, 653);
insert into SENDTEAM (callid, teamid)
values (137, 1357);
insert into SENDTEAM (callid, teamid)
values (898, 11);
insert into SENDTEAM (callid, teamid)
values (145, 1760);
insert into SENDTEAM (callid, teamid)
values (147, 1329);
insert into SENDTEAM (callid, teamid)
values (629, 1580);
insert into SENDTEAM (callid, teamid)
values (844, 889);
insert into SENDTEAM (callid, teamid)
values (750, 474);
insert into SENDTEAM (callid, teamid)
values (33, 1582);
insert into SENDTEAM (callid, teamid)
values (614, 1843);
insert into SENDTEAM (callid, teamid)
values (754, 695);
insert into SENDTEAM (callid, teamid)
values (438, 1287);
insert into SENDTEAM (callid, teamid)
values (382, 1198);
insert into SENDTEAM (callid, teamid)
values (438, 425);
insert into SENDTEAM (callid, teamid)
values (351, 858);
insert into SENDTEAM (callid, teamid)
values (319, 653);
insert into SENDTEAM (callid, teamid)
values (751, 48);
insert into SENDTEAM (callid, teamid)
values (470, 1948);
insert into SENDTEAM (callid, teamid)
values (519, 1568);
insert into SENDTEAM (callid, teamid)
values (216, 307);
insert into SENDTEAM (callid, teamid)
values (223, 347);
insert into SENDTEAM (callid, teamid)
values (753, 1914);
insert into SENDTEAM (callid, teamid)
values (664, 1349);
insert into SENDTEAM (callid, teamid)
values (605, 626);
insert into SENDTEAM (callid, teamid)
values (788, 542);
insert into SENDTEAM (callid, teamid)
values (726, 1880);
insert into SENDTEAM (callid, teamid)
values (633, 262);
insert into SENDTEAM (callid, teamid)
values (610, 605);
insert into SENDTEAM (callid, teamid)
values (302, 825);
insert into SENDTEAM (callid, teamid)
values (998, 1244);
insert into SENDTEAM (callid, teamid)
values (197, 726);
insert into SENDTEAM (callid, teamid)
values (67, 465);
insert into SENDTEAM (callid, teamid)
values (993, 268);
insert into SENDTEAM (callid, teamid)
values (190, 1669);
insert into SENDTEAM (callid, teamid)
values (94, 1968);
insert into SENDTEAM (callid, teamid)
values (643, 881);
insert into SENDTEAM (callid, teamid)
values (543, 1584);
insert into SENDTEAM (callid, teamid)
values (845, 121);
insert into SENDTEAM (callid, teamid)
values (639, 98);
commit;
prompt 700 records committed...
insert into SENDTEAM (callid, teamid)
values (25, 843);
insert into SENDTEAM (callid, teamid)
values (724, 1517);
insert into SENDTEAM (callid, teamid)
values (388, 542);
insert into SENDTEAM (callid, teamid)
values (892, 1809);
insert into SENDTEAM (callid, teamid)
values (167, 128);
insert into SENDTEAM (callid, teamid)
values (598, 850);
insert into SENDTEAM (callid, teamid)
values (158, 138);
insert into SENDTEAM (callid, teamid)
values (392, 1696);
insert into SENDTEAM (callid, teamid)
values (599, 412);
insert into SENDTEAM (callid, teamid)
values (283, 44);
insert into SENDTEAM (callid, teamid)
values (502, 300);
insert into SENDTEAM (callid, teamid)
values (449, 1212);
insert into SENDTEAM (callid, teamid)
values (802, 1001);
insert into SENDTEAM (callid, teamid)
values (280, 499);
insert into SENDTEAM (callid, teamid)
values (925, 145);
insert into SENDTEAM (callid, teamid)
values (5, 1240);
insert into SENDTEAM (callid, teamid)
values (642, 1181);
insert into SENDTEAM (callid, teamid)
values (359, 1441);
insert into SENDTEAM (callid, teamid)
values (311, 688);
insert into SENDTEAM (callid, teamid)
values (53, 290);
insert into SENDTEAM (callid, teamid)
values (870, 1201);
insert into SENDTEAM (callid, teamid)
values (10, 433);
insert into SENDTEAM (callid, teamid)
values (197, 1629);
insert into SENDTEAM (callid, teamid)
values (616, 324);
insert into SENDTEAM (callid, teamid)
values (681, 1882);
insert into SENDTEAM (callid, teamid)
values (460, 1513);
insert into SENDTEAM (callid, teamid)
values (123, 777);
insert into SENDTEAM (callid, teamid)
values (299, 208);
insert into SENDTEAM (callid, teamid)
values (336, 841);
insert into SENDTEAM (callid, teamid)
values (245, 955);
insert into SENDTEAM (callid, teamid)
values (28, 86);
insert into SENDTEAM (callid, teamid)
values (387, 783);
insert into SENDTEAM (callid, teamid)
values (852, 1354);
insert into SENDTEAM (callid, teamid)
values (353, 654);
insert into SENDTEAM (callid, teamid)
values (720, 332);
insert into SENDTEAM (callid, teamid)
values (525, 1566);
insert into SENDTEAM (callid, teamid)
values (744, 1828);
insert into SENDTEAM (callid, teamid)
values (921, 1142);
insert into SENDTEAM (callid, teamid)
values (408, 397);
insert into SENDTEAM (callid, teamid)
values (942, 1072);
insert into SENDTEAM (callid, teamid)
values (840, 1914);
insert into SENDTEAM (callid, teamid)
values (502, 220);
insert into SENDTEAM (callid, teamid)
values (288, 1192);
insert into SENDTEAM (callid, teamid)
values (250, 768);
insert into SENDTEAM (callid, teamid)
values (153, 1232);
insert into SENDTEAM (callid, teamid)
values (889, 1223);
insert into SENDTEAM (callid, teamid)
values (204, 201);
insert into SENDTEAM (callid, teamid)
values (803, 641);
insert into SENDTEAM (callid, teamid)
values (816, 732);
insert into SENDTEAM (callid, teamid)
values (504, 905);
insert into SENDTEAM (callid, teamid)
values (359, 644);
insert into SENDTEAM (callid, teamid)
values (611, 402);
insert into SENDTEAM (callid, teamid)
values (79, 668);
insert into SENDTEAM (callid, teamid)
values (352, 951);
insert into SENDTEAM (callid, teamid)
values (97, 1275);
insert into SENDTEAM (callid, teamid)
values (830, 308);
insert into SENDTEAM (callid, teamid)
values (372, 1207);
insert into SENDTEAM (callid, teamid)
values (529, 1115);
insert into SENDTEAM (callid, teamid)
values (746, 795);
insert into SENDTEAM (callid, teamid)
values (800, 1612);
insert into SENDTEAM (callid, teamid)
values (427, 1662);
insert into SENDTEAM (callid, teamid)
values (304, 1979);
insert into SENDTEAM (callid, teamid)
values (520, 902);
insert into SENDTEAM (callid, teamid)
values (658, 636);
insert into SENDTEAM (callid, teamid)
values (463, 341);
insert into SENDTEAM (callid, teamid)
values (754, 1345);
insert into SENDTEAM (callid, teamid)
values (484, 1952);
insert into SENDTEAM (callid, teamid)
values (503, 472);
insert into SENDTEAM (callid, teamid)
values (433, 1035);
insert into SENDTEAM (callid, teamid)
values (967, 238);
insert into SENDTEAM (callid, teamid)
values (591, 1254);
insert into SENDTEAM (callid, teamid)
values (133, 306);
insert into SENDTEAM (callid, teamid)
values (338, 116);
insert into SENDTEAM (callid, teamid)
values (803, 553);
insert into SENDTEAM (callid, teamid)
values (764, 1991);
insert into SENDTEAM (callid, teamid)
values (336, 365);
insert into SENDTEAM (callid, teamid)
values (597, 272);
insert into SENDTEAM (callid, teamid)
values (226, 307);
insert into SENDTEAM (callid, teamid)
values (57, 759);
insert into SENDTEAM (callid, teamid)
values (751, 495);
insert into SENDTEAM (callid, teamid)
values (485, 864);
insert into SENDTEAM (callid, teamid)
values (184, 534);
insert into SENDTEAM (callid, teamid)
values (870, 1738);
insert into SENDTEAM (callid, teamid)
values (284, 355);
insert into SENDTEAM (callid, teamid)
values (627, 901);
insert into SENDTEAM (callid, teamid)
values (69, 1791);
insert into SENDTEAM (callid, teamid)
values (228, 1482);
insert into SENDTEAM (callid, teamid)
values (94, 1246);
insert into SENDTEAM (callid, teamid)
values (563, 650);
insert into SENDTEAM (callid, teamid)
values (725, 297);
insert into SENDTEAM (callid, teamid)
values (121, 340);
insert into SENDTEAM (callid, teamid)
values (137, 1560);
insert into SENDTEAM (callid, teamid)
values (368, 1864);
insert into SENDTEAM (callid, teamid)
values (26, 1694);
insert into SENDTEAM (callid, teamid)
values (913, 497);
insert into SENDTEAM (callid, teamid)
values (270, 1851);
insert into SENDTEAM (callid, teamid)
values (341, 639);
insert into SENDTEAM (callid, teamid)
values (14, 437);
insert into SENDTEAM (callid, teamid)
values (805, 642);
insert into SENDTEAM (callid, teamid)
values (927, 1534);
commit;
prompt 800 records committed...
insert into SENDTEAM (callid, teamid)
values (749, 895);
insert into SENDTEAM (callid, teamid)
values (603, 800);
insert into SENDTEAM (callid, teamid)
values (363, 1263);
insert into SENDTEAM (callid, teamid)
values (347, 1216);
insert into SENDTEAM (callid, teamid)
values (638, 477);
insert into SENDTEAM (callid, teamid)
values (836, 1515);
insert into SENDTEAM (callid, teamid)
values (116, 561);
insert into SENDTEAM (callid, teamid)
values (370, 635);
insert into SENDTEAM (callid, teamid)
values (711, 1893);
insert into SENDTEAM (callid, teamid)
values (720, 37);
insert into SENDTEAM (callid, teamid)
values (202, 998);
insert into SENDTEAM (callid, teamid)
values (794, 244);
insert into SENDTEAM (callid, teamid)
values (257, 1662);
insert into SENDTEAM (callid, teamid)
values (608, 427);
insert into SENDTEAM (callid, teamid)
values (93, 460);
insert into SENDTEAM (callid, teamid)
values (297, 403);
insert into SENDTEAM (callid, teamid)
values (152, 299);
insert into SENDTEAM (callid, teamid)
values (153, 864);
insert into SENDTEAM (callid, teamid)
values (369, 55);
insert into SENDTEAM (callid, teamid)
values (916, 207);
insert into SENDTEAM (callid, teamid)
values (922, 920);
insert into SENDTEAM (callid, teamid)
values (819, 783);
insert into SENDTEAM (callid, teamid)
values (559, 527);
insert into SENDTEAM (callid, teamid)
values (96, 1934);
insert into SENDTEAM (callid, teamid)
values (861, 470);
insert into SENDTEAM (callid, teamid)
values (963, 1637);
insert into SENDTEAM (callid, teamid)
values (52, 1299);
insert into SENDTEAM (callid, teamid)
values (293, 1120);
insert into SENDTEAM (callid, teamid)
values (221, 1582);
insert into SENDTEAM (callid, teamid)
values (468, 1282);
insert into SENDTEAM (callid, teamid)
values (56, 144);
insert into SENDTEAM (callid, teamid)
values (148, 258);
insert into SENDTEAM (callid, teamid)
values (456, 1054);
insert into SENDTEAM (callid, teamid)
values (944, 1989);
insert into SENDTEAM (callid, teamid)
values (631, 1476);
insert into SENDTEAM (callid, teamid)
values (216, 119);
insert into SENDTEAM (callid, teamid)
values (537, 957);
insert into SENDTEAM (callid, teamid)
values (497, 83);
insert into SENDTEAM (callid, teamid)
values (781, 1267);
insert into SENDTEAM (callid, teamid)
values (265, 708);
insert into SENDTEAM (callid, teamid)
values (321, 365);
insert into SENDTEAM (callid, teamid)
values (51, 1202);
insert into SENDTEAM (callid, teamid)
values (608, 594);
insert into SENDTEAM (callid, teamid)
values (127, 1833);
insert into SENDTEAM (callid, teamid)
values (990, 1708);
insert into SENDTEAM (callid, teamid)
values (237, 1185);
insert into SENDTEAM (callid, teamid)
values (528, 1801);
insert into SENDTEAM (callid, teamid)
values (126, 1303);
insert into SENDTEAM (callid, teamid)
values (545, 1757);
insert into SENDTEAM (callid, teamid)
values (844, 584);
insert into SENDTEAM (callid, teamid)
values (551, 1296);
insert into SENDTEAM (callid, teamid)
values (53, 758);
insert into SENDTEAM (callid, teamid)
values (372, 1225);
insert into SENDTEAM (callid, teamid)
values (834, 800);
insert into SENDTEAM (callid, teamid)
values (623, 970);
insert into SENDTEAM (callid, teamid)
values (717, 1115);
insert into SENDTEAM (callid, teamid)
values (859, 1001);
insert into SENDTEAM (callid, teamid)
values (920, 1845);
insert into SENDTEAM (callid, teamid)
values (29, 234);
insert into SENDTEAM (callid, teamid)
values (47, 1639);
insert into SENDTEAM (callid, teamid)
values (85, 1003);
insert into SENDTEAM (callid, teamid)
values (699, 1727);
insert into SENDTEAM (callid, teamid)
values (861, 696);
insert into SENDTEAM (callid, teamid)
values (766, 648);
insert into SENDTEAM (callid, teamid)
values (570, 1659);
insert into SENDTEAM (callid, teamid)
values (358, 1467);
insert into SENDTEAM (callid, teamid)
values (548, 1446);
insert into SENDTEAM (callid, teamid)
values (622, 1835);
insert into SENDTEAM (callid, teamid)
values (81, 15);
insert into SENDTEAM (callid, teamid)
values (935, 1729);
insert into SENDTEAM (callid, teamid)
values (445, 976);
insert into SENDTEAM (callid, teamid)
values (183, 216);
insert into SENDTEAM (callid, teamid)
values (506, 460);
insert into SENDTEAM (callid, teamid)
values (147, 1087);
insert into SENDTEAM (callid, teamid)
values (491, 1726);
insert into SENDTEAM (callid, teamid)
values (194, 1704);
insert into SENDTEAM (callid, teamid)
values (794, 87);
insert into SENDTEAM (callid, teamid)
values (779, 1906);
insert into SENDTEAM (callid, teamid)
values (922, 1250);
insert into SENDTEAM (callid, teamid)
values (496, 311);
insert into SENDTEAM (callid, teamid)
values (946, 671);
insert into SENDTEAM (callid, teamid)
values (633, 1862);
insert into SENDTEAM (callid, teamid)
values (54, 8);
insert into SENDTEAM (callid, teamid)
values (511, 969);
insert into SENDTEAM (callid, teamid)
values (83, 1275);
insert into SENDTEAM (callid, teamid)
values (43, 1071);
insert into SENDTEAM (callid, teamid)
values (122, 1784);
insert into SENDTEAM (callid, teamid)
values (286, 1982);
insert into SENDTEAM (callid, teamid)
values (562, 1478);
insert into SENDTEAM (callid, teamid)
values (950, 854);
insert into SENDTEAM (callid, teamid)
values (185, 732);
insert into SENDTEAM (callid, teamid)
values (100, 1099);
insert into SENDTEAM (callid, teamid)
values (167, 1236);
insert into SENDTEAM (callid, teamid)
values (543, 124);
insert into SENDTEAM (callid, teamid)
values (94, 1040);
insert into SENDTEAM (callid, teamid)
values (632, 1212);
insert into SENDTEAM (callid, teamid)
values (355, 1357);
insert into SENDTEAM (callid, teamid)
values (459, 1398);
insert into SENDTEAM (callid, teamid)
values (520, 1225);
insert into SENDTEAM (callid, teamid)
values (697, 1682);
commit;
prompt 900 records committed...
insert into SENDTEAM (callid, teamid)
values (564, 609);
insert into SENDTEAM (callid, teamid)
values (545, 430);
insert into SENDTEAM (callid, teamid)
values (45, 1051);
insert into SENDTEAM (callid, teamid)
values (539, 1289);
insert into SENDTEAM (callid, teamid)
values (592, 1450);
insert into SENDTEAM (callid, teamid)
values (187, 1479);
insert into SENDTEAM (callid, teamid)
values (319, 1072);
insert into SENDTEAM (callid, teamid)
values (688, 801);
insert into SENDTEAM (callid, teamid)
values (25, 383);
insert into SENDTEAM (callid, teamid)
values (197, 191);
insert into SENDTEAM (callid, teamid)
values (276, 799);
insert into SENDTEAM (callid, teamid)
values (382, 1182);
insert into SENDTEAM (callid, teamid)
values (744, 939);
insert into SENDTEAM (callid, teamid)
values (263, 110);
insert into SENDTEAM (callid, teamid)
values (409, 1493);
insert into SENDTEAM (callid, teamid)
values (547, 1407);
insert into SENDTEAM (callid, teamid)
values (476, 1278);
insert into SENDTEAM (callid, teamid)
values (967, 820);
insert into SENDTEAM (callid, teamid)
values (120, 1586);
insert into SENDTEAM (callid, teamid)
values (343, 1918);
insert into SENDTEAM (callid, teamid)
values (424, 424);
insert into SENDTEAM (callid, teamid)
values (357, 1702);
insert into SENDTEAM (callid, teamid)
values (115, 720);
insert into SENDTEAM (callid, teamid)
values (272, 1694);
insert into SENDTEAM (callid, teamid)
values (951, 1116);
insert into SENDTEAM (callid, teamid)
values (86, 1322);
insert into SENDTEAM (callid, teamid)
values (880, 415);
insert into SENDTEAM (callid, teamid)
values (846, 955);
insert into SENDTEAM (callid, teamid)
values (325, 1294);
insert into SENDTEAM (callid, teamid)
values (115, 442);
insert into SENDTEAM (callid, teamid)
values (203, 1367);
insert into SENDTEAM (callid, teamid)
values (822, 1479);
insert into SENDTEAM (callid, teamid)
values (534, 199);
insert into SENDTEAM (callid, teamid)
values (977, 660);
insert into SENDTEAM (callid, teamid)
values (768, 1358);
insert into SENDTEAM (callid, teamid)
values (994, 558);
insert into SENDTEAM (callid, teamid)
values (156, 1106);
insert into SENDTEAM (callid, teamid)
values (599, 667);
insert into SENDTEAM (callid, teamid)
values (811, 1808);
insert into SENDTEAM (callid, teamid)
values (555, 568);
insert into SENDTEAM (callid, teamid)
values (294, 680);
insert into SENDTEAM (callid, teamid)
values (698, 138);
insert into SENDTEAM (callid, teamid)
values (837, 936);
insert into SENDTEAM (callid, teamid)
values (11, 172);
insert into SENDTEAM (callid, teamid)
values (578, 956);
insert into SENDTEAM (callid, teamid)
values (724, 1241);
insert into SENDTEAM (callid, teamid)
values (396, 1555);
insert into SENDTEAM (callid, teamid)
values (669, 1141);
insert into SENDTEAM (callid, teamid)
values (222, 1944);
insert into SENDTEAM (callid, teamid)
values (380, 1774);
insert into SENDTEAM (callid, teamid)
values (927, 1491);
insert into SENDTEAM (callid, teamid)
values (676, 802);
insert into SENDTEAM (callid, teamid)
values (147, 858);
insert into SENDTEAM (callid, teamid)
values (694, 1926);
insert into SENDTEAM (callid, teamid)
values (661, 625);
insert into SENDTEAM (callid, teamid)
values (632, 119);
insert into SENDTEAM (callid, teamid)
values (170, 1976);
insert into SENDTEAM (callid, teamid)
values (661, 669);
insert into SENDTEAM (callid, teamid)
values (592, 562);
insert into SENDTEAM (callid, teamid)
values (759, 1382);
insert into SENDTEAM (callid, teamid)
values (246, 1116);
insert into SENDTEAM (callid, teamid)
values (442, 1762);
insert into SENDTEAM (callid, teamid)
values (501, 924);
insert into SENDTEAM (callid, teamid)
values (629, 1542);
insert into SENDTEAM (callid, teamid)
values (787, 743);
insert into SENDTEAM (callid, teamid)
values (126, 1393);
insert into SENDTEAM (callid, teamid)
values (49, 263);
insert into SENDTEAM (callid, teamid)
values (463, 1153);
insert into SENDTEAM (callid, teamid)
values (25, 1700);
insert into SENDTEAM (callid, teamid)
values (63, 1437);
insert into SENDTEAM (callid, teamid)
values (935, 1614);
insert into SENDTEAM (callid, teamid)
values (989, 948);
insert into SENDTEAM (callid, teamid)
values (458, 1562);
insert into SENDTEAM (callid, teamid)
values (744, 349);
insert into SENDTEAM (callid, teamid)
values (106, 653);
insert into SENDTEAM (callid, teamid)
values (859, 38);
insert into SENDTEAM (callid, teamid)
values (339, 1620);
insert into SENDTEAM (callid, teamid)
values (258, 1666);
insert into SENDTEAM (callid, teamid)
values (45, 495);
insert into SENDTEAM (callid, teamid)
values (632, 1739);
insert into SENDTEAM (callid, teamid)
values (242, 481);
insert into SENDTEAM (callid, teamid)
values (304, 155);
insert into SENDTEAM (callid, teamid)
values (105, 1113);
insert into SENDTEAM (callid, teamid)
values (322, 1017);
insert into SENDTEAM (callid, teamid)
values (683, 304);
insert into SENDTEAM (callid, teamid)
values (766, 1564);
insert into SENDTEAM (callid, teamid)
values (916, 1375);
insert into SENDTEAM (callid, teamid)
values (501, 1565);
insert into SENDTEAM (callid, teamid)
values (806, 1651);
insert into SENDTEAM (callid, teamid)
values (855, 17);
insert into SENDTEAM (callid, teamid)
values (855, 1722);
insert into SENDTEAM (callid, teamid)
values (971, 500);
insert into SENDTEAM (callid, teamid)
values (132, 970);
insert into SENDTEAM (callid, teamid)
values (805, 1021);
insert into SENDTEAM (callid, teamid)
values (571, 1448);
insert into SENDTEAM (callid, teamid)
values (1000, 692);
insert into SENDTEAM (callid, teamid)
values (367, 701);
insert into SENDTEAM (callid, teamid)
values (142, 103);
insert into SENDTEAM (callid, teamid)
values (576, 631);
insert into SENDTEAM (callid, teamid)
values (108, 707);
commit;
prompt 1000 records loaded
prompt Enabling foreign key constraints for CALLHELP...
alter table CALLHELP enable constraint SYS_C008135;
prompt Enabling foreign key constraints for TEAM...
alter table TEAM enable constraint SYS_C008142;
alter table TEAM enable constraint SYS_C008143;
prompt Enabling foreign key constraints for PARTICIPANTPARAMEDIC...
alter table PARTICIPANTPARAMEDIC enable constraint SYS_C008157;
alter table PARTICIPANTPARAMEDIC enable constraint SYS_C008158;
prompt Enabling foreign key constraints for PARTICIPANTVOLUNTEER...
alter table PARTICIPANTVOLUNTEER enable constraint SYS_C008152;
alter table PARTICIPANTVOLUNTEER enable constraint SYS_C008153;
prompt Enabling foreign key constraints for SENDTEAM...
alter table SENDTEAM enable constraint SYS_C008147;
alter table SENDTEAM enable constraint SYS_C008148;
prompt Enabling triggers for AMBULANCE...
alter table AMBULANCE enable all triggers;
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
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for SENDTEAM...
alter table SENDTEAM enable all triggers;

set feedback on
set define on
prompt Done
