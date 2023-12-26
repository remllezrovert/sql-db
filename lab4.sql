USE EntertainmentAgencyExample;
SELECT CustFirstName, MbrFirstName, CustLastName
FROM Customers
INNER JOIN Members
	On CustLastName = MbrLastName;



USE EntertainmentAgencyExample;
SELECT e.EntStageName
FROM Entertainers AS e
INNER JOIN Entertainer_Styles AS es
	USING (EntertainerID)
INNER JOIN Musical_Styles AS ms
    ON ms.StyleID = es.StyleID
    AND ms.StyleName IN ("Show Tunes", "Standards")
INNER JOIN Entertainer_Styles AS es1
	ON es.EntertainerID = es1.EntertainerID
	AND es.StyleID < es1.StyleID
INNER JOIN Musical_Styles AS ms1
	ON es1.StyleID = ms1.StyleID
	AND ms1.StyleName = "Standards" 
    AND ms.StyleName = "Show Tunes";
	
    
    
USE EntertainmentAgencyExample;
SELECT e.EntStageName
FROM Entertainers AS e 
LEFT OUTER JOIN (
	Engagements AS en
	INNER JOIN Customers AS c ON (
		CustFirstName = "Sarah" AND CustLastName = "Thompson" AND c.CustomerID = en.CustomerID 
        )
	) USING (EntertainerID)
    WHERE c.CustomerID IS NULL;
	
    
    
USE EntertainmentAgencyExample;
SELECT e.EntStageName, c.CustFirstName, c.CustLastName, a.AgtFirstName, a.AgtLastname, en.StartDate, en.ContractPrice
FROM Entertainers as e
INNER JOIN Engagements as en
	ON en.EntertainerID = e.EntertainerID
	AND en.StartDate LIKE '2018-02%'
INNER JOIN Customers AS c
	ON c.CustomerID = en.CustomerID
INNER JOIN Agents AS a
	ON a.AgentID = en.AgentID;



/*
I Spent six hours on this specific queary and I still have no idea how I am supposed to get 25 results... Sometimes giving up is logical.
*/

USE EntertainmentAgencyExample;
SELECT DISTINCT e.EntStageName AS "Band Name", m.MbrFirstName AS "First Name" , m.MbrLastName AS "Last Name", ms.StyleName AS "Genre"
FROM Entertainer_Members AS em
INNER JOIN Entertainers AS e
	USING (EntertainerID)
Inner JOIN Entertainer_Styles as es
	on es.EntertainerID = em.EntertainerID
    AND es.StyleStrength = 1
INNER JOIN Musical_Styles AS ms
	ON es.StyleID = ms.StyleID
LEFT OUTER JOIN (
	Members AS m
	) ON m.MemberID = em.MemberID AND m.Gender = "M"
	ORDER BY e.EntStageName DESC;
 
 
 /*
  I dont know why this one doesn't work and I have no syntax highlighting clues telling me I did anything wrong 
  */
USE EntertainmentAgencyExample;
SELECT DISTINCT e.EntStageName AS "Band Name", m.MbrFirstName AS "First Name" , m.MbrLastName AS "Last Name", ms.StyleName AS "Genre"
FROM Entertainer_Members AS em
LEFT OUTER JOIN (
	Members AS m
		INNER JOIN Entertainers AS e ON (e.EntertainerID = em.EntertainerID)
		Inner JOIN Entertainer_Styles AS es ON (es.EntertainerID = em.EntertainerID AND es.StyleStrength = 1)
		INNER JOIN Musical_Styles AS ms ON (es.StyleID = ms.StyleID)
	) ON m.MemberID = em.MemberID AND m.Gender = "M"
	ORDER BY e.EntStageName DESC;
 

