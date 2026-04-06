-- 1. T?o Database
CREATE DATABASE Hang;
GO
USE Hang;
GO

-- 2. T?o b?ng Category (Danh m?c)
CREATE TABLE Category (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);

-- 3. T?o b?ng Supplier (Nhà cung c?p)
CREATE TABLE Supplier (
    SupplierId INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(200) NOT NULL,
    ContactName NVARCHAR(100)
);

-- 4. T?o b?ng Product (S?n ph?m)
-- Thi?t l?p 1-n v?i Category và Supplier
CREATE TABLE Product (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(200) NOT NULL,
    Price DECIMAL(18,2) DEFAULT 0,
    CategoryId INT,
    SupplierId INT,
    -- Khóa ngo?i
    CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId),
    CONSTRAINT FK_Product_Supplier FOREIGN KEY (SupplierId) REFERENCES Supplier(SupplierId)
);

-- 5. T?o b?ng Order (??n hàng)
CREATE TABLE [Order] (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME DEFAULT GETDATE(),
    CustomerName NVARCHAR(200)
);

-- 6. T?o b?ng OrderDetail (Chi ti?t ??n hàng)
-- Thi?t l?p 1-n v?i Order và Product
CREATE TABLE OrderDetail (
    OrderDetailId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT,
    ProductId INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2),
    -- Khóa ngo?i
    CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (OrderId) REFERENCES [Order](OrderId),
    CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);