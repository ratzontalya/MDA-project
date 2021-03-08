CREATE TABLE Person
(
  PersonId INT NOT NULL,
  FirstName VARCHAR2(20) NOT NULL,
  LastName VARCHAR2(20) NOT NULL,
  Phone VARCHAR2(20) NOT NULL,
  Mail VARCHAR2(20) NOT NULL,
  Address VARCHAR2(20) NOT NULL,
  BirthDate DATE NOT NULL,
  PRIMARY KEY (PersonId)
);

CREATE TABLE Volunteer
(
  VolunteerId INT NOT NULL,
  PRIMARY KEY (VolunteerId)
);

CREATE TABLE Driver
(
  DriverId INT NOT NULL,
  PRIMARY KEY (DriverId)
);

CREATE TABLE Paramedic
(
  YearsOfExperience INT NOT NULL,
  ParamedicId INT NOT NULL,
  PRIMARY KEY (ParamedicId)
);

CREATE TABLE Dispatcher
(
  DispatcherId INT NOT NULL,
  PRIMARY KEY (DispatcherId)
);

CREATE TABLE CallHelp
(
  CallId INT NOT NULL,
  CallDate DATE NOT NULL,
  DispatcherId INT NOT NULL,
  PRIMARY KEY (CallId),
  FOREIGN KEY (DispatcherId) REFERENCES Dispatcher(DispatcherId)
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
  FOREIGN KEY (DriverId) REFERENCES Driver(DriverId),
  FOREIGN KEY (AmbulanceId) REFERENCES Ambulance(AmbulanceId)
);

CREATE TABLE Send
(
  CallId INT NOT NULL,
  TeamId INT NOT NULL,
  PRIMARY KEY (CallId, TeamId),
  FOREIGN KEY (CallId) REFERENCES CallHelp(CallId),
  FOREIGN KEY (TeamId) REFERENCES Team(TeamId)
);

CREATE TABLE ParticipantVolunteer
(
  TeamId INT NOT NULL,
  VolunteerId INT NOT NULL,
  PRIMARY KEY (TeamId, VolunteerId),
  FOREIGN KEY (TeamId) REFERENCES Team(TeamId),
  FOREIGN KEY (VolunteerId) REFERENCES Volunteer(VolunteerId)
);

CREATE TABLE ParticipantParamedic
(
  TeamId INT NOT NULL,
  ParamedicId INT NOT NULL,
  PRIMARY KEY (TeamId, ParamedicId),
  FOREIGN KEY (TeamId) REFERENCES Team(TeamId),
  FOREIGN KEY (ParamedicId) REFERENCES Paramedic(ParamedicId)
);