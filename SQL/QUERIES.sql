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
                      HAVING COUNT(DISTINCT CallId) > 10
                      )
ORDER BY DispatcherId;

  
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

/*
    dispatcherFullName, num of calls, average of teams sent for every call.
*/
SELECT FirstName, LastName, SUM_UP, AVERAGE
FROM (SELECT DispatcherId,COUNT(DISTINCT(CallId)) AS SUM_UP,
      COUNT(CallId)/COUNT(DISTINCT(CallId)) AS AVERAGE
      FROM SENDTEAM NATURAL JOIN CALLHELP 
      GROUP BY DispatcherId
      ORDER BY DispatcherId) JOIN PERSON ON (PersonId=DispatcherId)

/*
    Delete the oldest dispatcher
*/
DELETE FROM DISPATCHER
WHERE DispatcherId IN (SELECT DispatcherId
                       FROM DISPATCHER JOIN PERSON ON (DispatcherId = PersonId) 
                       WHERE BirthDate IN (SELECT MIN(BirthDate)
                                           FROM DISPATCHER JOIN PERSON ON PersonId = DispatcherId));
                                           
/*
    Update the max YEARSOFEXPERIENCE to be 40:
    If there is paramedic with YEARSOFEXPERIENCE grather than 40 - 
    update it to be 40
*/
UPDATE PARAMEDIC
SET YearsOfExperience = 40
WHERE YearsOfExperience > 40;

/*
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

/*
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
	Give me all the ambulances that where used for 
    more than 3 times in average.
*/

SELECT AmbulanceId,counter,FirstUse,LatestUse
FROM (SELECT AmbulanceId,COUNT(*) AS counter, MIN(CallDate) AS FirstUse, MAX(CallDate) AS LatestUse
      FROM TEAM NATURAL JOIN SENDTEAM NATURAL JOIN CALLHELP
      GROUP BY AmbulanceId
      HAVING COUNT(*) > 5
      ORDER BY AmbulanceId) 
WHERE FirstUse > '01-JAN-1970'
/*
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
   It is now the end of the year, so we need to add
   1 year of experience to every paramedic if he worked in this year atleast 3 times
*/
SELECT ParamedicId
FROM ParticipantParamedic NATURAL JOIN SENDTEAM NATURAL JOIN CALLHELP
WHERE CallDate > '01-JAN-2000'
GROUP BY ParamedicId
HAVING COUNT(DISTINCT(CallId)) > 5
ORDER BY ParamedicId;
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
   Because of a new law, people which are older than
   75 years can't be drive ambulance,
   so delete all of them.
*/

UPDATE CALLHELP
SET DispatcherId = 190928615
WHERE DispatcherId = 235298895;
