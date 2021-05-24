--for checking the triggers
create table itemValue(
itemId int not null,
currentPrice int not null,
purchaseDate date,
FOREIGN KEY (itemId) REFERENCES item(itemId) ON DELETE CASCADE
);
--prepare
update item set recievedDate = null; 
delete from orderitem where orderid = 3 and itemid = 1;
update ordering set orderStatus = 'in way' where orderid = 5;
--check output
insert into orderitem(itemid, orderid)
values(1,3);
--check recievedDate
update ordering set orderStatus = 'recieved' where orderid = 5;
select * from item;
