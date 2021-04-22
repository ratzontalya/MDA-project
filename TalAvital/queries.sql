--select:

--query 1
select I.ITEMID, I.INAME 
from item I 
where I.itemid IN (select O.itid 
                  from orderItem O
                  where O.itid IN (select D.iid from donationItem D));
--query 2
select A.donor_id 
from (select D1.donorid as donor_id, count(*) as amount 
     	from donor D1 join donation D2 on D1.donorid = D2.DID 
    	 group by D1.DONORID) A 
     	order by A.amount;
     
--query 3
select A.WID 
from (select S.WID, count(*) as amount 
     	from ordering O join storekeeper S on O.WORKERID = S.STOREKEEPERID join orderItem OI on OI.ORID = O.ORDERID group by S.WID) A 
     	where A.AMOUNT >= All (select count(*) as amount 
                           			from ordering O join storekeeper S on O.WORKERID = S.STOREKEEPERID join orderItem OI on OI.ORID = O.ORDERID 
                           			group by S.WID);
--query 4
select I.itemid, I.INAME 
from item I join orderitem O1 on I.ITEMID = O1.ITID join ordering O2 on O1.ORID = O2.ORDERID 
group by O2.ORDERDATE, O1.ORID, I.Itemid, I.INAME 
HAVING count(*) > 1;

--query 5
select D1.DONORID 
from donor D1 join donation D2 on D1.DONORID = D2.DID 
group by D1.DONORID
having max(D2.DONATIONDATE) < (sysdate - 30) 
order by D1.DONORID;

--query 6
select ITEMID as item_id 
from item 
minus 
select IID as item_id 
from donationitem 
minus 
select ITID as item_id 
from orderitem O;

--query 7
select S.STOREKEEPERID, P.FIRSTNAME, P.LASTNAME 
from storekeeper S join person P on S.STOREKEEPERID = P.PERSONID 
where S.WID IN (select W.WAREHOUSEID 
               from warehouse W 
               where W.NUMOFWORKERS > 10);
--query 8
select D1.DONORID, P.FIRSTNAME, P.LASTNAME 
from donor D1 join donation D2 on D1.DONORID = D2.DID join person P on D1.DONORID = P.PERSONID 
where D2.DONATIONDATE = (sysdate - 365);


--update:

--query 1
update warehouse W 
set W.itemsCapacity = W.itemsCapacity * 2, W.numofworkers = W.numofworkers + 2 
where W.WADDRESS = '838 Dennis';

select * from warehouse;

--query 2
update ordering O 
set O.Shippingprice = 0 
where O.ORDERID IN (select O1.orderid 
                   from ordering O1 join orderItem O2 on O1.ORDERID = O2.ORID join item I on I.ITEMID = O2.ITID 
                   group by O1.orderid 
                   having sum(I.PRICE) >= 200);


--delete:

--query 1
delete storekeeper S 
where S.EXPERIENCE > 30 and S.STOREKEEPERID IN (select S.STOREKEEPERID 
                                               from storekeeper S join ordering O on S.STOREKEEPERID = O.WORKERID 
                                               group by S.STOREKEEPERID 
                                               having count (*) >= 10);
--query 2
delete donationitem D 
where D.DID IN (select donationid 
               from donation 
               where DONATIONSTATUS = 'Canceled' and DONATIONDATE <= (sysdate-730));
delete donation D 
where D.DONATIONSTATUS = 'Canceled' and D.DONATIONDATE <= (sysdate-730);

SELECT EXTRACT(MONTH FROM donationDate) as itsmonth, count(*) as amount
from donation D
group by EXTRACT(MONTH FROM donationDate)
having count(*) >= ALL (
                   SELECT count(*) as amount
                   from donation D
                   group by EXTRACT(MONTH FROM donationDate));
