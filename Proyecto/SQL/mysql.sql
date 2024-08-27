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
CREATE TABLE TempComp (
    Fecha DATE,
    CodProveedor VARCHAR(10),
    NombreProveedor VARCHAR(255),
    DireccionProveedor VARCHAR(255),
    NumeroProveedor VARCHAR(20),
    WebProveedor VARCHAR(255),
    CodProducto VARCHAR(20),
    NombreProducto VARCHAR(255),
    MarcaProducto VARCHAR(255),
    Categoria VARCHAR(100),
    SodSuSursal VARCHAR(20),
    NombreSucursal VARCHAR(255),
    DireccionSucursal VARCHAR(255),
    Region VARCHAR(100),
    Departamento VARCHAR(100),
    Unidades INT,
    CostoU DECIMAL(18, 2)
);

-- Create the TempVent table
CREATE TABLE TempVent (
    Fecha DATE,
    CodigoCliente VARCHAR(10),
    NombreCliente VARCHAR(255),
    TipoCliente VARCHAR(100),
    DireccionCliente VARCHAR(255),
    NumeroCliente VARCHAR(20),
    CodVendedor VARCHAR(10),
    NombreVendedor VARCHAR(255),
    Vacacionista TEXT,  -- Modified to accept any data type (use TEXT instead of NVARCHAR(MAX))
    CodProducto VARCHAR(20),
    NombreProducto VARCHAR(255),
    MarcaProducto VARCHAR(255),
    Categoria VARCHAR(100),
    SodSuSursal VARCHAR(20),
    NombreSucursal VARCHAR(255),
    DireccionSucursal VARCHAR(255),
    Region VARCHAR(100),
    Departamento VARCHAR(100),
    Unidades INT,
    PrecioUnitario DECIMAL(18, 2)
);
