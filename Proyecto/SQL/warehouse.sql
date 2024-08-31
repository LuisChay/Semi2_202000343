use seminario2_202000343;

/* CREACIÓN DE TABLAS DIMENSIONALES */
DROP TABLE HechosCompras;
DROP TABLE HechosVentas;
DROP TABLE DimTiempo;
DROP TABLE DimProveedor;
DROP TABLE DimCliente;
DROP TABLE DimVendedor;
DROP TABLE DimProducto;
DROP TABLE DimSucursal;

-- Tablas de Dimensiones
-- Dimensión de Productos (Dim_Product)
CREATE TABLE Dim_Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    CodProducto NVARCHAR(20),
    NombreProducto NVARCHAR(255),
    MarcaProducto NVARCHAR(255),
    Categoria NVARCHAR(100),
    Fecha DATE,   -- Fecha de la transacción (compra/venta)
    Unidades INT, -- Unidades compradas/vendidas
    PrecioCosto DECIMAL(18, 2)  -- Costo unitario de compra o precio unitario de venta
);

-- Dimensión de Proveedores (Dim_Supplier)
CREATE TABLE Dim_Supplier (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    CodProveedor NVARCHAR(10),
    NombreProveedor NVARCHAR(255),
    DireccionProveedor NVARCHAR(255),
    NumeroProveedor NVARCHAR(20),
    WebProveedor NVARCHAR(255)
);

-- Dimensión de Clientes (Dim_Customer)
CREATE TABLE Dim_Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCliente NVARCHAR(10),
    NombreCliente NVARCHAR(255),
    TipoCliente NVARCHAR(100),
    DireccionCliente NVARCHAR(255),
    NumeroCliente NVARCHAR(20)
);

-- Dimensión de Vendedores (Dim_Salesperson)
CREATE TABLE Dim_Salesperson (
    SalespersonID INT IDENTITY(1,1) PRIMARY KEY,
    CodVendedor NVARCHAR(10),
    NombreVendedor NVARCHAR(255),
    Vacacionista NVARCHAR(255)
);

-- Dimensión de Tiendas (Dim_Store)
CREATE TABLE Dim_Store (
    StoreID INT IDENTITY(1,1) PRIMARY KEY,
    SodSuSursal NVARCHAR(20),
    NombreSucursal NVARCHAR(255),
    DireccionSucursal NVARCHAR(255),
    Region NVARCHAR(100),
    Departamento NVARCHAR(100),
);

-- Tablas de Hechos

-- Tabla de Hechos de Compras (Fact_Compra)
CREATE TABLE Fact_Compra (
    CompraID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    SupplierID INT,
    StoreID INT,
    FOREIGN KEY (ProductID) REFERENCES Dim_Product(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Dim_Supplier(SupplierID),
    FOREIGN KEY (StoreID) REFERENCES Dim_Store(StoreID)
);

-- Tabla de Hechos de Ventas (Fact_Venta)
CREATE TABLE Fact_Venta (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SalespersonID INT,
    StoreID INT,
    FOREIGN KEY (ProductID) REFERENCES Dim_Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Dim_Customer(CustomerID),
    FOREIGN KEY (SalespersonID) REFERENCES Dim_Salesperson(SalespersonID),
    FOREIGN KEY (StoreID) REFERENCES Dim_Store(StoreID)
);
-- ---------------------------------------------------------


CREATE TABLE DimTiempo
(
    IdTiempo INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE,
    Anio INT,
    Mes INT,
    Dia INT
);

CREATE TABLE DimProveedor
(
    IdProveedor             INT PRIMARY KEY IDENTITY(1,1),
    CodProveedor            VARCHAR(5),
    NombreProveedor         VARCHAR(150),
    DireccionProveedor      VARCHAR(200),
    NumeroTelefonoProveedor VARCHAR(8),
    WebProveedor            VARCHAR(2)
);

CREATE TABLE DimCliente
(
    IdCliente INT PRIMARY KEY IDENTITY(1,1),
    CodCliente VARCHAR(5),
    NombreCliente VARCHAR(100),
    TipoCliente VARCHAR(50),
    DireccionCliente VARCHAR(200),
    NumeroCliente VARCHAR(8)
);

CREATE TABLE DimVendedor
(
    IdVendedor INT PRIMARY KEY IDENTITY(1,1),
    CodVendedor VARCHAR(5),
    NombreVendedor VARCHAR(100),
    Vacacionista INT
);

CREATE TABLE DimProducto
(
    IdProducto INT PRIMARY KEY IDENTITY(1,1),
    CodProducto VARCHAR(7),
    NombreProducto VARCHAR(100),
    MarcaProducto VARCHAR(50),
    Categoria VARCHAR(50)
);

CREATE TABLE DimSucursal
(
    IdSucursal INT PRIMARY KEY IDENTITY(1,1),
    SodSuSucursal VARCHAR(5),
    NombreSucursal VARCHAR(50),
    DireccionSucursal VARCHAR(200),
    Region VARCHAR(50),
    Departamento VARCHAR(50)
);

/* CREACIÓN DE TABLAS DE HECHOS */
CREATE TABLE HechosCompras
(
    IdCompra INT PRIMARY KEY IDENTITY(1,1),
    IdTiempo INT,
    IdProveedor INT,
    IdProducto INT,
    IdSucursal INT,
    Unidades INT,
    CostoUnitario DECIMAL(10,2),
    FOREIGN KEY (IdTiempo) REFERENCES DimTiempo(IdTiempo),
    FOREIGN KEY (IdProveedor) REFERENCES DimProveedor(IdProveedor),
    FOREIGN KEY (IdProducto) REFERENCES DimProducto(IdProducto),
    FOREIGN KEY (IdSucursal) REFERENCES DimSucursal(IdSucursal)
);

CREATE TABLE HechosVentas
(
    IdVenta INT PRIMARY KEY IDENTITY(1,1),
    IdTiempo INT,
    IdCliente INT,
    IdVendedor INT,
    IdProducto INT,
    IdSucursal INT,
    Unidades INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (IdTiempo) REFERENCES DimTiempo(IdTiempo),
    FOREIGN KEY (IdCliente) REFERENCES DimCliente(IdCliente),
    FOREIGN KEY (IdVendedor) REFERENCES DimVendedor(IdVendedor),
    FOREIGN KEY (IdProducto) REFERENCES DimProducto(IdProducto),
    FOREIGN KEY (IdSucursal) REFERENCES DimSucursal(IdSucursal)
);