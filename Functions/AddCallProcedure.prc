create or replace procedure AddCall(dispatcher_id in integer) 
is
  Not_found_dispatcher_exception EXCEPTION;
  PRAGMA 
  EXCEPTION_INIT (Not_found_dispatcher_exception, -1000);
  found_dispatcher number:= 0;
  call_id integer := 1;
begin
  select COUNT(*) into found_dispatcher from dispatcher where dispatcherId = dispatcher_id;
  if found_dispatcher = 0 then
    raise Not_found_dispatcher_exception;
  else
    select MAX(callId) + 1 into call_id from callhelp ;
    insert into callhelp (callId,callDate,dispatcherid,status)
    values(call_id, SYSDATE,dispatcher_id, 'RECIEVED');
    dbms_output.put_line ('added successfully');
  end if;
  exception
    when Not_found_dispatcher_exception then
      dbms_output.put_line ('dispatcher not found');
end;
/
