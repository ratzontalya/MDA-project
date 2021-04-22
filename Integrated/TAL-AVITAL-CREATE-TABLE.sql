CREATE TABLE Person
(
  lastName VARCHAR2(10) NOT NULL,
  firstName VARCHAR2(10) NOT NULL,
  personId INT NOT NULL,
  address VARCHAR2(10) NOT NULL,
  PRIMARY KEY (personId)
);

CREATE TABLE Donor
(
  emailAddress VARCHAR2(10),
  donorId INT NOT NULL,
  PRIMARY KEY (donorId),
  FOREIGN KEY (donorId) REFERENCES Person(personId)
);

CREATE TABLE Warehouse
(
  warehouseId INT NOT NULL,
  address VARCHAR2(10) NOT NULL,
  itemsCapacity INT NOT NULL,
  numOfWorkers INT NOT NULL,
  PRIMARY KEY (warehouseId)
);

CREATE TABLE Item
(
  itemId INT NOT NULL,
  itemName VARCHAR2(10) NOT NULL,
  price INT NOT NULL,
  companyName VARCHAR2(10) NOT NULL,
  amount INT NOT NULL,
  warrantYears INT NOT NULL,
  PRIMARY KEY (itemId)
);

CREATE TABLE Donation
(
  donationDate DATE NOT NULL,
  donationId INT NOT NULL,
  status VARCHAR2(10) NOT NULL,
  donorId INT NOT NULL,
  PRIMARY KEY (donationId),
  FOREIGN KEY (donorId) REFERENCES Donor(donorId)
);

CREATE TABLE Storekeeper
(
  experience VARCHAR2(10),
  storekeeperId INT NOT NULL,
  warehouseId INT NOT NULL,
  PRIMARY KEY (storekeeperId),
  FOREIGN KEY (warehouseId) REFERENCES Warehouse(warehouseId),
  FOREIGN KEY (storekeeperId) REFERENCES Person(personId)
);

CREATE TABLE Ordering
(
  orderId INT NOT NULL,
  orderDate DATE NOT NULL,
  shippingPrice INT NOT NULL,
  status VARCHAR2(10) NOT NULL,
  workerId INT NOT NULL,
  PRIMARY KEY (orderId),
  FOREIGN KEY (workerId) REFERENCES Storekeeper(storekeeperId)
);

CREATE TABLE OrderItem
(
  orderId INT NOT NULL,
  itemId INT NOT NULL,
  PRIMARY KEY (orderID, itemId),
  FOREIGN KEY (orderId) REFERENCES Ordering(orderID),
  FOREIGN KEY (itemId) REFERENCES Item(itemID)
);

CREATE TABLE DonationItem
(
  donationId INT NOT NULL,
  itemId INT NOT NULL,
  PRIMARY KEY (donationId, itemId),
  FOREIGN KEY (donationId) REFERENCES Donation(donationId),
  FOREIGN KEY (itemId) REFERENCES Item(itemId)
);
