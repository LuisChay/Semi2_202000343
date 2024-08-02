-- Eliminar registros duplicados en la tabla temporal basados en PassengerID
WITH CTE AS (
    SELECT 
        PassengerID, 
        ROW_NUMBER() OVER (PARTITION BY PassengerID ORDER BY (SELECT NULL)) AS rn
    FROM TempPassengers
)
DELETE FROM TempPassengers
WHERE PassengerID IN (
    SELECT PassengerID
    FROM CTE
    WHERE rn > 1
);

-- Insertar Continentes únicos
INSERT INTO Continents (ContinentName)
SELECT DISTINCT AirportContinent
FROM TempPassengers
WHERE AirportContinent IS NOT NULL
AND NOT EXISTS (
    SELECT 1 FROM Continents WHERE ContinentName = TempPassengers.AirportContinent
);

-- Insertar Aeropuertos
INSERT INTO Airports (AirportName, CountryCode, CountryName, ContinentID, ArrivalAirportCode)
SELECT DISTINCT
    tp.AirportName,
    tp.CountryCode,
    tp.CountryName,
    c.ContinentID,
    tp.ArrivalAirport
FROM TempPassengers tp
JOIN Continents c ON c.ContinentName = tp.AirportContinent
WHERE tp.AirportName IS NOT NULL
AND tp.CountryCode IS NOT NULL
AND tp.CountryName IS NOT NULL
AND NOT EXISTS (
    SELECT 1 FROM Airports
    WHERE AirportName = tp.AirportName
    AND CountryCode = tp.CountryCode
    AND CountryName = tp.CountryName
);

-- Insertar Pasajeros
INSERT INTO Passengers (PassengerID, FirstName, LastName, Gender, Age, Nationality)
SELECT DISTINCT
    tp.PassengerID,
    tp.FirstName,
    tp.LastName,
    tp.Gender,
    TRY_CAST(tp.Age AS INT),
    tp.Nationality
FROM TempPassengers tp
WHERE tp.PassengerID IS NOT NULL
AND NOT EXISTS (
    SELECT 1 FROM Passengers p
    WHERE p.PassengerID = tp.PassengerID
);

-- Insertar Vuelos
INSERT INTO Flights (DepartureDate, ArrivalAirportID, PilotName, FlightStatus)
SELECT DISTINCT 
    tp.DepartureDate, 
    a.AirportID,  
    tp.PilotName, 
    tp.FlightStatus
FROM TempPassengers tp
JOIN Airports a ON a.AirportName = tp.AirportName  
WHERE tp.DepartureDate IS NOT NULL
AND tp.ArrivalAirport IS NOT NULL
AND NOT EXISTS (
    SELECT 1 FROM Flights 
    WHERE DepartureDate = tp.DepartureDate
    AND ArrivalAirportID = a.AirportID  
    AND PilotName = tp.PilotName
);

-- Insertar relaciones de Pasajeros y Vuelos
INSERT INTO PassengerFlights (PassengerID, FlightID)
SELECT 
    tp.PassengerID, 
    f.FlightID
FROM TempPassengers tp
JOIN Passengers p ON tp.PassengerID = p.PassengerID
JOIN Flights f ON 
    tp.DepartureDate = f.DepartureDate 
    AND f.ArrivalAirportID = (
        SELECT TOP 1 AirportID 
        FROM Airports 
        WHERE AirportName = tp.AirportName
    )  
    AND tp.PilotName = f.PilotName
WHERE tp.PassengerID IS NOT NULL
AND f.FlightID IS NOT NULL;

-- Verificar datos en las tablas finales
SELECT COUNT(*) FROM Passengers;
SELECT COUNT(*) FROM Flights;
SELECT COUNT(*) FROM PassengerFlights;
SELECT COUNT(*) FROM Airports;
SELECT COUNT(*) FROM Continents;

-- Eliminar tabla temporal
DROP TABLE TempPassengers;
