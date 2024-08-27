CREATE DATABASE proyectosemi2
CREATE DATABASE seminario2_202000343 -- crear tablas datawarehouse
use proyectosemi2;

DELETE FROM TempComp;
DELETE FROM TempVent;

DROP TABLE TempVent;
DROP TABLE TempComp;


CREATE TABLE TempComp (
    Fecha DATE,
    CodProveedor NVARCHAR(10),
    NombreProveedor NVARCHAR(255),
    DireccionProveedor NVARCHAR(255),
    NumeroProveedor NVARCHAR(20),
    WebProveedor NVARCHAR(255),
    CodProducto NVARCHAR(20),
    NombreProducto NVARCHAR(255),
    MarcaProducto NVARCHAR(255),
    Categoria NVARCHAR(100),
    SodSuSursal NVARCHAR(20),
    NombreSucursal NVARCHAR(255),
    DireccionSucursal NVARCHAR(255),
    Region NVARCHAR(100),
    Departamento NVARCHAR(100),
    Unidades INT,
    CostoU DECIMAL(18, 2)
);

CREATE TABLE TempVent (
    Fecha DATE,
    CodigoCliente NVARCHAR(10),
    NombreCliente NVARCHAR(255),
    TipoCliente NVARCHAR(100),
    DireccionCliente NVARCHAR(255),
    NumeroCliente NVARCHAR(20),
    CodVendedor NVARCHAR(10),
    NombreVendedor NVARCHAR(255),
    Vacacionista NVARCHAR(MAX),  -- Modified to accept any data type
    CodProducto NVARCHAR(20),
    NombreProducto NVARCHAR(255),
    MarcaProducto NVARCHAR(255),
    Categoria NVARCHAR(100),
    SodSuSursal NVARCHAR(20),
    NombreSucursal NVARCHAR(255),
    DireccionSucursal NVARCHAR(255),
    Region NVARCHAR(100),
    Departamento NVARCHAR(100),
    Unidades INT,
    PrecioUnitario DECIMAL(18, 2)
);
