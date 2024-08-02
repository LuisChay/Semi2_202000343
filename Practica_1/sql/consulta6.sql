WITH FlightCountByStatus AS (
    SELECT
        f.FlightStatus,
        COUNT(f.FlightID) AS FlightCount
    FROM Flights f
    GROUP BY f.FlightStatus
)

SELECT
    FlightStatus as EstadoVuelo,
    FlightCount as ConteoVuelos
FROM FlightCountByStatus
ORDER BY FlightCount DESC;