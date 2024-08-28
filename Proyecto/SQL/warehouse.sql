use seminario2_202000343;

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
