WITH AgeGenderTravelCount AS (
    SELECT
        p.Gender,
        p.Age,
        COUNT(DISTINCT pf.PassengerID) AS TravelCount
    FROM 
        Passengers p
    JOIN 
        PassengerFlights pf ON p.PassengerID = pf.PassengerID
    GROUP BY 
        p.Gender,
        p.Age
),
RankedAgeGender AS (
    SELECT
        Gender,
        Age,
        TravelCount,
        ROW_NUMBER() OVER (PARTITION BY Gender ORDER BY TravelCount DESC) AS rn
    FROM 
        AgeGenderTravelCount
)
SELECT
    Gender AS Genero,
    Age AS Edad,
    TravelCount AS Conteo
FROM 
    RankedAgeGender
WHERE 
    rn <= 5
ORDER BY 
    Gender, Conteo DESC;
