DECLARE @TotalFlights INT;
SELECT @TotalFlights = COUNT(DISTINCT FlightID)
FROM Flights;

WITH GenderFlightCount AS (
    SELECT
        p.Gender,
        COUNT(DISTINCT pf.FlightID) AS FlightCount
    FROM Passengers p
    JOIN PassengerFlights pf ON p.PassengerID = pf.PassengerID
    GROUP BY p.Gender
),
GenderFlightPercentage AS (
    SELECT
        Gender,
        CAST(FlightCount AS FLOAT) / @TotalFlights * 100 AS Percentage
    FROM GenderFlightCount
)
-- Seleccionar los resultados
SELECT
    Gender as Genero,
    Percentage as Porcentaje
FROM GenderFlightPercentage;