-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2024 a las 07:53:58
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





INSERT INTO `cliente` (`idCliente`, `nombre`, `direccion`, `estado`) VALUES
	(1, 'Manuel Rodríguez', '43 avenida zona 4 Quetzaltenango, Quetzaltenango', 1),
	(2, 'Juan Pérez', '5 calle zona 1 Quetzaltenango, Quetzaltenango', 1),
	(3, 'Gabriela Munguia', '13 calle zona 10 Quetzaltenango, Quetzaltenango', 1),
	(4, 'Antonio Martinez', '14 calle zona 8 Quetzaltenango, Quetzaltenango', 1),
	(5, 'Alejandro Requena', '14 calle zona 3 Quetzaltenango, Quetzaltenango', 1),
	(6, 'Mariano Baquiax', '10 avenida zona 8 Quetzaltenango, Quetzaltenango', 1),
	(7, 'Davidsos', 'de Totoyork', 1),
	(8, 'Alejandro Requena', '14 calle zona 3 Quetzaltenango, Quetzaltenango', 1),
	(9, 'Victor Hugo', '4ta calle zona 5 Quetzaltenango', 1),
	(10, 'María López', 'Calle Luna #456, San José', 1),
	(11, 'Javier Martínez', 'Av. Central #789, Ciudad del Sol', 1),
	(12, 'Ana Fernández', 'Paseo de las Palmas #123, Monterrey', 1),
	(13, 'Roberto Sánchez', 'Calle Olmo #89, Guadalajara', 1),
	(14, 'Elena García', 'Calle Amado Nervo #55, Puebla', 1),
	(15, 'Daniel Hernández', 'Calle Pino #201, Tijuana', 1),
	(16, 'Carmen Torres', 'Av. de las Rosas #12, Querétaro', 1),
	(17, 'Francisco Ruiz', 'Blvd. Independencia #70, Aguascalientes', 1),
	(18, 'Valeria Gómez', 'Calle del Valle #330, Mérida', 1),
	(19, 'Fernando Morales', 'Av. Juárez #101, Cancún', 1);


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

