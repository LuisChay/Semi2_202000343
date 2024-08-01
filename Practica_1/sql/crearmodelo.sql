-- Crear tabla Continents
CREATE TABLE Continents (
    ContinentID INT PRIMARY KEY IDENTITY(1,1),
    ContinentName VARCHAR(50) NOT NULL
);

-- Crear tabla Airports
CREATE TABLE Airports (
    AirportID INT PRIMARY KEY IDENTITY(1,1),
    AirportName VARCHAR(255) NOT NULL,
    CountryCode VARCHAR(3) NOT NULL,
    CountryName VARCHAR(100) NOT NULL,
    ContinentID INT NOT NULL,
    FOREIGN KEY (ContinentID) REFERENCES Continents(ContinentID)
);

-- Crear tabla Passengers
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Age INT NOT NULL,
    Nationality VARCHAR(100) NOT NULL
);

-- Crear tabla Flights
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY IDENTITY(1,1),
    DepartureDate DATE NOT NULL,
    ArrivalAirportID INT NOT NULL,
    PilotName VARCHAR(255) NOT NULL,
    FlightStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (ArrivalAirportID) REFERENCES Airports(AirportID)
);

-- Crear tabla PassengerFlights (tabla intermedia)
CREATE TABLE PassengerFlights (
    PassengerFlightID INT PRIMARY KEY IDENTITY(1,1),
    PassengerID INT NOT NULL,
    FlightID INT NOT NULL,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);
