import os
import pyodbc
from os import system
ruta = ""
from datetime import datetime

def menu():
    print("================MENU+===============")
    print("1. Borrar modelo")
    print("2. Crear modelo")
    print("3. Extraer informacion")
    print("4. Cargar informacion")
    print("5. Realizar consultas")
    print("6. Salir")
    print("=====================================")

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
        menu()



def borrarModelo():
    try:
        print("============BORRAR MODELO============")
        ruta = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\borrarmodelo.sql"
        comando = f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{ruta}" -C'
        os.system(comando)
        print("Modelo borrado con éxito")
    except Exception as e:
        print(f"Error al borrar el modelo: {e}")
    menu()


def crearModelo():
    try:
        print("===========CREAR MODELO============")
        ruta = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\crearmodelo.sql"
        # Asegúrate de usar la interpolación de cadenas correctamente
        comando = f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{ruta}" -C'
        os.system(comando)
        print("Modelo creado con éxito")
    except Exception as e:
        print(f"Error al crear el modelo: {e}")
    menu()

def extraerInfo():
    global ruta
    print("============EXTRAER INFORMACION===========")
    ruta = input("Introduce la ruta del archivo: ")
    print("Ruta obtenida")
    
    bulk_insert_sql = f"""BULK INSERT TempPassengers
    FROM '{ruta}'
    WITH (
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '\\n',
        FIRSTROW = 2,
        CODEPAGE = '65001'
    );
    """
    #Creamos archivo SQL
    with open("sql/bulkinsert.sql", "w") as f:
        f.write(bulk_insert_sql)
    
    menu()

# C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\data.csv
def cargarInfo():
    global ruta
    if not ruta:
        print("La ruta no está especificada")
        return


    print("============CARGAR INFORMACION===========")
    rutatablatemp = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\creartemp.sql"
    rutabulkinsert = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\bulkinsert.sql"
    rutainsert = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\insertardatos.sql"
    try:
        system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutatablatemp}" -C')
    except Exception as e:
        print(f"Error al crear la tabla temporal: {e}")
            
    try:    
        system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutabulkinsert}" -C')
    except Exception as e:
        print(f"Error al cargar la información: {e}")
        
    try:        
        system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutainsert}" -C')
    except Exception as e:
        print(f"Error al insertar los datos: {e}")
    
    print("Información cargada con éxito")
    menu()
        

def consultas():
    print("==============CONSULTAS=============")
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
    print("=====================================")

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
        consultas()


def consulta1():
    print("==========CONSULTA 1===========")
    rutaconsulta1 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta1.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta1.txt"

    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta1}" -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta1}" -o "{rutaout}" -C')
    consultas()

def consulta2():
    print("==========CONSULTA 2===========")
    rutaconsulta2 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta2.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta2.txt"
    
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta2}" -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta2}" -o "{rutaout}" -C')
    consultas()

def consulta3():
    print("==========CONSULTA 3===========")
    rutaconsulta3 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta3.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta3.txt"
    
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta3}" -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta3}" -o "{rutaout}" -C')
    consultas()

def consulta4():
    print("==========CONSULTA 4===========")
    rutaconsulta4 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta4.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta4.txt"
    
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta4}" -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta4}" -o "{rutaout}" -C')
    consultas()

def consulta5():
    print("==========CONSULTA 5===========")
    rutaconsulta5 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta5.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta5.txt"
    
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta5}" -W -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta5}" -o "{rutaout}" -W -C')
    consultas()

def consulta6():
    print("==========CONSULTA 6===========")
    rutaconsulta6 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta6.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta6.txt"
    
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta6}" -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta6}" -o "{rutaout}" -C')
    consultas()

def consulta7():
    print("==========CONSULTA 7===========")
    rutaconsulta7 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta7.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta7.txt"
    
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta7}" -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta7}" -o "{rutaout}" -C')
    consultas()

def consulta8():
    print("==========CONSULTA 8===========")
    rutaconsulta8 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta8.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta8.txt"
    
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta8}" -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta8}" -o "{rutaout}" -C')
    
    consultas()

def consulta9():
    print("==========CONSULTA 9===========")
    rutaconsulta9 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta9.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta9.txt"
    
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta9}" -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta9}" -o "{rutaout}" -C')    
    consultas()

def consulta10():
    print("==========CONSULTA 10===========")
    rutaconsulta10 = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\sql\consulta10.sql"
    rutaout = r"C:\Users\Admin\Documents\U\wDecimo Semestre\Semi\Lab\Semi2_202000343\Practica_1\out\consulta10.txt"
    
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta10}"  -W -C')
    system(f'sqlcmd -S (localdb)\\MSSQLLocalDB -d pr1semi2 -i "{rutaconsulta10}" -o "{rutaout}" -W -C')
    consultas()
    

menu()