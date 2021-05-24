create or replace function getNumOfCallls
(beginDate in callhelp.calldate%type, endDate in callhelp.calldate%type) return integer 
is
  FunctionResult integer:= 0;
  no_calls_exception exception;
begin
  select count(*) into FunctionResult
  from callhelp
  where calldate >= beginDate and calldate <= endDate;
  if FunctionResult = 0 then 
    raise no_calls_exception;
  end if;
  return(FunctionResult);
  exception
    when no_calls_exception then
      raise_application_error(-20001, 'There are no calls between this dates');
end;
/
