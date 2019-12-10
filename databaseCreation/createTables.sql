USE db;

CREATE TABLE Persons
(
    P_Id      MEDIUMINT NOT NULL AUTO_INCREMENT,
    LastName  varchar(255),
    FirstName varchar(255),
    CanDrive boolean,
    PRIMARY KEY (P_Id)
);

CREATE TABLE Drivers
(
    D_Id     MEDIUMINT NOT NULL AUTO_INCREMENT,
    PersonId MEDIUMINT NOT NULL UNIQUE,
    PRIMARY KEY (D_Id),
    FOREIGN KEY (PersonId) REFERENCES Persons (P_Id)
);

CREATE TABLE Routes
(
    R_Id        MEDIUMINT NOT NULL AUTO_INCREMENT,
    RouteNumber varchar(255) UNIQUE,
    PRIMARY KEY (R_Id)
);

CREATE TABLE Transfers
(
    T_Id     MEDIUMINT NOT NULL AUTO_INCREMENT,
    Route_Id MEDIUMINT,
    PRIMARY KEY (T_Id),
    FOREIGN KEY (Route_Id) REFERENCES Routes (R_Id)
);

CREATE TABLE TransfersPersons
(
    TP_Id      MEDIUMINT NOT NULL AUTO_INCREMENT,
    TransferId MEDIUMINT,
    PersonId   MEDIUMINT,
    PRIMARY KEY (TP_Id),
    FOREIGN KEY (TransferId) REFERENCES Transfers (T_Id),
    FOREIGN KEY (PersonId) REFERENCES Persons (P_Id)
);

CREATE TABLE TransfersDrivers
(
    TD_Id      MEDIUMINT NOT NULL AUTO_INCREMENT,
    DriverId   MEDIUMINT NOT NULL,
    TransferId MEDIUMINT NOT NULL,
    PRIMARY KEY (TD_Id),
    FOREIGN KEY (DriverId) REFERENCES Drivers (D_Id),
    FOREIGN KEY (TransferId) REFERENCES Transfers (T_Id)
);