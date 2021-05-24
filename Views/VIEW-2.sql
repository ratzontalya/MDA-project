/*
VIEW 1
This view is showing for every item where he came from - from order, donation or unknown.
if from donation - the id of donor.
if from order - the id of storekeeper
warehouseid where the item is.    
*/
CREATE VIEW ITEMS
AS 
SELECT  ITEMID,ORDERID, 'FALSE' AS DONATED, WAREHOUSEID, STOREKEEPERID AS StorekeeperOrDonor
FROM ITEM
NATURAL JOIN ORDERING
NATURAL JOIN WAREHOUSE
NATURAL JOIN STOREKEEPER
UNION
SELECT ITEMID,DONATIONID, 'TRUE' AS DONATED, NULL, DONORID
FROM ITEM
NATURAL JOIN DONATEITEM
NATURAL JOIN DONATION
UNION
SELECT ITEMID, NULL, 'UNKNOWN', NULL,NULL
FROM ITEM
WHERE ORDERID IS NULL AND ITEMID NOT IN (SELECT ITEMID FROM DONATEITEM);

/*SELECT*/
SELECT * FROM ITEMS;

/*
1
Return how many items are donated, how many where ordered and how many UNKNOWN
*/
SELECT DONATED, COUNT(*) AS NUM_ITEMS
FROM ITEMS
GROUP BY DONATED;
/*
2
Return the id of the people whick ordered an item or donated an item atleast two times.
*/
SELECT StorekeeperOrDonor
FROM ITEMS
WHERE StorekeeperOrDonor IS NOT NULL
GROUP BY StorekeeperOrDonor
HAVING COUNT(*) > 1;   

/*
UPDATE
מפני שזו עמודה חדשה ולכן הוא לא יודע מה לעדכן.
*/
UPDATE ITEMS
SET DONATED = 'NO KNOWLEFGE'
WHERE DONATED = 'UNKNOWN';
/*
DELETE
מפני שיש חיבור של כמה טבלאות אז הוא לא יודע מה למחוק
*/ 
 DELETE FROM ITEMS WHERE ITEMID =  2;                    
/*DROP*/
DROP VIEW ITEMS;

