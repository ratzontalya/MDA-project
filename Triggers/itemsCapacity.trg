create or replace trigger itemsCapacity
  before insert
  on orderitem 
  for each row
  
declare
  -- local variables here
  numOfItems integer := 0;
  maximumItems integer:= 0;
  emptySpace integer:= 0;
  warehouse_id integer := 0;
begin
  select warehouseid into warehouse_id from ordering natural join storekeeper where orderid = :new.orderid;
  select count(*) into numOfItems from item where warehouseid = warehouse_id;
  select itemsCapacity into maximumItems from warehouse where warehouseid = warehouse_id;
  emptySpace := maximumItems - numOfItems;
  if numOfItems >= maximumItems then
    dbms_output.put_line('Please change the location of the item to a different warehouse');
  else
    dbms_output.put_line('Number of items in the warehouse is: ' || to_char(numOfItems));
    dbms_output.put_line('Number of items the warehouse can still contain: ' || to_char(emptySpace));
  end if;
end;
/
