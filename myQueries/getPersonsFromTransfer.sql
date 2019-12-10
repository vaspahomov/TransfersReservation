USE db;

set @transferId:=3;

SELECT TransferId, PersonId
FROM TransfersPersons
WHERE TransferId = @transferId;