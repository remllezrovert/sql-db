#12.1# 
USE EntertainmentAgencyExample;
SELECT EntStageName, StartDate, EndDate
FROM Engagements AS EN
INNER JOIN Customers AS C
ON EN.CustomerID = C.CustomerID
AND CustLastName NOT LIKE 'H%'
AND  CustLastName NOT LIKE 'B%'
INNER JOIN Entertainers
USING(EntertainerID);


#12.2# 
SELECT StyleName,
COUNT(*) AS 'Num Entertainers',
CONCAT(FORMAT(100 * COUNT(*) / (SELECT COUNT(*) FROM Entertainers), 1), '%') AS 'Pct Entertainers'
FROM Musical_Styles
INNER JOIN Entertainer_Styles
USING(StyleID)
GROUP BY StyleID;

#12.3#
WITH CTE AS (
	SELECT EntertainerID, EntStageName FROM Engagements 
	INNER JOIN Entertainers
	USING (EntertainerID)
	WHERE YEAR(StartDate) = '2017'
)
SELECT EntStageName 
FROM CTE GROUP BY EntertainerID
HAVING COUNT(*) >= (
	SELECT COUNT(*) FROM CTE WHERE EntStageName LIKE "Modern Dance"
);

#12.4#
SELECT CONCAT_WS(" ",AgtFirstName, AgtLastName) AS 'Agent',
(
SELECT COUNT(*) FROM Engagements AS EN
WHERE EN.AgentID = A.AgentID
) AS `# Booked`
FROM Agents AS A
WHERE AgentID IN
(SELECT AgentID FROM Agents)
ORDER BY `# Booked`;


#12.5# 

SELECT EntStageName FROM Entertainers AS E
WHERE NOT EXISTS (
SELECT * FROM Engagements AS EN
INNER JOIN Customers AS C
USING (CustomerID)
WHERE C.CustomerID = EN.CustomerID
AND C.CustCity = 'Seattle'
AND E.EntertainerID = EN.EntertainerID
);



#12.6#
WITH CTE AS (
SELECT EntertainerID, M.MemberID, MbrFirstName, MbrLastName
FROM Entertainer_Members AS EM
INNER JOIN Members AS M
ON M.MemberID = EM.MemberID
)
SELECT EntStageName AS `Band`, 
CONCAT_WS(" ", MbrFirstName, MbrLastName) AS `Member`
FROM Entertainers AS E
INNER JOIN (
SELECT DISTINCT EntertainerID
FROM CTE
WHERE MbrLastName LIKE "Viescas"
) AS o
USING(EntertainerID)
INNER JOIN CTE
USING(EntertainerID);



WITH CTE AS (
SELECT EntertainerID, M.MemberID, MbrFirstName, MbrLastName
FROM Entertainer_Members AS EM
INNER JOIN Members AS M
ON M.MemberID = EM.MemberID
)
SELECT EntStageName AS `Band`, 
CONCAT_WS(" ", MbrFirstName, MbrLastName) AS `Member`
FROM Entertainers AS E
INNER JOIN (
SELECT DISTINCT EntertainerID
FROM CTE
WHERE MbrLastName LIKE "Viescas"
) AS o
USING(EntertainerID)
INNER JOIN CTE
USING(EntertainerID);




#12.7#
WITH CTE AS (
	SELECT CustomerID, 
	SUM(ContractPrice) AS total
	FROM Engagements 
	GROUP BY CustomerID
)
SELECT CONCAT_WS(" ", CustFirstName, CustLastName) AS `Customer`,
CONCAT( "$", FORMAT(CTE.total, 0)) AS `Total Contracts`
FROM Customers
INNER JOIN CTE
USING (CustomerID)
WHERE CTE.total >= (SELECT AVG(CTE.total) FROM CTE) * 1.2



