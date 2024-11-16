-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2024 a las 07:02:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `storeonline`;
USE `storeonline`;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `storeonline`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `direccion`, `estado`) VALUES
(1, 'Manuel Rodríguez', '43 avenida zona 4 Quetzaltenango, Quetzaltenango', 1),
(2, 'Juan Pérez', '5 calle zona 1 Quetzaltenango, Quetzaltenango', 1),
(3, 'Gabriela Munguia', '13 calle zona 10 Quetzaltenango, Quetzaltenango', 1),
(4, 'Antonio Martinez', '14 calle zona 8 Quetzaltenango, Quetzaltenango', 1),
(5, 'Alejandro Requena', '14 calle zona 3 Quetzaltenango, Quetzaltenango', 1),
(6, 'Mariano Baquiax', '10 avenida zona 8 Quetzaltenango, Quetzaltenango', 1),
(7, 'Davidsos', 'de Totoyork', 1),
(8, 'Alejandro Requena', '14 calle zona 3 Quetzaltenango, Quetzaltenango', 1),
(9, 'Victor Hugo', '4ta calle zona 5 Quetzaltenango', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idCompra` int(11) NOT NULL,
  `idProductoSucursal` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `idContacto` int(11) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `email` varchar(75) NOT NULL,
  `idCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`idContacto`, `telefono`, `email`, `idCliente`) VALUES
(1, '12345678', 'mauenl2@gmail.com', 1),
(2, '33441156', 'juanp@gmail.com', 2),
(3, '33441156', 'juanp4@gmail.com', 2),
(4, '44551678', 'victor@gmail.com', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `idDetalleFactura` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idFactura` int(11) DEFAULT NULL,
  `idSerie` varchar(25) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `idSucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `nombre`, `telefono`, `email`, `estado`, `idSucursal`) VALUES