INSERT INTO `detallefactura` (`idDetalleFactura`, `cantidad`, `idFactura`, `idSerie`, `idProducto`) VALUES
	(1, 2, 1, 'A-01', 3),
	(2, 5, 2, 'A-01', 5),
	(3, 3, 3, 'A-01', 7),
	(4, 1, 4, 'A-01', 8),
	(5, 9, 5, 'A-01', 2),
	(6, 4, 6, 'A-01', 6),
	(7, 6, 7, 'A-01', 9),
	(8, 5, 8, 'A-01', 4),
	(9, 10, 9, 'A-01', 1),
	(10, 3, 10, 'A-01', 12),
	(11, 2, 1, 'A-01', 3),
	(12, 5, 2, 'A-01', 5),
	(13, 3, 3, 'A-01', 7),
	(14, 1, 4, 'A-01', 8),
	(15, 9, 5, 'A-01', 2),
	(16, 4, 6, 'A-01', 6),
	(17, 6, 7, 'A-01', 9),
	(18, 5, 8, 'A-01', 4),
	(19, 10, 9, 'A-01', 1),
	(20, 3, 10, 'A-01', 12),
	(21, 4, 11, 'A-01', 3),
	(22, 7, 12, 'A-01', 5),
	(23, 5, 13, 'A-01', 6),
	(24, 2, 14, 'A-01', 11),
	(25, 10, 15, 'A-01', 7),
	(26, 8, 16, 'A-01', 2),
	(27, 6, 17, 'A-01', 9),
	(28, 5, 18, 'A-01', 10),
	(29, 3, 19, 'A-01', 4),
	(30, 6, 20, 'A-01', 12),
	(31, 8, 21, 'A-01', 5),
	(32, 10, 22, 'A-01', 3),
	(33, 10, 23, 'A-01', 11),
	(34, 2, 24, 'A-01', 7),
	(35, 5, 25, 'A-01', 9),
	(36, 4, 26, 'A-01', 4),
	(37, 5, 27, 'A-01', 6),
	(38, 4, 28, 'A-01', 2),
	(39, 6, 29, 'A-01', 12),
	(40, 5, 30, 'A-01', 8),
	(41, 10, 31, 'A-01', 10),
	(42, 7, 32, 'A-01', 11),
	(43, 8, 33, 'A-01', 9),
	(44, 4, 34, 'A-01', 3),
	(45, 5, 35, 'A-01', 12),
	(46, 6, 36, 'A-01', 2),
	(47, 4, 37, 'A-01', 7),
	(48, 4, 38, 'A-01', 6),
	(49, 5, 39, 'A-01', 8),
	(50, 3, 40, 'A-01', 5),
	(51, 9, 41, 'A-01', 10),
	(52, 8, 42, 'A-01', 11),
	(53, 7, 43, 'A-01', 9),
	(54, 10, 44, 'A-01', 10),
	(55, 10, 45, 'A-01', 13),
	(56, 7, 46, 'A-01', 6),
	(57, 8, 47, 'A-01', 7),
	(58, 9, 48, 'A-01', 8),
	(59, 9, 49, 'A-01', 9),
	(60, 8, 50, 'A-01', 6),
	(61, 9, 41, 'A-01', 10),
	(62, 8, 42, 'A-01', 11),
	(63, 7, 43, 'A-01', 9),
	(64, 10, 44, 'A-01', 10),
	(65, 10, 45, 'A-01', 13),
	(66, 7, 46, 'A-01', 6),
	(67, 8, 47, 'A-01', 7),
	(68, 9, 48, 'A-01', 8),
	(69, 9, 49, 'A-01', 9),
	(70, 8, 50, 'A-01', 6),
	(71, 9, 41, 'A-01', 10),
	(72, 8, 42, 'A-01', 11),
	(73, 7, 43, 'A-01', 9),
	(74, 10, 44, 'A-01', 10),
	(75, 10, 45, 'A-01', 13),
	(76, 7, 46, 'A-01', 6),
	(77, 8, 47, 'A-01', 7),
	(78, 9, 48, 'A-01', 8),
	(79, 9, 49, 'A-01', 9),
	(80, 8, 50, 'A-01', 6),
	(81, 9, 41, 'A-01', 25),
	(82, 8, 42, 'A-01', 31),
	(83, 7, 43, 'A-01', 45),
	(84, 10, 44, 'A-01', 21),
	(85, 10, 45, 'A-01', 18),
	(86, 7, 46, 'A-01', 13),
	(87, 8, 47, 'A-01', 9),
	(88, 9, 48, 'A-01', 6),
	(89, 9, 49, 'A-01', 55),
	(90, 8, 50, 'A-01', 17),
	(91, 9, 41, 'A-01', 25),
	(92, 8, 42, 'A-01', 31),
	(93, 7, 43, 'A-01', 45),
	(94, 10, 44, 'A-01', 21),
	(95, 10, 45, 'A-01', 18),
	(96, 7, 46, 'A-01', 13),
	(97, 8, 47, 'A-01', 9),
	(98, 9, 48, 'A-01', 6),
	(99, 9, 49, 'A-01', 55),
	(100, 8, 50, 'A-01', 17),
	(101, 9, 41, 'A-01', 25),
	(102, 8, 42, 'A-01', 31),
	(103, 7, 43, 'A-01', 45),
	(104, 10, 44, 'A-01', 21),
	(105, 10, 45, 'A-01', 18),
	(106, 7, 46, 'A-01', 13),
	(107, 8, 47, 'A-01', 9),
	(108, 9, 48, 'A-01', 6),
	(109, 9, 49, 'A-01', 55),
	(110, 8, 50, 'A-01', 17),
	(111, 9, 41, 'A-01', 37),
	(112, 8, 42, 'A-01', 42),
	(113, 7, 43, 'A-01', 49),
	(114, 10, 44, 'A-01', 51),
	(115, 10, 45, 'A-01', 61),
	(116, 7, 46, 'A-01', 15),
	(117, 8, 47, 'A-01', 72),
	(118, 9, 48, 'A-01', 10),
	(119, 9, 49, 'A-01', 44),
	(120, 8, 50, 'A-01', 38),
	(121, 10, 51, 'A-01', 56),
	(122, 9, 52, 'A-01', 64),
	(123, 8, 53, 'A-01', 72),
	(124, 10, 54, 'A-01', 11),
	(125, 10, 55, 'A-01', 85),
	(126, 8, 56, 'A-01', 92),
	(127, 7, 57, 'A-01', 54),
	(128, 9, 58, 'A-01', 47),
	(129, 9, 59, 'A-01', 61),
	(130, 8, 60, 'A-01', 50),
	(131, 10, 61, 'A-01', 43),
	(132, 9, 62, 'A-01', 29),
	(133, 8, 63, 'A-01', 67),
	(134, 10, 64, 'A-01', 78),
	(135, 10, 65, 'A-01', 92),
	(136, 8, 66, 'A-01', 54),
	(137, 7, 67, 'A-01', 84),
	(138, 9, 68, 'A-01', 19),
	(139, 8, 69, 'A-01', 55),
	(140, 9, 70, 'A-01', 66),
	(141, 10, 71, 'A-01', 15),
	(142, 8, 72, 'A-01', 73),
	(143, 10, 73, 'A-01', 10),
	(144, 9, 74, 'A-01', 26),
	(145, 8, 75, 'A-01', 43),
	(146, 9, 76, 'A-01', 91),
	(147, 10, 77, 'A-01', 57),
	(148, 9, 78, 'A-01', 88),
	(149, 8, 79, 'A-01', 32),
	(150, 9, 80, 'A-01', 99),
	(151, 9, 81, 'A-01', 15),
	(152, 9, 82, 'A-01', 73),
	(153, 8, 83, 'A-01', 10),
	(154, 10, 84, 'A-01', 26),
	(155, 8, 85, 'A-01', 43),
	(156, 10, 86, 'A-01', 91),
	(157, 9, 87, 'A-01', 57),
	(158, 7, 88, 'A-01', 88),
	(159, 9, 89, 'A-01', 32),
	(160, 8, 90, 'A-01', 99),
	(161, 8, 91, 'A-01', 16),
	(162, 9, 92, 'A-01', 28),
	(163, 8, 93, 'A-01', 13),
	(164, 9, 94, 'A-01', 25),
	(165, 8, 95, 'A-01', 45),
	(166, 10, 96, 'A-01', 92),
	(167, 9, 97, 'A-01', 68),
	(168, 8, 98, 'A-01', 59),
	(169, 9, 99, 'A-01', 82),
	(170, 9, 100, 'A-01', 55),
	(171, 8, 101, 'A-01', 13),
	(172, 9, 102, 'A-01', 18),
	(173, 8, 103, 'A-01', 29),
	(174, 9, 104, 'A-01', 21),
	(175, 8, 105, 'A-01', 17),
	(176, 10, 106, 'A-01', 23),
	(177, 9, 107, 'A-01', 31),
	(178, 8, 108, 'A-01', 22),
	(179, 9, 109, 'A-01', 25),
	(180, 9, 110, 'A-01', 20),
	(181, 7, 101, 'A-01', 16),
	(182, 8, 102, 'A-01', 18),
	(183, 10, 103, 'A-01', 22),
	(184, 9, 104, 'A-01', 19),
	(185, 8, 105, 'A-01', 14),
	(186, 9, 106, 'A-01', 28),
	(187, 8, 107, 'A-01', 21),
	(188, 9, 108, 'A-01', 20),
	(189, 9, 109, 'A-01', 26),
	(190, 9, 110, 'A-01', 13),
	(191, 5, 101, 'A-01', 8),
	(192, 7, 102, 'A-01', 15),
	(193, 6, 103, 'A-01', 20),
	(194, 9, 104, 'A-01', 22),
	(195, 8, 105, 'A-01', 18),
	(196, 6, 106, 'A-01', 12),
	(197, 10, 107, 'A-01', 6),
	(198, 4, 108, 'A-01', 29),
	(199, 8, 109, 'A-01', 19),
	(200, 7, 110, 'A-01', 9),
	(201, 6, 101, 'A-01', 5),
	(202, 8, 102, 'A-01', 12),
	(203, 7, 103, 'A-01', 17),
	(204, 9, 104, 'A-01', 22),
	(205, 5, 105, 'A-01', 19),
	(206, 10, 106, 'A-01', 4),
	(207, 8, 107, 'A-01', 29),
	(208, 6, 108, 'A-01', 11),
	(209, 7, 109, 'A-01', 16),
	(210, 9, 110, 'A-01', 8),
	(211, 2, 111, 'A-01', 3),
	(212, 5, 112, 'A-01', 5),
	(213, 3, 113, 'A-01', 7),
	(214, 1, 114, 'A-01', 8),
	(215, 9, 115, 'A-01', 2),
	(216, 4, 116, 'A-01', 6),
	(217, 6, 117, 'A-01', 9),
	(218, 5, 118, 'A-01', 4),
	(219, 10, 119, 'A-01', 1),
	(220, 3, 120, 'A-01', 12),
	(221, 2, 121, 'A-01', 3),
	(222, 5, 122, 'A-01', 5),
	(223, 3, 123, 'A-01', 7),
	(224, 1, 124, 'A-01', 8),
	(225, 9, 125, 'A-01', 2),
	(226, 4, 126, 'A-01', 6),
	(227, 6, 127, 'A-01', 9),
	(228, 5, 128, 'A-01', 4),
	(229, 10, 129, 'A-01', 1),
	(230, 3, 130, 'A-01', 12),
	(231, 4, 131, 'A-01', 3),
	(232, 7, 132, 'A-01', 5),
	(233, 5, 133, 'A-01', 6),
	(234, 2, 134, 'A-01', 11),
	(235, 10, 135, 'A-01', 7),
	(236, 8, 136, 'A-01', 2),
	(237, 6, 137, 'A-01', 9),
	(238, 5, 138, 'A-01', 10),
	(239, 3, 139, 'A-01', 4),
	(240, 6, 140, 'A-01', 12),
	(241, 8, 141, 'A-01', 5),
	(242, 10, 142, 'A-01', 3),
	(243, 10, 143, 'A-01', 11),
	(244, 2, 144, 'A-01', 7),
	(245, 5, 145, 'A-01', 9),
	(246, 4, 146, 'A-01', 4),
	(247, 5, 147, 'A-01', 6),
	(248, 4, 148, 'A-01', 2),
	(249, 6, 149, 'A-01', 12),
	(250, 5, 150, 'A-01', 8),
	(251, 10, 151, 'A-01', 10),
	(252, 7, 152, 'A-01', 11),
	(253, 8, 153, 'A-01', 9),
	(254, 4, 154, 'A-01', 3),
	(255, 5, 155, 'A-01', 12),
	(256, 6, 156, 'A-01', 2),
	(257, 4, 157, 'A-01', 7),
	(258, 4, 158, 'A-01', 6),
	(259, 5, 159, 'A-01', 8),
	(260, 3, 160, 'A-01', 5),
	(261, 7, 161, 'A-01', 84),
	(262, 9, 162, 'A-01', 19),
	(263, 8, 163, 'A-01', 55),
	(264, 9, 164, 'A-01', 66),
	(265, 10, 165, 'A-01', 15),
	(266, 8, 166, 'A-01', 73),
	(267, 10, 167, 'A-01', 10),
	(268, 9, 168, 'A-01', 26),
	(269, 8, 169, 'A-01', 43),
	(270, 9, 170, 'A-01', 91),
	(271, 10, 171, 'A-01', 57),
	(272, 9, 172, 'A-01', 88),
	(273, 8, 173, 'A-01', 32),
	(274, 9, 174, 'A-01', 99),
	(275, 9, 175, 'A-01', 15),
	(276, 9, 176, 'A-01', 73),
	(277, 8, 177, 'A-01', 10),
	(278, 10, 178, 'A-01', 26),
	(279, 8, 179, 'A-01', 43),
	(280, 10, 180, 'A-01', 91),
	(281, 9, 181, 'A-01', 57),
	(282, 8, 182, 'A-01', 88),
	(283, 9, 183, 'A-01', 32),
	(284, 9, 184, 'A-01', 99),
	(285, 10, 185, 'A-01', 15),
	(286, 9, 186, 'A-01', 73),
	(287, 8, 187, 'A-01', 10),
	(288, 10, 188, 'A-01', 26),
	(289, 8, 189, 'A-01', 43),
	(290, 10, 190, 'A-01', 91),
	(291, 7, 191, 'A-01', 84),
	(292, 9, 192, 'A-01', 19),
	(293, 8, 193, 'A-01', 55),
	(294, 9, 194, 'A-01', 66),
	(295, 10, 195, 'A-01', 15),
	(296, 8, 196, 'A-01', 73),
	(297, 10, 197, 'A-01', 10),
	(298, 9, 198, 'A-01', 26),
	(299, 8, 199, 'A-01', 43),
	(300, 9, 200, 'A-01', 91),
	(301, 10, 201, 'A-01', 57),
	(302, 9, 202, 'A-01', 88),
	(303, 8, 203, 'A-01', 32),
	(304, 9, 204, 'A-01', 99),
	(305, 9, 205, 'A-01', 15),
	(306, 9, 206, 'A-01', 73),
	(307, 8, 207, 'A-01', 10),
	(308, 10, 208, 'A-01', 26),
	(309, 8, 209, 'A-01', 43),
	(310, 10, 210, 'A-01', 91);




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

