--query 1
select O.ORDERID , O.SHIPPINGPRICE
from ordering O
where O.ORDERID IN (select orderid 
                   from ordering natural join Item
                   group by orderid 
                   having sum(PRICE) >= &<name=price_of_order hint="needs to be higher than 200" type="integer" default = 200>);
--query 2                   
select DONORID 
from donor natural join donation
group by DONORID
having max(DONATIONDATE) < &<name=till_this_date 
hint="choose a date to return the donors that donated a month before it - dd-MON-yyyy" type=date default = sysdate required = true> 
order by DONORID;
--query 3
SELECT PARAMEDICID
FROM PARTICIPANTPARAMEDIC JOIN PERSON ON (PERSONID = PARAMEDICID)
GROUP BY PARAMEDICID, FIRSTNAME, LASTNAME
HAVING COUNT(*) > &<name="num_of_events" hint="put integer for the number of calls the excellent paramedic needs to participate in" 
type="integer" default=30>
UNION
SELECT PARAMEDICID
FROM SENDTEAM NATURAL JOIN PARTICIPANTPARAMEDIC JOIN PERSON ON (PERSONID = PARAMEDICID)
WHERE CallId IN (&<name="Call_id" list="SELECT CallId,CallDate FROM CALLHELP NATURAL JOIN SENDTEAM GROUP BY CALLID,CALLDATE" 
hint="select the date of calls the excellent paramedic needs to be in" description="yes" multiselect="yes" type="date" required=true>);
--query 4            
SELECT ParamedicId
FROM ParticipantParamedic NATURAL JOIN SENDTEAM NATURAL JOIN CALLHELP
WHERE CallDate > &<name="call_date" type = date hint="enter a date" required = true >
GROUP BY ParamedicId
HAVING COUNT(DISTINCT(CallId)) > &<name="call_sum" type="integer" hint="enter number of calls the paramedic needs to pass">
&<name="order_by_parameter" list="paramedicid" prefix=" order by ">;
