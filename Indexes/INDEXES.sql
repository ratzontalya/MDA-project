create index INDEX_CALLDATE on CALLHELP (CALLDATE,DISPATCHERID);
create index INDEX_BIRTHDATE on PERSON (birthdate,lastname,firstname);
create index INDEX_DRIVERID on TEAM (driverid,ambulanceid);

drop index INDEX_CALLDATE;
drop index INDEX_BIRTHDATE;
drop index INDEX_DRIVERID;
