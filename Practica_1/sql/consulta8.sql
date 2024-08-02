WITH ContinentVisitCounts AS (
    SELECT
        c.ContinentName,
        COUNT(f.FlightID) AS VisitCount
    FROM
        Airports a
    JOIN
        Flights f ON a.AirportID = f.ArrivalAirportID
    JOIN
        Continents c ON a.ContinentID = c.ContinentID
    GROUP BY
        c.ContinentName
)
SELECT
    ContinentName,
    VisitCount
FROM
    ContinentVisitCounts
ORDER BY
    VisitCount DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
