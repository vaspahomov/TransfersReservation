USE db;

-- Получить все свободные машины
SELECT T_Id
FROM Transfers
WHERE T_Id NOT IN
(SELECT TransferId FROM TransfersPersons)