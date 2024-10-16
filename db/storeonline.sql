-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2024 a las 18:59:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


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
(6, 'Mariano Baquiax', '10 avenida zona 8 Quetzaltenango, Quetzaltenango', 1);

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
(1, 'https://example.com/images/samsung_galaxy_s21.jpg', 'Samsung Galaxy S21', 1),
(2, 'https://example.com/images/lg_smart_fridge.jpg', 'LG Smart Refrigerator', 2),
(3, 'https://example.com/images/macbook_pro_m1.jpg', 'Apple MacBook Pro', 3),
(4, 'https://example.com/images/sony_bravia_tv.jpg', 'Sony Bravia TV', 4),
(5, 'https://example.com/images/huawei_matepad_pro.jpg', 'Huawei MatePad Pro', 5),
(6, 'https://example.com/images/xiaomi_smartwatch.jpg', 'Xiaomi Mi Smartwatch', 6),
(7, 'https://example.com/images/bose_qc35.jpg', 'Bose QuietComfort 35', 7),
(8, 'https://example.com/images/canon_eos_r6.jpg', 'Canon EOS R6', 8),
(9, 'https://example.com/images/nintendo_switch_oled.jpg', 'Nintendo Switch OLED', 9),
(10, 'https://example.com/images/xbox_series_x.jpg', 'Microsoft Xbox Series X', 10),
(11, 'https://example.com/images/iphone_13.jpg', 'Apple iPhone 13', 11),
(12, 'https://example.com/images/lg_instaview_fridge.jpg', 'LG InstaView Refrigerator', 12),
(13, 'https://example.com/images/samsung_tab_s7.jpg', 'Samsung Galaxy Tab S7', 13),
(14, 'https://example.com/images/sony_wh1000xm4.jpg', 'Sony WH-1000XM4', 14),
(15, 'https://example.com/images/huawei_p40_pro.jpg', 'Huawei P40 Pro', 15),
(16, 'https://example.com/images/bose_soundlink.jpg', 'Bose SoundLink Revolve', 16),
(17, 'https://example.com/images/xiaomi_mi_11.jpg', 'Xiaomi Mi 11', 17),
(18, 'https://example.com/images/sony_alpha_a7.jpg', 'Sony Alpha a7 III', 18),
(19, 'https://example.com/images/surface_laptop_4.jpg', 'Microsoft Surface Laptop 4', 19),
(20, 'https://example.com/images/nintendo_switch_lite.jpg', 'Nintendo Switch Lite', 20);

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
('6OrWVh2uMHDXKXeJqRYLwejxeYXOy9ECvYzWoJWv', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1dZdEJzeEp3VTBGa1hRTE5NSVZqRldhOU8yODFWWU9qbXE2VUZQSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0b3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728496692),
('dYYwGPNIacqla7bdyy1KfSva6CxY83ZqfnYaZ3Hi', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3VyZUZ6VWxBbzdQSEZTNDh3OU1JMU1WRWJHZ29oOXZNUjg0aGE4SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jbGllbnRlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728443291),
('HB1VEgbTS1XmY9uM2bCAJ2w0wOWZtPwn4wmTPf9h', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejZ3bzVMNFVyMXltS0dJbEZ4S2RBNVJJQjhWbGVuM1Rvc3BxRFkzbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0b3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728704198),
('mUBxFx0cQkbt7lkXY4u2TLAIm1LL6OExXOvW3j7S', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHp1NzFtR0VuM3lwbG5pRnROYWNIVlFuZzBxZEphZTdWNlNUZmt3ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbWFnZW5lcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728781534),
('QBcedJuOGDxfqe2MPve3JadvArHeo1JtzH2L0nBC', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3Fnb0x6Mk1rYVM5NGNIUEhsb09lQlBJcHdIQkhUSUQxN0dxZWlKdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jbGllbnRlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728482398),
('SUT78pY67JeRabV7jXkXDLLgb1CC0QDow7a4eD92', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUNBV3JaeWVVRVJCTjJmVXZoZ2xvVjlnUVV0MmpjTWZrSU9KSm0zSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0b3MvMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728528542);

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
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `idProductoSucursal` int(11) NOT NULL AUTO_INCREMENT;

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
