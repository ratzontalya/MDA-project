
[General]
Version=1

[Preferences]
Username=
Password=2393
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=TEAM
Count=2000

[Record]
Name=TEAMID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=DRIVERID
Type=NUMBER
Size=
Data=List(select DriverId from Driver)
Master=

[Record]
Name=AMBULANCEID
Type=NUMBER
Size=
Data=List(select AmbulanceId from Ambulance)
Master=