(1, 'Juan', '85120354', 'juancho@technology.com.gt', 1, 5),
(2, 'Miguel', '02024596', 'bob@technology.com.gt', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `fechaFactura` date NOT NULL,
  `montoTotal` decimal(18,2) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idSerie` varchar(25) NOT NULL,
  `idSucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `idHistorial` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fecha` datetime NOT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenproducto`
--

CREATE TABLE `imagenproducto` (
  `idImagen` int(11) NOT NULL,
  `ruta` varchar(1000) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imagenproducto`
--

INSERT INTO `imagenproducto` (`idImagen`, `ruta`, `nombre`, `idProducto`) VALUES
(1, 'https://i.blogs.es/79a3b7/1366_2000/500_500.jpeg', 'Samsung Galaxy S21', 1),
(2, 'https://www.lg.com/us/images/refrigerators/md07500695/gallery/desktop-01.jpg', 'LG Smart Refrigerator', 2),
(3, 'https://www.hoxtonmacs.co.uk/cdn/shop/products/apple-macbook-pro-13-inch-macbook-pro-13-inch-m1-space-grey-2020-fair-40354911191356.jpg?v=1680262183', 'Apple MacBook Pro', 3),
(4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwppz6o7Mf8cgG5x9DFpZtFefRvvBJ_cPNMQ&s', 'Sony Bravia TV', 4),
(5, 'https://i.blogs.es/e28772/img_7621/1366_2000.jpg', 'Huawei MatePad Pro', 5),
(6, 'https://i.blogs.es/7504f7/captura-de-pantalla-2022-08-11-a-las-15.23.49/650_1200.jpeg', 'Xiaomi Mi Smartwatch', 6),
(7, 'https://www.cnet.com/a/img/resize/9d56072ccf4afebce8fb20e8d4e85c8d330399e1/hub/2017/09/26/4c6ec5f4-8dcb-45c7-8770-e87208e3d3ae/17bose-quietcomfort-35-ii.jpg?auto=webp&fit=crop&height=1200&width=1200', 'Bose QuietComfort 35', 7),
(8, 'https://amateurphotographer.com/wp-content/uploads/sites/7/2020/12/Intro-1-Canon_EOS_R6.jpg', 'Canon EOS R6', 8),
(9, 'https://i.blogs.es/cf5de6/switch/1366_2000.jpg', 'Nintendo Switch OLED', 9),
(10, 'https://sm.ign.com/ign_latam/news/m/microsoft-/microsoft-working-on-why-ps5-outperforms-xbox-series-x-on-ce_q9vy.jpg', 'Microsoft Xbox Series X', 10),
(11, 'https://i.blogs.es/f93223/iphone-13-pro-00-01/1366_2000.jpg', 'Apple iPhone 13', 11),
(12, 'https://i.pinimg.com/736x/d4/74/88/d474886eafe1edd3d2fb0d20831777ba.jpg', 'LG InstaView Refrigerator', 12),
(13, 'https://movicenter.com.pa/wp-content/uploads/2022/09/1260236-samsung-galaxy-tab-s7.jpg', 'Samsung Galaxy Tab S7', 13),
(14, 'https://cellexportgt.com/cdn/shop/products/s-l1000_8fba621c-f45e-4e37-be4c-e9103836cee0.jpg?v=1655865379&width=1000', 'Sony WH-1000XM4', 14),
(15, 'https://img.pacifiko.com/PROD/resize/0/1000x1000/Vogue-L29D.jpg', 'Huawei P40 Pro', 15),
(16, 'https://cdn.dxomark.com/wp-content/uploads/medias/post-74427/bose_soundlink_revolveII.jpg', 'Bose SoundLink Revolve', 16),
(17, 'https://i.blogs.es/e2801a/00-xiaomi-mi-11-01/840_560.jpg', 'Xiaomi Mi 11', 17),
(18, 'https://www.ephotozine.com/articles/sony-alpha-xx-xx-announced-32006/images/highres-Sony-Alpha-A7-III-2-Custom_1519667443.jpg', 'Sony Alpha a7 III', 18),
(19, 'https://i5.walmartimages.com/seo/Microsoft-Surface-Pro-7-12-3-Touch-Screen-Intel-Core-i7-16GB-Memory-512GB-Solid-State-Drive-Matte-Black-VAT-00016_b1bfeab5-7941-45c0-b9eb-9b1d6edb5f3c.4028a3c80729fd2f07f948d4e86c371e.jpeg', 'Microsoft Surface Laptop 4', 19),
(20, 'https://www.tecnofacil.com.gt/media/catalog/product/cache/0a3c9f56440fe010e3e9b5a77fcf2268/H/R/HRHSDAZAA_2_1.jpg', 'Nintendo Switch Lite', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `nombre`, `estado`) VALUES
(1, 'Samsung', 1),
(2, 'LG', 1),
(3, 'Apple', 1),
(4, 'Sony', 1),
(5, 'Huawei', 1),
(6, 'Xiaomi', 1),
(7, 'Bose', 1),
(8, 'Canon', 1),
(9, 'Nintendo', 1),
(10, 'Microsoft', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precioVenta` decimal(12,2) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `idTipoProducto` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `descripcion`, `precioVenta`, `estado`, `idTipoProducto`, `idMarca`) VALUES
(1, 'Samsung Galaxy S21', 'Smartphone con pantalla AMOLED de 6.2 pulgadas', 799.99, 1, 1, 1),
(2, 'LG Smart Refrigerator', 'Refrigerador inteligente con pantalla táctil y conexión WiFi', 1599.99, 1, 2, 2),
(3, 'Apple MacBook Pro', 'Laptop con chip M1 de 13 pulgadas', 1299.99, 1, 3, 3),
(4, 'Sony Bravia 55\"', 'Televisor 4K UHD con HDR y Android TV', 999.99, 1, 4, 4),
(5, 'Huawei MatePad Pro', 'Tablet con pantalla 10.8 pulgadas y procesador Kirin 9000E', 699.99, 1, 5, 5),
(6, 'Xiaomi Mi Smartwatch', 'Smartwatch con pantalla AMOLED de 1.39 pulgadas', 199.99, 1, 6, 6),
(7, 'Bose QuietComfort 35', 'Auriculares inalámbricos con cancelación de ruido', 349.99, 1, 7, 7),
(8, 'Canon EOS R6', 'Cámara mirrorless de 20.1 MP y grabación 4K', 2499.99, 1, 8, 8),
(9, 'Nintendo Switch OLED', 'Consola de videojuegos híbrida con pantalla OLED de 7 pulgadas', 349.99, 1, 9, 9),
(10, 'Microsoft Xbox Series X', 'Consola de videojuegos 4K UHD con SSD de 1TB', 499.99, 1, 9, 10),
(11, 'Apple iPhone 13', 'Smartphone con chip A15 Bionic y pantalla Super Retina XDR', 999.99, 1, 1, 3),
(12, 'LG InstaView Refrigerator', 'Refrigerador con tecnología InstaView Door-in-Door', 1899.99, 1, 2, 2),
(13, 'Samsung Galaxy Tab S7', 'Tablet con pantalla de 11 pulgadas y 120Hz de refresco', 649.99, 1, 5, 1),
(14, 'Sony WH-1000XM4', 'Auriculares con cancelación de ruido y hasta 30 horas de batería', 299.99, 1, 7, 4),
(15, 'Huawei P40 Pro', 'Smartphone con cámara Ultra Vision Leica de 50MP', 899.99, 1, 1, 5),
(16, 'Bose SoundLink Revolve', 'Altavoz portátil con sonido de 360 grados', 199.99, 1, 10, 7),
(17, 'Xiaomi Mi 11', 'Smartphone con pantalla AMOLED de 6.81 pulgadas y 120Hz de refresco', 749.99, 1, 1, 6),
(18, 'Sony Alpha a7 III', 'Cámara mirrorless de fotograma completo con sensor de 24.2MP', 1999.99, 1, 8, 4),
(19, 'Microsoft Surface Laptop 4', 'Laptop de 13.5 pulgadas con procesador Intel Core i5', 999.99, 1, 3, 10),
(20, 'Nintendo Switch Lite', 'Consola portátil de videojuegos con pantalla de 5.5 pulgadas', 199.99, 1, 9, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `nombre`, `estado`) VALUES
(1, 'Administrador', 1),
(2, 'Gerente', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rproductosucursal`
--

CREATE TABLE `rproductosucursal` (
  `idProductoSucursal` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `idSucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rproductosucursal`
--

INSERT INTO `rproductosucursal` (`idProductoSucursal`, `cantidad`, `idProducto`, `idSucursal`) VALUES
(1, 5, 1, 1),
(2, 12, 2, 1),
(3, 7, 3, 1),
(4, 20, 4, 1),
(5, 33, 5, 1),
(6, 8, 6, 1),
(7, 15, 7, 1),
(8, 9, 8, 1),
(9, 14, 9, 1),
(10, 21, 10, 1),
(11, 10, 11, 1),
(12, 18, 12, 1),
(13, 6, 13, 1),
(14, 25, 14, 1),
(15, 30, 15, 1),
(16, 17, 16, 1),
(17, 3, 17, 1),
(18, 13, 18, 1),
(19, 4, 19, 1),
(20, 22, 20, 1),
(21, 6, 1, 2),
(22, 19, 2, 2),
(23, 11, 3, 2),
(24, 5, 4, 2),
(25, 8, 5, 2),
(26, 23, 6, 2),
(27, 14, 7, 2),
(28, 7, 8, 2),
(29, 12, 9, 2),
(30, 18, 10, 2),
(31, 16, 11, 2),
(32, 9, 12, 2),
(33, 21, 13, 2),
(34, 4, 14, 2),
(35, 27, 15, 2),
(36, 11, 16, 2),
(37, 13, 17, 2),
(38, 3, 18, 2),
(39, 25, 19, 2),
(40, 5, 20, 2),
(41, 13, 1, 3),
(42, 17, 2, 3),
(43, 5, 3, 3),
(44, 8, 4, 3),
(45, 6, 5, 3),
(46, 15, 6, 3),
(47, 9, 7, 3),
(48, 4, 8, 3),
(49, 21, 9, 3),
(50, 16, 10, 3),
(51, 12, 11, 3),
(52, 10, 12, 3),
(53, 7, 13, 3),
(54, 23, 14, 3),
(55, 11, 15, 3),
(56, 19, 16, 3),
(57, 14, 17, 3),
(58, 6, 18, 3),
(59, 20, 19, 3),
(60, 9, 20, 3),
(61, 9, 1, 4),
(62, 5, 2, 4),
(63, 22, 3, 4),
(64, 14, 4, 4),
(65, 18, 5, 4),
(66, 13, 6, 4),
(67, 8, 7, 4),
(68, 11, 8, 4),
(69, 3, 9, 4),
(70, 17, 10, 4),
(71, 4, 11, 4),
(72, 25, 12, 4),
(73, 10, 13, 4),
(74, 16, 14, 4),
(75, 6, 15, 4),
(76, 12, 16, 4),
(77, 7, 17, 4),
(78, 15, 18, 4),
(79, 19, 19, 4),
(80, 2, 20, 4),
(81, 20, 1, 5),
(82, 14, 2, 5),
(83, 6, 3, 5),
(84, 11, 4, 5),
(85, 10, 5, 5),
(86, 7, 6, 5),
(87, 18, 7, 5),
(88, 4, 8, 5),
(89, 22, 9, 5),
(90, 15, 10, 5),
(91, 3, 11, 5),
(92, 19, 12, 5),
(93, 9, 13, 5),
(94, 13, 14, 5),
(95, 16, 15, 5),
(96, 8, 16, 5),
(97, 12, 17, 5),
(98, 5, 18, 5),
(99, 17, 19, 5),
(100, 21, 20, 5),
(101, 15, 1, 6),
(102, 4, 2, 6),
(103, 19, 3, 6),
(104, 7, 4, 6),
(105, 12, 5, 6),
(106, 16, 6, 6),
(107, 14, 7, 6),
(108, 9, 8, 6),
(109, 5, 9, 6),
(110, 20, 10, 6),
(111, 18, 11, 6),
(112, 3, 12, 6),
(113, 8, 13, 6),
(114, 22, 14, 6),
(115, 6, 15, 6),
(116, 17, 16, 6),
(117, 13, 17, 6),
(118, 10, 18, 6),
(119, 11, 19, 6),
(120, 2, 20, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seriefactura`
--

CREATE TABLE `seriefactura` (
  `idSerie` varchar(25) NOT NULL,
  `fechaInicio` date NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seriefactura`
--

INSERT INTO `seriefactura` (`idSerie`, `fechaInicio`, `estado`) VALUES
('A-01', '2024-08-01', 1),
('A-02', '2024-10-01', 1),
('B-01', '2024-08-15', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0UveC8xDlPKwgwMghumQHWEc4OLB1U4WlsgFnqEN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmJ6WW1VWjZCdUdJcVBqc05qcGRJZ0ptNHFla2wwZTJCMXRtZDd3QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731631178),
('15BApYdMjHfEH8mL6VHnvtCYgLfzfPEpQBlrV7Zc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmtVbDVSUHBSNFhOY0hNbjd5eGlKWUlGa2NUUXpzeEZUczRBcUY3VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731637732),
('2ZModFLHgSgyXHswhV2AclCmvvxTvRQNkDThvMpt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzV4QUpjMGQ5SzIyTlhaTUVVb3BtRlNGS1JYcW1YSHUzbFdadXJQSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641167),
('4EKXyC8dIe5QO1DBJfeONtAA6RRwrxHdCWNPilwc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFVNSTRDRHMxSnI3ZkJ1V1p1c1Brb3RRcWFmS1p3TDZ5VWRIZk9iZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731631375),
('4Qmz5c3Mqb1A0wW136uE0YIPVN54mudfpbdWMM5C', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjNGMzlSd1N4RzdjcGttTjM4UEcxV3ZIeEk1VG1WckgxTWQ4VDhUaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731631750),
('5RFaq54ZySCDk7iWjw9HgZZxaQFh5FjRoFpqjz07', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGQ2REQybXBlRkdSTm9XektsNEdVWHRpaTBFYXVtdEsxZjRXZk5vcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726587),
('5rjrAKCR092cHU1X5iFK6ZEZaVRGL2cyUTtFZRHq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmZnTmF5OHNtcVRUckk2aW91WlRiWDdxbEh5T2xMWlRub09nNW56ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726691),
('5shEsE8ARcEoFLVKTWefZ9c1B67pQpZnEpeeaIiL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlFPSXVwNWF5cmRwa0FDeERtZnNUMHN4VGtkbXg0VlpJMVFqeXFKeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641431),
('5UcEMK3W24qpB5yQEfVdcNkoGMKTJs3iilHQdXQA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0cyWTVhVWM5SFRmUGRNNEcyamhBYmNFZEZ0R2xlc1Z0cW9YenJvZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641177),
('5XUqToMKqVbrvjgoGD9nrCzO1lyWlNRSZ1o6GZGW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTc4a2JEbXl0RFJCMUNjbUE5TUtISDhTQ0IyRnAyeWROeDYxNkNLYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731636097),
('5zl43NhsXwVOt7ksbCt2gOeNPkcZor9TWRXBKBT1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFBtaTdTbGlocjQ3SWlObmVySkRFekN6M0oyalVkbDJoUHRQQ04wdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731727019),
('6dZmHaYAQObfoDSnZH71FkvtBOpTy8GDEp1e85xb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFR1MVNSR091U0pqckRwMXVRUmgzMExTQkprRVFsa0J6Qng4dHJGSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731633064),
('78451tvXscyvkOnPLg8VftHcU5lnHCRkGw4ZSsP4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkxqODhHbE0wMURUTGpqMExnR05pQ2hHdnFDV0dQdlFGNk02SDJvSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXN1YXJpb3MvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1731729108),
('8K5RzJQJbvjL4lDv9Ymkw6rq0JcO7YbyUEESCvhi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmYxOFplOTNvZEZQZzVvNVJwNlM5cVpPdDEwaGdrVnNJMDNyVDJPMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725044),
('8VfKyRWrelToxg9kImizxgwRg34OPIlWhjT9hZsl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGlFN0t1S2RtM0k0MTVrS2xwRkJOVmI1RVRtVTZKSnVQUkdZbEIwbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725020),
('9aCohuPK9teVjX3Fh7RLnEbBXExCDf3oXQBemGD9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDRFQVJzVEk1blg1MXRwMEZiYkljZ2hPanl3NVhURDFmUXlGZ3ZFQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726656),
('aXWfUkq7JcYBQx6vyceuV2BtDKdYm0GtvKA5YcpW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDRLclQwSUI4NGhFbVp4TkIxdkVkSkl0Tmx1bU9palV5aHlMaUpZVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731638519),
('beNLvJkvX2tbfc36GV4kwokslvEAVrFJiMSulGBF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkFxM1VsalFOZ284UW9mWFFZQUdzcUVobWJzZVh6a25TemQ2Rkk2VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641588),
('BErOjIfP07zPXkJItCqhqI895jZS6YPsWA8Ou554', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkVIZGdRN3Z4cUljNTRrb3ZvYnBWVkNQMU40NTNWM2FYclc3VkVxWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731640825),
('bVkgwUpry3Z063B19AjpcMUW5HnIx1ODtH2Z2Zqt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3VhNDB3c2xyd3VtQVdUMEQzVkE1eUFDNmE2Sk9zZXBYbHlZbmtPMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726635),
('Cbz8CoZhCQbiHz28UvgnDZ8mUtM7973fEEWvrUSs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2tqeEM3a3JIck1xdFpvVVVoNm9EbGJ0U1dvVzg0QmdrVU9WbU5NUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731735506),
('cjVzrWfGIdhOR4TYYJWDPJNcHCzCIXqx8E0qsaSC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0l1ZjlxdkpiYmN0ZFk2ekM3d242b2xIcmZmWVpUTnYwaHlpaGJXMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731640810),
('CLUczAiLBnWHp7rJW9zCm89H6VpJIBwsCXi5MGyZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1pFZUo0VUFkOFNqblR2UVpqSlFwekRxOTVKbFZ2NEJHaEQxalY3ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731724464),
('Cnlk7uy1WJDYL2LehSO5sNf2Xy1ICWfdblD8u4Oc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUFaVHBXUU03dkhDekJ0TDc1V1BkYVlzV045djBQQU1rdkxxTDFXdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726613),
('cSJgYB66n1pfy6a9McqbAkAcHlqDwkigJLCcfLcT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV3o0NFFic0U5bXJhSm5aY3pkc0tkYkk5YW16Z0lqaEx3Y2l2OTRmQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731641717),
('d54i9X8OTQZb2SLzTgP1WN7YrB7w8rPv5RgLPxmw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkhXSkltRnc4cWFyQ0NGeW85THBhT1VNNGVrUjBvbENiajVzb3VEYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641057),
('D7VGr5cBu6nx99s7SDlif6YYY0WXh9qIIohntFvZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDZhTHNXTDRwYmZQbDBBV2tlYXg2WmJrYWZTcElZWUN5RzF2WmNZMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731730038),
('DBfhQeC7HOhD04xzFrEvg61bQZn0PTkdmsJl5K3D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR01MekpUWENLY29GSG5BQUFLbVBiZEdBTGhHVjJnM1JJelZVV1BqOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641964),
('F8VrE7s3UyFG0WkcT5dmjunOXCzHfKnLqYZMnNfn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDM2a2ptVjA1V0ZMeFozaEI2VDlXaUFEM1dVMVF6YzRLNzBXb1hhZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641943),
('F9MCHv3NOJRfr6gOTJeCBPGA7Uc0OWKosPPVuvXH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnZpYkdmYVVxOVNKb1JTZnZDQzVQOUprRjhvUEg4NjNQMk9QaTZ5ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725024),
('fkQwfh6khR2k9mRegEARai6A0R94q4Np6VJCwEJM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblZMblhSNm1FOUFJSzBBcXJESGFxTkhnWFhFWjhTSk10NFFNdm1LaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXN1YXJpb3MvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1731729724),
('GBYOfIBpEvE2mgCI5sLN5v0f3cJUKvzqihGywj0r', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk9ZcW9nRks1YjZSWkxMVkJpZE1HQ0JGdnF0NUdKZE43aWlyQk4yUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731632800),
('GEmHt7jiuBEocxltq4O1BLwUrtLtsPGhVGRauqYR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFlMTTBReWZ2R2J2RFdZV2Q1dVdWSkNjSnZnTnlVNG9FV1hyMmpPYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731735552),
('h5uBMsLkUfTsz6JzPMF0sX02xZjcqTMlW5j3htwS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTZRVlc1VElKcU1zcUZ4WUxvdzdOSTlXdkJZUGRzRDlETmlINVoyVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725821),
('hifFz1zcyAZcSjiKhXsNnQE34SxhjihbtbpWrTRi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3NGVDdmMzIxeUNLdEpIN1p4TG9pSnlubWk5Y2JyNnlNbExsWHZjZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726800),
('jD9OHJuKF7htmYGHryd3xuD7w8yvW9wyo9tv805n', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemgzSTZsaGJVRlB6VmhOQU9RaVkxdHlJVkdhRVFpcjNER0Y5M3JZQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXN1YXJpb3MvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1731729429),
('jQHK5Oob1qJ2ggJB9wHuNIanxw90s4BvuPHsZH4m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmswZEZuRlFRMk9lZVhLdTN2cHByVFRBTUEwSDI1M0NxeVh0czdhTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731730686),
('LAJSoIr6RR3dekOwuy4nSinbvQJrvq42giOf84vZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3VjbUhDRzBSNVJRZXQ0MjZ5Q2RnV2dHbFpxeXJzU3FCeHZVb0RMZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731727920),
('liwFJLRZ2L9UxtHnZcs7Eu0Sy1Aj94gdO97rHbVH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEtmNEg2Yk5zYjF1cEU3NnEzRFM1WFR5YzBKNk5WMERQc29KQ0NLeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731636568),
('LKEdsy61AooHUCe1Mhj4mGfq1EYq094qDLVIfFjC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlpNMUpYZVBpZVRVSk05emZoR0k1TzdMc1hYOGVuN3l3UXNkcVgzUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726575),
('mERqQ0HGPFXPK8ByOu4pWQSMfLCBUSSLHpmoPZfB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmJzZjI4T282a3NnakZpUUtVcWxsR2VhZDhqRU52ZzVTaXFSbkZEYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731633460),
('MGxiGSjxosdygSffRMWP1CrLRuu6ZrbdsnWRTGLf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3pmem5Qd0JZbVROQnJVcnI1UEY1ZmFibXZvMGhZV3JSdmlaQkxKTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731730733),
('MzrG4EuQoFXllNTQIARp4MpALprYZrmDPzjRtjy1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHNYREdHMGJiSVU0VDZVcXhOV1k1QjVicUNCZ3NwM0twZFFqMFJrZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725085),
('nTbhF5McYBTfhCwAqHTpTL5tzd7CBXIjZE5zZijQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam5ESkZ4MjA1ZFRIaVZacXdTZ2l3OXptenZORm5JaDdQN2E5M2hZdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXN1YXJpb3MvYm9iIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731729773),
('OGfrYrJkpnn4ZLfb8pDZrDCYPXhDLtApvbGa9b2e', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnozZUh4Y05Id3BlUVhZRUc0WDZkUTVZeFNhdnp6SEdFRTlzb1VRNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726689),
('ojlP3LfM2GQg4FTmBHm85dCVEnAgYx09X4rsiJLW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjJPQWU3TjVrdTVWQlp6STNGTlJDdkhybjNPeTBlYmQ2akRKUG55ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731633054),
('OX7QVcjTU9aiuiDuNqMsurDDBs6YQxC07otsOsn0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1llSTdTNmpuTDF4ZjltVVFIaGRiMlVqY01BaVF6UmFLekxNdXBXTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725128),
('p19X4sHnmXe2YecD4fRWdZcKHlzXfHOVu82ecZcV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1VYR1cyOENJcEVXYTBpWm9pUXRZZXZDOWFsVDBGNDI0MWprWXZ5eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731633110),
('PbDj1GcuMmRi1XFYPsmrHmW4MbJXpJGs15ABII7a', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0hrV2t5OTRlTE5hc2h6WXRSdnIyMndLN2N4TmJTSGFkQzNDUlFwWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641913),
('PcLaWflw1mjFXsdVCPttpYhpBYC6WpqPaNQRMtyh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXEzSk9LaGF0RlJxanhnVEJoTkJOWEZvQ2U1ZTl1ZFVRckxnTmxDRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731632737),
('pIlWsN0b7uZNNE0toEQAMqs6EgJZaQOshHiXcAcf', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1JzaHIwMk1vUGtmdjhtcWJ1RGlqNERlQzZjNHpBTmR5WDV3RzZ1RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731631741),
('q34bG2yvPRyWFO7R25QjYwcDcMutLQxiDZh0Adl5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSU9DcE1WdVZab0pCM2s0RUNhamh4Ymg0SVp4aTZ6TnAxSlBkYlBiNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731637299),
('qTvN2bCvuyethTmtmsdtQsGIi4WhUQMQG7YoXsNA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFRtd0VLbWNNMHZVSDVXZjBjY2R0ZlpqQTdrRGZoa0h6VjE1YkVzSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641542),
('R1pvxXoR4uoVPuZGfma9q1DO4eGGCjUE4vK1zV4e', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmdRYnUzWXZNcXVQRllua2p1b0IxREM5MmZ3VHYzazNIYnZwYW9jUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731730676),
('R9ADrFw5wIaG4oUj5TLL4QfexIUer3FxgjknvPz4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjRaWmtPOFFPR1MyUnppVWozZzdkZVRhMlhMV2NDd1F0emFLSExwaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641373),
('rf49d2j4aymd7Hju82IwAN6vFfc99ZoWxhHJ6Udg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkswREpJN1dqWEpUODNldEFuczJVOWJuR2pWUzJyMzh5V3ZROFpZRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXN1YXJpb3MvYm9iIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731729787),
('RskXUz2MAQdwnV6S9I7huTmOJsnFuTv4crhEsHnW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWhRYWJTeDF2bjM0TlZCTDNWRWt1UkdDbnhsV21HTHpNOHdOYmwwayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726763),
('RTgLR6iLjhVRruY88mr0lDxHkima2sTO36x1iq1D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUQyM2J1MGxGQ3Q4WE84OFdxYkpRd3ROdTNXTEdvajJsV1NweVVLUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731637577),
('RzGUVB7tbjy9nVCMeANt7dweYvJnwBZGazlZv4uH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnQ5d2x6aHFqQWFJM2NFTG5YTGFaSThqZGczbVJhWWV3SmJ4SktBdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731727232),
('t0CkcfFSCKGLtTkEBV5SpyR0q9pbn57ESeOriqO8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDhIM01wVUo4dzlhcnpSbXZDV3h1R2dnU2hYWWNmSklnS2U5ZGgyRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726610),
('tjJK6UfN0vjzlP5umbJqoPdwgq4NZbtFVSHaUAZQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmVvckR5dkxVQnF6M0xyU1B1TVF2YmVQYm9oS1QxdzlhWFZpcmFrbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725078),
('Tys8yauDivf7x0kM4qRxyI5nW9OTGmEPlQg3x2OD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0FDRTRhUFdWYkN1QzRwclpqdUhWbnN4QjJsOFJRdEJzTjd6bWV0YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731638093),
('TZW9UCJPqXSHZsazVe2JgrabENxB40KYGPn1lcb9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTA3M0QydnlSenVsd2xDSlF6bG9mQ2JBQVJrNWd0aThaMGkyaVdIcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731632460),
('Uh0AIkyavOSUhlh46LnC1qOJ0nXJB78DJA7vaaPr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejNPYk5OcmFsWU9wckpsemJYdWFqS0tDa1FUWVJQT01PdnVMTnV4VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXN1YXJpb3MvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1731729127),
('UQM6wHQa0w7tG2mf3KSl1W2PAvT22ovd0K5hJy9K', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzlhSGdJNENvRkNhak5lempxZWJwdVlDVFFLRDNPTFFSTEdpM3kzQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731636993),
('uwD6Rt7xzCrHH7VMQZ9TCxi428JQAEqlT2mEQ9Gc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkNySHRDbGZEbWNjbEE1QW93bkU2ZTZsckJuVlhBbnpJUEt0S3dDdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731631177),
('v97vPSqDZ72R35jPZWglprTv0yELfShsORAIcO0t', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2VrSzFiclo2ZHNQQ0FYNWc2MzM2ZmpSckZzUzZWWHBHQUg1a0tKeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725032),
('VESbT5iVMJUH9iLPLRXcgNTJB5GU3A9WKaD33SZk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnpsdkx2UjZ1czE4bzFQNG8yUVpRemtPRHNvZXB6WWYxWFRWRGt1eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726838),
('X8xCoe08uroLUiDnJicqFY4xs9Khm9P1J4uYYKbx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2hQcjlTZUYzTDl1VXZPM1RTbVFkMEhNdHhEdG81djFYbkFNZFRVWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725047),
('x9ts2NLxxNTPGT9WOxgZhFvFmwDKGxdrAdrMEZf0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid21qT0VuQWZhajdPMzd2bHhscXlwTGpyaHhsSFBWTmJ5OEJNWDdCUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641635),
('xECRvAddF8bavbLG6UVq5r55ra1NZZlKROPzdHfI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1FTNUk0amg5RFVZTFpDaGNCdlloMkhValNuTFpjSHBBMG15NFl4eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725132),
('xjbxshJbSxqU1ThzAZHK6vSl6nPJvJItSMEf9aJb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEc4UmwydjVJRjVqRFl5TXVITzV0bjROclhkTjYzcXRLdm5QWVVLbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731638271),
('XjlSVdCO1SZYAuIVlOaIdMtPyDYRvUEBiky2X5LV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib205bFV5WmxPS2JEckZXemtPUHEwTkFIOVZraHJGdk9FQ1FTdFBlcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731730730),
('XNl5DwTq2PkH7ZfHL4i4cd0iAC8tV2QunTILnboU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWhyaG5vaUJ6UEg4Zm5kRFA0Vm5OVW5DN0E2WTBQUG5oRjN3QVlRUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641932),
('XXNwBSFCYyRBaj6aTCtqvwweeF1mKAXwm43CUxt1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3F2UWVWSzJWQ1IwdmxLTGxtdWZRT0lYeXp6RlJNeTg1WkpScll1eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731727106),
('xztuooLizZ93lCxil7K8dJVqAh9lFER9HBRWOPgD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXhvUHRKaGZ5Q0hDUVVualpDbGgwazRQcFBuUjBXSHFDUk4wNHE5OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726562),
('y4USHljvabGD4qT1SHpZiyzFARER5FJCMCPEeKUT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnZQcmdBYmJtOTg1SkdCUlhlRHlYOG10WDZ3UVdySk5WTWRPdmpLTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725043),
('yAfv9MmiiazuQGRl061p66WiLorH7WcGvG3XXfk3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkF1MDV6R3gwUXNMdmRJb3hJRXFKWWdlV2NEdVBGR09XVThqRDV4WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731730304),
('Ybkds3HeQptjv6Ol9h0LzoFBqeOYyD61WZcIpgwp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnpKQ1RpaXRYcVpVWWNjWkFxYk1vVG42T3gzSHhZYVAxazZJN0ZrMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726585),
('ylpv4ZXvUuvkhzhbKZ28TfYfkAIqBuc8TIGcknPs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVptVm5OOU5uMlhudTQwMGlnV3MxR0tMU0NodkJRS0dPWnJHQlZMTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731638261),
('YZBlTSztCbfwFY4AS0EJmvwB4xRwmQ1LVdBe8Qvo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGFsZ2Q3RjNCR2dDMXFkM1liNFZ5T1A2dFZEMkMxbTB5TExtRDl4NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725894),
('Z7vl6TB0ESRTkZz10vBKzx92RhwIHjOGRDbt0bBc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFhvTnJUa1NVVDZVS01TaE4yMmpOcWw1YWsyZldEQXFaNEY3U2R0UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726753),
('ZEGtIsb1ZZ5v8xZDg5mtk0oluMcleaLwOxVotSvi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTZGdGVUd3dmVU1tUWJ3TGhub3lRS2d3cnNUQ0NyN1ZpdURGSnBYQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731727920),
('ZhvC4b5LD0pHxW9ylkWmfWp8ivXbbBZ6soCV7S89', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmZIZzNaUzBibmlWbzdvdWJUSm1HS2N3ZG9ZSmYyNkxrdEE5ekRrZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731636587),
('zJlfP2BjdJAbZNQFtBZVUESCvXVgTAowUnZgS6cj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjkyYjVkbWxsTTBod0xKemNXT0hIRFhwSEdyRGxmNlpGVWZJZ2NRbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731730449),
('ZnGqHnu9M8U5gKmHjEceUCYrsrZelzPP4j6K43hK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidk5McVZrWFFRSlFXMUI0bTdoU3FPbGtlaVNXZDhaNUhVQmdleEwxUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731730292),
('zO0DDzbM4ihYAbyxS3DOAsTvqqhpceCkazqnDg5D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjQ1RGV6b3hFTGRzM2EwclcxT1c1OVB3WEtaZkVUOUpvelZNcTZnVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726620);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idSucursal` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `celular` varchar(8) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idSucursal`, `nombre`, `ubicacion`, `telefono`, `celular`, `email`, `estado`, `direccion`) VALUES
(1, 'Store Pradera Chimaltenango', '14.660672, -90.809802', '12121212', '21212121', 'storepraderachimaltenango@gmail.com', 1, 'Diagonal 1, Zona 6 75 Chimaltenango'),
(2, 'Store Pradera Escuintla', '14.2899457,-90.7845336', '78898028', '31313131', 'storepraderaescuintla@gmail.com', 1, '1a. ave. 1-40 zona 3 de Escuintla'),
(3, 'Stores Las Americas Mazatenango', '14.5349775,-91.4947557', '77972525', '14141414', 'storeplazalasamericasmazatenango@gmail.com', 1, 'Km. 158 Carretera a, Mazatenango 10001'),
(4, 'Store La Trinidad Coatepeque', '14.7013053,-91.8535172,767', '15151515', '51515151', 'storelatrinidadcoatepeque@gmail.com', 1, 'Calzada Álvaro Arzu Coatepeque'),
(5, 'Stroe Pradera Xela', '14.8502391,-91.5371314', '77677884', '16161616', 'storepraderaxela@gmail.com', 1, 'Av. Las Americas 7-12, Quetzaltenango'),
(6, 'Store Miraflores Guatemala', '14.6202631,-90.5545295', '17171717', '71717171', 'storemirafloresguate@gmail.com', 1, '7 calle 12 avenida Guatemala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `idTipoProducto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`idTipoProducto`, `nombre`, `estado`) VALUES
(1, 'Teléfono', 1),
(2, 'Refrigerador', 1),
(3, 'Laptop', 1),
(4, 'Televisor', 1),
(5, 'Tablet', 1),
(6, 'Smartwatch', 1),
(7, 'Auriculares', 1),
(8, 'Cámara', 1),
(9, 'Consola de videojuegos', 1),
(10, 'Altavoz', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `password` varbinary(5000) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `usuario` varchar(20) NOT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `password`, `estado`, `usuario`, `idEmpleado`, `idRol`) VALUES
(1, 0x6261333235333837366165643662633232643461366666353364383430366336616438363431393565643134346162356338373632316236633233336235343862616561653639353664663334366563386331376635656131306633356565336362633531343739376564376464643331343534363465326130626162343133, 1, 'admin', 1, 1),
(2, 0x6261333235333837366165643662633232643461366666353364383430366336616438363431393565643134346162356338373632316236633233336235343862616561653639353664663334366563386331376635656131306633356565336362633531343739376564376464643331343534363465326130626162343133, 1, 'bob', 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idProductoSucursal` (`idProductoSucursal`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`idContacto`),
  ADD KEY `IX_Relationship1` (`idCliente`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`idDetalleFactura`),
  ADD KEY `IX_Relationship4` (`idFactura`,`idSerie`),
  ADD KEY `IX_Relationship5` (`idProducto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `IX_Relationship11` (`idSucursal`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`,`idSerie`),
  ADD KEY `IX_Relationship2` (`idCliente`),
  ADD KEY `Relationship3` (`idSerie`),
  ADD KEY `fk_factura_sucursal` (`idSucursal`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `IX_Relationship13` (`idUsuario`);

--
-- Indices de la tabla `imagenproducto`
--
ALTER TABLE `imagenproducto`
  ADD PRIMARY KEY (`idImagen`),
  ADD KEY `IX_Relationship8` (`idProducto`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `IX_Relationship6` (`idTipoProducto`),
  ADD KEY `IX_Relationship7` (`idMarca`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `rproductosucursal`
--
ALTER TABLE `rproductosucursal`
  ADD PRIMARY KEY (`idProductoSucursal`),
  ADD KEY `IX_Relationship9` (`idProducto`),
  ADD KEY `IX_Relationship10` (`idSucursal`);

--
-- Indices de la tabla `seriefactura`
--
ALTER TABLE `seriefactura`
  ADD PRIMARY KEY (`idSerie`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idSucursal`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`idTipoProducto`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `IX_Relationship12` (`idEmpleado`),
  ADD KEY `IX_Relationship14` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `idContacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `idDetalleFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenproducto`
--
ALTER TABLE `imagenproducto`
  MODIFY `idImagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rproductosucursal`
--
ALTER TABLE `rproductosucursal`
  MODIFY `idProductoSucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `idSucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `idTipoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idProductoSucursal`) REFERENCES `rproductosucursal` (`idProductoSucursal`);

--
-- Filtros para la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `Relationship1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `Relationship4` FOREIGN KEY (`idFactura`,`idSerie`) REFERENCES `factura` (`idFactura`, `idSerie`),
  ADD CONSTRAINT `Relationship5` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `Relationship11` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `Relationship2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `Relationship3` FOREIGN KEY (`idSerie`) REFERENCES `seriefactura` (`idSerie`),
  ADD CONSTRAINT `fk_factura_sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `Relationship13` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `imagenproducto`
--
ALTER TABLE `imagenproducto`
  ADD CONSTRAINT `Relationship8` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `Relationship6` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipoproducto` (`idTipoProducto`),
  ADD CONSTRAINT `Relationship7` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`);

--
-- Filtros para la tabla `rproductosucursal`
--
ALTER TABLE `rproductosucursal`
  ADD CONSTRAINT `Relationship10` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`),
  ADD CONSTRAINT `Relationship9` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `Relationship12` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `Relationship14` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
