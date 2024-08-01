-- Insertar los datos de la tabla temporal en las tablas permanentes

-- Insertar continentes
INSERT INTO Continents (ContinentName)
SELECT DISTINCT Continent
FROM #TempPassengers
WHERE Continent IS NOT NULL;

-- Insertar aeropuertos
INSERT INTO Airports (AirportName, CountryCode, CountryName, ContinentID)
SELECT DISTINCT tp.AirportName, tp.CountryCode, tp.CountryName, c.ContinentID
FROM #TempPassengers tp
JOIN Continents c ON tp.Continent = c.ContinentName
WHERE tp.AirportName IS NOT NULL;

-- Insertar pasajeros
INSERT INTO Passengers (FirstName, LastName, Gender, Age, Nationality)
SELECT DISTINCT FirstName, LastName, Gender, Age, Nationality
FROM #TempPassengers
WHERE FirstName IS NOT NULL AND LastName IS NOT NULL;

-- Insertar vuelos
INSERT INTO Flights (DepartureDate, ArrivalAirportID, PilotName, FlightStatus)
SELECT DISTINCT tp.DepartureDate, a.AirportID, tp.PilotName, tp.FlightStatus
FROM #TempPassengers tp
JOIN Airports a ON tp.ArrivalAirport = a.AirportName
WHERE tp.DepartureDate IS NOT NULL;

-- Insertar relación pasajero-vuelo
INSERT INTO PassengerFlights (PassengerID, FlightID)
SELECT p.PassengerID, f.FlightID
FROM #TempPassengers tp
JOIN Passengers p ON tp.FirstName = p.FirstName AND tp.LastName = p.LastName
JOIN Flights f ON tp.DepartureDate = f.DepartureDate AND tp.PilotName = f.PilotName;