INSERT INTO `factura` (`idFactura`, `fechaFactura`, `montoTotal`, `idCliente`, `idSerie`, `idSucursal`) VALUES
	(1, '2024-11-01', 3500.00, 12, 'A-01', 3),
	(2, '2024-11-02', 2500.00, 5, 'A-01', 2),
	(3, '2024-11-03', 4500.00, 8, 'A-01', 6),
	(4, '2024-11-04', 1750.00, 15, 'A-01', 1),
	(5, '2024-11-05', 2700.00, 9, 'A-01', 4),
	(6, '2024-11-06', 3600.00, 7, 'A-01', 5),
	(7, '2024-11-07', 5400.00, 3, 'A-01', 6),
	(8, '2024-11-08', 4100.00, 10, 'A-01', 2),
	(9, '2024-11-09', 1900.00, 14, 'A-01', 4),
	(10, '2024-11-10', 2250.00, 6, 'A-01', 3),
	(11, '2024-11-11', 3500.00, 12, 'A-01', 3),
	(12, '2024-11-12', 2500.00, 5, 'A-01', 2),
	(13, '2024-11-13', 4500.00, 8, 'A-01', 6),
	(14, '2024-11-14', 1750.00, 15, 'A-01', 1),
	(15, '2024-11-15', 2700.00, 9, 'A-01', 4),
	(16, '2024-11-16', 3600.00, 7, 'A-01', 5),
	(17, '2024-11-17', 5400.00, 3, 'A-01', 6),
	(18, '2024-11-18', 4100.00, 10, 'A-01', 2),
	(19, '2024-11-19', 1900.00, 14, 'A-01', 4),
	(20, '2024-11-20', 2250.00, 6, 'A-01', 3),
	(21, '2024-11-21', 8200.00, 11, 'A-01', 2),
	(22, '2024-11-22', 2800.00, 17, 'A-01', 3),
	(23, '2024-11-23', 3650.00, 2, 'A-01', 5),
	(24, '2024-11-24', 4300.00, 18, 'A-01', 1),
	(25, '2024-11-25', 6200.00, 13, 'A-01', 4),
	(26, '2024-11-26', 1440.00, 9, 'A-01', 6),
	(27, '2024-11-27', 5400.00, 4, 'A-01', 2),
	(28, '2024-11-28', 9400.00, 16, 'A-01', 6),
	(29, '2024-11-29', 2150.00, 1, 'A-01', 5),
	(30, '2024-11-30', 3150.00, 10, 'A-01', 4),
	(31, '2024-12-01', 5600.00, 15, 'A-01', 3),
	(32, '2024-12-02', 7300.00, 9, 'A-01', 1),
	(33, '2024-12-03', 12800.00, 5, 'A-01', 2),
	(34, '2024-12-04', 4300.00, 14, 'A-01', 4),
	(35, '2024-12-05', 3500.00, 12, 'A-01', 6),
	(36, '2024-12-06', 4000.00, 7, 'A-01', 1),
	(37, '2024-12-07', 2900.00, 16, 'A-01', 5),
	(38, '2024-12-08', 5200.00, 3, 'A-01', 2),
	(39, '2024-12-09', 6600.00, 6, 'A-01', 4),
	(40, '2024-12-10', 9000.00, 8, 'A-01', 3),
	(41, '2024-12-11', 11500.00, 10, 'A-01', 6),
	(42, '2024-12-12', 9700.00, 11, 'A-01', 3),
	(43, '2024-12-13', 10200.00, 13, 'A-01', 5),
	(44, '2024-12-14', 8000.00, 17, 'A-01', 2),
	(45, '2024-12-15', 11000.00, 18, 'A-01', 4),
	(46, '2024-12-16', 6000.00, 14, 'A-01', 1),
	(47, '2024-12-17', 4600.00, 15, 'A-01', 6),
	(48, '2024-12-18', 5400.00, 9, 'A-01', 5),
	(49, '2024-12-19', 7500.00, 12, 'A-01', 3),
	(50, '2024-12-20', 6700.00, 16, 'A-01', 4),
	(51, '2024-12-21', 10500.00, 10, 'A-01', 2),
	(52, '2024-12-22', 8900.00, 12, 'A-01', 6),
	(53, '2024-12-23', 9800.00, 11, 'A-01', 1),
	(54, '2024-12-24', 11500.00, 13, 'A-01', 5),
	(55, '2024-12-25', 12500.00, 14, 'A-01', 4),
	(56, '2024-12-26', 7700.00, 15, 'A-01', 2),
	(57, '2024-12-27', 8300.00, 16, 'A-01', 3),
	(58, '2024-12-28', 9500.00, 17, 'A-01', 4),
	(59, '2024-12-29', 10800.00, 18, 'A-01', 6),
	(60, '2024-12-30', 10200.00, 9, 'A-01', 5),
	(61, '2024-12-21', 10500.00, 10, 'A-01', 2),
	(62, '2024-12-22', 8900.00, 12, 'A-01', 6),
	(63, '2024-12-23', 9800.00, 11, 'A-01', 1),
	(64, '2024-12-24', 11500.00, 13, 'A-01', 5),
	(65, '2024-12-25', 12500.00, 14, 'A-01', 4),
	(66, '2024-12-26', 7700.00, 15, 'A-01', 2),
	(67, '2024-12-27', 8300.00, 16, 'A-01', 3),
	(68, '2024-12-28', 9500.00, 17, 'A-01', 4),
	(69, '2024-12-29', 10800.00, 18, 'A-01', 6),
	(70, '2024-12-30', 10200.00, 9, 'A-01', 5),
	(71, '2024-12-21', 10500.00, 10, 'A-01', 2),
	(72, '2024-12-22', 8900.00, 12, 'A-01', 6),
	(73, '2024-12-23', 9800.00, 11, 'A-01', 1),
	(74, '2024-12-24', 11500.00, 13, 'A-01', 5),
	(75, '2024-12-25', 12500.00, 14, 'A-01', 4),
	(76, '2024-12-26', 7700.00, 15, 'A-01', 2),
	(77, '2024-12-27', 8300.00, 16, 'A-01', 3),
	(78, '2024-12-28', 9500.00, 17, 'A-01', 4),
	(79, '2024-12-29', 10800.00, 18, 'A-01', 6),
	(80, '2024-12-30', 10200.00, 9, 'A-01', 5),
	(81, '2024-12-21', 10500.00, 10, 'A-01', 2),
	(82, '2024-12-22', 8900.00, 12, 'A-01', 6),
	(83, '2024-12-23', 9800.00, 11, 'A-01', 1),
	(84, '2024-12-24', 11500.00, 13, 'A-01', 5),
	(85, '2024-12-25', 12500.00, 14, 'A-01', 4),
	(86, '2024-12-26', 7700.00, 15, 'A-01', 2),
	(87, '2024-12-27', 8300.00, 16, 'A-01', 3),
	(88, '2024-12-28', 9500.00, 17, 'A-01', 4),
	(89, '2024-12-29', 10800.00, 18, 'A-01', 6),
	(90, '2024-12-30', 10200.00, 9, 'A-01', 5),
	(91, '2024-12-21', 10500.00, 10, 'A-01', 2),
	(92, '2024-12-22', 8900.00, 12, 'A-01', 6),
	(93, '2024-12-23', 9800.00, 11, 'A-01', 1),
	(94, '2024-12-24', 11500.00, 13, 'A-01', 5),
	(95, '2024-12-25', 12500.00, 14, 'A-01', 4),
	(96, '2024-12-26', 7700.00, 15, 'A-01', 2),
	(97, '2024-12-27', 8300.00, 16, 'A-01', 3),
	(98, '2024-12-28', 9500.00, 17, 'A-01', 4),
	(99, '2024-12-29', 10800.00, 18, 'A-01', 6),
	(100, '2024-12-30', 10200.00, 9, 'A-01', 5),
	(101, '2024-12-21', 10500.00, 10, 'A-01', 2),
	(102, '2024-12-22', 8900.00, 12, 'A-01', 6),
	(103, '2024-12-23', 9800.00, 11, 'A-01', 1),
	(104, '2024-12-24', 11500.00, 13, 'A-01', 5),
	(105, '2024-12-25', 12500.00, 14, 'A-01', 4),
	(106, '2024-12-26', 7700.00, 15, 'A-01', 2),
	(107, '2024-12-27', 8300.00, 16, 'A-01', 3),
	(108, '2024-12-28', 9500.00, 17, 'A-01', 4),
	(109, '2024-12-29', 10800.00, 18, 'A-01', 6),
	(110, '2024-12-30', 10200.00, 9, 'A-01', 5),
	(111, '2024-12-21', 10500.00, 10, 'A-01', 2),
	(112, '2024-12-22', 8900.00, 12, 'A-01', 6),
	(113, '2024-12-23', 9800.00, 11, 'A-01', 1),
	(114, '2024-12-24', 11500.00, 13, 'A-01', 5),
	(115, '2024-12-25', 12500.00, 14, 'A-01', 4),
	(116, '2024-12-26', 7700.00, 15, 'A-01', 2),
	(117, '2024-12-27', 8300.00, 16, 'A-01', 3),
	(118, '2024-12-28', 9500.00, 17, 'A-01', 4),
	(119, '2024-12-29', 10800.00, 18, 'A-01', 6),
	(120, '2024-12-30', 10200.00, 9, 'A-01', 5),
	(121, '2024-12-31', 11900.00, 10, 'A-01', 3),
	(122, '2025-01-01', 10700.00, 12, 'A-01', 4),
	(123, '2025-01-02', 10200.00, 11, 'A-01', 2),
	(124, '2025-01-03', 11600.00, 13, 'A-01', 6),
	(125, '2025-01-04', 13000.00, 14, 'A-01', 5),
	(126, '2025-01-05', 8700.00, 15, 'A-01', 3),
	(127, '2025-01-06', 8400.00, 16, 'A-01', 4),
	(128, '2025-01-07', 11000.00, 17, 'A-01', 2),
	(129, '2025-01-08', 9500.00, 18, 'A-01', 6),
	(130, '2025-01-09', 10400.00, 9, 'A-01', 5),
	(131, '2025-01-10', 11800.00, 10, 'A-01', 4),
	(132, '2025-01-11', 10550.00, 11, 'A-01', 5),
	(133, '2025-01-12', 9900.00, 12, 'A-01', 3),
	(134, '2025-01-13', 11250.00, 13, 'A-01', 2),
	(135, '2025-01-14', 12500.00, 14, 'A-01', 1),
	(136, '2025-01-15', 9500.00, 15, 'A-01', 6),
	(137, '2025-01-16', 8600.00, 16, 'A-01', 4),
	(138, '2025-01-17', 11050.00, 17, 'A-01', 5),
	(139, '2025-01-18', 9200.00, 18, 'A-01', 3),
	(140, '2025-01-19', 10100.00, 9, 'A-01', 2),
	(141, '2025-01-20', 11640.00, 10, 'A-01', 1),
	(142, '2025-01-21', 9800.00, 11, 'A-01', 2),
	(143, '2025-01-22', 12200.00, 12, 'A-01', 3),
	(144, '2025-01-23', 10850.00, 13, 'A-01', 4),
	(145, '2025-01-24', 10400.00, 14, 'A-01', 5),
	(146, '2025-01-25', 11100.00, 15, 'A-01', 6),
	(147, '2025-01-26', 11450.00, 16, 'A-01', 1),
	(148, '2025-01-27', 12150.00, 17, 'A-01', 2),
	(149, '2025-01-28', 9400.00, 18, 'A-01', 3),
	(150, '2025-01-29', 10620.00, 9, 'A-01', 4),
	(151, '2025-01-30', 11850.00, 10, 'A-01', 1),
	(152, '2025-01-31', 10450.00, 11, 'A-01', 2),
	(153, '2025-02-01', 10620.00, 12, 'A-01', 3),
	(154, '2025-02-02', 11230.00, 13, 'A-01', 4),
	(155, '2025-02-03', 9900.00, 14, 'A-01', 5),
	(156, '2025-02-04', 12010.00, 15, 'A-01', 6),
	(157, '2025-02-05', 10800.00, 16, 'A-01', 1),
	(158, '2025-02-06', 10650.00, 17, 'A-01', 2),
	(159, '2025-02-07', 11560.00, 18, 'A-01', 3),
	(160, '2025-02-08', 11350.00, 9, 'A-01', 4),
	(161, '2025-03-01', 11070.00, 10, 'A-01', 1),
	(162, '2025-03-02', 10230.00, 11, 'A-01', 2),
	(163, '2025-03-03', 10450.00, 12, 'A-01', 3),
	(164, '2025-03-04', 11380.00, 13, 'A-01', 4),
	(165, '2025-03-05', 10760.00, 14, 'A-01', 5),
	(166, '2025-03-06', 12140.00, 15, 'A-01', 6),
	(167, '2025-03-07', 10590.00, 16, 'A-01', 1),
	(168, '2025-03-08', 11080.00, 17, 'A-01', 2),
	(169, '2025-03-09', 11410.00, 18, 'A-01', 3),
	(170, '2025-03-10', 11840.00, 9, 'A-01', 4),
	(171, '2025-03-11', 10670.00, 10, 'A-01', 2),
	(172, '2025-03-12', 11130.00, 11, 'A-01', 3),
	(173, '2025-03-13', 11290.00, 12, 'A-01', 4),
	(174, '2025-03-14', 10750.00, 13, 'A-01', 5),
	(175, '2025-03-15', 10990.00, 14, 'A-01', 6),
	(176, '2025-03-16', 11940.00, 15, 'A-01', 1),
	(177, '2025-03-17', 10480.00, 16, 'A-01', 2),
	(178, '2025-03-18', 11660.00, 17, 'A-01', 3),
	(179, '2025-03-19', 11350.00, 18, 'A-01', 4),
	(180, '2025-03-20', 11830.00, 9, 'A-01', 5),
	(181, '2025-03-21', 11340.00, 10, 'A-01', 1),
	(182, '2025-03-22', 10660.00, 11, 'A-01', 2),
	(183, '2025-03-23', 12020.00, 12, 'A-01', 3),
	(184, '2025-03-24', 10780.00, 13, 'A-01', 4),
	(185, '2025-03-25', 11210.00, 14, 'A-01', 5),
	(186, '2025-03-26', 11180.00, 15, 'A-01', 6),
	(187, '2025-03-27', 10420.00, 16, 'A-01', 1),
	(188, '2025-03-28', 11370.00, 17, 'A-01', 2),
	(189, '2025-03-29', 11900.00, 18, 'A-01', 3),
	(190, '2025-03-30', 11810.00, 9, 'A-01', 4),
	(191, '2025-04-01', 9350.00, 10, 'A-01', 2),
	(192, '2025-04-02', 10600.00, 11, 'A-01', 4),
	(193, '2025-04-03', 11850.00, 12, 'A-01', 1),
	(194, '2025-04-04', 12030.00, 13, 'A-01', 3),
	(195, '2025-04-05', 11050.00, 14, 'A-01', 5),
	(196, '2025-04-06', 12260.00, 15, 'A-01', 6),
	(197, '2025-04-07', 10410.00, 16, 'A-01', 2),
	(198, '2025-04-08', 11230.00, 17, 'A-01', 4),
	(199, '2025-04-09', 12150.00, 18, 'A-01', 1),
	(200, '2025-04-10', 10770.00, 9, 'A-01', 3),
	(201, '2025-04-11', 11500.00, 10, 'A-01', 3),
	(202, '2025-04-12', 9900.00, 11, 'A-01', 2),
	(203, '2025-04-13', 12450.00, 12, 'A-01', 6),
	(204, '2025-04-14', 10600.00, 13, 'A-01', 1),
	(205, '2025-04-15', 11350.00, 14, 'A-01', 4),
	(206, '2025-04-16', 11980.00, 15, 'A-01', 5),
	(207, '2025-04-17', 10780.00, 16, 'A-01', 2),
	(208, '2025-04-18', 12540.00, 17, 'A-01', 3),
	(209, '2025-04-19', 11200.00, 18, 'A-01', 6),
	(210, '2025-04-20', 10830.00, 19, 'A-01', 4);



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
(20, 'https://www.tecnofacil.com.gt/media/catalog/product/cache/0a3c9f56440fe010e3e9b5a77fcf2268/H/R/HRHSDAZAA_2_1.jpg', 'Nintendo Switch Lite', 20),
(21, 'https://gsmphone.co/wp-content/uploads/2022/10/SamsungGalaxyS22-1_900x.jpg', 'Samsung Galaxy S22', 21),
(22, 'https://www.mercamarket88.com/data/productos/d_lg48c14lboled2.jpg', 'LG OLED55C1', 22),
(23, 'https://puntonaranja.com.gt/wp-content/uploads/2022/08/TA100APL05-1-1024x1024.jpg', 'Apple iPad Pro 12.9\"', 23),
(24, 'https://m.media-amazon.com/images/I/410+YnkARyL.jpg', 'Sony WH-CH710N', 24),
(25, 'https://www.resetdigitale.it/128674-thickbox_default/smartwatch-huawei-gt3-active-42mm-nero.jpg', 'Huawei Watch GT 3', 25),
(26, 'https://i01.appmifile.com/webfile/globalimg/products/pc/redmi-note-11/mimg01.jpg', 'Xiaomi Redmi Note 11', 26),
(27, 'https://www.bhphotovideo.com/images/images1000x1000/canon_3616c016_eos_90d_dslr_camera_1502489.jpg', 'Canon EOS 90D', 27),
(28, 'https://lanoticia.com/wp-content/uploads/2021/05/amazon-nintendo-switch-pro.jpg', 'Nintendo Switch Pro', 28),
(29, 'https://i.pcmag.com/imagery/reviews/01OQN7sePUgsfxPSDKD4n0G-2.fit_lim.size_768x432.v1633361884.jpg', 'Microsoft Surface Pro 8', 29),
(30, 'https://i.ytimg.com/vi/pcBl8W1Od4w/maxresdefault.jpg', 'Samsung QLED Q60A', 30),
(31, 'https://static.hub.91mobiles.com/wp-content/uploads/2020/10/LG-Gram-14.jpg', 'LG Gram 17', 31),
(32, 'https://rbtv.disway.id/upload/d0ec8097416ba3aefcb27924860f37a1.jpeg', 'Apple MacBook Air M2', 32),
(33, 'https://bloganchoi.com/wp-content/uploads/2022/09/ifa-2022-cong-nghe-11.jpg', 'Sony Xperia 10 IV', 33),
(34, 'https://consumer.huawei.com/content/dam/huawei-cbg-site/mkt/by/plp/5-0/laptops/d14-2020-big.jpg', 'Huawei MateBook D15', 34),
(35, 'https://joinet.com/wp-content/uploads/2021/04/M5.png', 'Xiaomi Mi Band 6', 35),
(36, 'https://www.neboweb.nl/media/catalog/product/cache/1/image/600x/602f0fa2c1f0d1ba5e241f914e856ff9/2/6/269250_00.png', 'Canon PowerShot G7 X', 36),
(37, 'https://files.refurbed.com/ii/nintendo-new-2ds-xl-1646221602.jpg', 'Nintendo 2DS XL', 37),
(38, 'https://s1.kuantokusta.pt/img_upload/produtos_videojogos/113145_53_microsoft-xbox-one-elite-wireless-controller-series-2.jpg', 'Microsoft Xbox Elite Controller', 38),
(39, 'https://m.media-amazon.com/images/I/41TxlDQKHlL.jpg', 'Samsung Galaxy Tab A7', 39),
(40, 'https://electronicstore.com.pe/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/s/1s-12s21.jpg', 'LG 27UL500-W', 40),
(41, 'https://i.pinimg.com/originals/10/9d/fb/109dfb5711f54eb5230fe005dd5af844.jpg', 'Apple Watch Series 7', 41),
(42, 'https://img.alicdn.com/bao/uploaded/O1CN01fObzA21uISp0y2S0j_!!6000000006014-0-yinhe.jpg_500x500.jpg', 'Sony Alpha A6400', 42),
(43, 'https://technave.com/data/files/mall/article/202009101517599626.png', 'Huawei FreeBuds Pro', 43),
(44, 'https://m.media-amazon.com/images/I/41C5yctI-tL._SL500_.jpg', 'Xiaomi Smart Air Purifier', 44),
(45, 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6356/6356231_rd.jpg', 'Canon PIXMA G6020', 45),
(46, 'https://i.gadgets360cdn.com/large/gamecube_purple__1547458731074.jpg', 'Nintendo GameCube Classic', 46),
(47, 'https://storage.comprasmartphone.com/smartphones/microsoft-surface-duo-2.png', 'Microsoft Surface Duo 2', 47),
(48, 'https://leclaireur.fnac.com/wp-content/uploads/4d/8806092562554/9214365-pictures-defaut.png', 'Samsung Galaxy Z Fold 3', 48),
(49, 'https://www.lg.com/us/images/tvs/md08000813/gallery/desktop-02.jpg', 'LG NanoCell 75 Series', 49),
(50, 'https://brain-images-ssl.cdn.dixons.com/6/2/10207226/u_10207226.jpg', 'Apple AirPods Max', 50),
(51, 'https://m.media-amazon.com/images/I/71lddEkg7cL.jpg', 'Samsung Galaxy A53', 51),
(52, 'https://www.parkwaynigeria.com/wp-content/uploads/2022/01/LG-32UK50T-W-32-inch-4K-UHD-Monitor.jpg', 'LG 32UN500-W', 52),
(53, 'https://assets.hardwarezone.com/img/2021/05/imac-intro1.jpg', 'Apple iMac 24\"', 53),
(54, 'https://m.media-amazon.com/images/I/61+btxzpfDL._AC_SL1500_.jpg', 'Sony WH-1000XM5', 54),
(55, 'https://www.gizmochina.com/wp-content/uploads/2022/09/HUawei-Nova-10-SE.png', 'Huawei Nova 10', 55),
(56, 'https://www.antarti.com/system/products/images/images/000/031/555/original/4f6659a9efad620ffdf7d8d8cee3003f.jpg', 'Xiaomi 12X', 56),
(57, 'https://www.bhphotovideo.com/images/images1500x1500/canon_2727c002_eos_rebel_t7_dslr_1461734.jpg', 'Canon EOS Rebel T7', 57),
(58, 'https://i.wfcdn.de/teaser/1920/38487.jpg', 'Nintendo Game & Watch', 58),
(59, 'https://media.techtribune.net/uploads/2022/10/Surface-Studio-plus-Hero.jpg', 'Microsoft Surface Studio 2', 59),
(60, 'https://img.welt.de/img/wirtschaft/webwelt/mobile163295452/4802508447-ci102l-w1024/Samsung-2.jpg', 'Samsung The Frame 2022', 60),
(61, 'https://media.materiel.net/r900/products/MN0005632585_1.jpg', 'LG CineBeam HU70LA', 61),
(62, 'https://gudagudablog.com/wp-content/uploads/2021/01/IMG_5448.jpg', 'Apple Magic Keyboard', 62),
(63, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/x/b/xb43_blue_1.jpg', 'Sony SRS-XB43', 63),
(64, 'https://www.gadgetpilipinas.net/wp-content/uploads/2023/02/Huawei-MatePad-SE-10.4-PH-launch-soon-1-770x433.jpg', 'Huawei MatePad 11', 64),
(65, 'https://www.startech.com.bd/image/cache/catalog/smart-band/xiaomi/smart-band-7/xiaomi-smart-band-7-black-01-500x500.jpg', 'Xiaomi Smart Band 7', 65),
(66, 'https://www.bhphotovideo.com/images/images2500x2500/canon_2234c001_selphy_cp1300_compact_photo_1349456.jpg', 'Canon Selphy CP1300', 66),
(67, 'https://i5.walmartimages.com/asr/765735dd-4c6a-4570-b80b-dfe64296453c.2a51685020fde9fd6b5113cff6bb4360.jpeg', 'Nintendo Switch Joy-Con', 67),
(68, 'https://i5.walmartimages.com/asr/b98c89b5-033a-4057-b43e-99c913887dd9.35988d8f4d3fe04e2a09b068bdaa0062.jpeg', 'Microsoft Arc Mouse', 68),
(69, 'https://afdalmuntajat.com/wp-content/uploads/2021/11/Tab-S7-Ecran-scaled-1-1.jpg', 'Samsung Galaxy Tab S8', 69),
(70, 'https://imgeng.jagran.com/images/2024/05/10/template/image/LG-1715336928171.jpg', 'LG UltraGear 27GP950-B', 70),
(71, 'https://img2.joongna.com/cafe-article-data/live/2023/07/17/1002099257/1689582428390_006_GO2fs_main.jpg', 'Samsung Galaxy M32', 71),
(72, 'https://resources.claroshop.com/medios-plazavip/s2/10252/667429/5a8202be760f2-71f-jferpxl-1600x1600.jpg', 'LG Ultragear 24GL600F', 72),
(73, 'https://cdn.mos.cms.futurecdn.net/6QbFZzDxe3LqFStGGksKLk.jpg', 'Apple Mac Mini M1', 73),
(74, 'https://telefonika.com/wp-content/uploads/2021/02/Sony-HT-G700-3.1ch-Dolby-AtmosDTS-X-Soundbar.jpg', 'Sony HT-G700', 74),
(75, 'https://www.gdgtme.com/wp-content/uploads/2021/02/Huawei-FreeLace-Pro-Review-6.jpg', 'Huawei FreeLace Pro', 75),
(76, 'https://images.frandroid.com/wp-content/uploads/2021/08/xiaomi-mi-pad-5-pro-frandroid-2021.png', 'Xiaomi Mi Pad 5', 76),
(77, 'https://www.cameralabs.com/wp-content/uploads/2020/07/canon-eos-r6-hero1-945x709.jpg', 'Canon EOS R6', 77),
(78, 'https://cdn.mos.cms.futurecdn.net/b2iigLABgoNW5UQVPkg4vQ-1200-80.jpg', 'Nintendo Switch Lite Coral', 78),
(79, 'https://cdn.mos.cms.futurecdn.net/4xypbR6bCaRSMpawkMnnoW-480-80.jpg', 'Microsoft Surface Go 3', 79),
(80, 'https://images.samsung.com/kdp/static/pcd/lifestyle-tvs/the-serif/interior_05_mo.jpg', 'Samsung The Serif', 80),
(81, 'https://www.on-mag.fr/images/stories/2021/05/gal_lg_xboom_go_pl7_on/LG_Xboom_Go_PL7_details_on_010.jpg', 'LG XBOOM Go PL7', 81),
(82, 'https://www.ilounge.com/wp-content/uploads/2020/05/Apple-Pro-Display-XDR.jpg', 'Apple Pro Display XDR', 82),
(83, 'https://www.bhphotovideo.com/images/images500x500/sony_srs_ra5000_wireless_speaker_1616496628_1630687.jpg', 'Sony SRS-RA5000', 83),
(84, 'https://cdn.mos.cms.futurecdn.net/aRRfG7wN2Ek99nLMPsVTFY.jpg', 'Huawei MateBook X', 84),
(85, 'https://www.notebookcheck.org/fileadmin/Notebooks/News/_nc3/Redmi_Smart_Band_Pro_drdNBC.jpg', 'Xiaomi Redmi Smart Band Pro', 85),
(86, 'https://static.bhphoto.com/images/fb/1428256.jpg', 'Canon PIXMA TS9120', 86),
(87, 'https://assets.vg247.com/current/2021/07/nintendo_switch_oled_white_1.jpg', 'Nintendo Switch OLED White', 87),
(88, 'https://images.frandroid.com/wp-content/uploads/2020/09/microsoft-xbox-series-s-frandroid-2020.png', 'Microsoft Xbox Series S', 88),
(89, 'https://images.idgesg.net/images/article/2021/05/primary-alt-2-100887990-large.jpg', 'Samsung Galaxy Book Pro 360', 89),
(90, 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/5823/5823045_sd.jpg', 'LG UltraFine 5K', 90),
(91, 'https://images.frandroid.com/wp-content/uploads/2020/01/samsung-galaxy-z-flip-frandroid-2020.png', 'Samsung Galaxy Z Flip 4', 91),
(92, 'https://www.lg.com/us/images/monitors/md07000511/gallery/zoom-02.jpg', 'LG 34WN80C-B', 92),
(93, 'https://live.staticflickr.com/2544/4057376721_f812556f69_b.jpg', 'Apple Magic Mouse', 93),
(94, 'https://images.expertreviews.co.uk/wp-content/uploads/2021/07/sony_wf-1000xm4_review_earbuds_with_case.jpg', 'Sony WF-1000XM4', 94),
(95, 'https://images.frandroid.com/wp-content/uploads/2023/05/huawei-p60-pro-frandroid-2023-e1683224106720.png', 'Huawei P60 Pro', 95),
(96, 'https://elchapuzasinformatico.com/wp-content/uploads/2021/07/Xiaomi-Mi-Electric-Scooter-3-2.jpg', 'Xiaomi Mi Electric Scooter 3', 96),
(97, 'https://amateurphotographer.com/wp-content/uploads/sites/7/2021/04/Canon-EOS-M50-Mark-II-02.jpg', 'Canon EOS M50 Mark II', 97),
(98, 'https://shop.r10s.jp/otakarasouko/cabinet/_518/1240010413279_1.jpg', 'Nintendo Wii U Deluxe', 98),
(99, 'https://cdn.wccftech.com/wp-content/uploads/2023/02/Surface-Laptop-Studio-2.jpg', 'Microsoft Surface Laptop Studio', 99),
(100, 'https://m.media-amazon.com/images/I/61uKcMW9UOL._AC_UL1500_.jpg', 'Samsung Galaxy Watch 5', 100),
(101, 'https://www.themarysue.com/wp-content/uploads/2024/09/playstation-5-pro.jpg', 'PlayStation 5 PRO', 101);

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
(20, 'Nintendo Switch Lite', 'Consola portátil de videojuegos con pantalla de 5.5 pulgadas', 199.99, 1, 9, 9),
(21, 'Samsung Galaxy S22', 'Smartphone con pantalla AMOLED de 6.1 pulgadas y procesador Exynos', 899.99, 1, 1, 1),
(22, 'LG OLED55C1', 'Televisor OLED 4K de 55 pulgadas con HDR', 1299.99, 1, 4, 2),
(23, 'Apple iPad Pro 12.9\"', 'Tablet con pantalla Retina de 12.9 pulgadas y chip M1', 1099.99, 1, 5, 3),
(24, 'Sony WH-CH710N', 'Auriculares inalámbricos con cancelación de ruido', 199.99, 1, 7, 4),
(25, 'Huawei Watch GT 3', 'Smartwatch con pantalla AMOLED y duración de batería de 14 días', 249.99, 1, 6, 5),
(26, 'Xiaomi Redmi Note 11', 'Smartphone con pantalla AMOLED de 6.43 pulgadas', 249.99, 1, 1, 6),
(27, 'Canon EOS 90D', 'Cámara DSLR con sensor de 32.5 MP', 1199.99, 1, 8, 8),
(28, 'Nintendo Switch Pro', 'Consola de videojuegos híbrida de última generación', 399.99, 1, 9, 9),
(29, 'Microsoft Surface Pro 8', 'Tablet con pantalla táctil de 13 pulgadas y procesador Intel i7', 1099.99, 1, 5, 10),
(30, 'Samsung QLED Q60A', 'Televisor QLED 4K de 65 pulgadas con HDR', 999.99, 1, 4, 1),
(31, 'LG Gram 17', 'Laptop ultraligera con pantalla de 17 pulgadas', 1299.99, 1, 3, 2),
(32, 'Apple MacBook Air M2', 'Laptop con chip M2 y pantalla Retina de 13 pulgadas', 999.99, 1, 3, 3),
(33, 'Sony Xperia 10 IV', 'Smartphone con pantalla OLED de 6 pulgadas', 349.99, 1, 1, 4),
(34, 'Huawei MateBook D15', 'Laptop con procesador Intel i5 y pantalla de 15 pulgadas', 799.99, 1, 3, 5),
(35, 'Xiaomi Mi Band 6', 'Pulsera inteligente con pantalla AMOLED', 49.99, 1, 6, 6),
(36, 'Canon PowerShot G7 X', 'Cámara compacta con sensor de 20 MP', 649.99, 1, 8, 8),
(37, 'Nintendo 2DS XL', 'Consola portátil de videojuegos con pantalla dual', 149.99, 1, 9, 9),
(38, 'Microsoft Xbox Elite Controller', 'Control inalámbrico de alto rendimiento', 179.99, 1, 9, 10),
(39, 'Samsung Galaxy Tab A7', 'Tablet con pantalla de 10.4 pulgadas y procesador Snapdragon', 199.99, 1, 5, 1),
(40, 'LG 27UL500-W', 'Monitor 4K UHD de 27 pulgadas', 349.99, 1, 4, 2),
(41, 'Apple Watch Series 7', 'Smartwatch con pantalla Retina Always-On', 399.99, 1, 6, 3),
(42, 'Sony Alpha A6400', 'Cámara mirrorless con enfoque automático rápido', 899.99, 1, 8, 4),
(43, 'Huawei FreeBuds Pro', 'Auriculares inalámbricos con cancelación activa de ruido', 149.99, 1, 7, 5),
(44, 'Xiaomi Smart Air Purifier', 'Purificador de aire inteligente con conectividad Wi-Fi', 199.99, 1, 10, 6),
(45, 'Canon PIXMA G6020', 'Impresora multifunción con sistema de tinta continua', 249.99, 1, 11, 8),
(46, 'Nintendo GameCube Classic', 'Consola retro de videojuegos', 99.99, 1, 9, 9),
(47, 'Microsoft Surface Duo 2', 'Dispositivo móvil de doble pantalla con Android', 1499.99, 1, 1, 10),
(48, 'Samsung Galaxy Z Fold 3', 'Smartphone plegable con pantalla de 7.6 pulgadas', 1799.99, 1, 1, 1),
(49, 'LG NanoCell 75 Series', 'Televisor 4K UHD con tecnología NanoCell', 1099.99, 1, 4, 2),
(50, 'Apple AirPods Max', 'Auriculares inalámbricos premium con audio espacial', 549.99, 1, 7, 3),
(51, 'Samsung Galaxy A53', 'Smartphone con pantalla AMOLED de 6.5 pulgadas y cámara cuádruple', 399.99, 1, 1, 1),
(52, 'LG 32UN500-W', 'Monitor 4K UHD de 32 pulgadas con HDR10', 349.99, 1, 4, 2),
(53, 'Apple iMac 24\"', 'Computadora de escritorio con pantalla Retina 4.5K', 1499.99, 1, 3, 3),
(54, 'Sony WH-1000XM5', 'Auriculares inalámbricos premium con cancelación de ruido líder', 399.99, 1, 7, 4),
(55, 'Huawei Nova 10', 'Smartphone con diseño ultradelgado y cámara de 60 MP', 499.99, 1, 1, 5),
(56, 'Xiaomi 12X', 'Smartphone con procesador Snapdragon 870 y pantalla AMOLED', 599.99, 1, 1, 6),
(57, 'Canon EOS Rebel T7', 'Cámara DSLR con sensor de 24.1 MP y lente 18-55mm', 449.99, 1, 8, 8),
(58, 'Nintendo Game & Watch', 'Consola retro con diseño clásico y juegos preinstalados', 49.99, 1, 9, 9),
(59, 'Microsoft Surface Studio 2', 'Computadora todo-en-uno con pantalla táctil PixelSense', 3499.99, 1, 3, 10),
(60, 'Samsung The Frame 2022', 'Televisor QLED 4K con diseño de marco de arte', 1299.99, 1, 4, 1),
(61, 'LG CineBeam HU70LA', 'Proyector 4K UHD con HDR y compatibilidad inteligente', 1699.99, 1, 4, 2),
(62, 'Apple Magic Keyboard', 'Teclado inalámbrico con retroiluminación para iPad y Mac', 129.99, 1, 10, 3),
(63, 'Sony SRS-XB43', 'Altavoz inalámbrico portátil con EXTRA BASS', 229.99, 1, 10, 4),
(64, 'Huawei MatePad 11', 'Tablet con pantalla de 11 pulgadas y 120 Hz', 329.99, 1, 5, 5),
(65, 'Xiaomi Smart Band 7', 'Pulsera inteligente con pantalla AMOLED y monitoreo de salud', 49.99, 1, 6, 6),
(66, 'Canon Selphy CP1300', 'Impresora fotográfica portátil con conexión Wi-Fi', 129.99, 1, 11, 8),
(67, 'Nintendo Switch Joy-Con', 'Controladores inalámbricos para la consola Nintendo Switch', 79.99, 1, 9, 9),
(68, 'Microsoft Arc Mouse', 'Mouse ergonómico e inalámbrico con diseño plegable', 79.99, 1, 10, 10),
(69, 'Samsung Galaxy Tab S8', 'Tablet con pantalla de 11 pulgadas y procesador Snapdragon 8 Gen 1', 699.99, 1, 5, 1),
(70, 'LG UltraGear 27GP950-B', 'Monitor gaming 4K UHD de 27 pulgadas con 144 Hz', 799.99, 1, 4, 2),
(71, 'Samsung Galaxy M32', 'Smartphone con pantalla AMOLED de 6.4 pulgadas y batería de 6000 mAh', 249.99, 1, 1, 1),
(72, 'LG Ultragear 24GL600F', 'Monitor gaming Full HD de 24 pulgadas con 144 Hz', 199.99, 1, 4, 2),
(73, 'Apple Mac Mini M1', 'Computadora compacta con chip M1 y 256GB SSD', 699.99, 1, 3, 3),
(74, 'Sony HT-G700', 'Barra de sonido Dolby Atmos de 3.1 canales', 599.99, 1, 10, 4),
(75, 'Huawei FreeLace Pro', 'Auriculares inalámbricos con diseño deportivo y cancelación de ruido', 119.99, 1, 7, 5),
(76, 'Xiaomi Mi Pad 5', 'Tablet con pantalla de 11 pulgadas y procesador Snapdragon 860', 329.99, 1, 5, 6),
(77, 'Canon EOS R6', 'Cámara mirrorless con sensor de 20 MP y grabación 4K', 2499.99, 1, 8, 8),
(78, 'Nintendo Switch Lite Coral', 'Consola portátil de videojuegos en color coral', 199.99, 1, 9, 9),
(79, 'Microsoft Surface Go 3', 'Tablet con pantalla de 10.5 pulgadas y procesador Intel Pentium', 399.99, 1, 5, 10),
(80, 'Samsung The Serif', 'Televisor QLED 4K con diseño único y soporte de pie', 1099.99, 1, 4, 1),
(81, 'LG XBOOM Go PL7', 'Altavoz portátil Bluetooth con iluminación LED', 149.99, 1, 10, 2),
(82, 'Apple Pro Display XDR', 'Monitor 6K Retina de 32 pulgadas para profesionales', 4999.99, 1, 4, 3),
(83, 'Sony SRS-RA5000', 'Altavoz inalámbrico premium con sonido de 360 grados', 599.99, 1, 10, 4),
(84, 'Huawei MateBook X', 'Laptop ultraligera con pantalla táctil de 13 pulgadas', 1499.99, 1, 3, 5),
(85, 'Xiaomi Redmi Smart Band Pro', 'Pulsera inteligente con pantalla AMOLED y monitoreo deportivo', 59.99, 1, 6, 6),
(86, 'Canon PIXMA TS9120', 'Impresora multifunción con impresión de alta resolución', 199.99, 1, 11, 8),
(87, 'Nintendo Switch OLED White', 'Consola híbrida con pantalla OLED de 7 pulgadas', 349.99, 1, 9, 9),
(88, 'Microsoft Xbox Series S', 'Consola de videojuegos de próxima generación con diseño compacto', 299.99, 1, 9, 10),
(89, 'Samsung Galaxy Book Pro 360', 'Laptop convertible con pantalla AMOLED de 13.3 pulgadas', 1099.99, 1, 3, 1),
(90, 'LG UltraFine 5K', 'Monitor profesional con resolución 5K y compatibilidad con Mac', 1299.99, 1, 4, 2),
(91, 'Samsung Galaxy Z Flip 4', 'Smartphone plegable con pantalla AMOLED de 6.7 pulgadas', 999.99, 1, 1, 1),
(92, 'LG 34WN80C-B', 'Monitor ultrapanorámico QHD de 34 pulgadas con USB-C', 599.99, 1, 4, 2),
(93, 'Apple Magic Mouse', 'Mouse inalámbrico con diseño minimalista', 79.99, 1, 10, 3),
(94, 'Sony WF-1000XM4', 'Auriculares inalámbricos con cancelación activa de ruido', 279.99, 1, 7, 4),
(95, 'Huawei P60 Pro', 'Smartphone con cámara Leica y pantalla OLED curva', 1199.99, 1, 1, 5),
(96, 'Xiaomi Mi Electric Scooter 3', 'Scooter eléctrico plegable con autonomía de 30 km', 449.99, 1, 10, 6),
(97, 'Canon EOS M50 Mark II', 'Cámara mirrorless con sensor de 24.1 MP y grabación 4K', 699.99, 1, 8, 8),
(98, 'Nintendo Wii U Deluxe', 'Consola híbrida con juegos clásicos y pantalla táctil', 299.99, 1, 9, 9),
(99, 'Microsoft Surface Laptop Studio', 'Laptop convertible con pantalla táctil PixelSense', 1599.99, 1, 3, 10),
(100, 'Samsung Galaxy Watch 5', 'Smartwatch con monitoreo avanzado de salud y batería de larga duración', 299.99, 1, 6, 1),
(101, 'PlayStation 5 PRO', 'Consola de videojuegos de Sony.', 699.99, 1, 9, 4);

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
(120, 2, 20, 6),

(15, 21, 1), (9, 22, 1), (18, 23, 1), (6, 24, 1), (12, 25, 1), (4, 26, 1), (22, 27, 1), (7, 28, 1), (14, 29, 1), (10, 30, 1), 
(5, 31, 1), (17, 32, 1), (13, 33, 1), (20, 34, 1), (8, 35, 1), (11, 36, 1), (3, 37, 1), (25, 38, 1), (19, 39, 1), (9, 40, 1),
(12, 21, 2), (19, 22, 2), (11, 23, 2), (14, 24, 2), (10, 25, 2), (16, 26, 2), (7, 27, 2), (5, 28, 2), (22, 29, 2), (8, 30, 2), 
(20, 31, 2), (9, 32, 2), (3, 33, 2), (15, 34, 2), (14, 35, 2), (7, 36, 2), (13, 37, 2), (18, 38, 2), (17, 39, 2), (4, 40, 2), 
(8, 21, 3), (6, 22, 3), (14, 23, 3), (3, 24, 3), (17, 25, 3), (13, 26, 3), (9, 27, 3), (11, 28, 3), (16, 29, 3), (10, 30, 3), 
(7, 31, 3), (22, 32, 3), (5, 33, 3), (12, 34, 3), (14, 35, 3), (20, 36, 3), (18, 37, 3), (21, 38, 3), (6, 39, 3), (19, 40, 3), 
(11, 21, 4), (13, 22, 4), (4, 23, 4), (18, 24, 4), (7, 25, 4), (9, 26, 4), (12, 27, 4), (19, 28, 4), (8, 29, 4), (3, 30, 4), 
(17, 31, 4), (10, 32, 4), (21, 33, 4), (5, 34, 4), (22, 35, 4), (6, 36, 4), (20, 37, 4), (14, 38, 4), (15, 39, 4), (9, 40, 4),
(10, 21, 5), (5, 22, 5), (19, 23, 5), (7, 24, 5), (22, 25, 5), (4, 26, 5), (17, 27, 5), (8, 28, 5), (6, 29, 5), (13, 30, 5), 
(3, 31, 5), (12, 32, 5), (21, 33, 5), (20, 34, 5), (18, 35, 5), (15, 36, 5), (11, 37, 5), (7, 38, 5), (16, 39, 5), (14, 40, 5),
(14, 21, 6), (17, 22, 6), (7, 23, 6), (11, 24, 6), (20, 25, 6), (5, 26, 6), (18, 27, 6), (6, 28, 6), (12, 29, 6), (15, 30, 6), 
(9, 31, 6), (4, 32, 6), (13, 33, 6), (22, 34, 6), (10, 35, 6), (8, 36, 6), (3, 37, 6), (16, 38, 6), (19, 39, 6), (21, 40, 6),
(14, 41, 1), (7, 42, 1), (9, 43, 1), (18, 44, 1), (6, 45, 1), (21, 46, 1), (13, 47, 1), (10, 48, 1), (8, 49, 1), (22, 50, 1),
(5, 51, 1), (19, 52, 1), (3, 53, 1), (17, 54, 1), (11, 55, 1), (12, 56, 1), (16, 57, 1), (4, 58, 1), (20, 59, 1), (9, 60, 1),
(10, 41, 2), (5, 42, 2), (17, 43, 2), (8, 44, 2), (15, 45, 2), (9, 46, 2), (19, 47, 2), (6, 48, 2), (13, 49, 2), (11, 50, 2),
(3, 51, 2), (21, 52, 2), (14, 53, 2), (7, 54, 2), (12, 55, 2), (16, 56, 2), (4, 57, 2), (20, 58, 2), (18, 59, 2), (6, 60, 2),
(9, 41, 3), (3, 42, 3), (22, 43, 3), (6, 44, 3), (11, 45, 3), (20, 46, 3), (8, 47, 3), (17, 48, 3), (14, 49, 3), (12, 50, 3),
(5, 51, 3), (19, 52, 3), (7, 53, 3), (10, 54, 3), (4, 55, 3), (13, 56, 3), (16, 57, 3), (15, 58, 3), (18, 59, 3), (9, 60, 3),
(7, 41, 4), (16, 42, 4), (12, 43, 4), (4, 44, 4), (20, 45, 4), (13, 46, 4), (6, 47, 4), (10, 48, 4), (8, 49, 4), (17, 50, 4),
(3, 51, 4), (14, 52, 4), (19, 53, 4), (5, 54, 4), (22, 55, 4), (15, 56, 4), (11, 57, 4), (9, 58, 4), (18, 59, 4), (7, 60, 4),
(11, 41, 5), (9, 42, 5), (14, 43, 5), (19, 44, 5), (5, 45, 5), (16, 46, 5), (10, 47, 5), (3, 48, 5), (12, 49, 5), (7, 50, 5),
(22, 51, 5), (4, 52, 5), (20, 53, 5), (6, 54, 5), (18, 55, 5), (13, 56, 5), (8, 57, 5), (15, 58, 5), (17, 59, 5), (21, 60, 5),
(13, 41, 6), (6, 42, 6), (10, 43, 6), (15, 44, 6), (17, 45, 6), (4, 46, 6), (21, 47, 6), (9, 48, 6), (14, 49, 6), (8, 50, 6),
(20, 51, 6), (3, 52, 6), (5, 53, 6), (11, 54, 6), (19, 55, 6), (7, 56, 6), (18, 57, 6), (12, 58, 6), (16, 59, 6), (22, 60, 6),
(12, 61, 1), (5, 62, 1), (17, 63, 1), (9, 64, 1), (14, 65, 1), (6, 66, 1), (22, 67, 1), (7, 68, 1), (13, 69, 1), (19, 70, 1), 
(8, 71, 1), (16, 72, 1), (3, 73, 1), (11, 74, 1), (18, 75, 1), (20, 76, 1), (10, 77, 1), (4, 78, 1), (15, 79, 1), (21, 80, 1),
(9, 61, 2), (12, 62, 2), (7, 63, 2), (19, 64, 2), (5, 65, 2), (17, 66, 2), (11, 67, 2), (6, 68, 2), (15, 69, 2), (22, 70, 2), 
(8, 71, 2), (13, 72, 2), (20, 73, 2), (3, 74, 2), (16, 75, 2), (10, 76, 2), (4, 77, 2), (21, 78, 2), (18, 79, 2), (14, 80, 2),
(11, 61, 3), (18, 62, 3), (6, 63, 3), (14, 64, 3), (8, 65, 3), (5, 66, 3), (20, 67, 3), (10, 68, 3), (12, 69, 3), (4, 70, 3), 
(15, 71, 3), (7, 72, 3), (3, 73, 3), (16, 74, 3), (9, 75, 3), (22, 76, 3), (17, 77, 3), (19, 78, 3), (13, 79, 3), (21, 80, 3),
(13, 61, 4), (10, 62, 4), (8, 63, 4), (5, 64, 4), (17, 65, 4), (14, 66, 4), (4, 67, 4), (19, 68, 4), (22, 69, 4), (6, 70, 4), 
(9, 71, 4), (3, 72, 4), (12, 73, 4), (20, 74, 4), (11, 75, 4), (7, 76, 4), (21, 77, 4), (18, 78, 4), (16, 79, 4), (15, 80, 4),
(15, 61, 5), (9, 62, 5), (3, 63, 5), (20, 64, 5), (13, 65, 5), (16, 66, 5), (7, 67, 5), (22, 68, 5), (11, 69, 5), (5, 70, 5), 
(4, 71, 5), (10, 72, 5), (18, 73, 5), (6, 74, 5), (21, 75, 5), (17, 76, 5), (8, 77, 5), (19, 78, 5), (12, 79, 5), (14, 80, 5),
(10, 61, 6), (8, 62, 6), (21, 63, 6), (17, 64, 6), (3, 65, 6), (15, 66, 6), (12, 67, 6), (14, 68, 6), (7, 69, 6), (19, 70, 6), 
(5, 71, 6), (11, 72, 6), (6, 73, 6), (13, 74, 6), (9, 75, 6), (4, 76, 6), (16, 77, 6), (20, 78, 6), (18, 79, 6), (22, 80, 6),
(15, 81, 1), (6, 82, 1), (12, 83, 1), (8, 84, 1), (19, 85, 1), (7, 86, 1), (14, 87, 1), (4, 88, 1), (21, 89, 1), (10, 90, 1),
(22, 91, 1), (9, 92, 1), (16, 93, 1), (5, 94, 1), (11, 95, 1), (3, 96, 1), (17, 97, 1), (13, 98, 1), (18, 99, 1), (20, 100, 1),
(10, 81, 2), (14, 82, 2), (5, 83, 2), (21, 84, 2), (7, 85, 2), (12, 86, 2), (18, 87, 2), (8, 88, 2), (3, 89, 2), (22, 90, 2),
(19, 91, 2), (16, 92, 2), (6, 93, 2), (11, 94, 2), (20, 95, 2), (9, 96, 2), (13, 97, 2), (4, 98, 2), (17, 99, 2), (15, 100, 2),
(18, 81, 3), (3, 82, 3), (9, 83, 3), (16, 84, 3), (20, 85, 3), (6, 86, 3), (11, 87, 3), (19, 88, 3), (7, 89, 3), (13, 90, 3),
(10, 91, 3), (8, 92, 3), (15, 93, 3), (4, 94, 3), (12, 95, 3), (17, 96, 3), (5, 97, 3), (21, 98, 3), (14, 99, 3), (22, 100, 3),
(12, 81, 4), (17, 82, 4), (4, 83, 4), (13, 84, 4), (6, 85, 4), (15, 86, 4), (9, 87, 4), (20, 88, 4), (5, 89, 4), (14, 90, 4),
(22, 91, 4), (8, 92, 4), (11, 93, 4), (7, 94, 4), (16, 95, 4), (3, 96, 4), (10, 97, 4), (21, 98, 4), (19, 99, 4), (18, 100, 4),
(16, 81, 5), (8, 82, 5), (11, 83, 5), (5, 84, 5), (13, 85, 5), (3, 86, 5), (19, 87, 5), (17, 88, 5), (7, 89, 5), (6, 90, 5),
(20, 91, 5), (12, 92, 5), (18, 93, 5), (10, 94, 5), (14, 95, 5), (4, 96, 5), (9, 97, 5), (22, 98, 5), (15, 99, 5), (21, 100, 5),
(13, 81, 6), (5, 82, 6), (7, 83, 6), (19, 84, 6), (4, 85, 6), (21, 86, 6), (10, 87, 6), (9, 88, 6), (16, 89, 6), (15, 90, 6),
(18, 91, 6), (3, 92, 6), (12, 93, 6), (6, 94, 6), (17, 95, 6), (8, 96, 6), (11, 97, 6), (14, 98, 6), (20, 99, 6), (22, 100, 6);


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
('1j1d4g9x4N0iEQycj5DrKR21BcwCREDkB0IkpYrV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUJTYlZTOVE1NUpHMW1jUVpKUFhOeFJRMXlOZllGRUFSaXBMQWRJZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731825996),
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
('8RHBx5uEOa8KBEnrFpcsGVdMZ1fenBeSZN1yn8WA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2doWW85QVVvaTd3VEQ3QkFhVjR3NVFXSXBPcUswMmpUelpnN0NaeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731819738),
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
('DnGlY7NdLZBYMqu5UBYaLxY2uCv5GZfPZn7RJvYp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmxpd0FDWGZkUEt6VlNyV3dBd3BlcDltaHZmTU9WRWYxejNiT2hISCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731826138),
('F8VrE7s3UyFG0WkcT5dmjunOXCzHfKnLqYZMnNfn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDM2a2ptVjA1V0ZMeFozaEI2VDlXaUFEM1dVMVF6YzRLNzBXb1hhZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731641943),
('F9MCHv3NOJRfr6gOTJeCBPGA7Uc0OWKosPPVuvXH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnZpYkdmYVVxOVNKb1JTZnZDQzVQOUprRjhvUEg4NjNQMk9QaTZ5ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725024),
('fkQwfh6khR2k9mRegEARai6A0R94q4Np6VJCwEJM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblZMblhSNm1FOUFJSzBBcXJESGFxTkhnWFhFWjhTSk10NFFNdm1LaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXN1YXJpb3MvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1731729724),
('GBYOfIBpEvE2mgCI5sLN5v0f3cJUKvzqihGywj0r', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk9ZcW9nRks1YjZSWkxMVkJpZE1HQ0JGdnF0NUdKZE43aWlyQk4yUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731632800),
('GEmHt7jiuBEocxltq4O1BLwUrtLtsPGhVGRauqYR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFlMTTBReWZ2R2J2RFdZV2Q1dVdWSkNjSnZnTnlVNG9FV1hyMmpPYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731735552),
('h5uBMsLkUfTsz6JzPMF0sX02xZjcqTMlW5j3htwS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTZRVlc1VElKcU1zcUZ4WUxvdzdOSTlXdkJZUGRzRDlETmlINVoyVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731725821),
('hifFz1zcyAZcSjiKhXsNnQE34SxhjihbtbpWrTRi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3NGVDdmMzIxeUNLdEpIN1p4TG9pSnlubWk5Y2JyNnlNbExsWHZjZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726800),
('HJTl3a0ixBcAhh20b02ydqzivMyA7oJrqLjwEVWl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUQ0M0Y3d0lvYlM5d1hxMVpsMG0xeVVrRUthekRSQTY5cmFSYVhKZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731826113),
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
('RLYv0DYMXYvNkuVvE6tlPvsSUjiYafCcrkMcvAcF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEp1T1VXZ3FhdHRmRjdKYWFON01iTlBLT0l5N25QMUhPR3Zxb2k4MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731819715),
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
('WO9IF4ZJtYTGEmkkprbjdEqjYJyFOKiEwXNahMVW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk5oNlVDWEFZUTNCQVdiZHFGa3RvZThEZTdEUEZRQXo2cWdBdzNrSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731819793),
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
('zO0DDzbM4ihYAbyxS3DOAsTvqqhpceCkazqnDg5D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjQ1RGV6b3hFTGRzM2EwclcxT1c1OVB3WEtaZkVUOUpvelZNcTZnVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdWN1cnNhbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731726620),
('zv78FN55ILn2LSaQbks0xLZkIkA20JHbAsq4uCQN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnQ2bWJIa0pwbUk2ZmFXWUE5TE1hT0oxWWNhTnBKMldqcGphUmk5VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRvc3Byb2R1Y3RvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731819726);

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
(10, 'Altavoz', 1),
(11, 'Impresora', 1);

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
  MODIFY `idImagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

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
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

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
  MODIFY `idTipoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
