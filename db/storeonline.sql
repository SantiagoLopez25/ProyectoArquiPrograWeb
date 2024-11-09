-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2024 a las 04:34:30
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
(8, 'Alejandro Requena', '14 calle zona 3 Quetzaltenango, Quetzaltenango', 1);

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
(3, '33441156', 'juanp4@gmail.com', 2);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `fechaFactura` date NOT NULL,
  `montoTotal` decimal(18,2) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idSerie` varchar(25) NOT NULL
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
('0c01BL9rZ2EoytmP4bwCNktDENonpGSf9QxAlevw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHZDcXFvckF3ZXo2ZU9sRlc0Qzc1dHhUTld1ZUZIdFhUZUtYWlVlRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941651),
('1op6dRHVrKwLGEz8YTtaFEYRXT1pwdBgPnKwD2dX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblU5bmRqdHpRVlQxSDJyRUtnMHRkaFBKM0xjbFBNSkJVZGNxVzlqZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730948326),
('2l1M5VoQyDXG4NivjIMQtanPtBaqOn2H7y6Eg94P', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDZCR1J4U21LZWRyMlNZM1g5Q1FyY01yMUlMVDN6ajhPbVg3YkRpdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730947089),
('2P7EndbtejFvXXi6VBqyYriNIrXS0eeME9zD0Ejw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2hoUk5TT2JINlJUanRHVEJNa0ZmcUduN1Y2MDFRa05QVW5vVmF5QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941203),
('3A4Gl4UVQzFE9uTRLY1FvHmvXKLU5gH1i0Ab9LvV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWQ3cVpSOUJpWGFBOW9vd25pNkVyVXJ6VzRnSVo5bG5xdDREUUN0TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946765),
('3pUAV80vQ8DglnDepPIaQlo1q2K3uQ81o0bcTjES', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHpKWHdpNlBrZFI3MWJ1QXlTN2Vxa2poWk14TjljMDVqN0R0N0JyeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946748),
('3zMzVfEUCPlZq2i4iXmgBY1asNO2H6MvbEcb5TCO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzFyTE4yZ2VaeFhGSmgydzJvclhNeVhZNUlFWGdtT2ZnMmpMSnVRRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730948347),
('4LeX0FcnYQ6Vp1OZh6uGqXpH0TZ9Ri1gE3MpVCyh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlN6THBLQnFxRmNnemdDZlh1RjdURFhzNU9Tc25Ya2E0eWlTdWpoViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730950133),
('5rClleyMOYYF4dkDnWxzKtIQszDpeN7LBcjNfuqc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0lDd1FnZXlPRWRnVVpJNzBIanN4NXRwYUpWMXAxaWdTN2k2cTJueCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730949479),
('afqwcv5dGs3uzWbHXhJ4Myk69eFRfTuckajgNdrw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0g1RU1xcTZUWkxoMENpMmI3cmRLeXlVR1h3TnhnSUVsTGIyMzdzVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941082),
('BfXcBkCcJ2XPWsdzEKgsaZDtetjWjPBKugTqDwuy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVlkcXo4akM1VlJXU05pRXpOdTgyQXZHQTVkNll5bWdwWWhIeEVSYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946577),
('cSMGiSXykYn5Zp4Ptx1pBYcecCgII5GfjX6MXdBU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFRLbVh2dGhEemJPS3Mxdm5aQVFjSmo4YkJsTmxjQ1pvNE9FR2lmViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730947042),
('DQxRlq0mWbOMaLsqDJXAmxq1txY3A9Le29ud5aId', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM05tNUhLNDY0RkxzT1FpaTQzbDdPNE0zcDgwTTBmZU41NzRYR1ZpWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730949735),
('DUZUdRHSnemLetk9rsI2i35VX56ygqTaHrvnoQ25', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDc1R2pKcTc4WTNqdTRNVkdvSDVWWGl1MkRlVkx5d0pTN1JndEN0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731005243),
('E2XDlahctziZJmXHyfeZ884sRkKjCB8AywA65Liv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlg1RWs4azJLSGdaQTV3V2Fsdkdxbnp5Q0h5blRoUkZJZEpYSW5FOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941391),
('EgpRK52cI9yYSpMMis3WIOAGJMiE3qFVr5NMds9s', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGUyd2dxc2RWaWhybm9mUXRMY29VdmlPTjJhanFKeEI3TlpzeWZaOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730948079),
('EhXRRNg0vd1XHjKPUK7irOGYJgEcZgm5W0MBM8q5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEZXSU1SYTUwTG1WVldvR2xtS2NxWmpyVUdJNW5EbmJQZVFYOHZGSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730940883),
('EKYcBQmh3S7YwNIGLyC7AjEqbbFai0jzpW8ov91W', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2tXQzk4eVRRdFVpM0I3TkQwZTNEM3ZZU3Q2NWk1VzliZVFLZU4yRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946846),
('g4xXLTJn0M4ernIQ8l29plOysCr12H66xbEf7Ttq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjRaUm9vZ1FOR0pSZ2I4NzUyQlQ4d3BnQW12MVNsNFV0T0VyUVgxaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730940932),
('gsdUlGguPy9Z5xPlMhzz9IRDqnfRTqBEqnarwjpz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTFJcnhzUkZSOGZXajdJOXpEbDJWZmlMRWJqcmtjdmtHeFF0ZEdLMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941037),
('hL3vdigRHXlN8hHTQ0HFPT4Pyv773IELRlRx9bjh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnU0aEhYc3JveG9EOTRkMnBJOFlmZjRZN0FRa3lBcUZmSnFJUHdkYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946855),
('hWovktDr3xcHuOUJVxnNFhWqX0y7U5WgcNiHcBqY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVZ2ejBOREZKek1sVHA5WFZGQ05YbmZ0UkJieE5MM1dIQVAxdTVuWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946826),
('iV52sLZZWtZW7EgvZJR7gmZ2KeI3S4lybZzaSVse', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVFpVTdWeVcya0xWUW5UdUZnNmJIWUI2ck1oaGR3SEtTQ2xzQjB6dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946724),
('Jn9LziGTdNla2QWhg5MO9cZf3QskTTErDvNrpPUj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGhBSjNCdWY2SzFJdUZXQTlMNXVQeFpDZWhJeWx4NHNxdFBYODJWVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730949362),
('l0s1kV1thGZwjiZHU8N7emS9QBTQ5cb4rz9Xv3gm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1VrdklWaHJ6eU1IVmFWcG1tNGU0NnVXYzh5cXFUbU53Wlp3QTVjYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946728),
('LhWzUKVUcVq1nQmaPdn7HRUmgE60pcBT3p2QlAuE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1hJSFNhN0sydTRQZ3pFSER3Y1B3VmpSdHVmNTRNdlJXQTZWZmFReiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946543),
('LJJ3pmrkLyp55BHyu4frsiXvihprjbkDNjEevnJL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMU1iS2w3Zk5qTll2U0VqbVpCaUdjN1ZmU1BOeDFOcld2aEVadGlpeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730947033),
('LwwlSs3BfIcdRA6GCKNi7o5OK7iseuS1JYABqcnQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU1Hc0dIMmR0dFlxeXNlQkFDOHhTaUx0Q3FabjFJcHlySUxubWdFaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941516),
('NGVR5wKwwHbYw03GbYw9L8DZrod1zVJytOUa38sZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1hZWEdncTZncWNETk0zN0hvMmtsa3NRbzE5enQ0UEVOV2pNQ1RLNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730947075),
('NppeRmLkx7lmAPFlNiv3CSxrU4odm3CzvNoLI6L7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibllBUjA0QXN2WjJkTHRHdVJVMXM0ZWxVdGN1c3FTRHFObmNtSkVVZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730949674),
('Rzn1prm7yqT9YWX0qXQdgksuVR8sxmOJgOuxDupg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHE3aVJqUE1nUWVZTTZDV2wySEdEUE1uRVMwSlVGVkUybnBmUXVYUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730950033),
('seywaTxLmoIRFIagc7fq4vOnbEbRkqeRIqWpm8tI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2pHbHhxTjQ4V2lXN3NXNTVxM0ppOU9Xc2VCUHp4cjByZmxhQm1WZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730940948),
('sMBrI19vgXmhU8su5AyhiWDMf63cIZPl9uK6mIsS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXRxNjFwb1ljTVAxY1ptTDZZNmtzandzbk5iUlgySldwczl3OURxcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730949729),
('sO9mIJ3rZ7TUVBmTDlzw9US08T1uThorKrKV9qSQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDk4RzZ2cWlWb0Iyc3BEeDIyNkFYRUpOc2IzQng4RXJuS1d5YlZTSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730949433),
('Sp66mU673gVZYPHpZIAaXNleHTx4Kf61mi79JFsd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3R3a2RHYTZFRXdCQlRWZGoxNFBXcjY1UjFCUElqdnNhMDQ1Vk9weiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730940992),
('SR5z8fMs2FTXCxjxpppRfAEQQcJTk4gAOzwvjrK7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnk5OHEzc2l3RVVYdGJlUVZ0cnp6WXg3blJzSzlhdXpBQkhsNmkyRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946537),
('Sv5oAtHQ1GXFpEIc5BeTevCynRPWfgZCfOi0BkCe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1ltUVlYTDNsMkVmOGU3SWdOcVZCTHQwSTRROWx3OWJGekw4Tkx2byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730947148),
('tJBId6UBTOaNv5WCDil2rNHH0QNOW0pk4k6CBGkd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlB4d3F0azRBWW5VMmprOHNhRllHNE95MVM4YVhYUWppTEVET1UxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941739),
('uW9PcZILigHQNeaBYOr5p8yHPyrNigNW3hqkjqVT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTcwTERqeTVBdTF1czU5WVZEcFJ6OHdPMzJvZWNwN1owUFdNSFRYYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730949204),
('vg49e6JEwOEULH6U0zQSrKcS1KvYePsdOwCnrjUe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0dJN29KN1NFVEVXU1Fob3lMM3BVRnpWRjVqazFMTE9qMnBHd1pQWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730949357),
('VoCn4Fz54jwYh8lF28MH5wArUNxKVsD2f0QtH9oC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjlQbDdTQmFLdTZZSVA4S040VWp4OWxuUVhDcjZWbWdxOU9xcE5NTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941429),
('wTW3FYcFQfJIafk3N5cCpU9YXTbHv82mDQnDvb7Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianE1Q1FZc2xEQjczaldjdm1JSVlTSXRzQm1nRXRhZ3VRaHp0NnVYdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941526),
('XM8yPThsqgYQq2WTJmBKIUOEIuKCvyop8QlqG6Rw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzBkUjlVemNsNjBiNnRDSGVPRGpxQW90cjNEUFgxeTYzQzR5U1BDWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730948683),
('XoJvzndlVxUKmLhvLQwJfYyM5H1S5mdaeoqPtf7f', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFc4OXRrOW8wWGpuczk5ZHM4UjNQVEI0WUVGMTNEazRSNDUwTUdrTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730948863),
('ZAoSQqkGhduYGv1tAbbpCA9SzPWHd5op5WuJ4CDG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3VRTWhndWNLdnp2SHFDWnl4YnUyQ1JLV0IzeTlyVHoxODJud2JUNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730941349),
('Znm7mwqRWKrMOKJguQgUGMGl20it5ZFKQXMQe4UH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMldFcEl1Y0FLSWJyclBOTjBnVmJHSDh1UkVvS2kxcGM3dVRqU1V5dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730946835);

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
  ADD KEY `Relationship3` (`idSerie`);

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
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `idContacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `idDetalleFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

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
  ADD CONSTRAINT `Relationship3` FOREIGN KEY (`idSerie`) REFERENCES `seriefactura` (`idSerie`);

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
