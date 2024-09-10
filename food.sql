CREATE DATABASE FoodOrderingDB;
USE FoodOrderingDB;
-- Bảng Khách Viếng Thăm (Guest)
CREATE TABLE Guests (
    GuestId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20)
);

-- Bảng Khách Hàng (Customer)
CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE,
    PasswordHash NVARCHAR(256),
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(200)
);

-- Bảng Quản Trị Viên (Admin)
CREATE TABLE Admins (
    AdminId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE,
    PasswordHash NVARCHAR(256)
);

-- Bảng Món Ăn (FoodItems)
CREATE TABLE FoodItems (
    FoodItemId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Description NVARCHAR(500),
    Price DECIMAL(18, 2),
    	Picture NVARCHAR(1000),
    Category NVARCHAR(50)
);

-- Bảng Combo (Combo)
CREATE TABLE Combos (
    ComboId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Description NVARCHAR(500),
    Price DECIMAL(18, 2)
    	
);

-- Bảng Đơn Hàng (Orders)
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerId),
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50)
);

-- Bảng Chi Tiết Đơn Hàng (OrderDetails)
CREATE TABLE OrderDetails (
    OrderDetailId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT FOREIGN KEY REFERENCES Orders(OrderId),
    FoodItemId INT FOREIGN KEY REFERENCES FoodItems(FoodItemId),
    Quantity INT,
    Price DECIMAL(18, 2)
);

-- Bảng Chi Tiết Combo (ComboDetails)
CREATE TABLE ComboDetails (
    ComboDetailId INT PRIMARY KEY IDENTITY(1,1),
    ComboId INT FOREIGN KEY REFERENCES Combos(ComboId),
    FoodItemId INT FOREIGN KEY REFERENCES FoodItems(FoodItemId),
    Quantity INT
);

