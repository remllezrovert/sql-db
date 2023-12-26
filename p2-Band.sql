## Populate Band table
USE Metal;
INSERT IGNORE INTO Band
(
bandId,
bandName,
formedIn,
bandStatus
)
SELECT
bandId,
bandName,
formedIn,
bandStatus
FROM Staging
