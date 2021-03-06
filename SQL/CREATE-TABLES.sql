CREATE TABLE Person
(
  PersonId INT NOT NULL,
  FirstName VARCHAR2(100) NOT NULL,
  LastName VARCHAR2(100) NOT NULL,
  Phone VARCHAR2(100) NOT NULL,
  Mail VARCHAR2(100) NOT NULL,
  Address VARCHAR2(100) NOT NULL,
  BirthDate DATE NOT NULL,
  PRIMARY KEY (PersonId)
);

CREATE TABLE Volunteer
(
  VolunteerId INT NOT NULL,
  PRIMARY KEY (VolunteerId),
  FOREIGN KEY (VolunteerId) REFERENCES Person(PersonId) ON DELETE CASCADE
);

CREATE TABLE Driver
(
  DriverId INT NOT NULL,
  PRIMARY KEY (DriverId),
  FOREIGN KEY (DriverId) REFERENCES Person(PersonId) ON DELETE CASCADE
);

CREATE TABLE Paramedic
(
  YearsOfExperience INT NOT NULL,
  ParamedicId INT NOT NULL,
  PRIMARY KEY (ParamedicId),
  FOREIGN KEY (ParamedicId) REFERENCES Person(PersonId) ON DELETE CASCADE

);

CREATE TABLE Dispatcher
(
  DispatcherId INT NOT NULL,
  PRIMARY KEY (DispatcherId),
  FOREIGN KEY (DispatcherId) REFERENCES Person(PersonId) ON DELETE CASCADE
);

CREATE TABLE CallHelp
(
  CallId INT NOT NULL,
  CallDate DATE NOT NULL,
  DispatcherId INT NOT NULL,
  PRIMARY KEY (CallId),
  FOREIGN KEY (DispatcherId) REFERENCES Dispatcher(DispatcherId)ON DELETE CASCADE
);

CREATE TABLE Ambulance
(
  AmbulanceId INT NOT NULL,
  PRIMARY KEY (AmbulanceId)
);

CREATE TABLE Team
(
  TeamId INT NOT NULL,
  DriverId INT NOT NULL,
  AmbulanceId INT NOT NULL,
  PRIMARY KEY (TeamId),
  FOREIGN KEY (DriverId) REFERENCES Driver(DriverId) ON DELETE CASCADE,
  FOREIGN KEY (AmbulanceId) REFERENCES Ambulance(AmbulanceId) ON DELETE CASCADE
);

CREATE TABLE SendTeam
(
  CallId INT NOT NULL,
  TeamId INT NOT NULL,
  PRIMARY KEY (CallId, TeamId),
  FOREIGN KEY (CallId) REFERENCES CallHelp(CallId) ON DELETE CASCADE,
  FOREIGN KEY (TeamId) REFERENCES Team(TeamId) ON DELETE CASCADE
);

CREATE TABLE ParticipantVolunteer
(
  TeamId INT NOT NULL,
  VolunteerId INT NOT NULL,
  PRIMARY KEY (TeamId, VolunteerId),
  FOREIGN KEY (TeamId) REFERENCES Team(TeamId) ON DELETE CASCADE,
  FOREIGN KEY (VolunteerId) REFERENCES Volunteer(VolunteerId) ON DELETE CASCADE
);

CREATE TABLE ParticipantParamedic
(
  TeamId INT NOT NULL,
  ParamedicId INT NOT NULL,
  PRIMARY KEY (TeamId, ParamedicId),
  FOREIGN KEY (TeamId) REFERENCES Team(TeamId) ON DELETE CASCADE,
  FOREIGN KEY (ParamedicId) REFERENCES Paramedic(ParamedicId) ON DELETE CASCADE
);
