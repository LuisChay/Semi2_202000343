BULK INSERT TempPassengers
    FROM 'C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\data.csv'
    WITH (
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2,
        CODEPAGE = '65001'
    );
    