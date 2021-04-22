CREATE TABLE person
(
  lastName VARCHAR2(10) NOT NULL,
  firstName VARCHAR2(10) NOT NULL,
  personID INT NOT NULL,
  pAddress VARCHAR2(10) NOT NULL,
  PRIMARY KEY (personID)
);

CREATE TABLE donor
(
  emailAddress VARCHAR2(10),
  donorID INT NOT NULL,
  PRIMARY KEY (donorID),
  FOREIGN KEY (donorID) REFERENCES person(personID)
);

CREATE TABLE warehouse
(
  warehouseID INT NOT NULL,
  wAddress VARCHAR2(10) NOT NULL,
  itemsCapacity INT NOT NULL,
  numOfWorkers INT NOT NULL,
  PRIMARY KEY (warehouseID)
);

CREATE TABLE item
(
  itemID INT NOT NULL,
  iName VARCHAR2(10) NOT NULL,
  price INT NOT NULL,
  companyName VARCHAR2(10) NOT NULL,
  amount INT NOT NULL,
  warrantYears INT NOT NULL,
  PRIMARY KEY (itemID)
);

CREATE TABLE Person_phoneNumber
(
  phoneNumber INT NOT NULL,
  pID INT NOT NULL,
  PRIMARY KEY (phoneNumber, pID),
  FOREIGN KEY (pID) REFERENCES person(personID)
);

CREATE TABLE donation
(
  donationDate DATE NOT NULL,
  donationID INT NOT NULL,
  donationStatus VARCHAR2(10) NOT NULL,
  dID INT NOT NULL,
  PRIMARY KEY (donationID),
  FOREIGN KEY (dID) REFERENCES donor(donorID)
);

CREATE TABLE storekeeper
(
  experience VARCHAR2(10),
  storekeeperID INT NOT NULL,
  wID INT NOT NULL,
  PRIMARY KEY (storekeeperID),
  FOREIGN KEY (wID) REFERENCES warehouse(warehouseID),
  FOREIGN KEY (storekeeperID) REFERENCES person(personID)
);

CREATE TABLE ordering
(
  orderID INT NOT NULL,
  orderDate DATE NOT NULL,
  shippingPrice INT NOT NULL,
  orderStatus VARCHAR2(10) NOT NULL,
  workerID INT NOT NULL,
  PRIMARY KEY (orderID),
  FOREIGN KEY (workerID) REFERENCES storekeeper(storekeeperID)
);

CREATE TABLE orderItem
(
  orID INT NOT NULL,
  itID INT NOT NULL,
  PRIMARY KEY (orID, itID),
  FOREIGN KEY (orID) REFERENCES ordering(orderID),
  FOREIGN KEY (itID) REFERENCES item(itemID)
);

CREATE TABLE donationItem
(
  dID INT NOT NULL,
  iID INT NOT NULL,
  PRIMARY KEY (donationID, iID),
  FOREIGN KEY (donationID) REFERENCES donation(donationID),
  FOREIGN KEY (iID) REFERENCES item(itemID)
);
