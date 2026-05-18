-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-05-2026 a las 21:38:40
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
  `distribuidor_id` bigint UNSIGNED NOT NULL,
  `vendedor_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisions`
--

CREATE TABLE `comisions` (
  `id` bigint UNSIGNED NOT NULL,
  `distribuidor_id` bigint UNSIGNED NOT NULL,
  `despacho_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `observacion` text COLLATE utf8mb4_unicode_ci,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despacho_detalles`
--

CREATE TABLE `despacho_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `despacho_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `pedido_detalle_id` bigint UNSIGNED NOT NULL,
  `categoria_producto_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `presentacion_producto_id` bigint UNSIGNED NOT NULL,
  `venta_id` bigint UNSIGNED DEFAULT NULL,
  `cantidad` double NOT NULL,
  `cantidad_despacho` double NOT NULL,
  `cantidad_entregado` double NOT NULL,
  `cantidad_devolucion` double DEFAULT NULL,
  `precio` decimal(24,2) NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA SUCURSAL', '{\"id\": 2, \"zona\": \"zona 2\", \"color\": \"#2ab760\", \"ciudad_id\": \"1\", \"created_at\": \"2026-05-18T21:32:09.000000Z\", \"updated_at\": \"2026-05-18T21:32:09.000000Z\", \"provincia_id\": \"1\", \"segmentacion\": [{\"color\": \"#2ab760\", \"coordenadas\": [{\"lat\": \"-16.12647917966873\", \"lng\": \"-67.19490408897401\"}, {\"lat\": \"-16.127241871478976\", \"lng\": \"-67.19548344612123\"}, {\"lat\": \"-16.12757168324447\", \"lng\": \"-67.19458222389223\"}, {\"lat\": \"-16.12647917966873\", \"lng\": \"-67.19436764717103\"}]}], \"departamento_id\": \"1\"}', NULL, 'SEGMENTACIÓN DE ZONAS', '2026-05-18', '17:32:09', '2026-05-18 21:32:09', '2026-05-18 21:32:09');

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
(20, '2026_05_18_084735_create_despacho_detalles_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `descuento` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` date NOT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci,
  `esado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDIENTE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalles`
--

CREATE TABLE `pedido_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `pedido_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `presentacion_producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `stock_actual` double NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 1, 1, 'zona 1', '#ee4949', '[{\"color\": \"#ee4949\", \"coordenadas\": [{\"lat\": \"-16.12577832514687\", \"lng\": \"-67.19754338264467\"}, {\"lat\": \"-16.125262989358294\", \"lng\": \"-67.1967923641205\"}, {\"lat\": \"-16.12590200553673\", \"lng\": \"-67.19606280326845\"}, {\"lat\": \"-16.12668531287989\", \"lng\": \"-67.1968996524811\"}]}]', '2026-05-18 21:15:38', '2026-05-18 21:15:38'),
(2, 1, 1, 1, 'zona 2', '#2ab760', '[{\"color\": \"#2ab760\", \"coordenadas\": [{\"lat\": \"-16.12647917966873\", \"lng\": \"-67.19490408897401\"}, {\"lat\": \"-16.127241871478976\", \"lng\": \"-67.19548344612123\"}, {\"lat\": \"-16.12757168324447\", \"lng\": \"-67.19458222389223\"}, {\"lat\": \"-16.12647917966873\", \"lng\": \"-67.19436764717103\"}]}]', '2026-05-18 21:32:09', '2026-05-18 21:32:09');

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
(1, 'admin', 'admin', '$2y$12$M2b1lEQrbaI17YIiht9xAuk2FCenB023wiuQVI63qmFsgogMzdXFe', NULL, 1, 0, 'ADMINISTRADOR', '2026-05-18', 1, '2026-05-18 13:31:09', '2026-05-18 13:31:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `vendedor_id` bigint UNSIGNED NOT NULL,
  `tipo_pago` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `descuento` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion_zonas`
--
ALTER TABLE `asignacion_zonas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignacion_zonas_segmentacion_zona_id_foreign` (`segmentacion_zona_id`),
  ADD KEY `asignacion_zonas_distribuidor_id_foreign` (`distribuidor_id`),
  ADD KEY `asignacion_zonas_vendedor_id_foreign` (`vendedor_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comisions`
--
ALTER TABLE `comisions`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `despacho_detalles`
--
ALTER TABLE `despacho_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `despacho_detalles_despacho_id_foreign` (`despacho_id`),
  ADD KEY `despacho_detalles_cliente_id_foreign` (`cliente_id`),
  ADD KEY `despacho_detalles_pedido_detalle_id_foreign` (`pedido_detalle_id`),
  ADD KEY `despacho_detalles_categoria_producto_id_foreign` (`categoria_producto_id`),
  ADD KEY `despacho_detalles_producto_id_foreign` (`producto_id`),
  ADD KEY `despacho_detalles_presentacion_producto_id_foreign` (`presentacion_producto_id`),
  ADD KEY `despacho_detalles_venta_id_foreign` (`venta_id`);

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
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `ventas_vendedor_id_foreign` (`vendedor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion_zonas`
--
ALTER TABLE `asignacion_zonas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_productos`
--
ALTER TABLE `categoria_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudads`
--
ALTER TABLE `ciudads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comisions`
--
ALTER TABLE `comisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consolidados`
--
ALTER TABLE `consolidados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `despachos`
--
ALTER TABLE `despachos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `despacho_detalles`
--
ALTER TABLE `despacho_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presentacion_productos`
--
ALTER TABLE `presentacion_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_zonas`
--
ALTER TABLE `asignacion_zonas`
  ADD CONSTRAINT `asignacion_zonas_distribuidor_id_foreign` FOREIGN KEY (`distribuidor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `asignacion_zonas_segmentacion_zona_id_foreign` FOREIGN KEY (`segmentacion_zona_id`) REFERENCES `segmentacion_zonas` (`id`),
  ADD CONSTRAINT `asignacion_zonas_vendedor_id_foreign` FOREIGN KEY (`vendedor_id`) REFERENCES `users` (`id`);

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
-- Filtros para la tabla `despacho_detalles`
--
ALTER TABLE `despacho_detalles`
  ADD CONSTRAINT `despacho_detalles_categoria_producto_id_foreign` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categoria_productos` (`id`),
  ADD CONSTRAINT `despacho_detalles_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `despacho_detalles_despacho_id_foreign` FOREIGN KEY (`despacho_id`) REFERENCES `despachos` (`id`),
  ADD CONSTRAINT `despacho_detalles_pedido_detalle_id_foreign` FOREIGN KEY (`pedido_detalle_id`) REFERENCES `pedido_detalles` (`id`),
  ADD CONSTRAINT `despacho_detalles_presentacion_producto_id_foreign` FOREIGN KEY (`presentacion_producto_id`) REFERENCES `presentacion_productos` (`id`),
  ADD CONSTRAINT `despacho_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `despacho_detalles_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD CONSTRAINT `historial_accions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ventas_vendedor_id_foreign` FOREIGN KEY (`vendedor_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
