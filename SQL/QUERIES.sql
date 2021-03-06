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
    is at least 2
*/

SELECT *
FROM DISPATCHER
WHERE DispatcherId IN (SELECT DispatcherId 
                      FROM CALLHELP
                      GROUP BY DispatcherId
                      HAVING COUNT(DISTINCT CallId) > 1
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
      ORDER BY DispatcherId) JOIN PERSON ON (PersonId=DispatcherId);

                                       

/*
	5
    Give me all the teams with the number of 
    the paramedics and volunteers
	that participated in it.
    TeamId, numVolunteers, numParamedics
*/

SELECT CallId, COUNT(DISTINCT(TeamId)) AS TEAMS, COUNT(DISTINCT(PARAMEDICID)), COUNT(DISTINCT(VOLUNTEERID))
FROM CALLHELP 
NATURAL JOIN SENDTEAM 
NATURAL JOIN PARTICIPANTPARAMEDIC 
NATURAL JOIN PARTICIPANTVOLUNTEER
GROUP BY CallId;
/*
	6
    Give me all the ambulances, times of use, first use date, last use date, that where used for 
    more than 5 times, and if the first use was after 1.1.1970
*/

SELECT AmbulanceId,counter,FirstUse,LatestUse
FROM (SELECT AmbulanceId,COUNT(*) AS counter, MIN(CallDate) AS FirstUse, MAX(CallDate) AS LatestUse
      FROM TEAM NATURAL JOIN SENDTEAM NATURAL JOIN CALLHELP
      GROUP BY AmbulanceId
      HAVING COUNT(*) > 5
      ORDER BY AmbulanceId) 
WHERE FirstUse > '01-JAN-1970';

/*
   7
   Return all the paramedics' id which participated in more than 5 calls in the last 21 years.
*/
SELECT ParamedicId
FROM ParticipantParamedic NATURAL JOIN SENDTEAM NATURAL JOIN CALLHELP
WHERE CallDate > '01-JAN-2000'
GROUP BY ParamedicId
HAVING COUNT(DISTINCT(CallId)) > 5
ORDER BY ParamedicId;
/*

	8
    Give me the precent of volunteers, drivers, paramedics and dispatchers from all the people
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
     FROM PERSON);
/*

/* UPDATE */

/*
    Update the YEARSOFEXPERIENCE of excellent paramedics by adding 2 years
*/
UPDATE PARAMEDIC
SET YearsOfExperience = YearsOfExperience + 2
WHERE PARAMEDICID IN (SELECT PARAMEDICID
                      FROM PARTICIPANTPARAMEDIC JOIN PERSON ON (PERSONID = PARAMEDICID)
                      GROUP BY PARAMEDICID, FIRSTNAME, LASTNAME
                      HAVING COUNT(*) > 30
                      UNION
                      SELECT PARAMEDICID
                      FROM SENDTEAM NATURAL JOIN PARTICIPANTPARAMEDIC JOIN PERSON ON (PERSONID = PARAMEDICID)
                      WHERE CallId IN (SELECT CallId
                                       FROM CALLHELP NATURAL JOIN SENDTEAM
                                       GROUP BY CALLID
                                       HAVING COUNT(TeamId) > 5));

/*
   When 235298895  was in vacation, 190928615 replaced him and worked with his computer.
   Update the database.
*/

UPDATE CALLHELP
SET DispatcherId = 580488974
WHERE DispatcherId = 961635098;

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
    WHERE BIRTHDATE < '01-JAN-1960'
    );
    
/*
     Delete the oldest dispatcher
*/
DELETE FROM DISPATCHER
WHERE DispatcherId IN (SELECT DispatcherId
                       FROM DISPATCHER JOIN PERSON ON (DispatcherId = PersonId) 
                       WHERE BirthDate IN (SELECT MIN(BirthDate)
                                           FROM DISPATCHER JOIN PERSON ON PersonId = DispatcherId));
 
/* We did it infront of Hadar*/   
SELECT EXTRACT(month FROM callDate), count(*)
FROM CALLHELP
WHERE CallId IN (SELECT CallId
                 FROM CALLHELP 
                 NATURAL JOIN SENDTEAM
                 NATURAL JOIN PARTICIPANTPARAMEDIC
                 NATURAL JOIN PARAMEDIC 
                 WHERE YearsOfExperience > 10)
GROUP BY EXTRACT(month FROM callDate);

/*******************NOT NEEDED******************/

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

