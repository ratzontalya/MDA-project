create or replace trigger updateItemRecievedDate
  after update
  on ordering 
  for each row
declare
  -- local variables here
begin
  if lower(:new.orderstatus) = 'recieved' and lower(:old.orderstatus) != 'recieved' then
    update item 
    set recievedDate = sysdate 
    where itemid in (select itemid from orderitem where orderid = :new.orderid);
  end if;
end;
/
