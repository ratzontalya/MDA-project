
[General]
Version=1

[Preferences]
Username=
Password=2130
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=SENDTEAM
Count=1000

[Record]
Name=CALLID
Type=NUMBER
Size=
Data=List(select CallId from CallHelp)
Master=

[Record]
Name=TEAMID
Type=NUMBER
Size=
Data=List(select TeamId from Team)
Master=

