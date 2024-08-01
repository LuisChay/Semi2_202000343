
    BULK INSERT #TempPassengers
    FROM '/home/luis/Documentos/Semi/Lab/Semi2_202000343/Practica_1/data.csv'
    WITH (
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    );
    