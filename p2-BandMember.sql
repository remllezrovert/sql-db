
#Populate bandMember


USE Metal;
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 2), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 3), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 4), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 5), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 6), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 7), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 8), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 9), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 10), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 11), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 12), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 13), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 14), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 15), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 16), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 17), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 18), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 19), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 20), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 21), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 22), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 23), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 24), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 25), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 26), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 27), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 28), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 29), ',', -1)));
INSERT IGNORE INTO BandMember (bandId, memberId)
SELECT bandId, memberId
FROM Staging
INNER JOIN Member AS C
ON (C.memberName =
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Staging.memberNames, ',', 30), ',', -1)));



