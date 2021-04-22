ALTER TABLE PERSON
      ADD CONSTRAINT check_phone_number
      CHECK (phone LIKE '0%');
ALTER TABLE PERSON
      ADD CONSTRAINT check_birthdate
      CHECK (75 > DATEDIFF(hour,BirthDate,GETDATE())/8766) ;
ALTER TABLE PARAMEDIC
      ADD CONSTRAINT check_experience
      CHECK (experience > 1);
      
/**************/
/*
delete email address from donor
delete amount from item
delete orderitem table

add email address, phone and birthdate to person
add to item the attribute orderId with foreign key to order

move ambulance table to item

add to item warehouseId
add table - ItemType, with itemName as id
add constraint to item -  foreign key to ItemType(itemName)
*/


