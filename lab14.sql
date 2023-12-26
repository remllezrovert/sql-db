USE EntertainmentAgencyExample;



##14.1##
SELECT
EntStageName AS 'Band Name',
COUNT(*) OVER (PARTITION BY EntertainerID) AS `# of members`,
CONCAT_WS(MbrFirstName, MbrLastName) AS 'Member Name'
FROM Members
INNER JOIN Entertainer_Members
USING (MemberID)
INNER JOIN Entertainers
USING (EntertainerID);



##14.2##
SELECT
CustLastName AS `Customer Name`,
ContractPrice,
SUM(ContractPrice) OVER (PARTITION BY E.EntertainerID ORDER BY StartDate) AS `Running Total`,
SUM(ContractPrice) OVER (PARTITION BY E.EntertainerID) AS Total
FROM Entertainers AS E
INNER JOIN Engagements AS EN
ON E.EntertainerID = EN.EntertainerID
AND StartDate > '2018-01-01'
INNER JOIN Customers
USING (CustomerID);


##14.3##
SELECT
EntStageName AS 'Name',
IFNULL(SUM(ContractPrice), 0) AS `Total Earnings`,
RANK() OVER (ORDER BY SUM(ContractPrice) DESC) AS `Earning Rank`,
COUNT(EngagementNumber) AS `Engagement Quantity`,
DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS `Engagement Rank`
FROM Entertainers
LEFT OUTER JOIN (Engagements)
USING (EntertainerID)
GROUP BY EntertainerID
ORDER BY `Total Earnings` DESC;



##14.4##
USE EntertainmentAgencyExample;
WITH CTE AS (
SELECT 
AgentID,
SUM(ContractPrice) AS ContractPrice
FROM Engagements
GROUP BY AgentID
)
SELECT
EN.ContractPrice,
SUM(EN.ContractPrice) OVER (PARTITION BY A.AgentID ORDER BY StartDate) AS `Running Total`,
SUM(EN.ContractPrice) OVER (PARTITION BY A.AgentID) AS TotalSum,
DENSE_RANK() OVER (ORDER BY CTE.ContractPrice) AS `Contract Rank`,
A.Salary AS Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS `Salary Rank`
FROM Agents AS A
INNER JOIN Engagements AS EN
ON A.AgentID = EN.AgentID
INNER JOIN CTE
ON A.AgentID = CTE.AgentID





