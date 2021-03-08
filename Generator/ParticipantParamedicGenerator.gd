
[General]
Version=1

[Preferences]
Username=
Password=2544
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PARTICIPANTPARAMEDIC
Count=3000

[Record]
Name=TEAMID
Type=NUMBER
Size=
Data=List(select TeamId from Team)
Master=

[Record]
Name=PARAMEDICID
Type=NUMBER
Size=
Data=List(select paramedicId from paramedic)
Master=

