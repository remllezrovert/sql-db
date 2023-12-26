USE EntertainmentAgencyExample;
SELECT COUNT(DISTINCT EntertainerID) AS 'Karens Client Count'
FROM Engagements AS en
INNER JOIN Agents AS a
ON (a.AgentID = en.AgentID)
AND (a.AgtFirstName = "Karen")
AND (a.AgtLastName = "Smith");


USE EntertainmentAgencyExample;
SELECT SUM(ContractPrice) AS 'Total Earnings', COUNT(EngagementNumber) AS 'Engagement Quantity'
FROM Engagements
GROUP BY EntertainerID
ORDER BY SUM(ContractPrice) DESC;

USE EntertainmentAgencyExample;
SELECT DISTINCT StyleName
FROM Musical_Styles AS ms
INNER JOIN Musical_Preferences AS mp
ON mp.StyleID = ms.StyleID
AND mp.PreferenceSeq = 1;



USE EntertainmentAgencyExample;
SELECT Stylename
FROM Musical_Preferences AS mp
INNER JOIN Musical_Styles AS ms
ON mp.StyleID = ms.StyleID
AND mp.PreferenceSeq = 1
GROUP BY StyleName;

USE EntertainmentAgencyExample;
SELECT MbrFirstName AS 'First Name', MbrLastName AS 'Last Name', Gender
FROM Members AS m
INNER JOIN Entertainer_Members AS em
ON m.MemberID = em.MemberID
GROUP BY em.MemberID
HAVING COUNT(*) > 2;


USE EntertainmentAgencyExample;
SELECT EntStageName AS 'Artist'
FROM Entertainers AS e
INNER JOIN Entertainer_Styles AS es
ON e.EntertainerID = es.EntertainerID
INNER JOIN Musical_Styles AS ms
ON es.StyleID = ms.StyleID
INNER JOIN Engagements as en
ON en.EntertainerID = e.EntertainerID
WHERE StyleName IN ('Country', 'Jazz', 'Folk')
GROUP BY EntStageName
HAVING AVG(ContractPrice) > 1500 AND COUNT(EngagementNumber);


