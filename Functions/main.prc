create or replace procedure main 
is
teams varchar(20);
team_id team.teamid%type;
num_calls integer;
dispatcher_id integer := 115714750;
call_id integer;
begin
  -- Add new call
  AddCall(dispatcher_id);
  -- Add new teams that go to help for the new call
  select MAX(callid) into call_id from callhelp;
  team_id := AddNewTeam(150507078,5);
  teams := to_char(team_id) || ',';
  team_id := AddNewTeam(101584298,14);
  teams := teams || to_char(team_id);
  dbms_output.put_line(teams);
  -- Connect between the call and the teams, and update the call's status to 'IN_OPERATION'
  UpdateCall(call_id,teams);
  -- Get the num of calls between two dates
  num_calls := getNumOfCallls('01-may-00','01-may-20');
  dbms_output.put_line ('number of calls between the dates is: ' || to_char(num_calls));
end;
/
