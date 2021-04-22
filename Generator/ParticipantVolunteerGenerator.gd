
[General]
Version=1

[Preferences]
Username=
Password=2265
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PARTICIPANTVOLUNTEER
Count=1000

[Record]
Name=TEAMID
Type=NUMBER
Size=
Data=List(select TeamId from Team)
Master=

[Record]
Name=VOLUNTEERID
Type=NUMBER
Size=
Data=List(select VolunteerId from Volunteer)
Master=

