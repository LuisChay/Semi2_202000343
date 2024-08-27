-- DIMENSION
-- Product Dimension
CREATE TABLE Dim_Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    CodProducto VARCHAR(20),
    NombreProducto VARCHAR(255),
    MarcaProducto VARCHAR(255),
    Categoria VARCHAR(100)
);

-- Supplier Dimension (specific to purchases)
CREATE TABLE Dim_Supplier (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    CodProveedor VARCHAR(10),
    NombreProveedor VARCHAR(255),
    DireccionProveedor VARCHAR(255),
    NumeroProveedor VARCHAR(20),
    WebProveedor VARCHAR(255)
);

-- Customer Dimension (specific to sales)
CREATE TABLE Dim_Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCliente VARCHAR(10),
    NombreCliente VARCHAR(255),
    TipoCliente VARCHAR(100),
    DireccionCliente VARCHAR(255),
    NumeroCliente VARCHAR(20)
);

-- Store Dimension
CREATE TABLE Dim_Store (
    StoreID INT IDENTITY(1,1) PRIMARY KEY,
    SodSuSursal VARCHAR(20),
    NombreSucursal VARCHAR(255),
    DireccionSucursal VARCHAR(255),
    Region VARCHAR(100),
    Departamento VARCHAR(100)
);


-- HECHOS

-- Purchase Fact Table
CREATE TABLE Fact_Compra (
    CompraID INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,   -- Date column for the purchase date
    ProductID INT,
    SupplierID INT,
    StoreID INT,
    Unidades INT,
    CostoU DECIMAL(18, 2),
    FOREIGN KEY (ProductID) REFERENCES Dim_Product(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Dim_Supplier(SupplierID),
    FOREIGN KEY (StoreID) REFERENCES Dim_Store(StoreID)
);

-- Sales Fact Table
CREATE TABLE Fact_Venta (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,   -- Date column for the sales date
    ProductID INT,
    CustomerID INT,
    StoreID INT,
    Unidades INT,
    PrecioUnitario DECIMAL(18, 2),
    Vacacionista VARCHAR(20),
    FOREIGN KEY (ProductID) REFERENCES Dim_Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Dim_Customer(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Dim_Store(StoreID)
);
