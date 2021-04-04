/*
    1
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
    2
    All dispatchers whose number of calls received
    is at least 10
*/

SELECT *
FROM DISPATCHER
WHERE DispatcherId IN (SELECT DispatcherId 
                      FROM CALLHELP
                      GROUP BY DispatcherId
                      HAVING COUNT(DISTINCT CallId) > 10
                      )
ORDER BY DispatcherId;

  
/*
    3
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

/*
    4
    dispatcherFullName, num of calls, average of teams sent for every call.
*/
SELECT FirstName, LastName, SUM_UP, AVERAGE
FROM (SELECT DispatcherId,COUNT(DISTINCT(CallId)) AS SUM_UP,
      COUNT(CallId)/COUNT(DISTINCT(CallId)) AS AVERAGE
      FROM SENDTEAM NATURAL JOIN CALLHELP 
      GROUP BY DispatcherId
      ORDER BY DispatcherId) JOIN PERSON ON (PersonId=DispatcherId)

                                       

/*
	5
    Give me all the teams with the number of 
    the paramedics and volunteers
	that participated in it.
    TeamId, numVolunteers, numParamedics
*/

SELECT CallId, COUNT(DISTINCT(TeamId)), COUNT(DISTINCT(PARAMEDICID)), COUNT(DISTINCT(VOLUNTEERID))
FROM CALLHELP 
NATURAL JOIN SENDTEAM 
NATURAL JOIN PARTICIPANTPARAMEDIC 
NATURAL JOIN PARTICIPANTVOLUNTEER
GROUP BY CallId;

	5
    Give me all the ambulances, times of use, first use date, last use date, that where used for 
    more than 5 times, and if the first use was after 1.1.1970
*/

SELECT AmbulanceId,counter,FirstUse,LatestUse
FROM (SELECT AmbulanceId,COUNT(*) AS counter, MIN(CallDate) AS FirstUse, MAX(CallDate) AS LatestUse
      FROM TEAM NATURAL JOIN SENDTEAM NATURAL JOIN CALLHELP
      GROUP BY AmbulanceId
      HAVING COUNT(*) > 5
      ORDER BY AmbulanceId) 
WHERE FirstUse > '01-JAN-1970'
/*
	6
    I want the EXCELLENT paramedic which participated
    in more than 30 calls or
    participated in "big events" which needed more 
    than 5 teams
*/

SELECT FIRSTNAME, LASTNAME
FROM PARTICIPANTPARAMEDIC JOIN PERSON ON (PERSONID = PARAMEDICID)
GROUP BY PARAMEDICID, FIRSTNAME, LASTNAME
HAVING COUNT(*) > 30
UNION
SELECT FIRSTNAME, LASTNAME
FROM SENDTEAM NATURAL JOIN PARTICIPANTPARAMEDIC JOIN PERSON ON (PERSONID = PARAMEDICID)
WHERE CallId IN (SELECT CallId
                 FROM CALLHELP NATURAL JOIN SENDTEAM
                 GROUP BY CALLID
                 HAVING COUNT(TeamId) > 5);


/*
   7
   Return all the paramedics' id which participated in more than 5 calls.
*/
SELECT ParamedicId
FROM ParticipantParamedic NATURAL JOIN SENDTEAM NATURAL JOIN CALLHELP
WHERE CallDate > '01-JAN-2000'
GROUP BY ParamedicId
HAVING COUNT(DISTINCT(CallId)) > 5
ORDER BY ParamedicId;

/*
	8
    Give me all the calls with the number of 
    the paramedics and volunteers
	that participated in this event.
    CallId, numVolunteers, numParamedics
*/

SELECT people,drivers/people*100,paramedics/people*100,dispatchers/people*100,volunteers/people*100
FROM (SELECT COUNT(DISTINCT DriverId) AS drivers
     FROM DRIVER), 
     (SELECT COUNT(DISTINCT ParamedicId) AS paramedics
     FROM PARAMEDIC),
     (SELECT COUNT(DISTINCT DispatcherId) AS dispatchers
     FROM DISPATCHER),
     (SELECT COUNT(DISTINCT VolunteerId) AS volunteers
     FROM VOLUNTEER),
     (SELECT COUNT(DISTINCT PersonId) AS people
     FROM PERSON)
/*

/* UPDATE */

/*
    Update the max YEARSOFEXPERIENCE to be 40:
    If there is paramedic with YEARSOFEXPERIENCE grather than 40 - 
    update it to be 40
*/
UPDATE PARAMEDIC
SET YearsOfExperience = 40
WHERE YearsOfExperience > 40;

/*
   When 235298895 was in vacation, 190928615 replaced him and worked with his computer.
   Update the database.
*/

UPDATE CALLHELP
SET DispatcherId = 190928615
WHERE DispatcherId = 235298895;

/* DELETE */

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
    
/*
     Delete the oldest dispatcher
*/
DELETE FROM DISPATCHER
WHERE DispatcherId IN (SELECT DispatcherId
                       FROM DISPATCHER JOIN PERSON ON (DispatcherId = PersonId) 
                       WHERE BirthDate IN (SELECT MIN(BirthDate)
                                           FROM DISPATCHER JOIN PERSON ON PersonId = DispatcherId));
    