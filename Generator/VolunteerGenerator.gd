
[General]
Version=1

[Preferences]
Username=
Password=2291
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=VOLUNTEER
Count=100

[Record]
Name=VOLUNTEERID
Type=NUMBER
Size=
Data=List(select PersonId from Person)
Master=

