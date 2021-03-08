
[General]
Version=1

[Preferences]
Username=
Password=2404
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PERSON
Count=1000

[Record]
Name=PERSONID
Type=NUMBER
Size=
Data=Random(100000000, 999999999)
Master=

[Record]
Name=FIRSTNAME
Type=VARCHAR2
Size=20
Data=FirstName
Master=

[Record]
Name=LASTNAME
Type=VARCHAR2
Size=20
Data=LastName
Master=

[Record]
Name=PHONE
Type=VARCHAR2
Size=20
Data='05' + Random(20000000, 99999999)
Master=

[Record]
Name=MAIL
Type=VARCHAR2
Size=20
Data=Email
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=20
Data=Address1 + City
Master=

[Record]
Name=BIRTHDATE
Type=DATE
Size=
Data=Random('01/01/1948', '01/01/2005')
Master=

