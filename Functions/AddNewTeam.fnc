create or replace noneditionable function AddNewTeam(driver_id in integer, ambulance_id in integer)
 return team.teamId%type 
is 
  Not_found_driver_exception EXCEPTION;
  PRAGMA 
  EXCEPTION_INIT (Not_found_driver_exception, -2000);
  Not_found_ambulance_exception EXCEPTION;
  PRAGMA 
  EXCEPTION_INIT (Not_found_ambulance_exception, -3000);
  found_driver number:= 0;
  found_ambulance number:= 0;
  team_id team.teamId%type;
begin
  
  select COUNT(*) into found_driver from driver where driverId = driver_id;
  if found_driver = 0 then
    raise Not_found_driver_exception;
  end if;
  select COUNT(*) into found_ambulance from item where itemId = ambulance_id and LOWER(itemName) = 'ambulance';
  if found_ambulance = 0 then
    raise Not_found_ambulance_exception;
  end if;
      
  select MAX(teamId) + 1 into team_id from team ;
  insert into team (teamId,driverid,ambulanceId)
  values(team_id, driver_id, ambulance_id);
  commit;
  dbms_output.put_line ('added successfully team ' || to_char(team_id));
  return (team_id);
  exception
    when Not_found_driver_exception then
      dbms_output.put_line ('driver not found');
        return -1;
    when Not_found_ambulance_exception then
      dbms_output.put_line ('ambulance not found');
       return -1;
end;
/
