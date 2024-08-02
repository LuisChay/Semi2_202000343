WITH CountryVisitCounts AS (
    SELECT
        a.CountryName,
        COUNT(f.FlightID) AS VisitCount
    FROM
        Airports a
    JOIN
        Flights f ON a.AirportID = f.ArrivalAirportID
    GROUP BY
        a.CountryName
)
SELECT
    CountryName,
    VisitCount
FROM
    CountryVisitCounts
ORDER BY
    VisitCount DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
