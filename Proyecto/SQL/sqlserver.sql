CREATE DATABASE proyectosemi2
CREATE DATABASE seminario2_202000343 -- crear tablas datawarehouse
use proyectosemi2;

DELETE FROM TempComp;
DELETE FROM TempVent;

DROP TABLE TempVent;
DROP TABLE TempComp;

CREATE TABLE TempComp
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

CREATE TABLE TempVent
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
);