import os
import pyodbc
from os import system
ruta = ""

def menu():
    print("Menu:")
    print("1. Borrar modelo")
    print("2. Crear modelo")
    print("3. Extraer informacion")
    print("4. Cargar informacion")
    print("5. Realizar consultas")
    print("6. Salir")

    choice = input("Introduce el numero de la opcion: ")

    if choice == "1":
        borrarModelo()
    elif choice == "2":
        crearModelo()
    elif choice == "3":
        extraerInfo()
    elif choice == "4":
        cargarInfo()
    elif choice == "5":
        consultas()
    elif choice == "6":
        print("Saliendo del programa")

    else:
        print("La opcion no es valida")

def borrarModelo():
    try:
        system("sqlcmd -S localhost -d pr1semi2 -U sa -P YourStrong@Passw0rd -i /home/luis/Documentos/Semi/Lab/Semi2_202000343/Practica_1/sql/borrarmodelo.sql -C")
        print("Modelo borrado con exito")
    except:
        print("Error al borrar el modelo")
    menu()

def crearModelo():
    try:
        system("sqlcmd -S localhost -d pr1semi2 -U sa -P YourStrong@Passw0rd -i /home/luis/Documentos/Semi/Lab/Semi2_202000343/Practica_1/sql/crearmodelo.sql -C")
        print("Modelo creado con exito")
    except:
        print("Error al crear el modelo")
    menu()

def extraerInfo():
    global ruta
    ruta = input("Introduce la ruta del archivo: ")
    print("Ruta obtenida")
    menu()

#/home/luis/Documentos/Semi/Lab/Semi2_202000343/Practica_1/data.csv
def cargarInfo():
    # Asegurarse de que 'ruta' contiene el camino correcto al CSV
    global ruta
    print(ruta)
    
    # Configuración de la conexión
    conn_str = 'DRIVER={ODBC Driver 18 for SQL Server};SERVER=localhost;DATABASE=pr1semi2;UID=sa;PWD=YourStrong@Passw0rd;TrustServerCertificate=yes'
    conn = pyodbc.connect(conn_str)

    cursor = conn.cursor()

    # Crear la tabla temporal
    create_temp_table_sql = """
    CREATE TABLE #TempPassengers (
        PassengerID INT,
        FirstName VARCHAR(255),
        LastName VARCHAR(255),
        Gender VARCHAR(10),
        Age INT,
        Nationality VARCHAR(100),
        AirportName VARCHAR(255),
        CountryCode VARCHAR(3),
        CountryName VARCHAR(100),
        Continent VARCHAR(50),
        DepartureDate DATE,
        ArrivalAirport VARCHAR(255),
        PilotName VARCHAR(255),
        FlightStatus VARCHAR(50)
    );
    """
    cursor.execute(create_temp_table_sql)
    conn.commit()

    # Cargar datos en la tabla temporal
    bulk_insert_sql = f"""
    BULK INSERT #TempPassengers
    FROM '{ruta}'
    WITH (
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '\\n',
        FIRSTROW = 2
    );
    """
    cursor.execute(bulk_insert_sql)
    conn.commit()

    # Insertar datos en las tablas permanentes
    insert_data_sql = """
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
    """
    cursor.execute(insert_data_sql)
    conn.commit()

    # Cerrar la conexión
    cursor.close()
    conn.close()

        #print("Datos cargados con exito")
        #menu()
    #except:
        #print("Error al cargar los datos")
        #menu()
    

def consultas():
    print("Consultas")
    print("1. Consulta 1")
    print("2. Consulta 2")
    print("3. Consulta 3")
    print("4. Consulta 4")
    print("5. Consulta 5")
    print("6. Consulta 6")
    print("7. Consulta 7")
    print("8. Consulta 8")
    print("9. Consulta 9")
    print("10. Consulta 10")
    print("11. Volver al menu principal")

    choice2 = input("Elige una consulta: ")

    if choice2 == "1":
        consulta1()
    elif choice2 == "2":
        consulta2()
    elif choice2 == "3":
        consulta3()
    elif choice2 == "4":
        consulta4()
    elif choice2 == "5":
        consulta5()
    elif choice2 == "6":
        consulta6()
    elif choice2 == "7":
        consulta7()
    elif choice2 == "8":
        consulta8()
    elif choice2 == "9":
        consulta9()
    elif choice2 == "10":
        consulta10()
    elif choice2 == "11":
        menu()
    else:
        print("La consulta no es valida")

def consulta1():
    print("Consulta 1")
    consultas()


def consulta2():
    print("Consulta 2")
    consultas()

def consulta3():
    print("Consulta 3")
    consultas()

def consulta4():
    print("Consulta 4")
    consultas()

def consulta5():
    print("Consulta 5")
    consultas()

def consulta6():
    print("Consulta 6")
    consultas()

def consulta7():
    print("Consulta 7")
    consultas()

def consulta8():
    print("Consulta 8")
    consultas()

def consulta9():
    print("Consulta 9")
    consultas()

def consulta10():
    print("Consulta 10")
    consultas()
    

# Example usage
menu()