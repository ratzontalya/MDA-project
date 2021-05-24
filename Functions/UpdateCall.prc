create or replace noneditionable procedure UpdateCall(call_id in integer, teams_id in varchar)
is
  Not_found_team_exception EXCEPTION;
  Not_found_call_exception EXCEPTION;
  connection_already_exist_exception EXCEPTION;
  found_team boolean:= false;
  found_call number:= 0;
  found_connection number:= 0;
  CURSOR teamsCursor is select * from team
  where teamId in (
  select regexp_substr(teams_id,'[^,]+', 1, level) from dual
  connect by regexp_substr(teams_id, '[^,]+', 1, level) is not null );
  team_id teamsCursor%rowtype;
begin
  select COUNT(*) into found_call from callhelp where callid = call_id;
  if found_call = 0 then
    raise Not_found_call_exception;
  end if;
  for team_id in teamsCursor loop
    found_team := true;
    select COUNT(*) into found_connection from sendteam where teamid = team_id.teamId and callid = call_id;
    if found_connection != 0 then
       raise connection_already_exist_exception;
     end if;
    insert into sendteam (callId,teamId)
    values(call_id, team_id.teamId);
    commit;
    dbms_output.put_line ('added successfully: call: ' || to_char(call_id) || ' team: ' || to_char(team_id.teamId));
  end loop;
  if not found_team then
    raise Not_found_team_exception;
  else
    update callhelp set status = 'IN_OPERATION' where callid = call_id;
    dbms_output.put_line ('updated successfully');
  end if;
  exception
    when Not_found_team_exception then
      dbms_output.put_line ('team not found');
    when Not_found_call_exception then
      dbms_output.put_line ('call not found');
    when connection_already_exist_exception then
      dbms_output.put_line ('this connection already exist');
end;
/
