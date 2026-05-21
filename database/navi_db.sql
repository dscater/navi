-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-05-2026 a las 20:55:34
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `navi_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_zonas`
--

CREATE TABLE `asignacion_zonas` (
  `id` bigint UNSIGNED NOT NULL,
  `segmentacion_zona_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asignacion_zonas`
--

INSERT INTO `asignacion_zonas` (`id`, `segmentacion_zona_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2026-05-19 14:11:04', '2026-05-19 14:11:04'),
(2, 2, 4, '2026-05-19 14:14:31', '2026-05-19 14:14:31'),
(3, 1, 5, '2026-05-19 14:17:03', '2026-05-19 14:17:03'),
(5, 2, 6, '2026-05-19 14:22:08', '2026-05-19 14:22:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_productos`
--

CREATE TABLE `categoria_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria_productos`
--

INSERT INTO `categoria_productos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'CATEGORIA 1', '2026-05-19 14:30:20', '2026-05-19 14:30:20'),
(2, 'CATEGORIA 2', '2026-05-19 14:30:24', '2026-05-19 14:30:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudads`
--

CREATE TABLE `ciudads` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ciudads`
--

INSERT INTO `ciudads` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Ciudad 1', NULL, NULL),
(2, 'Ciudad 2', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit_ci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(900) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitud` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitud` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `segmentacion_zona_id` bigint UNSIGNED NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `fono`, `razon_social`, `nit_ci`, `dir`, `latitud`, `longitud`, `user_id`, `segmentacion_zona_id`, `fecha_registro`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mario gonzales', '67676767', 'gonzales', '564564564', 'los pedregales #w323', '-16.4666816266489', '-68.15597157691236', 5, 1, '2026-05-20', 1, '2026-05-20 15:56:03', '2026-05-20 15:56:03'),
(2, 'juan mamani', '67676767', NULL, NULL, 'los pedregales #111', '-16.464543790825925', '-68.1563555938417', 5, 1, '2026-05-20', 1, '2026-05-20 19:55:22', '2026-05-20 19:55:22'),
(3, 'maria gonzales', '676767676', NULL, NULL, 'los pedregales', '-16.46639354031556', '-68.15444854486383', 5, 1, '2026-05-20', 1, '2026-05-20 19:55:36', '2026-05-20 19:55:36'),
(4, 'felix contreras', '67676767', NULL, NULL, 'los olivos 3223', '-16.51077436050994', '-68.15931904933588', 6, 2, '2026-05-20', 1, '2026-05-20 20:05:12', '2026-05-20 20:05:12'),
(5, 'francisca choque', '6767676767', NULL, NULL, 'los pedregales', '-16.510646101336924', '-68.15821393431824', 6, 2, '2026-05-20', 1, '2026-05-20 20:05:35', '2026-05-20 20:05:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisions`
--

CREATE TABLE `comisions` (
  `id` bigint UNSIGNED NOT NULL,
  `distribuidor_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comisions`
--

INSERT INTO `comisions` (`id`, `distribuidor_id`, `user_id`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(3, 3, 1, '2026-05-21', '13:03:34', '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(4, 4, 1, '2026-05-21', '13:45:17', '2026-05-21 17:45:17', '2026-05-21 17:45:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comision_detalles`
--

CREATE TABLE `comision_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `comision_id` bigint UNSIGNED NOT NULL,
  `despacho_id` bigint UNSIGNED NOT NULL,
  `categoria_producto_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `comision_distribuidor` decimal(24,2) NOT NULL,
  `comision_vendedor` decimal(24,2) NOT NULL,
  `entrega_distribuidor` decimal(24,2) NOT NULL,
  `entrega_vendedor` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comision_detalles`
--

INSERT INTO `comision_detalles` (`id`, `comision_id`, `despacho_id`, `categoria_producto_id`, `producto_id`, `cantidad`, `comision_distribuidor`, `comision_vendedor`, `entrega_distribuidor`, `entrega_vendedor`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 1, 1, 36, 30.00, 15.00, 25.00, 15.00, '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(2, 3, 3, 1, 3, 24, 10.00, 5.00, 10.00, 5.00, '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(3, 3, 3, 2, 2, 16, 6.65, 3.33, 6.65, 3.33, '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(4, 3, 5, 1, 1, 48, 40.00, 20.00, 40.00, 20.00, '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(5, 3, 5, 1, 3, 1, 1.50, 0.50, 1.50, 0.50, '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(6, 3, 5, 2, 2, 24, 10.00, 5.00, 10.00, 5.00, '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(7, 3, 6, 1, 1, 48, 40.00, 20.00, 40.00, 20.00, '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(8, 3, 7, 1, 1, 12, 10.00, 5.00, 10.00, 5.00, '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(9, 4, 4, 1, 1, 24, 20.00, 10.00, 20.00, 10.00, '2026-05-21 17:45:17', '2026-05-21 17:45:17'),
(10, 4, 4, 1, 3, 6, 2.50, 1.25, 2.50, 1.25, '2026-05-21 17:45:17', '2026-05-21 17:45:17'),
(11, 4, 8, 1, 1, 6, 5.00, 2.50, 5.00, 2.50, '2026-05-21 17:45:17', '2026-05-21 17:45:17'),
(12, 4, 8, 2, 2, 12, 5.00, 2.50, 5.00, 2.50, '2026-05-21 17:45:17', '2026-05-21 17:45:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint UNSIGNED NOT NULL,
  `categoria_producto_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `precio_compra` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `categoria_producto_id`, `producto_id`, `cantidad`, `precio_compra`, `total`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 30, 40.00, 1200.00, '2026-05-20', '09:35:54', '2026-05-20 13:35:54', '2026-05-20 13:35:54'),
(2, 2, 2, 20, 40.00, 800.00, '2026-05-20', '09:37:10', '2026-05-20 13:37:10', '2026-05-20 13:37:10'),
(3, 1, 3, 30, 40.50, 1215.00, '2026-05-20', '09:37:31', '2026-05-20 13:37:31', '2026-05-20 13:37:31'),
(4, 1, 1, 10, 40.00, 400.00, '2026-05-20', '09:40:11', '2026-05-20 13:40:11', '2026-05-20 13:40:11'),
(5, 1, 1, 34, 40.00, 1360.00, '2026-05-20', '18:19:22', '2026-05-20 22:19:22', '2026-05-20 22:19:22'),
(6, 1, 3, 20, 40.00, 800.00, '2026-05-21', '12:09:35', '2026-05-21 16:09:35', '2026-05-21 16:09:35'),
(7, 1, 1, 100, 35.00, 3500.00, '2026-05-21', '12:09:43', '2026-05-21 16:09:43', '2026-05-21 16:09:43'),
(8, 2, 2, 40, 35.00, 1400.00, '2026-05-21', '12:10:04', '2026-05-21 16:10:04', '2026-05-21 16:10:04'),
(9, 1, 1, 50, 40.00, 2000.00, '2026-05-21', '16:12:51', '2026-05-21 20:12:51', '2026-05-21 20:12:51'),
(10, 2, 2, 20, 35.00, 700.00, '2026-05-21', '16:13:13', '2026-05-21 20:13:13', '2026-05-21 20:13:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_hora_inicio_admin` time DEFAULT NULL,
  `b_hora_fin_admin` time DEFAULT NULL,
  `b_hora_inicio_dist` time DEFAULT NULL,
  `b_hora_fin_dist` time DEFAULT NULL,
  `b_hora_inicio_ven` time DEFAULT NULL,
  `b_hora_fin_ven` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `logo`, `actividad`, `b_hora_inicio_admin`, `b_hora_fin_admin`, `b_hora_inicio_dist`, `b_hora_fin_dist`, `b_hora_inicio_ven`, `b_hora_fin_ven`, `created_at`, `updated_at`) VALUES
(1, 'NAVI', 'NAVI', 'logo11779111091.png', 'ACTIVIDAD NAVI', '08:00:00', '18:00:00', '08:00:00', '18:00:00', '08:00:00', '18:00:00', '2026-05-18 13:31:09', '2026-05-18 13:31:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consolidados`
--

CREATE TABLE `consolidados` (
  `id` bigint UNSIGNED NOT NULL,
  `distribuidor_id` bigint UNSIGNED NOT NULL,
  `despacho_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `consolidados`
--

INSERT INTO `consolidados` (`id`, `distribuidor_id`, `despacho_id`, `user_id`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(4, 3, 3, 1, '2026-05-21', '11:09:54', '2026-05-21 15:09:54', '2026-05-21 15:09:54'),
(5, 3, 5, 1, '2026-05-21', '12:18:40', '2026-05-21 16:18:40', '2026-05-21 16:18:40'),
(6, 3, 6, 1, '2026-05-21', '12:18:48', '2026-05-21 16:18:48', '2026-05-21 16:18:48'),
(7, 3, 7, 1, '2026-05-21', '12:18:55', '2026-05-21 16:18:55', '2026-05-21 16:18:55'),
(8, 4, 4, 1, '2026-05-21', '13:39:13', '2026-05-21 17:39:13', '2026-05-21 17:39:13'),
(9, 4, 8, 1, '2026-05-21', '13:40:30', '2026-05-21 17:40:30', '2026-05-21 17:40:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'La Paz', NULL, NULL),
(2, 'Cochabamba', NULL, NULL),
(3, 'Santa Cruz', NULL, NULL),
(4, 'Oruro', NULL, NULL),
(5, 'Potosi', NULL, NULL),
(6, 'Chuquisaca', NULL, NULL),
(7, 'Tarija', NULL, NULL),
(8, 'Pando', NULL, NULL),
(9, 'Beni', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despachos`
--

CREATE TABLE `despachos` (
  `id` bigint UNSIGNED NOT NULL,
  `distribuidor_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SIN CONSOLIDAR',
  `comision` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `despachos`
--

INSERT INTO `despachos` (`id`, `distribuidor_id`, `user_id`, `observacion`, `fecha`, `hora`, `estado`, `comision`, `created_at`, `updated_at`) VALUES
(3, 3, 1, NULL, '2026-05-20', '18:12:14', 'CONSOLIDADO', 1, '2026-05-20 22:12:14', '2026-05-21 17:03:34'),
(4, 4, 1, NULL, '2026-05-20', '18:19:36', 'CONSOLIDADO', 1, '2026-05-20 22:19:36', '2026-05-21 17:45:17'),
(5, 3, 1, NULL, '2026-05-21', '12:10:13', 'CONSOLIDADO', 1, '2026-05-21 16:10:13', '2026-05-21 17:03:34'),
(6, 3, 1, NULL, '2026-05-21', '12:14:51', 'CONSOLIDADO', 1, '2026-05-21 16:14:51', '2026-05-21 17:03:34'),
(7, 3, 1, NULL, '2026-05-21', '12:16:47', 'CONSOLIDADO', 1, '2026-05-21 16:16:47', '2026-05-21 17:03:34'),
(8, 4, 1, NULL, '2026-05-21', '13:39:56', 'CONSOLIDADO', 1, '2026-05-21 17:39:56', '2026-05-21 17:45:17'),
(9, 4, 1, NULL, '2026-05-21', '15:30:13', 'SIN CONSOLIDAR', 0, '2026-05-21 19:30:13', '2026-05-21 19:30:13'),
(10, 3, 1, NULL, '2026-05-21', '16:13:56', 'SIN CONSOLIDAR', 0, '2026-05-21 20:13:56', '2026-05-21 20:13:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` json DEFAULT NULL,
  `datos_nuevo` json DEFAULT NULL,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA SUCURSAL', '{\"id\": 1, \"zona\": \"zona 1\", \"color\": \"#ee4949\", \"ciudad_id\": \"1\", \"created_at\": \"2026-05-18T21:15:38.000000Z\", \"updated_at\": \"2026-05-18T21:15:38.000000Z\", \"provincia_id\": \"1\", \"segmentacion\": [{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.12577832514687\", \"lng\": \"-67.19754338264467\"}, {\"lat\": \"-16.125262989358294\", \"lng\": \"-67.1967923641205\"}, {\"lat\": \"-16.12590200553673\", \"lng\": \"-67.19606280326845\"}, {\"lat\": \"-16.12668531287989\", \"lng\": \"-67.1968996524811\"}]}], \"departamento_id\": \"1\"}', NULL, 'SEGMENTACIÓN DE ZONAS', '2026-05-18', '17:15:38', '2026-05-18 21:15:38', '2026-05-18 21:15:38'),
(2, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA SUCURSAL', '{\"id\": 2, \"zona\": \"zona 2\", \"color\": \"#2ab760\", \"ciudad_id\": \"1\", \"created_at\": \"2026-05-18T21:32:09.000000Z\", \"updated_at\": \"2026-05-18T21:32:09.000000Z\", \"provincia_id\": \"1\", \"segmentacion\": [{\"color\": \"#2ab760\", \"coordenadas\": [{\"lat\": \"-16.12647917966873\", \"lng\": \"-67.19490408897401\"}, {\"lat\": \"-16.127241871478976\", \"lng\": \"-67.19548344612123\"}, {\"lat\": \"-16.12757168324447\", \"lng\": \"-67.19458222389223\"}, {\"lat\": \"-16.12647917966873\", \"lng\": \"-67.19436764717103\"}]}], \"departamento_id\": \"1\"}', NULL, 'SEGMENTACIÓN DE ZONAS', '2026-05-18', '17:32:09', '2026-05-18 21:32:09', '2026-05-18 21:32:09'),
(3, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA SUCURSAL', '{\"id\": 2, \"zona\": \"zona 2\", \"color\": \"#2ab760\", \"ciudad_id\": 1, \"created_at\": \"2026-05-18T21:32:09.000000Z\", \"updated_at\": \"2026-05-18T21:32:09.000000Z\", \"provincia_id\": 1, \"segmentacion\": [{\"color\": \"#2ab760\", \"coordenadas\": [{\"lat\": \"-16.12647917966873\", \"lng\": \"-67.19490408897401\"}, {\"lat\": \"-16.127241871478976\", \"lng\": \"-67.19548344612123\"}, {\"lat\": \"-16.12757168324447\", \"lng\": \"-67.19458222389223\"}, {\"lat\": \"-16.12647917966873\", \"lng\": \"-67.19436764717103\"}]}], \"departamento_id\": 1}', '{\"id\": 2, \"zona\": \"zona 2\", \"color\": \"#2ab760\", \"ciudad_id\": \"1\", \"created_at\": \"2026-05-18T21:32:09.000000Z\", \"updated_at\": \"2026-05-18T21:44:08.000000Z\", \"provincia_id\": \"1\", \"segmentacion\": [{\"color\": \"#2ab760\", \"coordenadas\": [{\"lat\": \"-16.511951190703318\", \"lng\": \"-68.15705537796022\"}, {\"lat\": \"-16.508906397080768\", \"lng\": \"-68.15606832504274\"}, {\"lat\": \"-16.509070981745964\", \"lng\": \"-68.16160440444948\"}, {\"lat\": \"-16.512198063759822\", \"lng\": \"-68.16164731979372\"}]}], \"departamento_id\": \"1\"}', 'SEGMENTACIÓN DE ZONAS', '2026-05-18', '17:44:08', '2026-05-18 21:44:08', '2026-05-18 21:44:08'),
(4, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA SUCURSAL', '{\"id\": 1, \"zona\": \"zona 1\", \"color\": \"#ee4949\", \"ciudad_id\": 1, \"created_at\": \"2026-05-18T21:15:38.000000Z\", \"updated_at\": \"2026-05-18T21:15:38.000000Z\", \"provincia_id\": 1, \"segmentacion\": [{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.12577832514687\", \"lng\": \"-67.19754338264467\"}, {\"lat\": \"-16.125262989358294\", \"lng\": \"-67.1967923641205\"}, {\"lat\": \"-16.12590200553673\", \"lng\": \"-67.19606280326845\"}, {\"lat\": \"-16.12668531287989\", \"lng\": \"-67.1968996524811\"}]}], \"departamento_id\": 1}', '{\"id\": 1, \"zona\": \"zona 1\", \"color\": \"#ee4949\", \"ciudad_id\": \"1\", \"created_at\": \"2026-05-18T21:15:38.000000Z\", \"updated_at\": \"2026-05-18T21:44:48.000000Z\", \"provincia_id\": \"1\", \"segmentacion\": [{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.521764794670002\", \"lng\": \"-68.15729141235353\"}, {\"lat\": \"-16.51676515842266\", \"lng\": \"-68.15362215042116\"}, {\"lat\": \"-16.52190815381132\", \"lng\": \"-68.15096139907838\"}, {\"lat\": \"-16.525364169786208\", \"lng\": \"-68.1563687324524\"}]}], \"departamento_id\": \"1\"}', 'SEGMENTACIÓN DE ZONAS', '2026-05-18', '17:44:48', '2026-05-18 21:44:48', '2026-05-18 21:44:48'),
(5, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"id\": 2, \"tipo\": \"ADMINISTRADOR\", \"acceso\": \"1\", \"nombre\": \"JUAN PERES\", \"bloqueo\": \"1\", \"usuario\": \"jperes\", \"created_at\": \"2026-05-19T13:02:59.000000Z\", \"updated_at\": \"2026-05-19T13:02:59.000000Z\", \"fecha_registro\": \"2026-05-19\"}', NULL, 'USUARIOS', '2026-05-19', '09:02:59', '2026-05-19 13:02:59', '2026-05-19 13:02:59'),
(6, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"id\": 3, \"tipo\": \"DISTRIBUIDOR\", \"acceso\": \"1\", \"nombre\": \"FELIX CORTEZ\", \"bloqueo\": \"1\", \"usuario\": \"fcortez\", \"created_at\": \"2026-05-19T13:03:19.000000Z\", \"updated_at\": \"2026-05-19T13:03:19.000000Z\", \"fecha_registro\": \"2026-05-19\"}', NULL, 'USUARIOS', '2026-05-19', '09:03:19', '2026-05-19 13:03:19', '2026-05-19 13:03:19'),
(7, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"id\": 4, \"tipo\": \"DISTRIBUIDOR\", \"acceso\": \"1\", \"nombre\": \"CARLOS SANZ\", \"bloqueo\": \"1\", \"usuario\": \"csanz\", \"created_at\": \"2026-05-19T13:03:33.000000Z\", \"updated_at\": \"2026-05-19T13:03:33.000000Z\", \"fecha_registro\": \"2026-05-19\"}', NULL, 'USUARIOS', '2026-05-19', '09:03:33', '2026-05-19 13:03:33', '2026-05-19 13:03:33'),
(8, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"id\": 5, \"tipo\": \"VENDEDOR\", \"acceso\": \"1\", \"nombre\": \"JOSE MAMANI\", \"bloqueo\": \"1\", \"usuario\": \"jmamani\", \"created_at\": \"2026-05-19T13:03:57.000000Z\", \"updated_at\": \"2026-05-19T13:03:57.000000Z\", \"fecha_registro\": \"2026-05-19\"}', NULL, 'USUARIOS', '2026-05-19', '09:03:57', '2026-05-19 13:03:57', '2026-05-19 13:03:57'),
(9, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"id\": 6, \"tipo\": \"VENDEDOR\", \"acceso\": \"1\", \"nombre\": \"MARIA MAMANI\", \"bloqueo\": \"1\", \"usuario\": \"mmamani\", \"created_at\": \"2026-05-19T13:04:11.000000Z\", \"updated_at\": \"2026-05-19T13:04:11.000000Z\", \"fecha_registro\": \"2026-05-19\"}', NULL, 'USUARIOS', '2026-05-19', '09:04:11', '2026-05-19 13:04:11', '2026-05-19 13:04:11'),
(10, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ASIGNACIÓN DE ZONA', '{\"id\": 1, \"user_id\": 3, \"created_at\": \"2026-05-19T14:11:04.000000Z\", \"updated_at\": \"2026-05-19T14:11:04.000000Z\", \"segmentacion_zona_id\": 1}', NULL, 'ASIGNACIÓN DE ZONAS', '2026-05-19', '10:11:04', '2026-05-19 14:11:04', '2026-05-19 14:11:04'),
(11, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ASIGNACIÓN DE ZONA', '{\"id\": 2, \"user_id\": 4, \"created_at\": \"2026-05-19T14:14:31.000000Z\", \"updated_at\": \"2026-05-19T14:14:31.000000Z\", \"segmentacion_zona_id\": 2}', NULL, 'ASIGNACIÓN DE ZONAS', '2026-05-19', '10:14:31', '2026-05-19 14:14:31', '2026-05-19 14:14:31'),
(12, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ASIGNACIÓN DE ZONA', '{\"id\": 3, \"user_id\": 5, \"created_at\": \"2026-05-19T14:17:03.000000Z\", \"updated_at\": \"2026-05-19T14:17:03.000000Z\", \"segmentacion_zona_id\": 1}', NULL, 'ASIGNACIÓN DE ZONAS', '2026-05-19', '10:17:03', '2026-05-19 14:17:03', '2026-05-19 14:17:03'),
(13, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ASIGNACIÓN DE ZONA', '{\"id\": 4, \"user_id\": 6, \"created_at\": \"2026-05-19T14:21:48.000000Z\", \"updated_at\": \"2026-05-19T14:21:48.000000Z\", \"segmentacion_zona_id\": 2}', NULL, 'ASIGNACIÓN DE ZONAS', '2026-05-19', '10:21:48', '2026-05-19 14:21:48', '2026-05-19 14:21:48'),
(14, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA ASIGNACIÓN DE ZONA', '{\"id\": 4, \"user_id\": 6, \"created_at\": \"2026-05-19T14:21:48.000000Z\", \"updated_at\": \"2026-05-19T14:21:48.000000Z\", \"segmentacion_zona_id\": 2}', NULL, 'ASIGNACIÓN DE ZONAS', '2026-05-19', '10:21:58', '2026-05-19 14:21:58', '2026-05-19 14:21:58'),
(15, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ASIGNACIÓN DE ZONA', '{\"id\": 5, \"user_id\": 6, \"created_at\": \"2026-05-19T14:22:08.000000Z\", \"updated_at\": \"2026-05-19T14:22:08.000000Z\", \"segmentacion_zona_id\": 2}', NULL, 'ASIGNACIÓN DE ZONAS', '2026-05-19', '10:22:08', '2026-05-19 14:22:08', '2026-05-19 14:22:08'),
(16, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORÍA DE PRODUCTO', '{\"id\": 1, \"nombre\": \"CATEGORIA 1\", \"created_at\": \"2026-05-19T14:29:47.000000Z\", \"updated_at\": \"2026-05-19T14:29:47.000000Z\"}', NULL, 'CATEGORÍA DE PRODUCTOS', '2026-05-19', '10:29:47', '2026-05-19 14:29:47', '2026-05-19 14:29:47'),
(17, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA CATEGORÍA DE PRODUCTO', '{\"id\": 1, \"nombre\": \"CATEGORIA 1\", \"created_at\": \"2026-05-19T14:29:47.000000Z\", \"updated_at\": \"2026-05-19T14:29:47.000000Z\"}', '{\"id\": 1, \"nombre\": \"CATEGORIA 1 ASD\", \"created_at\": \"2026-05-19T14:29:47.000000Z\", \"updated_at\": \"2026-05-19T14:29:50.000000Z\"}', 'CATEGORÍA DE PRODUCTOS', '2026-05-19', '10:29:50', '2026-05-19 14:29:50', '2026-05-19 14:29:50'),
(18, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA CATEGORÍA DE PRODUCTO', '{\"id\": 1, \"nombre\": \"CATEGORIA 1 ASD\", \"created_at\": \"2026-05-19T14:29:47.000000Z\", \"updated_at\": \"2026-05-19T14:29:50.000000Z\"}', '{\"id\": 1, \"nombre\": \"CATEGORIA 1\", \"created_at\": \"2026-05-19T14:29:47.000000Z\", \"updated_at\": \"2026-05-19T14:29:55.000000Z\"}', 'CATEGORÍA DE PRODUCTOS', '2026-05-19', '10:29:55', '2026-05-19 14:29:55', '2026-05-19 14:29:55'),
(19, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORÍA DE PRODUCTO', '{\"id\": 2, \"nombre\": \"CATEGORIA 2\", \"created_at\": \"2026-05-19T14:30:00.000000Z\", \"updated_at\": \"2026-05-19T14:30:00.000000Z\"}', NULL, 'CATEGORÍA DE PRODUCTOS', '2026-05-19', '10:30:00', '2026-05-19 14:30:00', '2026-05-19 14:30:00'),
(20, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORÍA DE PRODUCTO', '{\"id\": 1, \"nombre\": \"CATEGORIA 1\", \"created_at\": \"2026-05-19T14:30:20.000000Z\", \"updated_at\": \"2026-05-19T14:30:20.000000Z\"}', NULL, 'CATEGORÍA DE PRODUCTOS', '2026-05-19', '10:30:20', '2026-05-19 14:30:20', '2026-05-19 14:30:20'),
(21, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORÍA DE PRODUCTO', '{\"id\": 2, \"nombre\": \"CATEGORIA 2\", \"created_at\": \"2026-05-19T14:30:24.000000Z\", \"updated_at\": \"2026-05-19T14:30:24.000000Z\"}', NULL, 'CATEGORÍA DE PRODUCTOS', '2026-05-19', '10:30:24', '2026-05-19 14:30:24', '2026-05-19 14:30:24'),
(22, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', '{\"id\": 1, \"estado\": \"1\", \"imagen\": \"11779216124.png\", \"nombre\": \"producto 1\", \"stock_min\": \"5\", \"created_at\": \"2026-05-19T18:42:04.000000Z\", \"updated_at\": \"2026-05-19T18:42:04.000000Z\", \"descripcion\": \"desc prod 1\", \"categoria_producto_id\": \"1\"}', NULL, 'PRODUCTOS', '2026-05-19', '14:42:04', '2026-05-19 18:42:04', '2026-05-19 18:42:04'),
(23, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', '{\"id\": 2, \"estado\": \"1\", \"imagen\": \"21779216384.png\", \"nombre\": \"producto 2\", \"stock_min\": \"4\", \"created_at\": \"2026-05-19T18:46:24.000000Z\", \"updated_at\": \"2026-05-19T18:46:24.000000Z\", \"descripcion\": null, \"categoria_producto_id\": \"2\"}', NULL, 'PRODUCTOS', '2026-05-19', '14:46:24', '2026-05-19 18:46:24', '2026-05-19 18:46:24'),
(24, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', '{\"id\": 3, \"estado\": \"1\", \"nombre\": \"producto 3\", \"stock_min\": \"4\", \"created_at\": \"2026-05-19T18:46:36.000000Z\", \"updated_at\": \"2026-05-19T18:46:36.000000Z\", \"descripcion\": null, \"categoria_producto_id\": \"1\"}', NULL, 'PRODUCTOS', '2026-05-19', '14:46:36', '2026-05-19 18:46:36', '2026-05-19 18:46:36'),
(25, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 1, \"nombre\": \"caja\", \"precio\": \"120\", \"equivale\": \"24\", \"created_at\": \"2026-05-19T19:39:50.000000Z\", \"updated_at\": \"2026-05-19T19:39:50.000000Z\", \"producto_id\": \"3\", \"comi_vendedor\": \"5\", \"comi_distribuidor\": \"10\"}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:39:50', '2026-05-19 19:39:50', '2026-05-19 19:39:50'),
(26, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 2, \"nombre\": \"media caja\", \"precio\": \"65\", \"equivale\": \"12\", \"created_at\": \"2026-05-19T19:41:19.000000Z\", \"updated_at\": \"2026-05-19T19:41:19.000000Z\", \"producto_id\": \"3\", \"comi_vendedor\": \"2.50\", \"comi_distribuidor\": \"5\"}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:41:19', '2026-05-19 19:41:19', '2026-05-19 19:41:19'),
(27, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 3, \"nombre\": \"unidad\", \"precio\": \"6\", \"equivale\": \"1\", \"created_at\": \"2026-05-19T19:43:34.000000Z\", \"updated_at\": \"2026-05-19T19:43:34.000000Z\", \"producto_id\": \"3\", \"comi_vendedor\": \"0.5\", \"comi_distribuidor\": \"6\"}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:43:34', '2026-05-19 19:43:34', '2026-05-19 19:43:34'),
(28, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 4, \"nombre\": \"caja\", \"precio\": 200, \"equivale\": 24, \"created_at\": \"2026-05-19T19:46:57.000000Z\", \"updated_at\": \"2026-05-19T19:46:57.000000Z\", \"producto_id\": 2, \"comi_vendedor\": \"5\", \"comi_distribuidor\": 10}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:46:57', '2026-05-19 19:46:57', '2026-05-19 19:46:57'),
(29, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 5, \"nombre\": \"media caja\", \"precio\": 110, \"equivale\": 12, \"created_at\": \"2026-05-19T19:48:16.000000Z\", \"updated_at\": \"2026-05-19T19:48:16.000000Z\", \"producto_id\": 2, \"comi_vendedor\": \"2.5\", \"comi_distribuidor\": 5}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:48:16', '2026-05-19 19:48:16', '2026-05-19 19:48:16'),
(30, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 6, \"nombre\": \"unidad\", \"precio\": 7, \"equivale\": 1, \"created_at\": \"2026-05-19T19:48:37.000000Z\", \"updated_at\": \"2026-05-19T19:48:37.000000Z\", \"producto_id\": 2, \"comi_vendedor\": \"0.5\", \"comi_distribuidor\": 2.5}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:48:37', '2026-05-19 19:48:37', '2026-05-19 19:48:37'),
(31, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 7, \"nombre\": \"caja\", \"precio\": 400, \"equivale\": 24, \"created_at\": \"2026-05-19T19:49:05.000000Z\", \"updated_at\": \"2026-05-19T19:49:05.000000Z\", \"producto_id\": 1, \"comi_vendedor\": 10, \"comi_distribuidor\": 20}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:49:05', '2026-05-19 19:49:05', '2026-05-19 19:49:05'),
(32, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 8, \"nombre\": \"media caja\", \"precio\": 200, \"equivale\": 12, \"created_at\": \"2026-05-19T19:50:47.000000Z\", \"updated_at\": \"2026-05-19T19:50:47.000000Z\", \"producto_id\": 1, \"comi_vendedor\": 5, \"comi_distribuidor\": 10}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:50:47', '2026-05-19 19:50:47', '2026-05-19 19:50:47'),
(33, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 3, \"nombre\": \"unidad\", \"precio\": \"6.00\", \"equivale\": 1, \"created_at\": \"2026-05-19T19:43:34.000000Z\", \"updated_at\": \"2026-05-19T19:43:34.000000Z\", \"producto_id\": 3, \"comi_vendedor\": \"0.50\", \"comi_distribuidor\": \"6.00\"}', '{\"id\": 3, \"nombre\": \"unidad\", \"precio\": \"6.00\", \"equivale\": 1, \"created_at\": \"2026-05-19T19:43:34.000000Z\", \"updated_at\": \"2026-05-19T19:55:53.000000Z\", \"producto_id\": 3, \"comi_vendedor\": \"0.50\", \"comi_distribuidor\": 1.5}', 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:55:53', '2026-05-19 19:55:53', '2026-05-19 19:55:53'),
(34, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 9, \"nombre\": \"asd\", \"precio\": 1, \"equivale\": 1, \"created_at\": \"2026-05-19T19:59:39.000000Z\", \"updated_at\": \"2026-05-19T19:59:39.000000Z\", \"producto_id\": 3, \"comi_vendedor\": 1, \"comi_distribuidor\": 1}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '15:59:39', '2026-05-19 19:59:39', '2026-05-19 19:59:39'),
(35, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 10, \"nombre\": \"asdasd\", \"precio\": 1, \"equivale\": 1, \"created_at\": \"2026-05-19T20:00:10.000000Z\", \"updated_at\": \"2026-05-19T20:00:10.000000Z\", \"producto_id\": 3, \"comi_vendedor\": 1, \"comi_distribuidor\": 1}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '16:00:10', '2026-05-19 20:00:10', '2026-05-19 20:00:10'),
(36, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 11, \"nombre\": \"xx\", \"precio\": 1, \"equivale\": 1, \"created_at\": \"2026-05-19T20:00:19.000000Z\", \"updated_at\": \"2026-05-19T20:00:19.000000Z\", \"producto_id\": 3, \"comi_vendedor\": 1, \"comi_distribuidor\": 1}', NULL, 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '16:00:19', '2026-05-19 20:00:19', '2026-05-19 20:00:19'),
(37, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA PRESENTACIÓN DE PRODUCTO', '{\"id\": 10, \"nombre\": \"asdasd\", \"precio\": \"1.00\", \"equivale\": 1, \"created_at\": \"2026-05-19T20:00:10.000000Z\", \"updated_at\": \"2026-05-19T20:00:10.000000Z\", \"producto_id\": 3, \"comi_vendedor\": \"1.00\", \"comi_distribuidor\": \"1.00\"}', '{\"id\": 10, \"nombre\": \"eeeeee\", \"precio\": \"1.00\", \"equivale\": 1, \"created_at\": \"2026-05-19T20:00:10.000000Z\", \"updated_at\": \"2026-05-19T20:00:27.000000Z\", \"producto_id\": 3, \"comi_vendedor\": \"1.00\", \"comi_distribuidor\": \"1.00\"}', 'PRESENTACIÓN DE PRODUCTOS', '2026-05-19', '16:00:27', '2026-05-19 20:00:27', '2026-05-19 20:00:27'),
(38, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORÍA DE PRODUCTO', '{\"id\": 1, \"hora\": \"09:35:54\", \"fecha\": \"2026-05-20\", \"total\": 1200, \"cantidad\": 30, \"created_at\": \"2026-05-20T13:35:54.000000Z\", \"updated_at\": \"2026-05-20T13:35:54.000000Z\", \"producto_id\": 1, \"precio_compra\": 40, \"categoria_producto_id\": 1}', NULL, 'CATEGORÍA DE PRODUCTOS', '2026-05-20', '09:35:54', '2026-05-20 13:35:54', '2026-05-20 13:35:54'),
(39, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORÍA DE PRODUCTO', '{\"id\": 2, \"hora\": \"09:37:10\", \"fecha\": \"2026-05-20\", \"total\": 800, \"cantidad\": 20, \"created_at\": \"2026-05-20T13:37:10.000000Z\", \"updated_at\": \"2026-05-20T13:37:10.000000Z\", \"producto_id\": 2, \"precio_compra\": 40, \"categoria_producto_id\": 2}', NULL, 'CATEGORÍA DE PRODUCTOS', '2026-05-20', '09:37:10', '2026-05-20 13:37:10', '2026-05-20 13:37:10'),
(40, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORÍA DE PRODUCTO', '{\"id\": 3, \"hora\": \"09:37:31\", \"fecha\": \"2026-05-20\", \"total\": 1215, \"cantidad\": 30, \"created_at\": \"2026-05-20T13:37:31.000000Z\", \"updated_at\": \"2026-05-20T13:37:31.000000Z\", \"producto_id\": 3, \"precio_compra\": 40.5, \"categoria_producto_id\": 1}', NULL, 'CATEGORÍA DE PRODUCTOS', '2026-05-20', '09:37:31', '2026-05-20 13:37:31', '2026-05-20 13:37:31'),
(41, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORÍA DE PRODUCTO', '{\"id\": 4, \"hora\": \"09:40:11\", \"fecha\": \"2026-05-20\", \"total\": 400, \"cantidad\": 10, \"created_at\": \"2026-05-20T13:40:11.000000Z\", \"updated_at\": \"2026-05-20T13:40:11.000000Z\", \"producto_id\": 1, \"precio_compra\": 40, \"categoria_producto_id\": 1}', NULL, 'CATEGORÍA DE PRODUCTOS', '2026-05-20', '09:40:11', '2026-05-20 13:40:11', '2026-05-20 13:40:11'),
(42, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA SEGMENTACIÓN DE ZONA', '{\"id\": 1, \"zona\": \"zona 1\", \"color\": \"#ee4949\", \"ciudad_id\": 1, \"created_at\": \"2026-05-18T21:15:38.000000Z\", \"updated_at\": \"2026-05-18T21:44:48.000000Z\", \"provincia_id\": 1, \"segmentacion\": [{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.521764794670002\", \"lng\": \"-68.15729141235353\"}, {\"lat\": \"-16.51676515842266\", \"lng\": \"-68.15362215042116\"}, {\"lat\": \"-16.52190815381132\", \"lng\": \"-68.15096139907838\"}, {\"lat\": \"-16.525364169786208\", \"lng\": \"-68.1563687324524\"}]}], \"departamento_id\": 1}', '{\"id\": 1, \"zona\": \"zona 1\", \"color\": \"#ee4949\", \"ciudad_id\": \"1\", \"created_at\": \"2026-05-18T21:15:38.000000Z\", \"updated_at\": \"2026-05-20T15:08:12.000000Z\", \"provincia_id\": \"1\", \"segmentacion\": [{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.465594227108642\", \"lng\": \"-68.15925558050728\"}, {\"lat\": \"-16.46343355705332\", \"lng\": \"-68.15629384394725\"}, {\"lat\": \"-16.464606495214184\", \"lng\": \"-68.15307456507767\"}, {\"lat\": \"-16.467981225075743\", \"lng\": \"-68.15530659842725\"}]}], \"departamento_id\": \"1\"}', 'SEGMENTACIÓN DE ZONAS', '2026-05-20', '11:08:12', '2026-05-20 15:08:12', '2026-05-20 15:08:12'),
(43, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA SEGMENTACIÓN DE ZONA', '{\"id\": 1, \"zona\": \"zona 1\", \"color\": \"#ee4949\", \"ciudad_id\": 1, \"created_at\": \"2026-05-18T21:15:38.000000Z\", \"updated_at\": \"2026-05-20T15:08:12.000000Z\", \"provincia_id\": 1, \"segmentacion\": [{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.465594227108642\", \"lng\": \"-68.15925558050728\"}, {\"lat\": \"-16.46343355705332\", \"lng\": \"-68.15629384394725\"}, {\"lat\": \"-16.464606495214184\", \"lng\": \"-68.15307456507767\"}, {\"lat\": \"-16.467981225075743\", \"lng\": \"-68.15530659842725\"}]}], \"departamento_id\": 1}', '{\"id\": 1, \"zona\": \"zona 1\", \"color\": \"#ee4949\", \"ciudad_id\": \"1\", \"created_at\": \"2026-05-18T21:15:38.000000Z\", \"updated_at\": \"2026-05-20T15:24:52.000000Z\", \"provincia_id\": \"1\", \"segmentacion\": [{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.465594227108642\", \"lng\": \"-68.15925558050728\"}, {\"lat\": \"-16.46497850290192\", \"lng\": \"-68.15778472513361\"}, {\"lat\": \"-16.465904499923457\", \"lng\": \"-68.15636859619356\"}, {\"lat\": \"-16.4669539578672\", \"lng\": \"-68.15450170749297\"}, {\"lat\": \"-16.467981225075743\", \"lng\": \"-68.15530659842725\"}]}], \"departamento_id\": \"1\"}', 'SEGMENTACIÓN DE ZONAS', '2026-05-20', '11:24:52', '2026-05-20 15:24:52', '2026-05-20 15:24:52'),
(44, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA SEGMENTACIÓN DE ZONA', '{\"id\": 1, \"zona\": \"zona 1\", \"color\": \"#ee4949\", \"ciudad_id\": 1, \"created_at\": \"2026-05-18T21:15:38.000000Z\", \"updated_at\": \"2026-05-20T15:24:52.000000Z\", \"provincia_id\": 1, \"segmentacion\": [{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.465594227108642\", \"lng\": \"-68.15925558050728\"}, {\"lat\": \"-16.46497850290192\", \"lng\": \"-68.15778472513361\"}, {\"lat\": \"-16.465904499923457\", \"lng\": \"-68.15636859619356\"}, {\"lat\": \"-16.4669539578672\", \"lng\": \"-68.15450170749297\"}, {\"lat\": \"-16.467981225075743\", \"lng\": \"-68.15530659842725\"}]}], \"departamento_id\": 1}', '{\"id\": 1, \"zona\": \"zona 1\", \"color\": \"#ee4949\", \"ciudad_id\": \"1\", \"created_at\": \"2026-05-18T21:15:38.000000Z\", \"updated_at\": \"2026-05-20T15:25:24.000000Z\", \"provincia_id\": \"1\", \"segmentacion\": [{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.465594227108642\", \"lng\": \"-68.15925558050728\"}, {\"lat\": \"-16.46471099182779\", \"lng\": \"-68.15804239371619\"}, {\"lat\": \"-16.46411423502453\", \"lng\": \"-68.15699100494386\"}, {\"lat\": \"-16.46359978803017\", \"lng\": \"-68.15621848539249\"}, {\"lat\": \"-16.463929034263817\", \"lng\": \"-68.15405163831707\"}, {\"lat\": \"-16.4648550362982\", \"lng\": \"-68.15287133628524\"}, {\"lat\": \"-16.4669539578672\", \"lng\": \"-68.15450170749297\"}, {\"lat\": \"-16.467981225075743\", \"lng\": \"-68.15530659842725\"}]}], \"departamento_id\": \"1\"}', 'SEGMENTACIÓN DE ZONAS', '2026-05-20', '11:25:24', '2026-05-20 15:25:24', '2026-05-20 15:25:24'),
(45, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN CLIENTE', '{\"id\": 1, \"dir\": \"los pedregales #323\", \"fono\": \"65656556\", \"nit_ci\": \"45456456456\", \"nombre\": \"mario gonzales\", \"latitud\": \"-16.465296195451995\", \"user_id\": 5, \"longitud\": \"-68.15603610060674\", \"created_at\": \"2026-05-20T15:38:25.000000Z\", \"updated_at\": \"2026-05-20T15:38:25.000000Z\", \"razon_social\": \"gonzales\", \"fecha_registro\": \"2026-05-20\"}', NULL, 'CLIENTES', '2026-05-20', '11:38:25', '2026-05-20 15:38:25', '2026-05-20 15:38:25'),
(46, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ACTUALIZÓ UN CLIENTE', '{\"id\": 1, \"dir\": \"los pedregales #323\", \"fono\": \"65656556\", \"nit_ci\": \"45456456456\", \"nombre\": \"mario gonzales\", \"status\": 1, \"latitud\": \"-16.465296195451995\", \"user_id\": 5, \"longitud\": \"-68.15603610060674\", \"created_at\": \"2026-05-20T15:38:25.000000Z\", \"updated_at\": \"2026-05-20T15:38:25.000000Z\", \"razon_social\": \"gonzales\", \"fecha_registro\": \"2026-05-20\"}', '{\"id\": 1, \"dir\": \"los pedregales #323\", \"fono\": \"65656556\", \"nit_ci\": \"45456456456\", \"nombre\": \"mario gonzales\", \"status\": 1, \"latitud\": \"-16.466846247218566\", \"user_id\": 5, \"longitud\": \"-68.15588595495886\", \"created_at\": \"2026-05-20T15:38:25.000000Z\", \"updated_at\": \"2026-05-20T15:38:41.000000Z\", \"razon_social\": \"gonzales\", \"fecha_registro\": \"2026-05-20\"}', 'CLIENTES', '2026-05-20', '11:38:41', '2026-05-20 15:38:41', '2026-05-20 15:38:41'),
(47, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN CLIENTE', '{\"id\": 1, \"dir\": \"los pedregales #w323\", \"fono\": \"67676767\", \"nit_ci\": \"564564564\", \"nombre\": \"mario gonzales\", \"latitud\": \"-16.4666816266489\", \"user_id\": 5, \"longitud\": \"-68.15597157691236\", \"created_at\": \"2026-05-20T15:56:03.000000Z\", \"updated_at\": \"2026-05-20T15:56:03.000000Z\", \"razon_social\": \"gonzales\", \"fecha_registro\": \"2026-05-20\", \"segmentacion_zona_id\": 1}', NULL, 'CLIENTES', '2026-05-20', '11:56:03', '2026-05-20 15:56:03', '2026-05-20 15:56:03'),
(48, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN PEDIDO', '{\"id\": 1, \"hora\": \"15:46:36\", \"fecha\": \"2026-05-20\", \"total\": \"1000.00\", \"user_id\": 5, \"subtotal\": \"1000.00\", \"descuento\": \"0\", \"cliente_id\": \"1\", \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-20T19:46:36.000000Z\", \"observacion\": null, \"segmentacion_zona_id\": 1}', NULL, 'PEDIDOS', '2026-05-20', '15:46:36', '2026-05-20 19:46:36', '2026-05-20 19:46:36'),
(49, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ACTUALIZÓ UN PEDIDO', '{\"id\": 1, \"hora\": \"15:46:36\", \"fecha\": \"2026-05-20\", \"total\": \"1000.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"1000.00\", \"descuento\": \"0.00\", \"cliente_id\": 1, \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-20T19:46:36.000000Z\", \"despacho_id\": null, \"observacion\": null, \"segmentacion_zona_id\": 1}', '{\"id\": 1, \"hora\": \"15:46:36\", \"fecha\": \"2026-05-20\", \"total\": \"800.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"800.00\", \"descuento\": \"0.00\", \"cliente_id\": \"1\", \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-20T19:53:55.000000Z\", \"despacho_id\": null, \"observacion\": null, \"segmentacion_zona_id\": 1}', 'PEDIDOS', '2026-05-20', '15:53:55', '2026-05-20 19:53:55', '2026-05-20 19:53:55'),
(50, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ACTUALIZÓ UN PEDIDO', '{\"id\": 1, \"hora\": \"15:46:36\", \"fecha\": \"2026-05-20\", \"total\": \"800.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"800.00\", \"descuento\": \"0.00\", \"cliente_id\": 1, \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-20T19:53:55.000000Z\", \"despacho_id\": null, \"observacion\": null, \"segmentacion_zona_id\": 1}', '{\"id\": 1, \"hora\": \"15:46:36\", \"fecha\": \"2026-05-20\", \"total\": \"1195.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"1195.00\", \"descuento\": \"0.00\", \"cliente_id\": \"1\", \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-20T19:54:27.000000Z\", \"despacho_id\": null, \"observacion\": null, \"segmentacion_zona_id\": 1}', 'PEDIDOS', '2026-05-20', '15:54:27', '2026-05-20 19:54:27', '2026-05-20 19:54:27'),
(51, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN CLIENTE', '{\"id\": 2, \"dir\": \"los pedregales #111\", \"fono\": \"67676767\", \"nit_ci\": null, \"nombre\": \"juan mamani\", \"latitud\": \"-16.464543790825925\", \"user_id\": 5, \"longitud\": \"-68.1563555938417\", \"created_at\": \"2026-05-20T19:55:22.000000Z\", \"updated_at\": \"2026-05-20T19:55:22.000000Z\", \"razon_social\": null, \"fecha_registro\": \"2026-05-20\", \"segmentacion_zona_id\": 1}', NULL, 'CLIENTES', '2026-05-20', '15:55:22', '2026-05-20 19:55:22', '2026-05-20 19:55:22'),
(52, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN CLIENTE', '{\"id\": 3, \"dir\": \"los pedregales\", \"fono\": \"676767676\", \"nit_ci\": null, \"nombre\": \"maria gonzales\", \"latitud\": \"-16.46639354031556\", \"user_id\": 5, \"longitud\": \"-68.15444854486383\", \"created_at\": \"2026-05-20T19:55:36.000000Z\", \"updated_at\": \"2026-05-20T19:55:36.000000Z\", \"razon_social\": null, \"fecha_registro\": \"2026-05-20\", \"segmentacion_zona_id\": 1}', NULL, 'CLIENTES', '2026-05-20', '15:55:36', '2026-05-20 19:55:36', '2026-05-20 19:55:36'),
(53, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN PEDIDO', '{\"id\": 2, \"hora\": \"15:55:51\", \"fecha\": \"2026-05-20\", \"total\": \"200.00\", \"user_id\": 5, \"subtotal\": \"200.00\", \"descuento\": \"0\", \"cliente_id\": \"2\", \"created_at\": \"2026-05-20T19:55:51.000000Z\", \"updated_at\": \"2026-05-20T19:55:51.000000Z\", \"observacion\": null, \"segmentacion_zona_id\": 1}', NULL, 'PEDIDOS', '2026-05-20', '15:55:51', '2026-05-20 19:55:51', '2026-05-20 19:55:51'),
(54, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN PEDIDO', '{\"id\": 3, \"hora\": \"15:56:00\", \"fecha\": \"2026-05-20\", \"total\": \"65.00\", \"user_id\": 5, \"subtotal\": \"65.00\", \"descuento\": \"0\", \"cliente_id\": \"3\", \"created_at\": \"2026-05-20T19:56:00.000000Z\", \"updated_at\": \"2026-05-20T19:56:00.000000Z\", \"observacion\": null, \"segmentacion_zona_id\": 1}', NULL, 'PEDIDOS', '2026-05-20', '15:56:00', '2026-05-20 19:56:00', '2026-05-20 19:56:00'),
(55, 6, 'CREACIÓN', 'EL USUARIO mmamani REGISTRO UN CLIENTE', '{\"id\": 4, \"dir\": \"los olivos 3223\", \"fono\": \"67676767\", \"nit_ci\": null, \"nombre\": \"felix contreras\", \"latitud\": \"-16.51077436050994\", \"user_id\": 6, \"longitud\": \"-68.15931904933588\", \"created_at\": \"2026-05-20T20:05:12.000000Z\", \"updated_at\": \"2026-05-20T20:05:12.000000Z\", \"razon_social\": null, \"fecha_registro\": \"2026-05-20\", \"segmentacion_zona_id\": 2}', NULL, 'CLIENTES', '2026-05-20', '16:05:12', '2026-05-20 20:05:12', '2026-05-20 20:05:12'),
(56, 6, 'CREACIÓN', 'EL USUARIO mmamani REGISTRO UN CLIENTE', '{\"id\": 5, \"dir\": \"los pedregales\", \"fono\": \"6767676767\", \"nit_ci\": null, \"nombre\": \"francisca choque\", \"latitud\": \"-16.510646101336924\", \"user_id\": 6, \"longitud\": \"-68.15821393431824\", \"created_at\": \"2026-05-20T20:05:35.000000Z\", \"updated_at\": \"2026-05-20T20:05:35.000000Z\", \"razon_social\": null, \"fecha_registro\": \"2026-05-20\", \"segmentacion_zona_id\": 2}', NULL, 'CLIENTES', '2026-05-20', '16:05:35', '2026-05-20 20:05:35', '2026-05-20 20:05:35'),
(57, 6, 'CREACIÓN', 'EL USUARIO mmamani REGISTRO UN PEDIDO', '{\"id\": 4, \"hora\": \"16:05:48\", \"fecha\": \"2026-05-20\", \"total\": \"400.00\", \"user_id\": 6, \"subtotal\": \"400.00\", \"descuento\": \"0\", \"cliente_id\": \"4\", \"created_at\": \"2026-05-20T20:05:48.000000Z\", \"updated_at\": \"2026-05-20T20:05:48.000000Z\", \"observacion\": null, \"segmentacion_zona_id\": 2}', NULL, 'PEDIDOS', '2026-05-20', '16:05:48', '2026-05-20 20:05:48', '2026-05-20 20:05:48'),
(58, 6, 'CREACIÓN', 'EL USUARIO mmamani REGISTRO UN PEDIDO', '{\"id\": 5, \"hora\": \"16:05:57\", \"fecha\": \"2026-05-20\", \"total\": \"65.00\", \"user_id\": 6, \"subtotal\": \"65.00\", \"descuento\": \"0\", \"cliente_id\": \"5\", \"created_at\": \"2026-05-20T20:05:57.000000Z\", \"updated_at\": \"2026-05-20T20:05:57.000000Z\", \"observacion\": null, \"segmentacion_zona_id\": 2}', NULL, 'PEDIDOS', '2026-05-20', '16:05:57', '2026-05-20 20:05:57', '2026-05-20 20:05:57'),
(59, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESPACHO', '{\"id\": 3, \"hora\": \"18:12:14\", \"fecha\": \"2026-05-20\", \"pedidos\": [{\"id\": 1, \"hora\": \"15:46:36\", \"fecha\": \"2026-05-20\", \"total\": \"1195.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"20/05/2026\", \"user_id\": 5, \"subtotal\": \"1195.00\", \"descuento\": \"0.00\", \"cliente_id\": 1, \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"despacho_id\": 3, \"observacion\": null, \"segmentacion_zona_id\": 1}, {\"id\": 2, \"hora\": \"15:55:51\", \"fecha\": \"2026-05-20\", \"total\": \"200.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"20/05/2026\", \"user_id\": 5, \"subtotal\": \"200.00\", \"descuento\": \"0.00\", \"cliente_id\": 2, \"created_at\": \"2026-05-20T19:55:51.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"despacho_id\": 3, \"observacion\": null, \"segmentacion_zona_id\": 1}, {\"id\": 3, \"hora\": \"15:56:00\", \"fecha\": \"2026-05-20\", \"total\": \"65.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"20/05/2026\", \"user_id\": 5, \"subtotal\": \"65.00\", \"descuento\": \"0.00\", \"cliente_id\": 3, \"created_at\": \"2026-05-20T19:56:00.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"despacho_id\": 3, \"observacion\": null, \"segmentacion_zona_id\": 1}], \"user_id\": 1, \"created_at\": \"2026-05-20T22:12:14.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"observacion\": null, \"distribuidor_id\": 3}', NULL, 'DESPACHOS', '2026-05-20', '18:12:14', '2026-05-20 22:12:14', '2026-05-20 22:12:14'),
(60, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA COMPRA', '{\"id\": 5, \"hora\": \"18:19:22\", \"fecha\": \"2026-05-20\", \"total\": 1360, \"cantidad\": 34, \"created_at\": \"2026-05-20T22:19:22.000000Z\", \"updated_at\": \"2026-05-20T22:19:22.000000Z\", \"producto_id\": 1, \"precio_compra\": 40, \"categoria_producto_id\": 1}', NULL, 'COMPRAS', '2026-05-20', '18:19:22', '2026-05-20 22:19:22', '2026-05-20 22:19:22'),
(61, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESPACHO', '{\"id\": 4, \"hora\": \"18:19:36\", \"fecha\": \"2026-05-20\", \"pedidos\": [{\"id\": 4, \"hora\": \"16:05:48\", \"fecha\": \"2026-05-20\", \"total\": \"400.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"20/05/2026\", \"user_id\": 6, \"subtotal\": \"400.00\", \"descuento\": \"0.00\", \"cliente_id\": 4, \"created_at\": \"2026-05-20T20:05:48.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"despacho_id\": 4, \"observacion\": null, \"segmentacion_zona_id\": 2}, {\"id\": 5, \"hora\": \"16:05:57\", \"fecha\": \"2026-05-20\", \"total\": \"65.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"20/05/2026\", \"user_id\": 6, \"subtotal\": \"65.00\", \"descuento\": \"0.00\", \"cliente_id\": 5, \"created_at\": \"2026-05-20T20:05:57.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"despacho_id\": 4, \"observacion\": null, \"segmentacion_zona_id\": 2}], \"user_id\": 1, \"created_at\": \"2026-05-20T22:19:36.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"observacion\": null, \"distribuidor_id\": 4}', NULL, 'DESPACHOS', '2026-05-20', '18:19:36', '2026-05-20 22:19:36', '2026-05-20 22:19:36'),
(62, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ENTREGÓ UN PEDIDO', '{\"id\": 1, \"hora\": \"15:46:36\", \"fecha\": \"2026-05-20\", \"total\": \"1195.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"1195.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 1, \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"despacho_id\": 3, \"observacion\": null, \"pedido_detalles\": [{\"id\": 1, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"400.00\", \"pedido_id\": 1, \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-21T14:11:55.000000Z\", \"producto_id\": 1, \"cantidad_total\": 48, \"cantidad_despacho\": 28, \"cantidad_entregado\": 24, \"cantidad_devolucion\": 4, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}, {\"id\": 3, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1.33, \"subtotal\": \"146.30\", \"pedido_id\": 1, \"created_at\": \"2026-05-20T19:54:27.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"producto_id\": 2, \"cantidad_total\": 24, \"cantidad_despacho\": 16, \"cantidad_entregado\": 16, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}, {\"id\": 4, \"precio\": \"65.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"780.00\", \"pedido_id\": 1, \"created_at\": \"2026-05-20T19:54:27.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"producto_id\": 3, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 2}], \"segmentacion_zona_id\": 1}', '{\"id\": 1, \"hora\": \"15:46:36\", \"fecha\": \"2026-05-20\", \"total\": \"1326.30\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"1326.30\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 1, \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-21T14:11:55.000000Z\", \"despacho_id\": 3, \"observacion\": null, \"pedido_detalles\": [{\"id\": 1, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"400.00\", \"pedido_id\": 1, \"created_at\": \"2026-05-20T19:46:36.000000Z\", \"updated_at\": \"2026-05-21T14:11:55.000000Z\", \"producto_id\": 1, \"cantidad_total\": 48, \"cantidad_despacho\": 28, \"cantidad_entregado\": 24, \"cantidad_devolucion\": 4, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}, {\"id\": 3, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1.33, \"subtotal\": \"146.30\", \"pedido_id\": 1, \"created_at\": \"2026-05-20T19:54:27.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"producto_id\": 2, \"cantidad_total\": 24, \"cantidad_despacho\": 16, \"cantidad_entregado\": 16, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}, {\"id\": 4, \"precio\": \"65.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"780.00\", \"pedido_id\": 1, \"created_at\": \"2026-05-20T19:54:27.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"producto_id\": 3, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 2}], \"segmentacion_zona_id\": 1}', 'PEDIDOS', '2026-05-21', '10:11:55', '2026-05-21 14:11:55', '2026-05-21 14:11:55'),
(63, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ENTREGÓ UN PEDIDO', '{\"id\": 2, \"hora\": \"15:55:51\", \"fecha\": \"2026-05-20\", \"total\": \"200.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"200.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 2, \"created_at\": \"2026-05-20T19:55:51.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"despacho_id\": 3, \"observacion\": null, \"pedido_detalles\": [{\"id\": 5, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 2, \"created_at\": \"2026-05-20T19:55:51.000000Z\", \"updated_at\": \"2026-05-21T14:17:47.000000Z\", \"producto_id\": 1, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}], \"segmentacion_zona_id\": 1}', '{\"id\": 2, \"hora\": \"15:55:51\", \"fecha\": \"2026-05-20\", \"total\": \"150.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"200.00\", \"descuento\": \"50\", \"tipo_pago\": \"MIXTO\", \"cliente_id\": 2, \"created_at\": \"2026-05-20T19:55:51.000000Z\", \"updated_at\": \"2026-05-21T14:17:47.000000Z\", \"despacho_id\": 3, \"observacion\": null, \"pedido_detalles\": [{\"id\": 5, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 2, \"created_at\": \"2026-05-20T19:55:51.000000Z\", \"updated_at\": \"2026-05-21T14:17:47.000000Z\", \"producto_id\": 1, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}], \"segmentacion_zona_id\": 1}', 'PEDIDOS', '2026-05-21', '10:17:47', '2026-05-21 14:17:47', '2026-05-21 14:17:47'),
(64, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ENTREGÓ UN PEDIDO', '{\"id\": 3, \"hora\": \"15:56:00\", \"fecha\": \"2026-05-20\", \"total\": \"65.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"65.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 3, \"created_at\": \"2026-05-20T19:56:00.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"despacho_id\": 3, \"observacion\": null, \"pedido_detalles\": [{\"id\": 6, \"precio\": \"65.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"780.00\", \"pedido_id\": 3, \"created_at\": \"2026-05-20T19:56:00.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"producto_id\": 3, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 2}], \"segmentacion_zona_id\": 1}', '{\"id\": 3, \"hora\": \"15:56:00\", \"fecha\": \"2026-05-20\", \"total\": \"780.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"780.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 3, \"created_at\": \"2026-05-20T19:56:00.000000Z\", \"updated_at\": \"2026-05-21T14:20:20.000000Z\", \"despacho_id\": 3, \"observacion\": null, \"pedido_detalles\": [{\"id\": 6, \"precio\": \"65.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"780.00\", \"pedido_id\": 3, \"created_at\": \"2026-05-20T19:56:00.000000Z\", \"updated_at\": \"2026-05-20T22:12:14.000000Z\", \"producto_id\": 3, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 2}], \"segmentacion_zona_id\": 1}', 'PEDIDOS', '2026-05-21', '10:20:20', '2026-05-21 14:20:20', '2026-05-21 14:20:20'),
(65, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CONSOLIDADO', '{\"id\": 1, \"hora\": \"11:00:56\", \"fecha\": \"2026-05-21\", \"pedidos\": [], \"user_id\": 1, \"created_at\": \"2026-05-21T15:00:56.000000Z\", \"updated_at\": \"2026-05-21T15:00:56.000000Z\", \"despacho_id\": 3, \"distribuidor_id\": 3}', NULL, 'CONSOLIDADOS', '2026-05-21', '11:00:56', '2026-05-21 15:00:56', '2026-05-21 15:00:56'),
(66, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CONSOLIDADO', '{\"id\": 4, \"hora\": \"11:09:54\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 4, \"hora\": \"16:05:48\", \"fecha\": \"2026-05-20\", \"total\": \"400.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"20/05/2026\", \"user_id\": 6, \"subtotal\": \"400.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 4, \"created_at\": \"2026-05-20T20:05:48.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"despacho_id\": 4, \"observacion\": null, \"consolidado_id\": null, \"segmentacion_zona_id\": 2}, {\"id\": 5, \"hora\": \"16:05:57\", \"fecha\": \"2026-05-20\", \"total\": \"65.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"20/05/2026\", \"user_id\": 6, \"subtotal\": \"65.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 5, \"created_at\": \"2026-05-20T20:05:57.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"despacho_id\": 4, \"observacion\": null, \"consolidado_id\": null, \"segmentacion_zona_id\": 2}], \"user_id\": 1, \"created_at\": \"2026-05-21T15:09:54.000000Z\", \"updated_at\": \"2026-05-21T15:09:54.000000Z\", \"despacho_id\": 3, \"distribuidor_id\": 3}', NULL, 'CONSOLIDADOS', '2026-05-21', '11:09:54', '2026-05-21 15:09:54', '2026-05-21 15:09:54'),
(67, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN PEDIDO', '{\"id\": 6, \"hora\": \"12:08:43\", \"fecha\": \"2026-05-21\", \"total\": \"1006.00\", \"user_id\": 5, \"subtotal\": \"1006.00\", \"descuento\": \"0\", \"cliente_id\": \"2\", \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:08:43.000000Z\", \"observacion\": \"pedido prueba\", \"pedido_detalles\": [{\"id\": 9, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 2, \"subtotal\": \"800.00\", \"pedido_id\": 6, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:08:43.000000Z\", \"producto_id\": 1, \"cantidad_total\": 48, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}, {\"id\": 10, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 6, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:08:43.000000Z\", \"producto_id\": 2, \"cantidad_total\": 24, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 4}, {\"id\": 11, \"precio\": \"6.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"6.00\", \"pedido_id\": 6, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:08:43.000000Z\", \"producto_id\": 3, \"cantidad_total\": 1, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 3}], \"segmentacion_zona_id\": 1}', NULL, 'PEDIDOS', '2026-05-21', '12:08:43', '2026-05-21 16:08:43', '2026-05-21 16:08:43'),
(68, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA COMPRA', '{\"id\": 6, \"hora\": \"12:09:35\", \"fecha\": \"2026-05-21\", \"total\": 800, \"cantidad\": 20, \"created_at\": \"2026-05-21T16:09:35.000000Z\", \"updated_at\": \"2026-05-21T16:09:35.000000Z\", \"producto_id\": 3, \"precio_compra\": 40, \"categoria_producto_id\": 1}', NULL, 'COMPRAS', '2026-05-21', '12:09:35', '2026-05-21 16:09:35', '2026-05-21 16:09:35'),
(69, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA COMPRA', '{\"id\": 7, \"hora\": \"12:09:43\", \"fecha\": \"2026-05-21\", \"total\": 3500, \"cantidad\": 100, \"created_at\": \"2026-05-21T16:09:43.000000Z\", \"updated_at\": \"2026-05-21T16:09:43.000000Z\", \"producto_id\": 1, \"precio_compra\": 35, \"categoria_producto_id\": 1}', NULL, 'COMPRAS', '2026-05-21', '12:09:43', '2026-05-21 16:09:43', '2026-05-21 16:09:43'),
(70, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA COMPRA', '{\"id\": 8, \"hora\": \"12:10:04\", \"fecha\": \"2026-05-21\", \"total\": 1400, \"cantidad\": 40, \"created_at\": \"2026-05-21T16:10:04.000000Z\", \"updated_at\": \"2026-05-21T16:10:04.000000Z\", \"producto_id\": 2, \"precio_compra\": 35, \"categoria_producto_id\": 2}', NULL, 'COMPRAS', '2026-05-21', '12:10:04', '2026-05-21 16:10:04', '2026-05-21 16:10:04'),
(71, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESPACHO', '{\"id\": 5, \"hora\": \"12:10:13\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 6, \"hora\": \"12:08:43\", \"fecha\": \"2026-05-21\", \"total\": \"1006.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"21/05/2026\", \"user_id\": 5, \"subtotal\": \"1006.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 2, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:10:13.000000Z\", \"despacho_id\": 5, \"observacion\": \"pedido prueba\", \"consolidado_id\": null, \"distribuidor_id\": null, \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}], \"user_id\": 1, \"created_at\": \"2026-05-21T16:10:13.000000Z\", \"updated_at\": \"2026-05-21T16:10:13.000000Z\", \"observacion\": null, \"distribuidor_id\": 3}', NULL, 'DESPACHOS', '2026-05-21', '12:10:13', '2026-05-21 16:10:13', '2026-05-21 16:10:13'),
(72, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN PEDIDO', '{\"id\": 7, \"hora\": \"12:13:55\", \"fecha\": \"2026-05-21\", \"total\": \"800.00\", \"user_id\": 5, \"subtotal\": \"800.00\", \"descuento\": \"0\", \"cliente_id\": \"3\", \"created_at\": \"2026-05-21T16:13:55.000000Z\", \"updated_at\": \"2026-05-21T16:13:55.000000Z\", \"observacion\": null, \"pedido_detalles\": [{\"id\": 12, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 2, \"subtotal\": \"800.00\", \"pedido_id\": 7, \"created_at\": \"2026-05-21T16:13:55.000000Z\", \"updated_at\": \"2026-05-21T16:13:55.000000Z\", \"producto_id\": 1, \"cantidad_total\": 48, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}], \"segmentacion_zona_id\": 1}', NULL, 'PEDIDOS', '2026-05-21', '12:13:55', '2026-05-21 16:13:55', '2026-05-21 16:13:55');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(73, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESPACHO', '{\"id\": 6, \"hora\": \"12:14:51\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 7, \"hora\": \"12:13:55\", \"fecha\": \"2026-05-21\", \"total\": \"800.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"21/05/2026\", \"user_id\": 5, \"subtotal\": \"800.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 3, \"created_at\": \"2026-05-21T16:13:55.000000Z\", \"updated_at\": \"2026-05-21T16:14:51.000000Z\", \"despacho_id\": 6, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}], \"user_id\": 1, \"created_at\": \"2026-05-21T16:14:51.000000Z\", \"updated_at\": \"2026-05-21T16:14:51.000000Z\", \"observacion\": null, \"distribuidor_id\": 3}', NULL, 'DESPACHOS', '2026-05-21', '12:14:51', '2026-05-21 16:14:51', '2026-05-21 16:14:51'),
(74, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN PEDIDO', '{\"id\": 8, \"hora\": \"12:16:39\", \"fecha\": \"2026-05-21\", \"total\": \"200.00\", \"user_id\": 5, \"subtotal\": \"200.00\", \"descuento\": \"0\", \"cliente_id\": \"1\", \"created_at\": \"2026-05-21T16:16:39.000000Z\", \"updated_at\": \"2026-05-21T16:16:39.000000Z\", \"observacion\": null, \"pedido_detalles\": [{\"id\": 13, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 8, \"created_at\": \"2026-05-21T16:16:39.000000Z\", \"updated_at\": \"2026-05-21T16:16:39.000000Z\", \"producto_id\": 1, \"cantidad_total\": 12, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}], \"segmentacion_zona_id\": 1}', NULL, 'PEDIDOS', '2026-05-21', '12:16:39', '2026-05-21 16:16:39', '2026-05-21 16:16:39'),
(75, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESPACHO', '{\"id\": 7, \"hora\": \"12:16:47\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 8, \"hora\": \"12:16:39\", \"fecha\": \"2026-05-21\", \"total\": \"200.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"21/05/2026\", \"user_id\": 5, \"subtotal\": \"200.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 1, \"created_at\": \"2026-05-21T16:16:39.000000Z\", \"updated_at\": \"2026-05-21T16:16:47.000000Z\", \"despacho_id\": 7, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}], \"user_id\": 1, \"created_at\": \"2026-05-21T16:16:47.000000Z\", \"updated_at\": \"2026-05-21T16:16:47.000000Z\", \"observacion\": null, \"distribuidor_id\": 3}', NULL, 'DESPACHOS', '2026-05-21', '12:16:47', '2026-05-21 16:16:47', '2026-05-21 16:16:47'),
(76, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ENTREGÓ UN PEDIDO', '{\"id\": 8, \"hora\": \"12:16:39\", \"fecha\": \"2026-05-21\", \"total\": \"200.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"200.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 1, \"created_at\": \"2026-05-21T16:16:39.000000Z\", \"updated_at\": \"2026-05-21T16:16:47.000000Z\", \"despacho_id\": 7, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 13, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 8, \"created_at\": \"2026-05-21T16:16:39.000000Z\", \"updated_at\": \"2026-05-21T16:16:47.000000Z\", \"producto_id\": 1, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}', '{\"id\": 8, \"hora\": \"12:16:39\", \"fecha\": \"2026-05-21\", \"total\": \"200.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"200.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 1, \"created_at\": \"2026-05-21T16:16:39.000000Z\", \"updated_at\": \"2026-05-21T16:18:04.000000Z\", \"despacho_id\": 7, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": 3, \"pedido_detalles\": [{\"id\": 13, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 8, \"created_at\": \"2026-05-21T16:16:39.000000Z\", \"updated_at\": \"2026-05-21T16:16:47.000000Z\", \"producto_id\": 1, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": 5}', 'PEDIDOS', '2026-05-21', '12:18:04', '2026-05-21 16:18:04', '2026-05-21 16:18:04'),
(77, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ENTREGÓ UN PEDIDO', '{\"id\": 6, \"hora\": \"12:08:43\", \"fecha\": \"2026-05-21\", \"total\": \"1006.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"1006.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 2, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:10:13.000000Z\", \"despacho_id\": 5, \"observacion\": \"pedido prueba\", \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 9, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 2, \"subtotal\": \"800.00\", \"pedido_id\": 6, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:10:13.000000Z\", \"producto_id\": 1, \"cantidad_total\": 48, \"cantidad_despacho\": 48, \"cantidad_entregado\": 48, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}, {\"id\": 10, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 6, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:10:13.000000Z\", \"producto_id\": 2, \"cantidad_total\": 24, \"cantidad_despacho\": 24, \"cantidad_entregado\": 24, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 4}, {\"id\": 11, \"precio\": \"6.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"6.00\", \"pedido_id\": 6, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:10:13.000000Z\", \"producto_id\": 3, \"cantidad_total\": 1, \"cantidad_despacho\": 1, \"cantidad_entregado\": 1, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 3}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}', '{\"id\": 6, \"hora\": \"12:08:43\", \"fecha\": \"2026-05-21\", \"total\": \"1006.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"1006.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 2, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:18:13.000000Z\", \"despacho_id\": 5, \"observacion\": \"pedido prueba\", \"consolidado_id\": null, \"distribuidor_id\": 3, \"pedido_detalles\": [{\"id\": 9, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 2, \"subtotal\": \"800.00\", \"pedido_id\": 6, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:10:13.000000Z\", \"producto_id\": 1, \"cantidad_total\": 48, \"cantidad_despacho\": 48, \"cantidad_entregado\": 48, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}, {\"id\": 10, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 6, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:10:13.000000Z\", \"producto_id\": 2, \"cantidad_total\": 24, \"cantidad_despacho\": 24, \"cantidad_entregado\": 24, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 4}, {\"id\": 11, \"precio\": \"6.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"6.00\", \"pedido_id\": 6, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:10:13.000000Z\", \"producto_id\": 3, \"cantidad_total\": 1, \"cantidad_despacho\": 1, \"cantidad_entregado\": 1, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 3}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": 5}', 'PEDIDOS', '2026-05-21', '12:18:13', '2026-05-21 16:18:13', '2026-05-21 16:18:13'),
(78, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ENTREGÓ UN PEDIDO', '{\"id\": 7, \"hora\": \"12:13:55\", \"fecha\": \"2026-05-21\", \"total\": \"800.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"800.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 3, \"created_at\": \"2026-05-21T16:13:55.000000Z\", \"updated_at\": \"2026-05-21T16:14:51.000000Z\", \"despacho_id\": 6, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 12, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 2, \"subtotal\": \"800.00\", \"pedido_id\": 7, \"created_at\": \"2026-05-21T16:13:55.000000Z\", \"updated_at\": \"2026-05-21T16:14:51.000000Z\", \"producto_id\": 1, \"cantidad_total\": 48, \"cantidad_despacho\": 48, \"cantidad_entregado\": 48, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}', '{\"id\": 7, \"hora\": \"12:13:55\", \"fecha\": \"2026-05-21\", \"total\": \"800.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"800.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 3, \"created_at\": \"2026-05-21T16:13:55.000000Z\", \"updated_at\": \"2026-05-21T16:18:20.000000Z\", \"despacho_id\": 6, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": 3, \"pedido_detalles\": [{\"id\": 12, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 2, \"subtotal\": \"800.00\", \"pedido_id\": 7, \"created_at\": \"2026-05-21T16:13:55.000000Z\", \"updated_at\": \"2026-05-21T16:14:51.000000Z\", \"producto_id\": 1, \"cantidad_total\": 48, \"cantidad_despacho\": 48, \"cantidad_entregado\": 48, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": 5}', 'PEDIDOS', '2026-05-21', '12:18:20', '2026-05-21 16:18:20', '2026-05-21 16:18:20'),
(79, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CONSOLIDADO', '{\"id\": 5, \"hora\": \"12:18:40\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 6, \"hora\": \"12:08:43\", \"fecha\": \"2026-05-21\", \"total\": \"1006.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"fecha_t\": \"21/05/2026\", \"user_id\": 5, \"subtotal\": \"1006.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 2, \"created_at\": \"2026-05-21T16:08:43.000000Z\", \"updated_at\": \"2026-05-21T16:18:40.000000Z\", \"despacho_id\": 5, \"observacion\": \"pedido prueba\", \"consolidado_id\": 5, \"distribuidor_id\": 3, \"segmentacion_zona_id\": 1, \"user_distribucion_id\": 5}], \"user_id\": 1, \"created_at\": \"2026-05-21T16:18:40.000000Z\", \"updated_at\": \"2026-05-21T16:18:40.000000Z\", \"despacho_id\": 5, \"distribuidor_id\": 3}', NULL, 'CONSOLIDADOS', '2026-05-21', '12:18:40', '2026-05-21 16:18:40', '2026-05-21 16:18:40'),
(80, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CONSOLIDADO', '{\"id\": 6, \"hora\": \"12:18:48\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 7, \"hora\": \"12:13:55\", \"fecha\": \"2026-05-21\", \"total\": \"800.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"fecha_t\": \"21/05/2026\", \"user_id\": 5, \"subtotal\": \"800.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 3, \"created_at\": \"2026-05-21T16:13:55.000000Z\", \"updated_at\": \"2026-05-21T16:18:48.000000Z\", \"despacho_id\": 6, \"observacion\": null, \"consolidado_id\": 6, \"distribuidor_id\": 3, \"segmentacion_zona_id\": 1, \"user_distribucion_id\": 5}], \"user_id\": 1, \"created_at\": \"2026-05-21T16:18:48.000000Z\", \"updated_at\": \"2026-05-21T16:18:48.000000Z\", \"despacho_id\": 6, \"distribuidor_id\": 3}', NULL, 'CONSOLIDADOS', '2026-05-21', '12:18:48', '2026-05-21 16:18:48', '2026-05-21 16:18:48'),
(81, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CONSOLIDADO', '{\"id\": 7, \"hora\": \"12:18:55\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 8, \"hora\": \"12:16:39\", \"fecha\": \"2026-05-21\", \"total\": \"200.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"fecha_t\": \"21/05/2026\", \"user_id\": 5, \"subtotal\": \"200.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 1, \"created_at\": \"2026-05-21T16:16:39.000000Z\", \"updated_at\": \"2026-05-21T16:18:55.000000Z\", \"despacho_id\": 7, \"observacion\": null, \"consolidado_id\": 7, \"distribuidor_id\": 3, \"segmentacion_zona_id\": 1, \"user_distribucion_id\": 5}], \"user_id\": 1, \"created_at\": \"2026-05-21T16:18:55.000000Z\", \"updated_at\": \"2026-05-21T16:18:55.000000Z\", \"despacho_id\": 7, \"distribuidor_id\": 3}', NULL, 'CONSOLIDADOS', '2026-05-21', '12:18:55', '2026-05-21 16:18:55', '2026-05-21 16:18:55'),
(82, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA COMISIÓN', '{\"id\": 3, \"hora\": \"13:03:34\", \"fecha\": \"2026-05-21\", \"user_id\": 1, \"created_at\": \"2026-05-21T17:03:34.000000Z\", \"updated_at\": \"2026-05-21T17:03:34.000000Z\", \"distribuidor_id\": 3, \"comision_detalles\": [{\"id\": 1, \"cantidad\": 36, \"created_at\": \"2026-05-21T17:03:34.000000Z\", \"updated_at\": \"2026-05-21T17:03:34.000000Z\", \"comision_id\": 3, \"despacho_id\": 3, \"producto_id\": 1, \"entrega_vendedor\": \"15.00\", \"comision_vendedor\": \"15.00\", \"entrega_distribuidor\": \"25.00\", \"categoria_producto_id\": 1, \"comision_distribuidor\": \"30.00\"}, {\"id\": 2, \"cantidad\": 24, \"created_at\": \"2026-05-21T17:03:34.000000Z\", \"updated_at\": \"2026-05-21T17:03:34.000000Z\", \"comision_id\": 3, \"despacho_id\": 3, \"producto_id\": 3, \"entrega_vendedor\": \"5.00\", \"comision_vendedor\": \"5.00\", \"entrega_distribuidor\": \"10.00\", \"categoria_producto_id\": 1, \"comision_distribuidor\": \"10.00\"}, {\"id\": 3, \"cantidad\": 16, \"created_at\": \"2026-05-21T17:03:34.000000Z\", \"updated_at\": \"2026-05-21T17:03:34.000000Z\", \"comision_id\": 3, \"despacho_id\": 3, \"producto_id\": 2, \"entrega_vendedor\": \"3.33\", \"comision_vendedor\": \"3.33\", \"entrega_distribuidor\": \"6.65\", \"categoria_producto_id\": 2, \"comision_distribuidor\": \"6.65\"}, {\"id\": 4, \"cantidad\": 48, \"created_at\": \"2026-05-21T17:03:34.000000Z\", \"updated_at\": \"2026-05-21T17:03:34.000000Z\", \"comision_id\": 3, \"despacho_id\": 5, \"producto_id\": 1, \"entrega_vendedor\": \"20.00\", \"comision_vendedor\": \"20.00\", \"entrega_distribuidor\": \"40.00\", \"categoria_producto_id\": 1, \"comision_distribuidor\": \"40.00\"}, {\"id\": 5, \"cantidad\": 1, \"created_at\": \"2026-05-21T17:03:34.000000Z\", \"updated_at\": \"2026-05-21T17:03:34.000000Z\", \"comision_id\": 3, \"despacho_id\": 5, \"producto_id\": 3, \"entrega_vendedor\": \"0.50\", \"comision_vendedor\": \"0.50\", \"entrega_distribuidor\": \"1.50\", \"categoria_producto_id\": 1, \"comision_distribuidor\": \"1.50\"}, {\"id\": 6, \"cantidad\": 24, \"created_at\": \"2026-05-21T17:03:34.000000Z\", \"updated_at\": \"2026-05-21T17:03:34.000000Z\", \"comision_id\": 3, \"despacho_id\": 5, \"producto_id\": 2, \"entrega_vendedor\": \"5.00\", \"comision_vendedor\": \"5.00\", \"entrega_distribuidor\": \"10.00\", \"categoria_producto_id\": 2, \"comision_distribuidor\": \"10.00\"}, {\"id\": 7, \"cantidad\": 48, \"created_at\": \"2026-05-21T17:03:34.000000Z\", \"updated_at\": \"2026-05-21T17:03:34.000000Z\", \"comision_id\": 3, \"despacho_id\": 6, \"producto_id\": 1, \"entrega_vendedor\": \"20.00\", \"comision_vendedor\": \"20.00\", \"entrega_distribuidor\": \"40.00\", \"categoria_producto_id\": 1, \"comision_distribuidor\": \"40.00\"}, {\"id\": 8, \"cantidad\": 12, \"created_at\": \"2026-05-21T17:03:34.000000Z\", \"updated_at\": \"2026-05-21T17:03:34.000000Z\", \"comision_id\": 3, \"despacho_id\": 7, \"producto_id\": 1, \"entrega_vendedor\": \"5.00\", \"comision_vendedor\": \"5.00\", \"entrega_distribuidor\": \"10.00\", \"categoria_producto_id\": 1, \"comision_distribuidor\": \"10.00\"}]}', NULL, 'COMISIONES', '2026-05-21', '13:03:34', '2026-05-21 17:03:34', '2026-05-21 17:03:34'),
(83, 6, 'MODIFICACIÓN', 'EL USUARIO mmamani ENTREGÓ UN PEDIDO', '{\"id\": 4, \"hora\": \"16:05:48\", \"fecha\": \"2026-05-20\", \"total\": \"400.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 6, \"subtotal\": \"400.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 4, \"created_at\": \"2026-05-20T20:05:48.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"despacho_id\": 4, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 7, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"400.00\", \"pedido_id\": 4, \"created_at\": \"2026-05-20T20:05:48.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"producto_id\": 1, \"cantidad_total\": 24, \"cantidad_despacho\": 24, \"cantidad_entregado\": 24, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}], \"segmentacion_zona_id\": 2, \"user_distribucion_id\": null}', '{\"id\": 4, \"hora\": \"16:05:48\", \"fecha\": \"2026-05-20\", \"total\": \"400.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 6, \"subtotal\": \"400.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 4, \"created_at\": \"2026-05-20T20:05:48.000000Z\", \"updated_at\": \"2026-05-21T17:38:45.000000Z\", \"despacho_id\": 4, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": 4, \"pedido_detalles\": [{\"id\": 7, \"precio\": \"400.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"400.00\", \"pedido_id\": 4, \"created_at\": \"2026-05-20T20:05:48.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"producto_id\": 1, \"cantidad_total\": 24, \"cantidad_despacho\": 24, \"cantidad_entregado\": 24, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 7}], \"segmentacion_zona_id\": 2, \"user_distribucion_id\": 6}', 'PEDIDOS', '2026-05-21', '13:38:45', '2026-05-21 17:38:45', '2026-05-21 17:38:45'),
(84, 6, 'MODIFICACIÓN', 'EL USUARIO mmamani ENTREGÓ UN PEDIDO', '{\"id\": 5, \"hora\": \"16:05:57\", \"fecha\": \"2026-05-20\", \"total\": \"65.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 6, \"subtotal\": \"65.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 5, \"created_at\": \"2026-05-20T20:05:57.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"despacho_id\": 4, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 8, \"precio\": \"65.00\", \"status\": 1, \"cantidad\": 0.5, \"subtotal\": \"32.50\", \"pedido_id\": 5, \"created_at\": \"2026-05-20T20:05:57.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"producto_id\": 3, \"cantidad_total\": 12, \"cantidad_despacho\": 6, \"cantidad_entregado\": 6, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 2}], \"segmentacion_zona_id\": 2, \"user_distribucion_id\": null}', '{\"id\": 5, \"hora\": \"16:05:57\", \"fecha\": \"2026-05-20\", \"total\": \"32.50\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 6, \"subtotal\": \"32.50\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 5, \"created_at\": \"2026-05-20T20:05:57.000000Z\", \"updated_at\": \"2026-05-21T17:38:52.000000Z\", \"despacho_id\": 4, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": 4, \"pedido_detalles\": [{\"id\": 8, \"precio\": \"65.00\", \"status\": 1, \"cantidad\": 0.5, \"subtotal\": \"32.50\", \"pedido_id\": 5, \"created_at\": \"2026-05-20T20:05:57.000000Z\", \"updated_at\": \"2026-05-20T22:19:36.000000Z\", \"producto_id\": 3, \"cantidad_total\": 12, \"cantidad_despacho\": 6, \"cantidad_entregado\": 6, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 2}], \"segmentacion_zona_id\": 2, \"user_distribucion_id\": 6}', 'PEDIDOS', '2026-05-21', '13:38:52', '2026-05-21 17:38:52', '2026-05-21 17:38:52'),
(85, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CONSOLIDADO', '{\"id\": 8, \"hora\": \"13:39:13\", \"fecha\": \"2026-05-21\", \"pedidos\": [], \"user_id\": 1, \"created_at\": \"2026-05-21T17:39:13.000000Z\", \"updated_at\": \"2026-05-21T17:39:13.000000Z\", \"despacho_id\": 4, \"distribuidor_id\": 4}', NULL, 'CONSOLIDADOS', '2026-05-21', '13:39:13', '2026-05-21 17:39:13', '2026-05-21 17:39:13'),
(86, 6, 'CREACIÓN', 'EL USUARIO mmamani REGISTRO UN PEDIDO', '{\"id\": 9, \"hora\": \"13:39:45\", \"fecha\": \"2026-05-21\", \"total\": \"310.00\", \"user_id\": 6, \"subtotal\": \"310.00\", \"descuento\": \"0\", \"cliente_id\": \"4\", \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:39:45.000000Z\", \"observacion\": null, \"pedido_detalles\": [{\"id\": 14, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 9, \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:39:45.000000Z\", \"producto_id\": 1, \"cantidad_total\": 12, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}, {\"id\": 15, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"110.00\", \"pedido_id\": 9, \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:39:45.000000Z\", \"producto_id\": 2, \"cantidad_total\": 12, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}], \"segmentacion_zona_id\": 2}', NULL, 'PEDIDOS', '2026-05-21', '13:39:45', '2026-05-21 17:39:45', '2026-05-21 17:39:45'),
(87, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESPACHO', '{\"id\": 8, \"hora\": \"13:39:56\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 9, \"hora\": \"13:39:45\", \"fecha\": \"2026-05-21\", \"total\": \"310.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"21/05/2026\", \"user_id\": 6, \"subtotal\": \"310.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 4, \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:39:56.000000Z\", \"despacho_id\": 8, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"segmentacion_zona_id\": 2, \"user_distribucion_id\": null}], \"user_id\": 1, \"created_at\": \"2026-05-21T17:39:56.000000Z\", \"updated_at\": \"2026-05-21T17:39:56.000000Z\", \"observacion\": null, \"distribuidor_id\": 4}', NULL, 'DESPACHOS', '2026-05-21', '13:39:57', '2026-05-21 17:39:57', '2026-05-21 17:39:57'),
(88, 6, 'MODIFICACIÓN', 'EL USUARIO mmamani ENTREGÓ UN PEDIDO', '{\"id\": 9, \"hora\": \"13:39:45\", \"fecha\": \"2026-05-21\", \"total\": \"310.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 6, \"subtotal\": \"310.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 4, \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:39:56.000000Z\", \"despacho_id\": 8, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 14, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 0.5, \"subtotal\": \"100.00\", \"pedido_id\": 9, \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:39:57.000000Z\", \"producto_id\": 1, \"cantidad_total\": 12, \"cantidad_despacho\": 6, \"cantidad_entregado\": 6, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}, {\"id\": 15, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"110.00\", \"pedido_id\": 9, \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:39:57.000000Z\", \"producto_id\": 2, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}], \"segmentacion_zona_id\": 2, \"user_distribucion_id\": null}', '{\"id\": 9, \"hora\": \"13:39:45\", \"fecha\": \"2026-05-21\", \"total\": \"210.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 6, \"subtotal\": \"210.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 4, \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:40:20.000000Z\", \"despacho_id\": 8, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": 4, \"pedido_detalles\": [{\"id\": 14, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 0.5, \"subtotal\": \"100.00\", \"pedido_id\": 9, \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:39:57.000000Z\", \"producto_id\": 1, \"cantidad_total\": 12, \"cantidad_despacho\": 6, \"cantidad_entregado\": 6, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}, {\"id\": 15, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"110.00\", \"pedido_id\": 9, \"created_at\": \"2026-05-21T17:39:45.000000Z\", \"updated_at\": \"2026-05-21T17:39:57.000000Z\", \"producto_id\": 2, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}], \"segmentacion_zona_id\": 2, \"user_distribucion_id\": 6}', 'PEDIDOS', '2026-05-21', '13:40:20', '2026-05-21 17:40:20', '2026-05-21 17:40:20'),
(89, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CONSOLIDADO', '{\"id\": 9, \"hora\": \"13:40:30\", \"fecha\": \"2026-05-21\", \"pedidos\": [], \"user_id\": 1, \"created_at\": \"2026-05-21T17:40:30.000000Z\", \"updated_at\": \"2026-05-21T17:40:30.000000Z\", \"despacho_id\": 8, \"distribuidor_id\": 4}', NULL, 'CONSOLIDADOS', '2026-05-21', '13:40:30', '2026-05-21 17:40:30', '2026-05-21 17:40:30'),
(90, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA COMISIÓN', '{\"id\": 4, \"hora\": \"13:45:17\", \"fecha\": \"2026-05-21\", \"user_id\": 1, \"created_at\": \"2026-05-21T17:45:17.000000Z\", \"updated_at\": \"2026-05-21T17:45:17.000000Z\", \"distribuidor_id\": 4, \"comision_detalles\": [{\"id\": 9, \"cantidad\": 24, \"created_at\": \"2026-05-21T17:45:17.000000Z\", \"updated_at\": \"2026-05-21T17:45:17.000000Z\", \"comision_id\": 4, \"despacho_id\": 4, \"producto_id\": 1, \"entrega_vendedor\": \"10.00\", \"comision_vendedor\": \"10.00\", \"entrega_distribuidor\": \"20.00\", \"categoria_producto_id\": 1, \"comision_distribuidor\": \"20.00\"}, {\"id\": 10, \"cantidad\": 6, \"created_at\": \"2026-05-21T17:45:17.000000Z\", \"updated_at\": \"2026-05-21T17:45:17.000000Z\", \"comision_id\": 4, \"despacho_id\": 4, \"producto_id\": 3, \"entrega_vendedor\": \"1.25\", \"comision_vendedor\": \"1.25\", \"entrega_distribuidor\": \"2.50\", \"categoria_producto_id\": 1, \"comision_distribuidor\": \"2.50\"}, {\"id\": 11, \"cantidad\": 6, \"created_at\": \"2026-05-21T17:45:17.000000Z\", \"updated_at\": \"2026-05-21T17:45:17.000000Z\", \"comision_id\": 4, \"despacho_id\": 8, \"producto_id\": 1, \"entrega_vendedor\": \"2.50\", \"comision_vendedor\": \"2.50\", \"entrega_distribuidor\": \"5.00\", \"categoria_producto_id\": 1, \"comision_distribuidor\": \"5.00\"}, {\"id\": 12, \"cantidad\": 12, \"created_at\": \"2026-05-21T17:45:17.000000Z\", \"updated_at\": \"2026-05-21T17:45:17.000000Z\", \"comision_id\": 4, \"despacho_id\": 8, \"producto_id\": 2, \"entrega_vendedor\": \"2.50\", \"comision_vendedor\": \"2.50\", \"entrega_distribuidor\": \"5.00\", \"categoria_producto_id\": 2, \"comision_distribuidor\": \"5.00\"}]}', NULL, 'COMISIONES', '2026-05-21', '13:45:17', '2026-05-21 17:45:17', '2026-05-21 17:45:17'),
(91, 6, 'CREACIÓN', 'EL USUARIO mmamani REGISTRO UN PEDIDO', '{\"id\": 10, \"hora\": \"15:27:36\", \"fecha\": \"2026-05-21\", \"total\": \"65.00\", \"user_id\": 6, \"subtotal\": \"65.00\", \"descuento\": \"0\", \"cliente_id\": \"4\", \"created_at\": \"2026-05-21T19:27:36.000000Z\", \"updated_at\": \"2026-05-21T19:27:36.000000Z\", \"observacion\": null, \"pedido_detalles\": [{\"id\": 16, \"precio\": \"65.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"65.00\", \"pedido_id\": 10, \"created_at\": \"2026-05-21T19:27:36.000000Z\", \"updated_at\": \"2026-05-21T19:27:36.000000Z\", \"producto_id\": 3, \"cantidad_total\": 12, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 2}], \"segmentacion_zona_id\": 2}', NULL, 'PEDIDOS', '2026-05-21', '15:27:36', '2026-05-21 19:27:36', '2026-05-21 19:27:36'),
(92, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESPACHO', '{\"id\": 9, \"hora\": \"15:30:13\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 10, \"hora\": \"15:27:36\", \"fecha\": \"2026-05-21\", \"total\": \"65.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"21/05/2026\", \"user_id\": 6, \"subtotal\": \"65.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 4, \"created_at\": \"2026-05-21T19:27:36.000000Z\", \"updated_at\": \"2026-05-21T19:30:13.000000Z\", \"despacho_id\": 9, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"segmentacion_zona_id\": 2, \"user_distribucion_id\": null}], \"user_id\": 1, \"created_at\": \"2026-05-21T19:30:13.000000Z\", \"updated_at\": \"2026-05-21T19:30:13.000000Z\", \"observacion\": null, \"distribuidor_id\": 4}', NULL, 'DESPACHOS', '2026-05-21', '15:30:14', '2026-05-21 19:30:14', '2026-05-21 19:30:14'),
(93, 6, 'MODIFICACIÓN', 'EL USUARIO mmamani ENTREGÓ UN PEDIDO', '{\"id\": 10, \"hora\": \"15:27:36\", \"fecha\": \"2026-05-21\", \"total\": \"65.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 6, \"subtotal\": \"65.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 4, \"created_at\": \"2026-05-21T19:27:36.000000Z\", \"updated_at\": \"2026-05-21T19:30:13.000000Z\", \"despacho_id\": 9, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 16, \"precio\": \"65.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"65.00\", \"pedido_id\": 10, \"created_at\": \"2026-05-21T19:27:36.000000Z\", \"updated_at\": \"2026-05-21T19:30:46.000000Z\", \"producto_id\": 3, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 2}], \"segmentacion_zona_id\": 2, \"user_distribucion_id\": null}', '{\"id\": 10, \"hora\": \"15:27:36\", \"fecha\": \"2026-05-21\", \"total\": \"65.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 6, \"subtotal\": \"65.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"EFECTIVO\", \"cliente_id\": 4, \"created_at\": \"2026-05-21T19:27:36.000000Z\", \"updated_at\": \"2026-05-21T19:30:46.000000Z\", \"despacho_id\": 9, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": 4, \"pedido_detalles\": [{\"id\": 16, \"precio\": \"65.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"65.00\", \"pedido_id\": 10, \"created_at\": \"2026-05-21T19:27:36.000000Z\", \"updated_at\": \"2026-05-21T19:30:46.000000Z\", \"producto_id\": 3, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 2}], \"segmentacion_zona_id\": 2, \"user_distribucion_id\": 6}', 'PEDIDOS', '2026-05-21', '15:30:46', '2026-05-21 19:30:46', '2026-05-21 19:30:46'),
(94, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN USUARIO', '{\"id\": 6, \"foto\": null, \"tipo\": \"VENDEDOR\", \"acceso\": 1, \"nombre\": \"MARIA MAMANI\", \"status\": 1, \"bloqueo\": 1, \"usuario\": \"mmamani\", \"created_at\": \"2026-05-19T13:04:11.000000Z\", \"updated_at\": \"2026-05-19T13:04:11.000000Z\", \"fecha_registro\": \"2026-05-19\"}', '{\"id\": 6, \"foto\": \"61779392180.jpg\", \"tipo\": \"VENDEDOR\", \"acceso\": \"1\", \"nombre\": \"MARIA MAMANI\", \"status\": 1, \"bloqueo\": \"1\", \"usuario\": \"mmamani\", \"created_at\": \"2026-05-19T13:04:11.000000Z\", \"updated_at\": \"2026-05-21T19:36:20.000000Z\", \"fecha_registro\": \"2026-05-19\"}', 'USUARIOS', '2026-05-21', '15:36:20', '2026-05-21 19:36:20', '2026-05-21 19:36:20'),
(95, 5, 'CREACIÓN', 'EL USUARIO jmamani REGISTRO UN PEDIDO', '{\"id\": 11, \"hora\": \"16:12:29\", \"fecha\": \"2026-05-21\", \"total\": \"310.00\", \"user_id\": 5, \"subtotal\": \"310.00\", \"descuento\": \"0\", \"cliente_id\": \"1\", \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:12:29.000000Z\", \"observacion\": null, \"pedido_detalles\": [{\"id\": 17, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"200.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:12:29.000000Z\", \"producto_id\": 1, \"cantidad_total\": 12, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}, {\"id\": 18, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"110.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:12:29.000000Z\", \"producto_id\": 2, \"cantidad_total\": 12, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}], \"segmentacion_zona_id\": 1}', NULL, 'PEDIDOS', '2026-05-21', '16:12:29', '2026-05-21 20:12:29', '2026-05-21 20:12:29'),
(96, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA COMPRA', '{\"id\": 9, \"hora\": \"16:12:51\", \"fecha\": \"2026-05-21\", \"total\": 2000, \"cantidad\": 50, \"created_at\": \"2026-05-21T20:12:51.000000Z\", \"updated_at\": \"2026-05-21T20:12:51.000000Z\", \"producto_id\": 1, \"precio_compra\": 40, \"categoria_producto_id\": 1}', NULL, 'COMPRAS', '2026-05-21', '16:12:51', '2026-05-21 20:12:51', '2026-05-21 20:12:51'),
(97, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA COMPRA', '{\"id\": 10, \"hora\": \"16:13:13\", \"fecha\": \"2026-05-21\", \"total\": 700, \"cantidad\": 20, \"created_at\": \"2026-05-21T20:13:13.000000Z\", \"updated_at\": \"2026-05-21T20:13:13.000000Z\", \"producto_id\": 2, \"precio_compra\": 35, \"categoria_producto_id\": 2}', NULL, 'COMPRAS', '2026-05-21', '16:13:13', '2026-05-21 20:13:13', '2026-05-21 20:13:13'),
(98, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ACTUALIZÓ UN PEDIDO', '{\"id\": 11, \"hora\": \"16:12:29\", \"fecha\": \"2026-05-21\", \"total\": \"310.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"310.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 1, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:12:29.000000Z\", \"despacho_id\": null, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 17, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 2, \"subtotal\": \"400.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:13:41.000000Z\", \"producto_id\": 1, \"cantidad_total\": 24, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}, {\"id\": 18, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"110.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:12:29.000000Z\", \"producto_id\": 2, \"cantidad_total\": 12, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}', '{\"id\": 11, \"hora\": \"16:12:29\", \"fecha\": \"2026-05-21\", \"total\": \"510.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"510.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": \"1\", \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:13:41.000000Z\", \"despacho_id\": null, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 17, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 2, \"subtotal\": \"400.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:13:41.000000Z\", \"producto_id\": 1, \"cantidad_total\": 24, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}, {\"id\": 18, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"110.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:12:29.000000Z\", \"producto_id\": 2, \"cantidad_total\": 12, \"cantidad_despacho\": 0, \"cantidad_entregado\": 0, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}', 'PEDIDOS', '2026-05-21', '16:13:41', '2026-05-21 20:13:41', '2026-05-21 20:13:41'),
(99, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESPACHO', '{\"id\": 10, \"hora\": \"16:13:56\", \"fecha\": \"2026-05-21\", \"pedidos\": [{\"id\": 11, \"hora\": \"16:12:29\", \"fecha\": \"2026-05-21\", \"total\": \"510.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"fecha_t\": \"21/05/2026\", \"user_id\": 5, \"subtotal\": \"510.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 1, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:13:56.000000Z\", \"despacho_id\": 10, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}], \"user_id\": 1, \"created_at\": \"2026-05-21T20:13:56.000000Z\", \"updated_at\": \"2026-05-21T20:13:56.000000Z\", \"observacion\": null, \"distribuidor_id\": 3}', NULL, 'DESPACHOS', '2026-05-21', '16:13:56', '2026-05-21 20:13:56', '2026-05-21 20:13:56'),
(100, 5, 'MODIFICACIÓN', 'EL USUARIO jmamani ENTREGÓ UN PEDIDO', '{\"id\": 11, \"hora\": \"16:12:29\", \"fecha\": \"2026-05-21\", \"total\": \"510.00\", \"estado\": \"PENDIENTE\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"510.00\", \"descuento\": \"0.00\", \"tipo_pago\": null, \"cliente_id\": 1, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:13:56.000000Z\", \"despacho_id\": 10, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": null, \"pedido_detalles\": [{\"id\": 17, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1.83, \"subtotal\": \"366.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:54:54.000000Z\", \"producto_id\": 1, \"cantidad_total\": 24, \"cantidad_despacho\": 24, \"cantidad_entregado\": 22, \"cantidad_devolucion\": 2, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}, {\"id\": 18, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"110.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:13:56.000000Z\", \"producto_id\": 2, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": null}', '{\"id\": 11, \"hora\": \"16:12:29\", \"fecha\": \"2026-05-21\", \"total\": \"476.00\", \"estado\": \"ENTREGADO\", \"status\": 1, \"user_id\": 5, \"subtotal\": \"476.00\", \"descuento\": \"0.00\", \"tipo_pago\": \"MIXTO\", \"cliente_id\": 1, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:54:54.000000Z\", \"despacho_id\": 10, \"observacion\": null, \"consolidado_id\": null, \"distribuidor_id\": 3, \"pedido_detalles\": [{\"id\": 17, \"precio\": \"200.00\", \"status\": 1, \"cantidad\": 1.83, \"subtotal\": \"366.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:54:54.000000Z\", \"producto_id\": 1, \"cantidad_total\": 24, \"cantidad_despacho\": 24, \"cantidad_entregado\": 22, \"cantidad_devolucion\": 2, \"categoria_producto_id\": 1, \"presentacion_producto_id\": 8}, {\"id\": 18, \"precio\": \"110.00\", \"status\": 1, \"cantidad\": 1, \"subtotal\": \"110.00\", \"pedido_id\": 11, \"created_at\": \"2026-05-21T20:12:29.000000Z\", \"updated_at\": \"2026-05-21T20:13:56.000000Z\", \"producto_id\": 2, \"cantidad_total\": 12, \"cantidad_despacho\": 12, \"cantidad_entregado\": 12, \"cantidad_devolucion\": 0, \"categoria_producto_id\": 2, \"presentacion_producto_id\": 5}], \"segmentacion_zona_id\": 1, \"user_distribucion_id\": 5}', 'PEDIDOS', '2026-05-21', '16:54:54', '2026-05-21 20:54:54', '2026-05-21 20:54:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_01_31_165641_create_configuracions_table', 1),
(2, '2024_11_02_153317_create_users_table', 1),
(3, '2024_11_02_153318_create_historial_accions_table', 1),
(4, '2026_05_18_082418_create_departamentos_table', 1),
(5, '2026_05_18_082424_create_provincias_table', 1),
(6, '2026_05_18_082428_create_ciudads_table', 1),
(7, '2026_05_18_082438_create_segmentacion_zonas_table', 1),
(8, '2026_05_18_082525_create_asignacion_zonas_table', 1),
(9, '2026_05_18_082538_create_categoria_productos_table', 1),
(10, '2026_05_18_082547_create_productos_table', 1),
(11, '2026_05_18_082559_create_presentacion_productos_table', 1),
(12, '2026_05_18_082648_create_compras_table', 1),
(13, '2026_05_18_082710_create_clientes_table', 1),
(14, '2026_05_18_082718_create_pedidos_table', 1),
(15, '2026_05_18_082903_create_despachos_table', 1),
(16, '2026_05_18_082918_create_ventas_table', 1),
(17, '2026_05_18_083043_create_consolidados_table', 1),
(18, '2026_05_18_083057_create_comisions_table', 1),
(19, '2026_05_18_084327_create_pedido_detalles_table', 1),
(21, '2026_05_20_085305_create_movimiento_inventarios_table', 2),
(22, '2026_05_21_112811_create_comision_detalles_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_inventarios`
--

CREATE TABLE `movimiento_inventarios` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo_registro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_id` bigint UNSIGNED DEFAULT NULL,
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `detalle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(24,2) DEFAULT NULL,
  `tipo_is` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_ingreso` double DEFAULT NULL,
  `cantidad_salida` double DEFAULT NULL,
  `cantidad_saldo` double NOT NULL,
  `cu` decimal(24,2) NOT NULL,
  `monto_ingreso` decimal(24,2) DEFAULT NULL,
  `monto_salida` decimal(24,2) DEFAULT NULL,
  `monto_saldo` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimiento_inventarios`
--

INSERT INTO `movimiento_inventarios` (`id`, `tipo_registro`, `registro_id`, `modulo`, `producto_id`, `detalle`, `precio`, `tipo_is`, `cantidad_ingreso`, `cantidad_salida`, `cantidad_saldo`, `cu`, `monto_ingreso`, `monto_salida`, `monto_saldo`, `fecha`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Compra', 1, 'Compra', 1, '', 40.00, 'INGRESO', 30, NULL, 30, 40.00, 1200.00, NULL, 1200.00, '2026-05-20', 1, '2026-05-20 13:35:54', '2026-05-20 13:35:54'),
(2, 'Compra', 2, 'Compra', 2, '', 40.00, 'INGRESO', 20, NULL, 20, 40.00, 800.00, NULL, 800.00, '2026-05-20', 1, '2026-05-20 13:37:10', '2026-05-20 13:37:10'),
(3, 'Compra', 3, 'Compra', 3, '', 40.50, 'INGRESO', 30, NULL, 30, 40.50, 1215.00, NULL, 1215.00, '2026-05-20', 1, '2026-05-20 13:37:31', '2026-05-20 13:37:31'),
(4, 'Compra', 4, 'Compra', 1, '', 40.00, 'INGRESO', 10, NULL, 40, 40.00, 400.00, NULL, 1600.00, '2026-05-20', 1, '2026-05-20 13:40:11', '2026-05-20 13:40:11'),
(5, 'Despacho', 1, 'PedidoDetalle', 1, 'Despacho de producto', 400.00, 'EGRESO', NULL, 28, 12, 400.00, NULL, 11200.00, -9600.00, '2026-05-20', 1, '2026-05-20 22:12:14', '2026-05-20 22:12:14'),
(6, 'Despacho', 5, 'PedidoDetalle', 1, 'Despacho de producto', 200.00, 'EGRESO', NULL, 12, 0, 200.00, NULL, 2400.00, -12000.00, '2026-05-20', 1, '2026-05-20 22:12:14', '2026-05-20 22:12:14'),
(7, 'Despacho', 4, 'PedidoDetalle', 3, 'Despacho de producto', 65.00, 'EGRESO', NULL, 12, 18, 65.00, NULL, 780.00, 435.00, '2026-05-20', 1, '2026-05-20 22:12:14', '2026-05-20 22:12:14'),
(8, 'Despacho', 6, 'PedidoDetalle', 3, 'Despacho de producto', 65.00, 'EGRESO', NULL, 12, 6, 65.00, NULL, 780.00, -345.00, '2026-05-20', 1, '2026-05-20 22:12:14', '2026-05-20 22:12:14'),
(9, 'Despacho', 3, 'PedidoDetalle', 2, 'Despacho de producto', 110.00, 'EGRESO', NULL, 16, 4, 110.00, NULL, 1760.00, -960.00, '2026-05-20', 1, '2026-05-20 22:12:14', '2026-05-20 22:12:14'),
(10, 'Compra', 5, 'Compra', 1, '', 40.00, 'INGRESO', 34, NULL, 34, 40.00, 1360.00, NULL, -10640.00, '2026-05-20', 1, '2026-05-20 22:19:22', '2026-05-20 22:19:22'),
(11, 'Despacho', 7, 'PedidoDetalle', 1, 'Despacho de producto', 400.00, 'EGRESO', NULL, 24, 10, 400.00, NULL, 9600.00, -20240.00, '2026-05-20', 1, '2026-05-20 22:19:36', '2026-05-20 22:19:36'),
(12, 'Despacho', 8, 'PedidoDetalle', 3, 'Despacho de producto', 65.00, 'EGRESO', NULL, 6, 0, 65.00, NULL, 390.00, -735.00, '2026-05-20', 1, '2026-05-20 22:19:36', '2026-05-20 22:19:36'),
(13, 'Consolidado', 1, 'PedidoDetalle', 1, 'Consolidado de Despacho', 400.00, 'INGRESO', 4, NULL, 14, 400.00, 1600.00, NULL, -18640.00, '2026-05-21', 1, '2026-05-21 15:09:54', '2026-05-21 15:09:54'),
(14, 'Compra', 6, 'Compra', 3, '', 40.00, 'INGRESO', 20, NULL, 20, 40.00, 800.00, NULL, 65.00, '2026-05-21', 1, '2026-05-21 16:09:35', '2026-05-21 16:09:35'),
(15, 'Compra', 7, 'Compra', 1, '', 35.00, 'INGRESO', 100, NULL, 114, 35.00, 3500.00, NULL, -15140.00, '2026-05-21', 1, '2026-05-21 16:09:43', '2026-05-21 16:09:43'),
(16, 'Compra', 8, 'Compra', 2, '', 35.00, 'INGRESO', 40, NULL, 44, 35.00, 1400.00, NULL, 440.00, '2026-05-21', 1, '2026-05-21 16:10:04', '2026-05-21 16:10:04'),
(17, 'Despacho', 9, 'PedidoDetalle', 1, 'Despacho de producto', 400.00, 'EGRESO', NULL, 48, 66, 400.00, NULL, 19200.00, -34340.00, '2026-05-21', 1, '2026-05-21 16:10:13', '2026-05-21 16:10:13'),
(18, 'Despacho', 11, 'PedidoDetalle', 3, 'Despacho de producto', 6.00, 'EGRESO', NULL, 1, 19, 6.00, NULL, 6.00, 59.00, '2026-05-21', 1, '2026-05-21 16:10:13', '2026-05-21 16:10:13'),
(19, 'Despacho', 10, 'PedidoDetalle', 2, 'Despacho de producto', 200.00, 'EGRESO', NULL, 24, 20, 200.00, NULL, 4800.00, -4360.00, '2026-05-21', 1, '2026-05-21 16:10:13', '2026-05-21 16:10:13'),
(20, 'Despacho', 12, 'PedidoDetalle', 1, 'Despacho de producto', 400.00, 'EGRESO', NULL, 48, 18, 400.00, NULL, 19200.00, -53540.00, '2026-05-21', 1, '2026-05-21 16:14:51', '2026-05-21 16:14:51'),
(21, 'Despacho', 13, 'PedidoDetalle', 1, 'Despacho de producto', 200.00, 'EGRESO', NULL, 12, 6, 200.00, NULL, 2400.00, -55940.00, '2026-05-21', 1, '2026-05-21 16:16:47', '2026-05-21 16:16:47'),
(22, 'Despacho', 14, 'PedidoDetalle', 1, 'Despacho de producto', 200.00, 'EGRESO', NULL, 6, 0, 200.00, NULL, 1200.00, -57140.00, '2026-05-21', 1, '2026-05-21 17:39:57', '2026-05-21 17:39:57'),
(23, 'Despacho', 15, 'PedidoDetalle', 2, 'Despacho de producto', 110.00, 'EGRESO', NULL, 12, 8, 110.00, NULL, 1320.00, -5680.00, '2026-05-21', 1, '2026-05-21 17:39:57', '2026-05-21 17:39:57'),
(24, 'Despacho', 16, 'PedidoDetalle', 3, 'Despacho de producto', 65.00, 'EGRESO', NULL, 12, 7, 65.00, NULL, 780.00, -721.00, '2026-05-21', 1, '2026-05-21 19:30:14', '2026-05-21 19:30:14'),
(25, 'Compra', 9, 'Compra', 1, 'COMPRA DE PRODUCTO', 40.00, 'INGRESO', 50, NULL, 50, 40.00, 2000.00, NULL, -55140.00, '2026-05-21', 1, '2026-05-21 20:12:51', '2026-05-21 20:12:51'),
(26, 'Compra', 10, 'Compra', 2, 'COMPRA DE PRODUCTO', 35.00, 'INGRESO', 20, NULL, 28, 35.00, 700.00, NULL, -4980.00, '2026-05-21', 1, '2026-05-21 20:13:13', '2026-05-21 20:13:13'),
(27, 'Despacho', 17, 'PedidoDetalle', 1, 'Despacho de producto', 200.00, 'EGRESO', NULL, 24, 26, 200.00, NULL, 4800.00, -59940.00, '2026-05-21', 1, '2026-05-21 20:13:56', '2026-05-21 20:13:56'),
(28, 'Despacho', 18, 'PedidoDetalle', 2, 'Despacho de producto', 110.00, 'EGRESO', NULL, 12, 16, 110.00, NULL, 1320.00, -6300.00, '2026-05-21', 1, '2026-05-21 20:13:56', '2026-05-21 20:13:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `user_distribucion_id` bigint UNSIGNED DEFAULT NULL,
  `distribuidor_id` bigint UNSIGNED DEFAULT NULL,
  `segmentacion_zona_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `despacho_id` bigint UNSIGNED DEFAULT NULL,
  `consolidado_id` bigint UNSIGNED DEFAULT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `descuento` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `tipo_pago` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDIENTE',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `user_id`, `user_distribucion_id`, `distribuidor_id`, `segmentacion_zona_id`, `cliente_id`, `despacho_id`, `consolidado_id`, `subtotal`, `descuento`, `total`, `tipo_pago`, `fecha`, `hora`, `observacion`, `estado`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 5, 3, 1, 1, 3, 4, 1326.30, 0.00, 1326.30, 'EFECTIVO', '2026-05-20', '15:46:36', NULL, 'ENTREGADO', 1, '2026-05-20 19:46:36', '2026-05-21 15:09:54'),
(2, 5, 5, 3, 1, 2, 3, 4, 200.00, 50.00, 150.00, 'MIXTO', '2026-05-20', '15:55:51', NULL, 'ENTREGADO', 1, '2026-05-20 19:55:51', '2026-05-21 15:09:54'),
(3, 5, 5, 3, 1, 3, 3, 4, 780.00, 0.00, 780.00, 'EFECTIVO', '2026-05-20', '15:56:00', NULL, 'ENTREGADO', 1, '2026-05-20 19:56:00', '2026-05-21 15:09:54'),
(4, 6, 6, 4, 2, 4, 4, 8, 400.00, 0.00, 400.00, 'EFECTIVO', '2026-05-20', '16:05:48', NULL, 'ENTREGADO', 1, '2026-05-20 20:05:48', '2026-05-21 17:39:13'),
(5, 6, 6, 4, 2, 5, 4, 8, 32.50, 0.00, 32.50, 'EFECTIVO', '2026-05-20', '16:05:57', NULL, 'ENTREGADO', 1, '2026-05-20 20:05:57', '2026-05-21 17:39:13'),
(6, 5, 5, 3, 1, 2, 5, 5, 1006.00, 0.00, 1006.00, 'EFECTIVO', '2026-05-21', '12:08:43', 'pedido prueba', 'ENTREGADO', 1, '2026-05-21 16:08:43', '2026-05-21 16:18:40'),
(7, 5, 5, 3, 1, 3, 6, 6, 800.00, 0.00, 800.00, 'EFECTIVO', '2026-05-21', '12:13:55', NULL, 'ENTREGADO', 1, '2026-05-21 16:13:55', '2026-05-21 16:18:48'),
(8, 5, 5, 3, 1, 1, 7, 7, 200.00, 0.00, 200.00, 'EFECTIVO', '2026-05-21', '12:16:39', NULL, 'ENTREGADO', 1, '2026-05-21 16:16:39', '2026-05-21 16:18:55'),
(9, 6, 6, 4, 2, 4, 8, 9, 210.00, 0.00, 210.00, 'EFECTIVO', '2026-05-21', '13:39:45', NULL, 'ENTREGADO', 1, '2026-05-21 17:39:45', '2026-05-21 17:40:30'),
(10, 6, 6, 4, 2, 4, 9, NULL, 65.00, 0.00, 65.00, 'EFECTIVO', '2026-05-21', '15:27:36', NULL, 'ENTREGADO', 1, '2026-05-21 19:27:36', '2026-05-21 19:30:46'),
(11, 5, 5, 3, 1, 1, 10, NULL, 476.00, 0.00, 476.00, 'MIXTO', '2026-05-21', '16:12:29', NULL, 'ENTREGADO', 1, '2026-05-21 20:12:29', '2026-05-21 20:54:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalles`
--

CREATE TABLE `pedido_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `pedido_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `categoria_producto_id` bigint UNSIGNED NOT NULL,
  `presentacion_producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `cantidad_total` double(8,2) NOT NULL,
  `cantidad_despacho` double(8,2) NOT NULL,
  `cantidad_entregado` double(8,2) NOT NULL,
  `cantidad_devolucion` double(8,2) NOT NULL DEFAULT '0.00',
  `precio` decimal(24,2) NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedido_detalles`
--

INSERT INTO `pedido_detalles` (`id`, `pedido_id`, `producto_id`, `categoria_producto_id`, `presentacion_producto_id`, `cantidad`, `cantidad_total`, `cantidad_despacho`, `cantidad_entregado`, `cantidad_devolucion`, `precio`, `subtotal`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 7, 1, 48.00, 28.00, 24.00, 4.00, 400.00, 400.00, 1, '2026-05-20 19:46:36', '2026-05-21 14:11:55'),
(3, 1, 2, 2, 5, 1.33, 24.00, 16.00, 16.00, 0.00, 110.00, 146.30, 1, '2026-05-20 19:54:27', '2026-05-20 22:12:14'),
(4, 1, 3, 1, 2, 1, 12.00, 12.00, 12.00, 0.00, 65.00, 65.00, 1, '2026-05-20 19:54:27', '2026-05-20 22:12:14'),
(5, 2, 1, 1, 8, 1, 12.00, 12.00, 12.00, 0.00, 200.00, 200.00, 1, '2026-05-20 19:55:51', '2026-05-21 14:17:47'),
(6, 3, 3, 1, 2, 1, 12.00, 12.00, 12.00, 0.00, 65.00, 65.00, 1, '2026-05-20 19:56:00', '2026-05-20 22:12:14'),
(7, 4, 1, 1, 7, 1, 24.00, 24.00, 24.00, 0.00, 400.00, 400.00, 1, '2026-05-20 20:05:48', '2026-05-20 22:19:36'),
(8, 5, 3, 1, 2, 0.5, 12.00, 6.00, 6.00, 0.00, 65.00, 32.50, 1, '2026-05-20 20:05:57', '2026-05-20 22:19:36'),
(9, 6, 1, 1, 7, 2, 48.00, 48.00, 48.00, 0.00, 400.00, 800.00, 1, '2026-05-21 16:08:43', '2026-05-21 16:10:13'),
(10, 6, 2, 2, 4, 1, 24.00, 24.00, 24.00, 0.00, 200.00, 200.00, 1, '2026-05-21 16:08:43', '2026-05-21 16:10:13'),
(11, 6, 3, 1, 3, 1, 1.00, 1.00, 1.00, 0.00, 6.00, 6.00, 1, '2026-05-21 16:08:43', '2026-05-21 16:10:13'),
(12, 7, 1, 1, 7, 2, 48.00, 48.00, 48.00, 0.00, 400.00, 800.00, 1, '2026-05-21 16:13:55', '2026-05-21 16:14:51'),
(13, 8, 1, 1, 8, 1, 12.00, 12.00, 12.00, 0.00, 200.00, 200.00, 1, '2026-05-21 16:16:39', '2026-05-21 16:16:47'),
(14, 9, 1, 1, 8, 0.5, 12.00, 6.00, 6.00, 0.00, 200.00, 100.00, 1, '2026-05-21 17:39:45', '2026-05-21 17:39:57'),
(15, 9, 2, 2, 5, 1, 12.00, 12.00, 12.00, 0.00, 110.00, 110.00, 1, '2026-05-21 17:39:45', '2026-05-21 17:39:57'),
(16, 10, 3, 1, 2, 1, 12.00, 12.00, 12.00, 0.00, 65.00, 65.00, 1, '2026-05-21 19:27:36', '2026-05-21 19:30:46'),
(17, 11, 1, 1, 8, 1.83, 24.00, 24.00, 22.00, 2.00, 200.00, 366.00, 1, '2026-05-21 20:12:29', '2026-05-21 20:54:54'),
(18, 11, 2, 2, 5, 1, 12.00, 12.00, 12.00, 0.00, 110.00, 110.00, 1, '2026-05-21 20:12:29', '2026-05-21 20:13:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion_productos`
--

CREATE TABLE `presentacion_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equivale` int NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `comi_distribuidor` decimal(24,2) NOT NULL,
  `comi_vendedor` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `presentacion_productos`
--

INSERT INTO `presentacion_productos` (`id`, `producto_id`, `nombre`, `equivale`, `precio`, `comi_distribuidor`, `comi_vendedor`, `created_at`, `updated_at`) VALUES
(1, 3, 'caja', 24, 120.00, 10.00, 5.00, '2026-05-19 19:39:50', '2026-05-19 19:39:50'),
(2, 3, 'media caja', 12, 65.00, 5.00, 2.50, '2026-05-19 19:41:19', '2026-05-19 19:41:19'),
(3, 3, 'unidad', 1, 6.00, 1.50, 0.50, '2026-05-19 19:43:34', '2026-05-19 19:55:53'),
(4, 2, 'caja', 24, 200.00, 10.00, 5.00, '2026-05-19 19:46:57', '2026-05-19 19:46:57'),
(5, 2, 'media caja', 12, 110.00, 5.00, 2.50, '2026-05-19 19:48:16', '2026-05-19 19:48:16'),
(6, 2, 'unidad', 1, 7.00, 2.50, 0.50, '2026-05-19 19:48:37', '2026-05-19 19:48:37'),
(7, 1, 'caja', 24, 400.00, 20.00, 10.00, '2026-05-19 19:49:05', '2026-05-19 19:49:05'),
(8, 1, 'media caja', 12, 200.00, 10.00, 5.00, '2026-05-19 19:50:47', '2026-05-19 19:50:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `categoria_producto_id` bigint UNSIGNED NOT NULL,
  `stock_min` double NOT NULL,
  `stock_actual` double NOT NULL DEFAULT '0',
  `estado` int NOT NULL DEFAULT '1',
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `categoria_producto_id`, `stock_min`, `stock_actual`, `estado`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'producto 1', 'desc prod 1', 1, 5, 26, 1, '11779216124.png', '2026-05-19 18:42:04', '2026-05-21 20:13:56'),
(2, 'producto 2', NULL, 2, 4, 16, 1, '21779216384.png', '2026-05-19 18:46:24', '2026-05-21 20:13:56'),
(3, 'producto 3', NULL, 1, 4, 7, 1, NULL, '2026-05-19 18:46:36', '2026-05-21 19:30:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Provincia 1', NULL, NULL),
(2, 'Provincia 2', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segmentacion_zonas`
--

CREATE TABLE `segmentacion_zonas` (
  `id` bigint UNSIGNED NOT NULL,
  `departamento_id` bigint UNSIGNED NOT NULL,
  `provincia_id` bigint UNSIGNED NOT NULL,
  `ciudad_id` bigint UNSIGNED NOT NULL,
  `zona` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `segmentacion` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `segmentacion_zonas`
--

INSERT INTO `segmentacion_zonas` (`id`, `departamento_id`, `provincia_id`, `ciudad_id`, `zona`, `color`, `segmentacion`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'zona 1', '#ee4949', '[{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.465594227108642\", \"lng\": \"-68.15925558050728\"}, {\"lat\": \"-16.46471099182779\", \"lng\": \"-68.15804239371619\"}, {\"lat\": \"-16.46411423502453\", \"lng\": \"-68.15699100494386\"}, {\"lat\": \"-16.46359978803017\", \"lng\": \"-68.15621848539249\"}, {\"lat\": \"-16.463929034263817\", \"lng\": \"-68.15405163831707\"}, {\"lat\": \"-16.4648550362982\", \"lng\": \"-68.15287133628524\"}, {\"lat\": \"-16.4669539578672\", \"lng\": \"-68.15450170749297\"}, {\"lat\": \"-16.467981225075743\", \"lng\": \"-68.15530659842725\"}]}]', '2026-05-18 21:15:38', '2026-05-20 15:25:24'),
(2, 1, 1, 1, 'zona 2', '#2ab760', '[{\"color\": \"#2ab760\", \"coordenadas\": [{\"lat\": \"-16.511951190703318\", \"lng\": \"-68.15705537796022\"}, {\"lat\": \"-16.508906397080768\", \"lng\": \"-68.15606832504274\"}, {\"lat\": \"-16.509070981745964\", \"lng\": \"-68.16160440444948\"}, {\"lat\": \"-16.512198063759822\", \"lng\": \"-68.16164731979372\"}]}]', '2026-05-18 21:32:09', '2026-05-18 21:44:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceso` int NOT NULL DEFAULT '1',
  `bloqueo` int NOT NULL DEFAULT '1',
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `password`, `foto`, `acceso`, `bloqueo`, `tipo`, `fecha_registro`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '$2y$12$M2b1lEQrbaI17YIiht9xAuk2FCenB023wiuQVI63qmFsgogMzdXFe', NULL, 1, 0, 'ADMINISTRADOR', '2026-05-18', 1, '2026-05-18 13:31:09', '2026-05-18 13:31:09'),
(2, 'jperes', 'JUAN PERES', '$2y$12$LQY1VK7rzrSVgLmxmMYRyeh.JeSIG2Hn9SavUruOtwuFgwktPTa6W', NULL, 1, 1, 'ADMINISTRADOR', '2026-05-19', 1, '2026-05-19 13:02:59', '2026-05-19 13:02:59'),
(3, 'fcortez', 'FELIX CORTEZ', '$2y$12$1m21Dvtn6UxFGOUABnzwZep515WuVPuiKuDYjbgCoOxzBTqU378/O', NULL, 1, 1, 'DISTRIBUIDOR', '2026-05-19', 1, '2026-05-19 13:03:19', '2026-05-19 13:03:19'),
(4, 'csanz', 'CARLOS SANZ', '$2y$12$PPb6IyMpNpo1KTqPhYF./eTkJr8ildoMDAtEkXbto3Fxn26QTZ2ua', NULL, 1, 1, 'DISTRIBUIDOR', '2026-05-19', 1, '2026-05-19 13:03:33', '2026-05-19 13:03:33'),
(5, 'jmamani', 'JOSE MAMANI', '$2y$12$rMLj2OuFwzN/uTtmuJ2G0eFjE0NPp/GxoIJB5Z4QUBLaTdOzUSMlq', NULL, 1, 1, 'VENDEDOR', '2026-05-19', 1, '2026-05-19 13:03:57', '2026-05-19 13:03:57'),
(6, 'mmamani', 'MARIA MAMANI', '$2y$12$SCXrQpZOHpAhBcRhYYr2oOcFE0ti9fX8oqMNAZ.q0eD1dtd7j0g0a', '61779392180.jpg', 1, 1, 'VENDEDOR', '2026-05-19', 1, '2026-05-19 13:04:11', '2026-05-21 19:36:20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion_zonas`
--
ALTER TABLE `asignacion_zonas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignacion_zonas_segmentacion_zona_id_foreign` (`segmentacion_zona_id`),
  ADD KEY `asignacion_zonas_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indices de la tabla `categoria_productos`
--
ALTER TABLE `categoria_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudads`
--
ALTER TABLE `ciudads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_user_id_fk` (`user_id`),
  ADD KEY `clientes_segmentacion_zona_id_fk` (`segmentacion_zona_id`);

--
-- Indices de la tabla `comisions`
--
ALTER TABLE `comisions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comision_detalles`
--
ALTER TABLE `comision_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comision_detalles_comision_id_foreign` (`comision_id`),
  ADD KEY `comision_detalles_despacho_id_foreign` (`despacho_id`),
  ADD KEY `comision_detalles_categoria_producto_id_foreign` (`categoria_producto_id`),
  ADD KEY `comision_detalles_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_categoria_producto_id_foreign` (`categoria_producto_id`),
  ADD KEY `compras_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consolidados`
--
ALTER TABLE `consolidados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consolidados_distribuidor_id_foreign` (`distribuidor_id`),
  ADD KEY `consolidados_despacho_id_foreign` (`despacho_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `despachos`
--
ALTER TABLE `despachos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `despachos_distribuidor_id_foreign` (`distribuidor_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_accions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimiento_inventarios`
--
ALTER TABLE `movimiento_inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movimiento_inventarios_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidos_user_id_foreign` (`user_id`),
  ADD KEY `pedidos_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_detalles_pedido_id_foreign` (`pedido_id`),
  ADD KEY `pedido_detalles_producto_id_foreign` (`producto_id`),
  ADD KEY `pedido_detalles_presentacion_producto_id_foreign` (`presentacion_producto_id`);

--
-- Indices de la tabla `presentacion_productos`
--
ALTER TABLE `presentacion_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `presentacion_productos_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_categoria_producto_id_foreign` (`categoria_producto_id`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `segmentacion_zonas`
--
ALTER TABLE `segmentacion_zonas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `segmentacion_zonas_departamento_id_foreign` (`departamento_id`),
  ADD KEY `segmentacion_zonas_provincia_id_foreign` (`provincia_id`),
  ADD KEY `segmentacion_zonas_ciudad_id_foreign` (`ciudad_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion_zonas`
--
ALTER TABLE `asignacion_zonas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categoria_productos`
--
ALTER TABLE `categoria_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ciudads`
--
ALTER TABLE `ciudads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `comisions`
--
ALTER TABLE `comisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comision_detalles`
--
ALTER TABLE `comision_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consolidados`
--
ALTER TABLE `consolidados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `despachos`
--
ALTER TABLE `despachos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `movimiento_inventarios`
--
ALTER TABLE `movimiento_inventarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `presentacion_productos`
--
ALTER TABLE `presentacion_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `segmentacion_zonas`
--
ALTER TABLE `segmentacion_zonas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_zonas`
--
ALTER TABLE `asignacion_zonas`
  ADD CONSTRAINT `asignacion_zonas_distribuidor_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `asignacion_zonas_segmentacion_zona_id_foreign` FOREIGN KEY (`segmentacion_zona_id`) REFERENCES `segmentacion_zonas` (`id`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_segmentacion_zona_id_fk` FOREIGN KEY (`segmentacion_zona_id`) REFERENCES `segmentacion_zonas` (`id`),
  ADD CONSTRAINT `clientes_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `comision_detalles`
--
ALTER TABLE `comision_detalles`
  ADD CONSTRAINT `comision_detalles_categoria_producto_id_foreign` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categoria_productos` (`id`),
  ADD CONSTRAINT `comision_detalles_comision_id_foreign` FOREIGN KEY (`comision_id`) REFERENCES `comisions` (`id`),
  ADD CONSTRAINT `comision_detalles_despacho_id_foreign` FOREIGN KEY (`despacho_id`) REFERENCES `despachos` (`id`),
  ADD CONSTRAINT `comision_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_categoria_producto_id_foreign` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categoria_productos` (`id`),
  ADD CONSTRAINT `compras_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `consolidados`
--
ALTER TABLE `consolidados`
  ADD CONSTRAINT `consolidados_despacho_id_foreign` FOREIGN KEY (`despacho_id`) REFERENCES `despachos` (`id`),
  ADD CONSTRAINT `consolidados_distribuidor_id_foreign` FOREIGN KEY (`distribuidor_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `despachos`
--
ALTER TABLE `despachos`
  ADD CONSTRAINT `despachos_distribuidor_id_foreign` FOREIGN KEY (`distribuidor_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD CONSTRAINT `historial_accions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `movimiento_inventarios`
--
ALTER TABLE `movimiento_inventarios`
  ADD CONSTRAINT `movimiento_inventarios_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `pedidos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  ADD CONSTRAINT `pedido_detalles_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `pedido_detalles_presentacion_producto_id_foreign` FOREIGN KEY (`presentacion_producto_id`) REFERENCES `presentacion_productos` (`id`),
  ADD CONSTRAINT `pedido_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `presentacion_productos`
--
ALTER TABLE `presentacion_productos`
  ADD CONSTRAINT `presentacion_productos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria_producto_id_foreign` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categoria_productos` (`id`);

--
-- Filtros para la tabla `segmentacion_zonas`
--
ALTER TABLE `segmentacion_zonas`
  ADD CONSTRAINT `segmentacion_zonas_ciudad_id_foreign` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudads` (`id`),
  ADD CONSTRAINT `segmentacion_zonas_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  ADD CONSTRAINT `segmentacion_zonas_provincia_id_foreign` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
