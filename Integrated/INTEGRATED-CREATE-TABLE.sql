CREATE TABLE Person
(
  lastName VARCHAR2(20) NOT NULL,
  firstName VARCHAR2(20) NOT NULL,
  personid INT NOT NULL,
  address VARCHAR2(100) NOT NULL,
  phone VARCHAR2(10) NOT NULL,
  mail VARCHAR2(100) NULL,
  birthDate DATE NULL,
  PRIMARY KEY (personid)
);

CREATE TABLE Donor
(
  donorId INT NOT NULL,
  PRIMARY KEY (donorId)
);

CREATE TABLE WareHouse
(
  wareHouseId INT NOT NULL,
  workersCapacity INT NOT NULL,
  address VARCHAR2(100) NOT NULL,
  PRIMARY KEY (wareHouseId)
);

CREATE TABLE Donation
(
  donationDate DATE NOT NULL,
  orderStatus INT NOT NULL,
  donationId INT NOT NULL,
  donorId INT NOT NULL,
  PRIMARY KEY (donationId),
  FOREIGN KEY (donorId) REFERENCES Donor(donorId)
);

CREATE TABLE StoreKeeper
(
  experience INT NOT NULL,
  storeKeeperId INT NOT NULL,
  wareHouseId INT NOT NULL,
  PRIMARY KEY (storeKeeperId),
  FOREIGN KEY (wareHouseId) REFERENCES WareHouse(wareHouseId)
);

CREATE TABLE Ordering
(
  orderId INT NOT NULL,
  requestDate DATE NOT NULL,
  shipingPrice INT NOT NULL,
  orderStatus INT NOT NULL,
  receivedDate DATE NOT NULL,
  storeKeeperId INT NOT NULL,
  PRIMARY KEY (orderId),
  FOREIGN KEY (storeKeeperId) REFERENCES StoreKeeper(storeKeeperId)
);

CREATE TABLE Dispatcher
(
  dispatcherId INT NOT NULL,
  PRIMARY KEY (dispatcherId)
);

CREATE TABLE Volunteer
(
  volunteerId INT NOT NULL,
  PRIMARY KEY (volunteerId)
);

CREATE TABLE Driver
(
  driverId INT NOT NULL,
  PRIMARY KEY (driverId)
);

CREATE TABLE Paramedic
(
  paramedicId INT NOT NULL,
  PRIMARY KEY (paramedicId)
);

CREATE TABLE CallHelp
(
  dispatcherId INT NOT NULL,
  FOREIGN KEY (dispatcherId) REFERENCES Dispatcher(dispatcherId)
);

CREATE TABLE ItemType
(
  itemName INT NOT NULL,
  PRIMARY KEY (itemName)
);

CREATE TABLE Item
(
  itemId INT NOT NULL,
  price INT NOT NULL,
  companyName VARCHAR2(20) NOT NULL,
  warrantYears INT NOT NULL,
  orderId INT NOT NULL,
  wareHouseId INT NOT NULL,
  itemName VARCHAR2(20) NOT NULL,
  PRIMARY KEY (itemId),
  FOREIGN KEY (orderId) REFERENCES Ordering(orderId),
  FOREIGN KEY (wareHouseId) REFERENCES WareHouse(wareHouseId),
  FOREIGN KEY (itemName) REFERENCES ItemType(itemName)
);

CREATE TABLE Team
(
  teamId INT NOT NULL,
  ambulanceId INT NOT NULL,
  driverId INT NOT NULL,
  PRIMARY KEY (teamId),
  FOREIGN KEY (itemId) REFERENCES Item(itemId),
  FOREIGN KEY (driverId) REFERENCES Driver(driverId)
);

CREATE TABLE DonateItem
(
  donationId INT NOT NULL,
  itemId INT NOT NULL,
  PRIMARY KEY (itemId),
  FOREIGN KEY (donationId) REFERENCES donation(donationId),
  FOREIGN KEY (itemId) REFERENCES item(itemId)
);

CREATE TABLE ParticipantVolunteer
(
  volunteerId INT NOT NULL,
  teamId INT NOT NULL,
  PRIMARY KEY (volunteerId, teamId),
  FOREIGN KEY (volunteerId) REFERENCES Volunteer(volunteerId),
  FOREIGN KEY (teamId) REFERENCES Team(teamId)
);

CREATE TABLE ParticipantParamedic
(
  paramedicId INT NOT NULL,
  teamId INT NOT NULL,
  PRIMARY KEY (paramedicId, teamId),
  FOREIGN KEY (paramedicId) REFERENCES Paramedic(paramedicId),
  FOREIGN KEY (teamId) REFERENCES Team(teamId)
);
