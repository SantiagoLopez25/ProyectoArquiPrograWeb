/*
Created: 8/10/2024
Modified: 8/10/2024
Model: MySQL 8.0
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Factura
-- CREATE DATABASE IF NOT EXISTS storeonline;
create database storeonline;
use storeonline;

CREATE TABLE `Factura`
(
  `idFactura` Int NOT NULL AUTO_INCREMENT,
  `fechaFactura` Date NOT NULL,
  `montoTotal` Decimal(18,2) NOT NULL,
  `idCliente` Int,
  `idSerie` Varchar(25) NOT NULL,
  PRIMARY KEY (`idFactura`, `idSerie`)
)
;

CREATE INDEX `IX_Relationship2` ON `Factura` (`idCliente`)
;

-- Table Cliente

CREATE TABLE `Cliente`
(
  `idCliente` Int NOT NULL AUTO_INCREMENT,
  `nombre` Varchar(75) NOT NULL,
  `direccion` Varchar(100) NOT NULL,
  `estado` Boolean NOT NULL DEFAULT true,
  PRIMARY KEY (`idCliente`)
)
;

-- Table Contacto

CREATE TABLE `Contacto`
(
  `idContacto` Int NOT NULL AUTO_INCREMENT,
  `telefono` Varchar(8) NOT NULL,
  `email` Varchar(75) NOT NULL,
  `idCliente` Int,
  PRIMARY KEY (`idContacto`)
)
;

CREATE INDEX `IX_Relationship1` ON `Contacto` (`idCliente`)
;

-- Table SerieFactura

CREATE TABLE `SerieFactura`
(
  `idSerie` Varchar(25) NOT NULL,
  `fechaInicio` Date NOT NULL,
  `estado` Boolean NOT NULL DEFAULT true
)
;

ALTER TABLE `SerieFactura` ADD PRIMARY KEY (`idSerie`)
;

-- Table detalleFactura

CREATE TABLE `detalleFactura`
(
  `idDetalleFactura` Int NOT NULL AUTO_INCREMENT,
  `cantidad` Int NOT NULL,
  `idFactura` Int,
  `idSerie` Varchar(25),
  `idProducto` Int,
  PRIMARY KEY (`idDetalleFactura`)
)
;

CREATE INDEX `IX_Relationship4` ON `detalleFactura` (`idFactura`, `idSerie`)
;

CREATE INDEX `IX_Relationship5` ON `detalleFactura` (`idProducto`)
;

-- Table Producto

CREATE TABLE `Producto`
(
  `idProducto` Int NOT NULL AUTO_INCREMENT,
  `nombre` Varchar(50) NOT NULL,
  `descripcion` Varchar(500),
  `precioVenta` Decimal(12,2) NOT NULL,
  `estado` Boolean NOT NULL DEFAULT true,
  `idTipoProducto` Int,
  `idMarca` Int,
  PRIMARY KEY (`idProducto`)
)
;

CREATE INDEX `IX_Relationship6` ON `Producto` (`idTipoProducto`)
;

CREATE INDEX `IX_Relationship7` ON `Producto` (`idMarca`)
;

-- Table TipoProducto

CREATE TABLE `TipoProducto`
(
  `idTipoProducto` Int NOT NULL AUTO_INCREMENT,
  `nombre` Varchar(50) NOT NULL,
  `estado` Boolean NOT NULL DEFAULT true,
  PRIMARY KEY (`idTipoProducto`)
)
;

-- Table Marca

CREATE TABLE `Marca`
(
  `idMarca` Int NOT NULL AUTO_INCREMENT,
  `nombre` Varchar(50) NOT NULL,
  `estado` Boolean NOT NULL DEFAULT true,
  PRIMARY KEY (`idMarca`)
)
;

-- Table ImagenProducto

CREATE TABLE `ImagenProducto`
(
  `idImagen` Int NOT NULL AUTO_INCREMENT,
  `ruta` Varchar(1000) NOT NULL,
  `nombre` Varchar(50) NOT NULL,
  `idProducto` Int,
  PRIMARY KEY (`idImagen`)
)
;

CREATE INDEX `IX_Relationship8` ON `ImagenProducto` (`idProducto`)
;

-- Table RProductoSucursal

CREATE TABLE `RProductoSucursal`
(
  `idProductoSucursal` Int NOT NULL AUTO_INCREMENT,
  `cantidad` Int NOT NULL,
  `idProducto` Int,
  `idSucursal` Int,
  PRIMARY KEY (`idProductoSucursal`)
)
;

CREATE INDEX `IX_Relationship9` ON `RProductoSucursal` (`idProducto`)
;

CREATE INDEX `IX_Relationship10` ON `RProductoSucursal` (`idSucursal`)
;

-- Table Sucursal

CREATE TABLE `Sucursal`
(
  `idSucursal` Int NOT NULL AUTO_INCREMENT,
  `nombre` Varchar(50) NOT NULL,
  `ubicacion` Varchar(100) NOT NULL,
  `telefono` Varchar(8) NOT NULL,
  `celular` Varchar(8),
  `email` Varchar(50) NOT NULL,
  `estado` Boolean NOT NULL DEFAULT true,
  `direccion` Varchar(100) NOT NULL,
  PRIMARY KEY (`idSucursal`)
)
;

-- Table Empleado

CREATE TABLE `Empleado`
(
  `idEmpleado` Int NOT NULL AUTO_INCREMENT,
  `nombre` Varchar(50) NOT NULL,
  `telefono` Varchar(8) NOT NULL,
  `email` Varchar(50) NOT NULL,
  `estado` Boolean NOT NULL DEFAULT true,
  `idSucursal` Int,
  PRIMARY KEY (`idEmpleado`)
)
;

CREATE INDEX `IX_Relationship11` ON `Empleado` (`idSucursal`)
;


-- Table Rol

CREATE TABLE `Rol`
(
  `idRol` Int NOT NULL AUTO_INCREMENT,
  `nombre` Varchar(30) NOT NULL,
  `estado` Boolean NOT NULL DEFAULT true,
  PRIMARY KEY (`idRol`)
)
;

-- Table Usuario

CREATE TABLE `Usuario`
(
  `idUsuario` Int NOT NULL AUTO_INCREMENT,
  `password` Varbinary(5000) NOT NULL,
  `estado` Boolean NOT NULL DEFAULT true,
  `usuario` Varchar(20) NOT NULL,
  `idEmpleado` Int,
  `idRol` Int,
  PRIMARY KEY (`idUsuario`)
)
;

CREATE INDEX `IX_Relationship12` ON `Usuario` (`idEmpleado`)
;

CREATE INDEX `IX_Relationship14` ON `Usuario` (`idRol`)
;

-- Table Historial

CREATE TABLE `Historial`
(
  `idHistorial` Int NOT NULL AUTO_INCREMENT,
  `descripcion` Varchar(500) NOT NULL,
  `fecha` Datetime NOT NULL,
  `idUsuario` Int,
  PRIMARY KEY (`idHistorial`)
)
;

CREATE INDEX `IX_Relationship13` ON `Historial` (`idUsuario`)
;



-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Contacto` ADD CONSTRAINT `Relationship1` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Factura` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Factura` ADD CONSTRAINT `Relationship3` FOREIGN KEY (`idSerie`) REFERENCES `SerieFactura` (`idSerie`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `detalleFactura` ADD CONSTRAINT `Relationship4` FOREIGN KEY (`idFactura`, `idSerie`) REFERENCES `Factura` (`idFactura`, `idSerie`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `detalleFactura` ADD CONSTRAINT `Relationship5` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Producto` ADD CONSTRAINT `Relationship6` FOREIGN KEY (`idTipoProducto`) REFERENCES `TipoProducto` (`idTipoProducto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Producto` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`idMarca`) REFERENCES `Marca` (`idMarca`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `ImagenProducto` ADD CONSTRAINT `Relationship8` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `RProductoSucursal` ADD CONSTRAINT `Relationship9` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `RProductoSucursal` ADD CONSTRAINT `Relationship10` FOREIGN KEY (`idSucursal`) REFERENCES `Sucursal` (`idSucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Empleado` ADD CONSTRAINT `Relationship11` FOREIGN KEY (`idSucursal`) REFERENCES `Sucursal` (`idSucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
;



ALTER TABLE `Historial` ADD CONSTRAINT `Relationship13` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Usuario` ADD CONSTRAINT `Relationship14` FOREIGN KEY (`idRol`) REFERENCES `Rol` (`idRol`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
ALTER TABLE `Usuario` ADD CONSTRAINT `Relationship12` FOREIGN KEY (`idEmpleado`) REFERENCES `Empleado` (`idEmpleado`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

