WITH MonthlyFlightCount AS (
    SELECT
        FORMAT(f.DepartureDate, 'MM-yyyy') AS MesAnio,
        COUNT(f.FlightID) AS ConteoVuelos
    FROM Flights f
    GROUP BY FORMAT(f.DepartureDate, 'MM-yyyy')
)

SELECT
    MesAnio AS Fecha,
    ConteoVuelos AS ConteoVuelos
FROM MonthlyFlightCount
ORDER BY MesAnio;