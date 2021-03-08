/*  Person  */
insert into SYS.PERSON (PERSONID, FIRSTNAME, LASTNAME, PHONE, MAIL, ADDRESS, BIRTHDATE)
values (902876007, 'Gordie', 'Graham', '0574983205', 'gordie@kis.at', '12 Warwick BlvdVienn', to_date('11-03-1984', 'dd-mm-yyyy'));

insert into SYS.PERSON (PERSONID, FIRSTNAME, LASTNAME, PHONE, MAIL, ADDRESS, BIRTHDATE)
values (335709695, 'Rupert', 'Frakes', '0579366815', 'rupert@accesssystems', '39 England RoadSt. P', to_date('12-07-1992', 'dd-mm-yyyy'));

insert into SYS.PERSON (PERSONID, FIRSTNAME, LASTNAME, PHONE, MAIL, ADDRESS, BIRTHDATE)
values (246843332, 'Mira', 'Arquette', '0539656337', 'mira.arquette@asapst', '58 ConnellyJuneau', to_date('18-12-1951', 'dd-mm-yyyy'));

insert into SYS.PERSON (PERSONID, FIRSTNAME, LASTNAME, PHONE, MAIL, ADDRESS, BIRTHDATE)
values (210761207, 'Samantha', 'Sartain', '0582448975', 's.sartain@thinktanks', '58 Jake DriveFort Le', to_date('01-12-1950', 'dd-mm-yyyy'));

insert into SYS.PERSON (PERSONID, FIRSTNAME, LASTNAME, PHONE, MAIL, ADDRESS, BIRTHDATE)
values (131261185, 'Neve', 'Wolf', '0564219841', 'neve.wolf@bat.com', '88 Turner DriveClaym', to_date('19-03-1950', 'dd-mm-yyyy'));

commit;

/*  Dispatcher  */
insert into SYS.DISPATCHER (DISPATCHERID)
values (184692113);

insert into SYS.DISPATCHER (DISPATCHERID)
values (473822197);

insert into SYS.DISPATCHER (DISPATCHERID)
values (528422726);

insert into SYS.DISPATCHER (DISPATCHERID)
values (207822589);

commit;

/*  Volunteer  */
insert into SYS.VOLUNTEER (VOLUNTEERID)
values (396257560);

insert into SYS.VOLUNTEER (VOLUNTEERID)
values (931077989);

commit;

/*  Driver  */
insert into SYS.DRIVER (DRIVERID)
values (524183716);

insert into SYS.DRIVER (DRIVERID)
values (107197897);

commit;

/*  Paramedic  */
insert into SYS.PARAMEDIC (YEARSOFEXPERIENCE, PARAMEDICID)
values (1, 423868293);

insert into SYS.PARAMEDIC (YEARSOFEXPERIENCE, PARAMEDICID)
values (42, 891726473);

commit;

/*  Call Help  */
insert into SYS.CALLHELP (CALLID, CALLDATE, DISPATCHERID)
values (1, to_date('30-12-1958', 'dd-mm-yyyy'), 359849386);

insert into SYS.CALLHELP (CALLID, CALLDATE, DISPATCHERID)
values (2, to_date('25-12-2014', 'dd-mm-yyyy'), 438813407);

insert into SYS.CALLHELP (CALLID, CALLDATE, DISPATCHERID)
values (3, to_date('27-05-1949', 'dd-mm-yyyy'), 196424839);

insert into SYS.CALLHELP (CALLID, CALLDATE, DISPATCHERID)
values (4, to_date('20-08-1988', 'dd-mm-yyyy'), 293770073);

commit;

/*  Ambulance   */
insert into SYS.AMBULANCE (AMBULANCEID)
values (1);

insert into SYS.AMBULANCE (AMBULANCEID)
values (2);

insert into SYS.AMBULANCE (AMBULANCEID)
values (3);

insert into SYS.AMBULANCE (AMBULANCEID)
values (4);

insert into SYS.AMBULANCE (AMBULANCEID)
values (5);

insert into SYS.AMBULANCE (AMBULANCEID)
values (6);

commit;

/*  Team    */
insert into SYS.TEAM (TEAMID, DRIVERID, AMBULANCEID)
values (1, 254746679, 15);

insert into SYS.TEAM (TEAMID, DRIVERID, AMBULANCEID)
values (2, 858098492, 57);

insert into SYS.TEAM (TEAMID, DRIVERID, AMBULANCEID)
values (3, 898173826, 100);

commit;

/*  SendTeam    */
insert into SYS.SENDTEAM (CALLID, TEAMID)
values (59, 851);

insert into SYS.SENDTEAM (CALLID, TEAMID)
values (754, 1353);

insert into SYS.SENDTEAM (CALLID, TEAMID)
values (927, 1557);

insert into SYS.SENDTEAM (CALLID, TEAMID)
values (393, 375);

commit;

/*  ParticipantParamedic */
insert into SYS.PARTICIPANTPARAMEDIC (TEAMID, PARAMEDICID)
values (1291, 247146261);

insert into SYS.PARTICIPANTPARAMEDIC (TEAMID, PARAMEDICID)
values (1446, 151224001);

insert into SYS.PARTICIPANTPARAMEDIC (TEAMID, PARAMEDICID)
values (1461, 393715774);

insert into SYS.PARTICIPANTPARAMEDIC (TEAMID, PARAMEDICID)
values (57, 540162175);

commit;

/*  ParticipantVolunteer    */
insert into SYS.PARTICIPANTVOLUNTEER (TEAMID, VOLUNTEERID)
values (1456, 701718916);

insert into SYS.PARTICIPANTVOLUNTEER (TEAMID, VOLUNTEERID)
values (1735, 435380711);

insert into SYS.PARTICIPANTVOLUNTEER (TEAMID, VOLUNTEERID)
values (1003, 662127500);

commit;