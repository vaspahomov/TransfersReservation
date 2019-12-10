USE db;

CREATE TABLE Persons
(
    P_Id      int,
    LastName  varchar(255),
    FirstName varchar(255),
    IsDriver  boolean,
    PRIMARY KEY (P_Id)
);

CREATE TABLE Routes
(
    R_Id        int,
    RouteNumber varchar(255),
    DriverId    int,
    PRIMARY KEY (R_Id),
    FOREIGN KEY (DriverId) REFERENCES Persons (P_Id)
);

CREATE TABLE Transfers
(
    T_Id     int,
    Route_Id int,
    PRIMARY KEY (T_Id),
    FOREIGN KEY (Route_Id) REFERENCES Routes (R_Id)
);

CREATE TABLE TransfersPersons
(
    TP_Id      int,
    TransferId int,
    PersonId   int,
    PRIMARY KEY (TP_Id),
    FOREIGN KEY (TransferId) REFERENCES Transfers (T_Id),
    FOREIGN KEY (PersonId) REFERENCES Persons (P_Id)
);