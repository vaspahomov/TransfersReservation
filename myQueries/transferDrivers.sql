USE db;

DELIMITER $$
CREATE PROCEDURE CREATE_DRIVERS_LIST(
    INOUT DRIVERS_LIST varchar(4000)
)
BEGIN
    DECLARE FINISHED INT DEFAULT 0;
    DECLARE Driver_id MEDIUMINT DEFAULT 0;
    DECLARE C_FirstName varchar(255) DEFAULT '';
    DECLARE C_LastName varchar(255) DEFAULT '';

    DECLARE GET_DRIVER
        CURSOR FOR
        SELECT P_Id, FirstName, LastName FROM Persons WHERE P_Id IN (SELECT PersonId FROM Drivers);

    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET FINISHED = 1;

    OPEN GET_DRIVER;

    GET_DRIVERS:
    LOOP
        FETCH GET_DRIVER INTO Driver_id, C_FirstName, C_LastName;
        IF FINISHED = 1 THEN
            LEAVE GET_DRIVERS;
        END IF;
        SET DRIVERS_LIST = CONCAT(Driver_id, ':', C_FirstName, ':', C_LastName, ';', DRIVERS_LIST);
    END LOOP GET_DRIVERS;
    CLOSE GET_DRIVER;

END$$
DELIMITER ;

DROP PROCEDURE CREATE_DRIVERS_LIST;

SET @DRIVERS_LIST = '';
CALL CREATE_DRIVERS_LIST(@DRIVERS_LIST);
SELECT @DRIVERS_LIST;