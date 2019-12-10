USE db;

CREATE PROCEDURE GET_DRIVERS_OF_ROUTE(IN routeId MEDIUMINT)
BEGIN
    SELECT FirstName, LastName
    FROM Persons
    WHERE Persons.P_Id IN (
        SELECT PersonId
        FROM Drivers
        WHERE Drivers.D_Id IN (
            SELECT DriverId
            FROM TransfersDrivers
            WHERE TransferId IN (
                SELECT T_Id
                FROM Transfers
                WHERE Transfers.Route_Id IN (
                    SELECT R_Id
                    FROM Routes
                    WHERE R_Id = routeId
                )
            )
        )
    );
END;

DROP PROCEDURE GET_DRIVERS_OF_ROUTE;

SET @routeId = 1;
CALL GET_DRIVERS_OF_ROUTE(@routeId);