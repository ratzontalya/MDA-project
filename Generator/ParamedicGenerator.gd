
[General]
Version=1

[Preferences]
Username=
Password=2299
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PARAMEDIC
Count=100

[Record]
Name=YEARSOFEXPERIENCE
Type=NUMBER
Size=
Data=Random(0, 50)
Master=

[Record]
Name=PARAMEDICID
Type=NUMBER
Size=
Data=List(select PersonId from Person)
Master=

