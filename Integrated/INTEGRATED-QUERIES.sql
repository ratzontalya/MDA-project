/*
    1
    All the ambulances that each of the drivers 
    are also volunteers have driven in the last year
*/

SELECT *
FROM ITEM
WHERE LOWER(itemName) = 'ambulance' AND itemId NOT IN (SELECT AmbulanceId
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
GOOD
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

SELECT people,drivers/people*100,paramedics/people*100,dispatchers/people*100,volunteers/people*100, 
       storekeepers/people*100, donors/people*100
FROM (SELECT COUNT(DISTINCT DriverId) AS drivers
     FROM DRIVER), 
     (SELECT COUNT(DISTINCT ParamedicId) AS paramedics
     FROM PARAMEDIC),
     (SELECT COUNT(DISTINCT DispatcherId) AS dispatchers
     FROM DISPATCHER),
     (SELECT COUNT(DISTINCT VolunteerId) AS volunteers
     FROM VOLUNTEER),
     (SELECT COUNT(DISTINCT storekeeperid) AS storekeepers
     FROM storekeeper),
     (SELECT COUNT(DISTINCT donorid) AS donors
     FROM donor),
     (SELECT COUNT(DISTINCT PersonId) AS people
     FROM PERSON);
/*

/* UPDATE */

/*
GOOD
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
 

/*******TAL & AVITAL*********/

--select:

--query 1
select ITEMID, ITEMNAME 
from donateitem NATURAL JOIN item;
--query 2
select A.donor_id , A.amount
from (select donorid as donor_id, count(*) as amount 
      from donor natural join donation
       group by DONORID) A 
order by A.amount;
     
--query 3
select A.warehouseid
from (select warehouseid, count(*) as amount 
      from item natural join ordering natural join storekeeper
      group by warehouseid) A 
      where A.AMOUNT >= All (select count(*) as amount 
                             from item natural join ordering natural join storekeeper 
                             group by warehouseid);
--query 4
select itemid, ITEMNAME 
from item natural join ordering
group by ORDERDATE, ORDERID, Itemid, ITEMNAME 
HAVING count(*) >= 1;

--query 5 GOOD
select DONORID 
from donor natural join donation
group by DONORID
having max(DONATIONDATE) < (sysdate - 30) 
order by DONORID;

--query 6
select ITEMID as item_id 
from item 
where orderid IS NULL
minus 
select ITEMID as item_id 
from donateitem;

--query 7
select S.STOREKEEPERID, P.FIRSTNAME, P.LASTNAME 
from storekeeper S join person P on S.STOREKEEPERID = P.PERSONID 
where S.WAREHOUSEID IN (select W.WAREHOUSEID 
                       from warehouse W 
                       where W.STOREKEEPERSCAPACITY > 10);
                       select * from warehouse;
--query 8
select DONORID, FIRSTNAME, LASTNAME 
from donor natural join donation join person P on DONORID = P.PERSONID 
where DONATIONDATE = (sysdate - 10);


--update:

--query 1
update warehouse W 
set W.itemsCapacity = W.itemsCapacity * 2, W.storekeeperscapacity = W.storekeeperscapacity + 2 
where W.ADDRESS = '838 Dennis';


--query 2 GOOD
update ordering O 
set O.Shippingprice = 0 
where O.ORDERID IN (select orderid 
                   from ordering natural join Item
                   group by orderid 
                   having sum(PRICE) >= 200);


--delete:

--query 1
delete storekeeper 
where EXPERIENCE > 30 and STOREKEEPERID IN (select STOREKEEPERID 
                                               from storekeeper natural join ordering 
                                               group by STOREKEEPERID 
                                               having count (*) >= 10);
--query 2
delete donateitem
where DONATIONID IN (select donationid 
               from donation 
               where DONATIONSTATUS = 'Canceled' and DONATIONDATE <= (sysdate-730));
