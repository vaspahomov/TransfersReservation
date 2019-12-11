USE db;

CREATE FUNCTION GET_DRIVERS_OF_ROUTE(r_Number VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
    DECLARE NAMES_FOUND VARCHAR(255) DEFAULT '';
    SELECT GROUP_CONCAT(CONCAT(FirstName, ' ', LastName) SEPARATOR ', ')
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
                    WHERE RouteNumber = r_Number
                )
            )
        )
    )
    INTO NAMES_FOUND;
    RETURN NAMES_FOUND;
END;

DROP FUNCTION GET_DRIVERS_OF_ROUTE;

# SET @routeId = '123';
SET @routeId = '234';
SELECT GET_DRIVERS_OF_ROUTE(@routeId);