CREATE TABLE address
(
  addressID INT NOT NULL,
  city varchar2(30) NOT NULL,
  street varchar2(30),
  country varchar2(30) NOT NULL,
  PRIMARY KEY (addressID)
);

CREATE TABLE person
(
  personID varchar2(9) NOT NULL,
  firstName varchar2(30) NOT NULL,
  lastName varchar2(30) NOT NULL,
  email varchar2(30) NOT NULL,
  birthDate date NOT NULL,
  addressID INT NOT NULL,
  phoneNumber varchar2(30) NOT NULL,
  PRIMARY KEY (personID),
  FOREIGN KEY (addressID) REFERENCES address(addressID)
);

CREATE TABLE interested
(
  PersonID_ varchar2(9) NOT NULL,
  PRIMARY KEY (PersonID_),
  FOREIGN KEY (PersonID_) REFERENCES person(PersonID)
);

CREATE TABLE areaStudy
(
  areaName varchar2(30) NOT NULL,
  minPsychoGrade INT NOT NULL,
  PRIMARY KEY (areaName)
);

CREATE TABLE bagrutSubject
(
  bagrutID INT NOT NULL,
  bagrutName varchar2(30) NOT NULL,
  units INT NOT NULL,
  PRIMARY KEY (bagrutID)
);

CREATE TABLE psychometric
(
  PersonID varchar2(9) NOT NULL,
  psychoDate date NOT NULL,
  psychoGrade INT NOT NULL,
  PRIMARY KEY (psychoDate, PersonID),
  FOREIGN KEY (PersonID) REFERENCES interested(PersonID_)
);

CREATE TABLE counselor
(
  PersonID varchar2(9) NOT NULL,
  areaName varchar2(30) NOT NULL,
  licenseNumber INT NOT NULL,
  PRIMARY KEY (PersonID),
  FOREIGN KEY (areaName) REFERENCES areaStudy(areaName),
  FOREIGN KEY (PersonID) REFERENCES person(PersonID)
);

CREATE TABLE meeting
(
  PersonID varchar2(9) NOT NULL,
  counselorID varchar2(9) NOT NULL,
  meetDate Timestamp NOT NULL,
  PRIMARY KEY (meetDate, PersonID, counselorID),
  FOREIGN KEY (PersonID) REFERENCES interested(PersonID_),
  FOREIGN KEY (counselorID) REFERENCES counselor(PersonID)
);

CREATE TABLE admissionBagrut
(
  bagrutID INT NOT NULL,
  areaName varchar2(30) NOT NULL,
  minBagrutGrade INT NOT NULL,
  PRIMARY KEY (areaName, bagrutID),
  FOREIGN KEY (areaName) REFERENCES areaStudy(areaName),
  FOREIGN KEY (bagrutID) REFERENCES bagrutSubject(bagrutID)
);

CREATE TABLE interestedOf
(
  PersonID varchar2(9) NOT NULL,
  areaName varchar2(30) NOT NULL,
  PRIMARY KEY (PersonID, areaName),
  FOREIGN KEY (PersonID) REFERENCES interested(PersonID_),
  FOREIGN KEY (areaName) REFERENCES areaStudy(areaName)
);

CREATE TABLE tested
(
  PersonID varchar2(9) NOT NULL,
  bagrutID INT NOT NULL,
  grade INT NOT NULL,
  PRIMARY KEY (PersonID, bagrutID),
  FOREIGN KEY (PersonID) REFERENCES interested(PersonID_),
  FOREIGN KEY (bagrutID) REFERENCES bagrutSubject(bagrutID)
);

