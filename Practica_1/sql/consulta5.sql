WITH PassengerCounts AS (
    SELECT 
        a.AirportName,
        COUNT(pf.PassengerID) AS PassengerCount
    FROM 
        Airports a
    JOIN 
        Flights f ON a.AirportID = f.ArrivalAirportID
    JOIN 
        PassengerFlights pf ON f.FlightID = pf.FlightID
    GROUP BY 
        a.AirportName
)
SELECT 
    AirportName,
    PassengerCount
FROM 
    PassengerCounts
ORDER BY 
    PassengerCount DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
