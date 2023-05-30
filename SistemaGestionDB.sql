USE MASTER;
GO

-- CREATE DATABASE IF NOT EXISTS
IF DB_ID('DBSistemaGestion') IS NOT NULL
BEGIN
	ALTER DATABASE DBSistemaGestion SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE DBSistemaGestion;
END
GO

-- CREATE DATABASE
CREATE DATABASE DBSistemaGestion;
GO
-- USE DATABASE
USE DBSistemaGestion;
GO

-- CREATE TABLES
-- USUARIO
CREATE TABLE dbo.usuario(
    Id INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    NombreUsuario NVARCHAR(50),
    Contraseña NVARCHAR(50),
    Mail NVARCHAR(50)
	CONSTRAINT pk_usuario_id PRIMARY KEY (id),
	CONSTRAINT ck_usuario_id CHECK (id>0)
);
GO

-- PRODUCTO
CREATE TABLE dbo.producto(
    Id INT PRIMARY KEY,
    Descripcion NVARCHAR(50),
    Costo DECIMAL(18, 2),
    PrecioVenta DECIMAL(18, 2),
    Stock INT,
    IdUsuario INT

    Id INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Descripcion NVARCHAR(50),
    Precio INT,
    Stock INT
    CONSTRAINT pk_producto_id PRIMARY KEY (id),
    CONSTRAINT ck_producto_id CHECK (id>0)
);

-- PRODUCTO VENDIDO
CREATE TABLE ProductoVendido (
    Id INT PRIMARY KEY,
    IdProducto INT,
    Stock INT,
    IdVenta INT
);

-- VENTA
CREATE TABLE Venta (
    Id INT PRIMARY KEY,
    Comentarios NVARCHAR(200),
    IdUsuario INT
);