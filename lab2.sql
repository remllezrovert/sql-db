USE SchoolSchedulingExample;
SELECT StudFirstName, StudLastName, StudCity, StudState
FROM Students
WHERE StudCity IN ('Dallas', 'Seattle', 'Portland', 'San Antonio');


USE SchoolSchedulingExample;
SELECT DISTINCT StfLastName
FROM Staff
WHERE StfLastName > 'S%'
ORDER BY StfLastName ASC;

USE SchoolSchedulingExample;
SELECT SubjectName
FROM Subjects
WHERE CategoryID = 'BUS' AND SubjectEstClassSize < 40 AND SubjectPreReq IS NULL;

USE SchoolSchedulingExample;
SELECT *
FROM Faculty
WHERE Title LIKE '%Professor' AND Tenured = 1
ORDER BY Title ASC, Status DESC;

USE SchoolSchedulingExample;
SELECT StudLastName, StudBirthDate
FROM Students
WHERE StudMaritalStatus = 'M' OR ((StudBirthDate BETWEEN '19900601' AND '19950101') AND StudMajor IN (3,4));

USE SchoolSchedulingExample;
SELECT *
FROM Students
WHERE StudLastName LIKE '%k%'
LIMIT 3;

