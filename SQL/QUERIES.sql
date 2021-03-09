/*
    All the ambulances that each of the drivers 
    are also volunteers have driven in the last year
*/

SELECT *
FROM AMBULANCE
WHERE AmbulanceId NOT IN (SELECT AmbulanceId
                      FROM CALLHELP NATURAL JOIN TEAM NATURAL JOIN SENDTEAM
                      WHERE CallDate > '01-JAN-2020' AND DriverId NOT IN(SELECT DriverId
                                            FROM DRIVER, VOLUNTEER
                                            WHERE DriverId = VolunteerId));


/*
    All dispatchers whose number of calls received
    in the past year is at least 100
*/

SELECT *
FROM DISPATCHER
WHERE DispatcherId IN (SELECT DispatcherId 
                      FROM CALLHELP
                      GROUP BY DispatcherId
                      HAVING COUNT(DISTINCT DispatcherId) > 99);

  
/*
    All calls that sent to them at least one paramedic
    with more than 10 years of experience
*/

SELECT *
FROM CALLHELP
WHERE CallId IN (SELECT CallId
                 FROM CALLHELP 
                 NATURAL JOIN SENDTEAM
                 NATURAL JOIN PARTICIPANTPARAMEDIC
                 NATURAL JOIN PARAMEDIC 
                 WHERE YearsOfExperience > 10);

SELECT CallId, CallDate, DispatcherId
FROM CALLHELP 
NATURAL JOIN SENDTEAM
NATURAL JOIN PARTICIPANTPARAMEDIC
NATURAL JOIN PARAMEDIC 
WHERE YearsOfExperience > 10;

/*
    All ambulances sent by a dispatcher
    that is also a paramedic with at least 20 years of experience
*/

SELECT AmbulanceId
FROM CALLHELP 
NATURAL JOIN SENDTEAM
NATURAL JOIN TEAM
NATURAL JOIN PARAMEDIC 
WHERE ParamedicId = DispatcherId AND YearsOfExperience > 20


/*
    Delete the oldest dispatcher
*/


/*
    Update the max YEARSOFEXPERIENCE to be 50:
    If there is paramedic with YEARSOFEXPERIENCE grather than 50 - 
    update it to be 50
*/


/*
	Give me all the teams with the number of 
    the paramedics and volunteers
	that participated in it.
    TeamId, numVolunteers, numParamedics
*/

SELECT TEAMID, COUNT(PARAMEDICID), COUNT(VOLUNTEERID)
FROM TEAM NATURAL JOIN PARTICIPANTPARAMEDIC NATURAL JOIN PARTICIPANTVOLUNTEER
GROUP BY TEAMID;

/*
	Give me all the calls with the number of 
    the paramedics and volunteers
	that participated in this event.
    CallId, numVolunteers, numParamedics
*/

SELECT CALLID, COUNT(DISTINCT PARAMEDICID), COUNT(DISTINCT VOLUNTEERID)
FROM  CALLHELP NATURAL JOIN SENDTEAM NATURAL JOIN PARTICIPANTPARAMEDIC  NATURAL JOIN PARTICIPANTVOLUNTEER
GROUP BY CALLID;

/*
	Give me all the ambulances that where used for 
    more than 50 times.
*/

SELECT AMBULANCEID, COUNT(*)
FROM TEAM
GROUP BY AMBULANCEID
HAVING COUNT(*) > 50;

/*
	I want the EXCELLENT paramedic which participated
    in more than 30 calls or
    participated in "big events" which needed more 
    than 2 teams
*/

SELECT FIRSTNAME, LASTNAME, COUNT(*)
FROM PARTICIPANTPARAMEDIC JOIN PERSON ON (PERSONID = PARAMEDICID)
GROUP BY PARAMEDICID, FIRSTNAME, LASTNAME
HAVING COUNT(*) > 30;


/*
   It is now the end of the year, so we need to add
   1 year of experience to every paramedic
*/

UPDATE PARAMEDIC
SET YEARSOFEXPERIENCE = YEARSOFEXPERIENCE + 1;

/*
   Because of a new law, people which are older than
   75 years can't be drive ambulance,
   so delete all of them.
*/

DELETE FROM DRIVER
WHERE DRIVERID IN (
    SELECT DRIVERID
    FROM DRIVER JOIN PERSON ON (DRIVERID = PERSONID)
    WHERE BIRTHDATE < TO_DATE('01/01/1946', 'dd-mm-yyyy')
    );