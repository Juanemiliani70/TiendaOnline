-- =====================================================
-- BaseDeDatos.sql
-- Parcial 1 - Laboratorio de Programacion 3 - Tienda Online
-- Ejecutar en SQL Server Management Studio
-- =====================================================

-- Crea la base de datos si no existe
IF DB_ID('TiendaOnline') IS NULL
    CREATE DATABASE TiendaOnline;
GO

USE TiendaOnline;
GO

-- Borra las tablas si ya existen (primero productos, porque depende de categorias)
IF OBJECT_ID('productos', 'U') IS NOT NULL DROP TABLE productos;
IF OBJECT_ID('categorias', 'U') IS NOT NULL DROP TABLE categorias;
GO

-- =====================================================
-- CREATE TABLE categorias (se crea primero)
-- =====================================================
CREATE TABLE categorias (
    idCategoria INT IDENTITY(1,1) PRIMARY KEY,  -- clave primaria autoincremental
    descripcion VARCHAR(100) NOT NULL           -- no permite nulos
);
GO

-- =====================================================
-- CREATE TABLE productos (depende de categorias)
-- =====================================================
CREATE TABLE productos (
    idProducto INT IDENTITY(1,1) PRIMARY KEY,   -- clave primaria autoincremental
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    idCategoria INT NOT NULL,                   -- clave foranea hacia categorias
    CONSTRAINT FK_productos_categorias
        FOREIGN KEY (idCategoria)
        REFERENCES categorias(idCategoria)
);
GO

-- =====================================================
-- Datos de ejemplo
-- =====================================================
INSERT INTO categorias (descripcion) VALUES ('Notebooks');
INSERT INTO categorias (descripcion) VALUES ('Celulares');
INSERT INTO categorias (descripcion) VALUES ('Auriculares');
INSERT INTO categorias (descripcion) VALUES ('Accesorios');

INSERT INTO productos (nombre, precio, idCategoria) VALUES ('Notebook Lenovo IdeaPad 15', 850000.00, 1);
INSERT INTO productos (nombre, precio, idCategoria) VALUES ('Notebook HP 14 pulgadas', 720000.00, 1);
INSERT INTO productos (nombre, precio, idCategoria) VALUES ('Samsung Galaxy A15', 310000.00, 2);
INSERT INTO productos (nombre, precio, idCategoria) VALUES ('Auriculares Bluetooth JBL', 95000.00, 3);
INSERT INTO productos (nombre, precio, idCategoria) VALUES ('Mouse inalambrico Logitech', 28000.00, 4);
INSERT INTO productos (nombre, precio, idCategoria) VALUES ('Funda para celular', 9500.00, 4);
GO
