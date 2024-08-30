-- Create databases
CREATE DATABASE proyectosemi2;
-- Use the proyectosemi2 database
USE proyectosemi2;

-- Delete data from the tables if they exist
DELETE FROM TempComp;
DELETE FROM TempVent;

-- Drop the tables if they exist
DROP TABLE IF EXISTS TempVent;
DROP TABLE IF EXISTS TempComp;

-- Create the TempComp table
CREATE TABLE IF NOT EXISTS TempComp
(
    Fecha VARCHAR(15),
    CodProveedor VARCHAR(15),
    NombreProveedor VARCHAR(100),
    DireccionProveedor VARCHAR(200),
    NumeroProveedor VARCHAR(15),
    WebProveedor VARCHAR(2),
    CodProducto VARCHAR(15),
    NombreProducto VARCHAR(100),
    MarcaProducto VARCHAR(50),
    Categoria VARCHAR(50),
    SodSuSucursal VARCHAR(50),
    NombreSucursal VARCHAR(50),
    DireccionSucursal VARCHAR(200),
    Region VARCHAR(50),
    Departamento VARCHAR(50),
    Unidades VARCHAR(20),
    CostoU VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS TempVent
(
    Fecha VARCHAR(15),
    CodCliente VARCHAR(15),
    NombreCliente VARCHAR(100),
    TipoCliente VARCHAR(50),
    DireccionCliente VARCHAR(200),
    NumeroCliente VARCHAR(15),
    CodVendedor VARCHAR(15),
    NombreVendedor VARCHAR(100),
    Vacacionista VARCHAR(5),
    CodProducto VARCHAR(15),
    NombreProducto VARCHAR(100),
    MarcaProducto VARCHAR(50),
    Categoria VARCHAR(50),
    SodSuSucursal VARCHAR(50),
    NombreSucursal VARCHAR(50),
    DireccionSucursal VARCHAR(200),
    Region VARCHAR(50),
    Departamento VARCHAR(50),
    Unidades VARCHAR(20),
    PrecioU VARCHAR(20)
)