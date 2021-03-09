/* SELECT */

/*
    All the ambulances that each of the drivers 
    who are also volunteers have driven in the last year
*/


/*
    All dispatchers whose number of calls received
    in the past year is at least 100
*/


/*
    All calls that sent to them at least one paramedic
    with more than 10 years of experience
*/


/*
    All ambulances sent by a dispatcher
    that is also a paramedic with at least 20 years of experience
*/


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