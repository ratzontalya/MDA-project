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

/*
	Give me all the ambulances that where used for 
    more than 50 times.
*/

/*
	I want the EXCELLENT paramedic which participated
    in more than 20 calls or
    participated in "big events" which needed more 
    than 2 teams
*/

/* UPDATE */
/*
   It is now the end of the year, so we need to add
   1 year of experience to every paramedic
*/
/* DELETE */
/*
   Because of a new law, people which are older than
   75 years can't be drive ambulance,
   so delete all of them.
*/
