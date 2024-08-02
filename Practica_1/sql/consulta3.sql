SET QUOTED_IDENTIFIER ON;

DECLARE @cols AS NVARCHAR(MAX);
DECLARE @query AS NVARCHAR(MAX);

SELECT @cols = STUFF((
    SELECT DISTINCT 
        ',' + QUOTENAME(FORMAT(DepartureDate, 'MM-yyyy'))
    FROM Flights
    FOR XML PATH(''), TYPE
).value('.', 'NVARCHAR(MAX)'), 1, 1, '');

IF @cols IS NULL OR @cols = ''
BEGIN
    PRINT 'No hay fechas disponibles en la tabla Flights.';
    RETURN;
END

SET @query = '
SELECT 
    Nationalidad, ' + @cols + '
FROM 
(
    SELECT 
        p.Nationality AS Nationalidad, 
        FORMAT(f.DepartureDate, ''MM-yyyy'') AS MonthYear
    FROM 
        Passengers p
    JOIN 
        PassengerFlights pf ON p.PassengerID = pf.PassengerID
    JOIN 
        Flights f ON pf.FlightID = f.FlightID
) AS SourceTable
PIVOT (
    COUNT(MonthYear)
    FOR MonthYear IN (' + @cols + ')
) AS PivotTable
ORDER BY Nationalidad;
';

EXEC sp_executesql @query;
