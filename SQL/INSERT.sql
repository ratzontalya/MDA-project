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
values (902876007);

insert into SYS.DISPATCHER (DISPATCHERID)
values (335709695);

insert into SYS.DISPATCHER (DISPATCHERID)
values (246843332);

insert into SYS.DISPATCHER (DISPATCHERID)
values (210761207);

commit;

/*  Volunteer  */
insert into SYS.VOLUNTEER (VOLUNTEERID)
values (902876007);

insert into SYS.VOLUNTEER (VOLUNTEERID)
values (335709695);

commit;

/*  Driver  */
insert into SYS.DRIVER (DRIVERID)
values (902876007);

insert into SYS.DRIVER (DRIVERID)
values (335709695);

commit;

/*  Paramedic  */
insert into SYS.PARAMEDIC (YEARSOFEXPERIENCE, PARAMEDICID)
values (1, 902876007);

insert into SYS.PARAMEDIC (YEARSOFEXPERIENCE, PARAMEDICID)
values (42, 335709695);

commit;

/*  Call Help  */
insert into SYS.CALLHELP (CALLID, CALLDATE, DISPATCHERID)
values (1, to_date('30-12-1958', 'dd-mm-yyyy'), 335709695);

insert into SYS.CALLHELP (CALLID, CALLDATE, DISPATCHERID)
values (2, to_date('25-12-2014', 'dd-mm-yyyy'), 902876007);

insert into SYS.CALLHELP (CALLID, CALLDATE, DISPATCHERID)
values (3, to_date('27-05-1949', 'dd-mm-yyyy'), 335709695);

insert into SYS.CALLHELP (CALLID, CALLDATE, DISPATCHERID)
values (4, to_date('20-08-1988', 'dd-mm-yyyy'), 902876007);

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
values (1, 335709695, 3);

insert into SYS.TEAM (TEAMID, DRIVERID, AMBULANCEID)
values (2, 902876007, 4);

insert into SYS.TEAM (TEAMID, DRIVERID, AMBULANCEID)
values (3, 902876007, 5);

commit;

/*  SendTeam    */
insert into SYS.SENDTEAM (CALLID, TEAMID)
values (1, 1);

insert into SYS.SENDTEAM (CALLID, TEAMID)
values (2, 2);

insert into SYS.SENDTEAM (CALLID, TEAMID)
values (2, 3);

insert into SYS.SENDTEAM (CALLID, TEAMID)
values (3, 2);

commit;

/*  ParticipantParamedic */
insert into SYS.PARTICIPANTPARAMEDIC (TEAMID, PARAMEDICID)
values (1, 335709695);

insert into SYS.PARTICIPANTPARAMEDIC (TEAMID, PARAMEDICID)
values (2, 335709695);

insert into SYS.PARTICIPANTPARAMEDIC (TEAMID, PARAMEDICID)
values (1, 902876007);

insert into SYS.PARTICIPANTPARAMEDIC (TEAMID, PARAMEDICID)
values (2, 902876007);

commit;

/*  ParticipantVolunteer    */
insert into SYS.PARTICIPANTVOLUNTEER (TEAMID, VOLUNTEERID)
values (1, 335709695);

insert into SYS.PARTICIPANTVOLUNTEER (TEAMID, VOLUNTEERID)
values (2, 335709695);

insert into SYS.PARTICIPANTVOLUNTEER (TEAMID, VOLUNTEERID)
values (3, 902876007);

commit;
