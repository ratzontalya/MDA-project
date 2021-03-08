
[General]
Version=1

[Preferences]
Username=
Password=2494
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=CALLHELP
Count=1000

[Record]
Name=CALLID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=CALLDATE
Type=DATE
Size=
Data=Random('01/01/1948', '01/01/2020')
Master=

[Record]
Name=DISPATCHERID
Type=NUMBER
Size=
Data=List(select DispatcherId from Dispatcher)
Master=

