
USE EntertainmentAgencyExample;
SELECT EntStageName, 
Engagements.EndDate
FROM Entertainers
INNER JOIN Engagements
ON Entertainers.EntertainerID = Engagements.EntertainerID;

USE EntertainmentAgencyExample;
SELECT DISTINCT CustFirstName, CustLastName, Entertainers.EntStageName
FROM Engagements
INNER JOIN Customers
ON Customers.CustomerID = Engagements.CustomerID
INNER JOIN Entertainers
ON Engagements.EntertainerID = Entertainers.EntertainerID;

USE EntertainmentAgencyExample;
SELECT Members.MbrLastName, Entertainers.EntStageName
FROM Musical_Styles
INNER JOIN Entertainer_Styles
ON Entertainer_Styles.StyleID = Musical_Styles.StyleID
	AND Musical_Styles.StyleName = "Country"
INNER JOIN Entertainer_Members
ON Entertainer_Styles.EntertainerID = Entertainer_Members.EntertainerID
INNER JOIN Members
ON Entertainer_Members.MemberID = Members.MemberID
	AND Members.Gender = "F"
INNER JOIN Entertainers
ON Entertainer_Members.EntertainerID = Entertainers.EntertainerID;

USE EntertainmentAgencyExample;
SELECT *
FROM Agents
LEFT JOIN Engagements
ON Engagements.AgentID = Agents.AgentID
WHERE EngagementNumber IS NULL;

USE EntertainmentAgencyExample;
SELECT DISTINCT Entertainers.EntStageName, Engagements.ContractPrice, Engagements.StartDate, Engagements.EndDate
FROM Entertainers
LEFT JOIN Engagements
ON Entertainers.EntertainerID = Engagements.EntertainerID
	AND Engagements.CustomerID = 10015;





