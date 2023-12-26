USE EntertainmentAgencyExample;
SELECT EntStageName,
	(CASE
	WHEN EntWebPage IS NULL THEN 'Not Available'
    ELSE EntWebPage
    END) AS 'Web Page',
CONCAT(EntStreetAddress, ", ", EntCity, ", ", EntState) AS 'Address',
DATEDIFF(CURRENT_DATE(), DateEntered) AS "Age in system (days)"
FROM Entertainers
ORDER BY EntStageName ASC;



USE EntertainmentAgencyExample;
SELECT
EntStageName AS "Entertainer", 
DATE_FORMAT(MIN(StartDate), "%M %D, %Y") AS "First Engagement",
DATE_FORMAT(MAX(StartDate), "%M %D, %Y") AS "Last Engagement",
 CONCAT( "$", FORMAT(AVG(ContractPrice), 2)) AS "Average Contract"
FROM Entertainers
INNER JOIN Engagements AS en
	USING (EntertainerID)
GROUP BY EntertainerID
HAVING MIN(StartDate) AND MAX(StartDate)
ORDER BY AVG(ContractPrice) DESC;



USE EntertainmentAgencyExample;
SELECT 
CONCAT(UPPER(SUBSTR(AgtFirstName, 1, 1)), ". ", AgtLastName) AS "Agent Name",
(CASE
	WHEN StartDate = EndDate THEN 1
    ELSE CEIL(DATEDIFF(EndDate, StartDate) / 7) 
END) AS "Weeks Spanned",
CONCAT( "$", FORMAT(CommissionRate * ContractPrice, 2)) AS "Agent Earnings",
(CASE
	WHEN CommissionRate <= 0.04 THEN "Budget"
    WHEN CommissionRate > 0.05 THEN "Premium"
    ELSE "Standard"
END) AS "Commission Category"
FROM Agents AS a
INNER JOIN Engagements AS en
USING (AgentID)
ORDER BY AgtLastName ASC, CommissionRate * ContractPrice DESC;



## This queary adds up the total number of days each entertainer has performed
USE EntertainmentAgencyExample;
SELECT
SUM(
(CASE
	WHEN StartDate = EndDate THEN 1
    ELSE DATEDIFF(EndDate, StartDate)
END)
) AS "Days Performed",
EntStagename AS "Entertainer Name"
FROM Entertainers
INNER JOIN Engagements
	USING (EntertainerID)
GROUP BY EntertainerID
ORDER BY EntStageName;


## This is supposed to reccomend a list of entertainers to customers based on their preferences.
## It only reccomends entertainers to customers that are in the same state
USE EntertainmentAgencyExample;
SELECT CustFirstName AS "First Name",
 CustLastName AS "Last Name", 
 GROUP_CONCAT(EntStageName) AS "Reccomended Artists"
FROM Customers AS c
INNER JOIN Musical_Preferences AS m ON (m.CustomerID = c.CustomerID AND m.PreferenceSeq = 1)
INNER JOIN Entertainer_Styles AS es 
USING (StyleID)
INNER JOIN Entertainers AS e 
ON es.EntertainerID = e.EntertainerID
AND e.EntState = c.CustState
GROUP BY c.CustomerID

	



