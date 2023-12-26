#11.1
USE EntertainmentAgencyExample;
SELECT EntStageName AS Who, 'Entertainer' AS What
FROM Entertainers AS E
INNER JOIN Entertainer_Styles AS ES
ON ES.EntertainerID = E.EntertainerID
INNER JOIN Musical_Styles AS MS
ON MS.StyleID = ES.StyleID
AND StyleName LIKE "Jazz"
UNION
SELECT CONCAT_WS(' ', CustFirstName, CustLastName) AS Who, 'Customer' AS What
FROM Customers AS C
INNER JOIN Musical_Preferences AS MP
USING(CustomerID)
INNER JOIN Musical_Styles AS MS2
ON MS2.StyleId = MP.StyleID
AND MS2.StyleName LIKE "Jazz";

## 11.2
SELECT 
"Total" AS "Customer",
NULL AS "Location",
NULL AS "Start Date",
SUM(ContractPrice) AS "Contract Price"
FROM Engagements AS EN
INNER JOIN Agents AS A
ON A.AgentID = EN.AgentID
AND CONCAT_WS(' ', AgtFirstName, AgtLastName) LIKE "Scott Bishop"
INNER JOIN Customers AS C
ON EN.CustomerID = C.CustomerID
UNION
SELECT 
CONCAT_WS(' ', CustFirstName, CustLastName),
CONCAT_WS(", ", CustCity, CustState),
StartDate,
CONCAT("$", ContractPrice)
FROM Engagements AS EN
INNER JOIN Agents AS A
ON A.AgentID = EN.AgentID
AND CONCAT_WS(' ', AgtFirstName, AgtLastName) LIKE "Scott Bishop"
INNER JOIN Customers AS C
ON EN.CustomerID = C.CustomerID





## 11.3 Show cities that have at least one entertainer and one customer
SELECT CustCity AS City
FROM Customers AS C
INTERSECT
SELECT EntCity AS City
FROM Entertainers AS E;

## Show Cities where there are customers but no entertainers
SELECT CustCity AS City
FROM Customers AS C
EXCEPT
SELECT EntCity AS City
FROM Entertainers AS E;

