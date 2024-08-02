SELECT 
    a.CountryName,
    COUNT(f.FlightID) AS NumberOfFlights
FROM 
    Flights f
JOIN 
    Airports a ON f.ArrivalAirportID = a.AirportID
GROUP BY 
    a.CountryName
ORDER BY 
    NumberOfFlights DESC;
