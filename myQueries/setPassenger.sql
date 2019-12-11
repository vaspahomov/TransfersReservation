USE db;

CREATE PROCEDURE SET_PASSENGER(IN route varchar(255), IN passengerId MEDIUMINT)
BEGIN
    INSERT INTO TransfersPersons(TransferId, PersonId)
    SELECT T_Id, passengerId
    FROM Transfers
    WHERE Transfers.Route_Id IN (
        SELECT R_Id
        FROM Routes
        WHERE RouteNumber = route
    )
    LIMIT 1;
END;

DROP PROCEDURE SET_PASSENGER;

SET @routeNumber = '234234';
SET @passengerId = 20;
CALL SET_PASSENGER(@routeNumber, @passengerId);