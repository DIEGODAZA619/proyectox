-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2022 a las 03:17:35
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_proyectox`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_aplicaciones`
--

CREATE TABLE `ad_aplicaciones` (
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `abreviatura` varchar(20) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ad_aplicaciones`
--

INSERT INTO `ad_aplicaciones` (`codigo`, `descripcion`, `abreviatura`, `nombre`, `estado`) VALUES
(1, 'SISTEMAS DE VENTAS PARA RESTAURANT, EMPRESAS DE COMIDA', 'SVT', 'SISTEMAS DE VENTAS RESTAURANT', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_configuraciones_empresas`
--

CREATE TABLE `ad_configuraciones_empresas` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `valor1` varchar(100) NOT NULL,
  `valor2` varchar(100) NOT NULL,
  `valor3` varchar(100) NOT NULL,
  `valor4` varchar(100) NOT NULL,
  `valor5` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_control_acceso`
--

CREATE TABLE `ad_control_acceso` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `aplicacion` varchar(100) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ad_control_acceso`
--

INSERT INTO `ad_control_acceso` (`id`, `id_usuario`, `aplicacion`, `ip`, `fecha_registro`) VALUES
(1, 1, '1', '::1', '2022-10-09 21:07:21'),
(2, 1, '1', '::1', '2022-10-09 21:09:54'),
(3, 1, '1', '::1', '2022-10-09 21:20:55'),
(4, 1, '1', '::1', '2022-10-09 21:33:59'),
(5, 1, '1', '::1', '2022-10-09 21:35:24'),
(6, 1, '1', '::1', '2022-10-09 21:35:55'),
(7, 1, '1', '::1', '2022-10-09 21:36:55'),
(8, 1, '1', '::1', '2022-10-09 21:49:39'),
(9, 1, '1', '::1', '2022-10-09 21:51:07'),
(10, 1, '1', '::1', '2022-10-09 22:02:29'),
(11, 1, '1', '::1', '2022-10-09 22:04:35'),
(12, 1, '1', '::1', '2022-10-09 22:04:39'),
(13, 1, '1', '::1', '2022-10-09 22:07:22'),
(14, 1, '1', '::1', '2022-10-09 22:07:34'),
(15, 1, '1', '::1', '2022-10-09 22:07:35'),
(16, 1, '1', '::1', '2022-10-09 22:07:36'),
(17, 1, '1', '::1', '2022-10-09 22:07:36'),
(18, 1, '1', '::1', '2022-10-09 22:08:23'),
(19, 1, '1', '::1', '2022-10-29 00:37:49'),
(20, 1, '1', '::1', '2022-10-29 17:16:24'),
(21, 1, '1', '::1', '2022-10-29 17:53:55'),
(22, 1, '1', '::1', '2022-10-29 19:04:01'),
(23, 1, '1', '::1', '2022-10-30 08:40:05'),
(24, 1, '1', '::1', '2022-10-30 18:11:10'),
(25, 1, '1', '::1', '2022-10-31 20:01:12'),
(26, 1, '1', '::1', '2022-11-02 10:09:23'),
(27, 1, '1', '::1', '2022-11-02 14:17:43'),
(28, 1, '1', '::1', '2022-11-02 21:24:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_empresas`
--

CREATE TABLE `ad_empresas` (
  `codigo` int(11) NOT NULL,
  `denominacion` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `abreviatura` varchar(100) NOT NULL,
  `propietario` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `descripcion_entidad` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `logo` varchar(100) NOT NULL,
  `estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ad_empresas`
--

INSERT INTO `ad_empresas` (`codigo`, `denominacion`, `correo`, `abreviatura`, `propietario`, `telefono`, `direccion`, `descripcion_entidad`, `fecha`, `logo`, `estado`) VALUES
(1, 'LULUZ COMIDA CON AMOR', '', 'LULUZ', 'DAVID DURAN', '', '', '', '2022-10-09 20:53:06', 'logo_madi.jpg', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_logs`
--

CREATE TABLE `ad_logs` (
  `id` int(11) NOT NULL,
  `idad_usuario` int(11) DEFAULT NULL,
  `codad_accion` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_modulos`
--

CREATE TABLE `ad_modulos` (
  `codigo` int(11) NOT NULL,
  `codad_aplicacion` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `abreviatura` varchar(20) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `estado` varchar(250) NOT NULL DEFAULT 'AC'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ad_modulos`
--

INSERT INTO `ad_modulos` (`codigo`, `codad_aplicacion`, `descripcion`, `abreviatura`, `nombre`, `estado`) VALUES
(1, 1, 'INICIO', 'I', 'INICIO', 'AC'),
(2, 1, 'CONTROL DE PRODUCTOS', 'CP', 'CONTROL DE PRODUCTOS', 'AC'),
(3, 1, 'CONTROL DE INGRESOS INVENTARIO', 'CII', 'CONTROL DE INGRESOS INVENTARIO', 'AC'),
(4, 1, 'CONTROL DE VENTAS', 'CV', 'CONTROLDE VENTAS', 'AC'),
(5, 1, 'REPORTES', 'RPT', 'REPORTES', 'AC'),
(6, 1, 'CONTROL DE USUARIOS', 'CU', 'CONTROL DE USUARIOS', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_opciones`
--

CREATE TABLE `ad_opciones` (
  `codigo` int(11) NOT NULL,
  `codad_modulo` int(11) NOT NULL,
  `cod_aplicacion` int(11) NOT NULL,
  `codad_opcion` int(11) DEFAULT NULL,
  `opcion` varchar(20) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `link` varchar(250) NOT NULL,
  `nivel` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ad_opciones`
--

INSERT INTO `ad_opciones` (`codigo`, `codad_modulo`, `cod_aplicacion`, `codad_opcion`, `opcion`, `descripcion`, `link`, `nivel`, `orden`, `estado`) VALUES
(1, 1, 1, 1, 'INICIO', '', 'Inicio', 0, 1, 'AC'),
(2, 2, 1, 2, 'PRODUCTOS', '', '', 1, 0, 'AC'),
(3, 3, 1, 3, 'ALMACENES', '', '', 1, 0, 'AC'),
(4, 4, 1, 4, 'VENTAS', '', '', 1, 0, 'AC'),
(5, 5, 1, 5, 'REPORTES', '', '', 1, 0, 'AC'),
(6, 6, 1, 6, 'USUARIOS', '', '', 1, 0, 'AC'),
(7, 7, 1, 7, 'OTROS', '', '', 1, 1, 'AC'),
(8, 8, 1, 8, 'OTROS', '', '', 1, 1, 'AC'),
(9, 9, 1, 9, 'OTROS', '', '', 1, 1, 'AC'),
(10, 10, 1, 10, 'OTROS', '', '', 1, 1, 'AC'),
(11, 2, 1, 2, 'PRODUCTOS', '', 'Productos/Productos', 2, 1, 'AC'),
(12, 3, 1, 3, 'INGRESO ALMACEN', '', 'Ingresos/Ingresos', 2, 1, 'AC'),
(13, 4, 1, 4, 'REGISTRAR VENTAS', '', 'Ventas/Ventas', 2, 1, 'AC'),
(14, 5, 1, 5, 'REPORTES', '', 'Reportes/Reportes', 2, 1, 'AC'),
(15, 6, 1, 6, 'USUARIOS', '', 'Usuarios/Usuarios', 2, 1, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_opciones_usuarios`
--

CREATE TABLE `ad_opciones_usuarios` (
  `id` int(11) NOT NULL,
  `idad_usuario` int(11) DEFAULT NULL,
  `codad_opcion` int(11) DEFAULT NULL,
  `idad_logs` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'AC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ad_opciones_usuarios`
--

INSERT INTO `ad_opciones_usuarios` (`id`, `idad_usuario`, `codad_opcion`, `idad_logs`, `fecha_registro`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(2, 1, 2, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(3, 1, 3, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(4, 1, 4, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(5, 1, 5, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(6, 1, 6, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(7, 1, 11, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(8, 1, 12, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(9, 1, 13, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(10, 1, 14, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(11, 1, 15, NULL, '2022-10-09 21:06:20', NULL, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_usuarios`
--

CREATE TABLE `ad_usuarios` (
  `id` int(11) NOT NULL,
  `codad_aplicacion` int(11) DEFAULT NULL,
  `codad_empresa` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `primer_apellido` varchar(150) NOT NULL,
  `segundo_apellido` varchar(150) NOT NULL,
  `nro_documento` varchar(30) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `idad_logs` int(11) DEFAULT NULL,
  `direccion` varchar(250) NOT NULL,
  `tel_cel` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `cargo` varchar(250) NOT NULL,
  `login` varchar(50) NOT NULL,
  `clave` varchar(250) NOT NULL,
  `tipo_user` varchar(250) NOT NULL,
  `estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ad_usuarios`
--

INSERT INTO `ad_usuarios` (`id`, `codad_aplicacion`, `codad_empresa`, `nombres`, `primer_apellido`, `segundo_apellido`, `nro_documento`, `tipo_documento`, `idad_logs`, `direccion`, `tel_cel`, `fecha_nacimiento`, `correo`, `cargo`, `login`, `clave`, `tipo_user`, `estado`) VALUES
(1, 1, 1, 'ADMIN', 'MADI', '', '4567891013', 'NIT', NULL, 'AV. CHAYANTA', '', NULL, '', '', 'ADMINMADI.SUPER', '952c4c39d5460b647fa9f7f4cf36fb13', 'SUPER ADMINISTRADOR', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_acumulador_almacen`
--

CREATE TABLE `ve_acumulador_almacen` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) DEFAULT NULL,
  `idad_usuario` int(11) DEFAULT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `idve_proveedor` int(11) DEFAULT NULL,
  `idve_porcentaje` int(11) DEFAULT NULL,
  `entrada` int(11) DEFAULT NULL,
  `precio_compra` float DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `vencimiento` int(11) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_acumulador_venta`
--

CREATE TABLE `ve_acumulador_venta` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) DEFAULT NULL,
  `idad_usuario` int(11) DEFAULT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `idve_porcentaje` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_compra` float DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_castigar_stock`
--

CREATE TABLE `ve_castigar_stock` (
  `id` int(11) NOT NULL,
  `idve_almacen` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `respaldo` varchar(200) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_cataegorias`
--

CREATE TABLE `ve_cataegorias` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) NOT NULL,
  `descripcion_categoria` varchar(20) NOT NULL,
  `estado` varchar(5) NOT NULL DEFAULT 'AC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_cataegorias`
--

INSERT INTO `ve_cataegorias` (`id`, `codad_empresa`, `descripcion_categoria`, `estado`) VALUES
(1, 1, 'COMIDA', 'AC'),
(2, 1, 'BEBIDA', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_clientes`
--

CREATE TABLE `ve_clientes` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) DEFAULT NULL,
  `num_documento` varchar(200) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'AC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_clientes`
--

INSERT INTO `ve_clientes` (`id`, `codad_empresa`, `num_documento`, `nombres`, `telefono`, `direccion`, `email`, `estado`) VALUES
(1, 1, '6703132', 'DAZA', NULL, NULL, NULL, 'AC'),
(2, NULL, NULL, 'RAFAEL MENDEZ', NULL, NULL, NULL, 'AC'),
(3, NULL, NULL, 'RAFAEL MENDEZ', NULL, NULL, NULL, 'AC'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, 'AC'),
(5, NULL, NULL, 'RAFAEL MENDEZ', NULL, NULL, NULL, 'AC'),
(6, NULL, NULL, 'ALEJANDRA', NULL, NULL, NULL, 'AC'),
(7, NULL, NULL, 'OROS', NULL, NULL, NULL, 'AC'),
(8, NULL, NULL, 'LEYTON', NULL, NULL, NULL, 'AC'),
(9, NULL, NULL, 'OROS', NULL, NULL, NULL, 'AC'),
(10, NULL, NULL, 'OROS', NULL, NULL, NULL, 'AC'),
(11, NULL, NULL, 'RAFAEL MENDEZ', NULL, NULL, NULL, 'AC'),
(12, NULL, NULL, 'ALEJANDRA', NULL, NULL, NULL, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_ingresos`
--

CREATE TABLE `ve_ingresos` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `order_compra` varchar(100) DEFAULT NULL,
  `nro_factura` varchar(20) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `monto_total_factura` float DEFAULT 0,
  `id_provedor` int(11) DEFAULT NULL,
  `descripcion_ingreso` text DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `id_usuario_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `id_usuario_update` int(11) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'ELB',
  `activo` varchar(3) DEFAULT 'SI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_ingresos`
--

INSERT INTO `ve_ingresos` (`id`, `codad_empresa`, `gestion`, `order_compra`, `nro_factura`, `fecha_factura`, `monto_total_factura`, `id_provedor`, `descripcion_ingreso`, `fecha_ingreso`, `id_usuario_registro`, `fecha_registro`, `id_usuario_update`, `fecha_modificacion`, `estado`, `activo`) VALUES
(1, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:17:13', NULL, NULL, 'ELB', 'SI'),
(2, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:18:07', NULL, NULL, 'ELB', 'SI'),
(3, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:18:12', NULL, NULL, 'ELB', 'SI'),
(4, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:18:52', NULL, NULL, 'ELB', 'SI'),
(5, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:18:55', NULL, NULL, 'ELB', 'SI'),
(6, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:19:40', NULL, NULL, 'ELB', 'SI'),
(7, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:19:42', NULL, NULL, 'ELB', 'SI'),
(8, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:21:21', NULL, NULL, 'AC', 'SI'),
(9, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:26:40', NULL, NULL, 'AC', 'SI'),
(10, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:30:44', NULL, NULL, 'AC', 'SI'),
(11, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 10:33:46', NULL, NULL, 'AC', 'SI'),
(12, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 11:20:48', NULL, NULL, 'AC', 'SI'),
(13, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 11:22:43', NULL, NULL, 'AC', 'SI'),
(14, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 11:24:02', NULL, NULL, 'AC', 'SI'),
(15, 1, 2022, '', '', '0000-00-00', 0, 0, '', '2022-10-30', 1, '2022-10-30 11:41:59', NULL, NULL, 'AC', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_ingresos_detalle`
--

CREATE TABLE `ve_ingresos_detalle` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) NOT NULL,
  `id_ingreso` int(11) DEFAULT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `cantidad_ingreso` float DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `precio_venta` float NOT NULL,
  `precio_total` float DEFAULT NULL,
  `id_usuario_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `id_usuario_update` int(11) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'ELB',
  `activo` varchar(3) DEFAULT 'SI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_ingresos_detalle`
--

INSERT INTO `ve_ingresos_detalle` (`id`, `codad_empresa`, `id_ingreso`, `idve_producto`, `cantidad_ingreso`, `precio_unitario`, `precio_venta`, `precio_total`, `id_usuario_registro`, `fecha_registro`, `id_usuario_update`, `fecha_modificacion`, `estado`, `activo`) VALUES
(4, 0, 0, 1, 10, 10, 25, 100, 1, '2022-10-30 10:26:34', NULL, NULL, 'AC', 'SI'),
(5, 0, 0, 1, 5, 10, 25, 50, 1, '2022-10-30 10:29:26', NULL, NULL, 'AC', 'SI'),
(7, 0, 0, 3, 20, 2, 4, 40, 1, '2022-10-30 10:33:31', NULL, NULL, 'AC', 'SI'),
(8, 0, 0, 2, 20, 10, 25, 200, 1, '2022-10-30 11:16:08', NULL, NULL, 'AC', 'SI'),
(10, 0, 0, 5, 12, 4, 8, 48, 1, '2022-10-30 11:20:41', NULL, NULL, 'AC', 'SI'),
(11, 0, 0, 4, 12, 4, 8, 48, 1, '2022-10-30 11:21:12', NULL, NULL, 'AC', 'SI'),
(12, 0, 0, 1, 5, 10, 25, 50, 1, '2022-10-30 11:23:44', NULL, NULL, 'AC', 'SI'),
(13, 0, 0, 2, 10, 10, 25, 100, 1, '2022-10-30 11:24:15', 1, '2022-10-30 04:10:19', 'AN', 'SI'),
(14, 0, 0, 3, 25, 2, 4.5, 50, 1, '2022-10-30 11:32:58', 1, '2022-10-30 04:10:49', 'AC', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_inventarios`
--

CREATE TABLE `ve_inventarios` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) NOT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `id_ingreso` int(11) DEFAULT NULL,
  `id_ingreso_detalle` int(11) DEFAULT NULL,
  `id_salida` int(11) DEFAULT NULL,
  `id_salida_detalle` int(11) DEFAULT NULL,
  `tipo_proceso` text DEFAULT NULL,
  `tipo_ingreso_egreso` text DEFAULT NULL,
  `cantidad_entrada` int(11) DEFAULT NULL,
  `cantidad_salida` int(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  `precio_venta` float NOT NULL,
  `precio_total` decimal(8,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_inventario` int(11) DEFAULT NULL,
  `id_inventario_inicial_ingreso` int(11) DEFAULT NULL,
  `id_cliente_solicitante` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'AC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_inventarios`
--

INSERT INTO `ve_inventarios` (`id`, `codad_empresa`, `idve_producto`, `gestion`, `id_ingreso`, `id_ingreso_detalle`, `id_salida`, `id_salida_detalle`, `tipo_proceso`, `tipo_ingreso_egreso`, `cantidad_entrada`, `cantidad_salida`, `saldo`, `precio_unitario`, `precio_venta`, `precio_total`, `fecha`, `id_inventario`, `id_inventario_inicial_ingreso`, `id_cliente_solicitante`, `id_usuario`, `fecha_registro`, `fecha_modificacion`, `estado`) VALUES
(4, 1, 1, 2022, 9, 4, NULL, NULL, 'INGP', NULL, 10, 0, 10, '10.00', 25, '100.00', NULL, NULL, NULL, NULL, 1, '2022-10-30 10:26:40', NULL, 'AC'),
(5, 1, 1, 2022, 10, 5, NULL, NULL, 'INGP', NULL, 5, 0, 5, '10.00', 25, '50.00', NULL, NULL, NULL, NULL, 1, '2022-10-30 10:30:44', NULL, 'AC'),
(6, 1, 3, 2022, 11, 7, NULL, NULL, 'INGP', NULL, 20, 0, 20, '2.00', 4, '40.00', NULL, NULL, NULL, NULL, 1, '2022-10-30 10:33:46', NULL, 'AC'),
(7, 1, 2, 2022, 12, 8, NULL, NULL, 'INGP', NULL, 20, 0, 20, '10.00', 25, '200.00', NULL, NULL, NULL, NULL, 1, '2022-10-30 11:20:48', NULL, 'AC'),
(8, 1, 5, 2022, 12, 10, NULL, NULL, 'INGP', NULL, 12, 0, 12, '4.00', 8, '48.00', NULL, NULL, NULL, NULL, 1, '2022-10-30 11:20:48', NULL, 'AC'),
(9, 1, 4, 2022, 13, 11, NULL, NULL, 'INGP', NULL, 12, 0, 12, '4.00', 8, '48.00', NULL, NULL, NULL, NULL, 1, '2022-10-30 11:22:43', NULL, 'AC'),
(10, 1, 1, 2022, 14, 12, NULL, NULL, 'INGP', NULL, 5, 0, 5, '10.00', 25, '50.00', NULL, NULL, NULL, NULL, 1, '2022-10-30 11:24:02', NULL, 'AC'),
(11, 1, 3, 2022, 15, 14, NULL, NULL, 'INGP', NULL, 25, 0, 25, '2.00', 4.5, '50.00', NULL, NULL, NULL, NULL, 1, '2022-10-30 11:41:59', NULL, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_inventarios_resumen`
--

CREATE TABLE `ve_inventarios_resumen` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `cantidad_entrada` int(11) DEFAULT 0,
  `cantidad_salida` int(11) DEFAULT 0,
  `saldo` int(11) DEFAULT 0,
  `cantidad_solicitada` int(11) DEFAULT 0,
  `cantidad_disponible` int(11) DEFAULT 0,
  `precio_venta_unitario` decimal(8,2) DEFAULT 0.00,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'AC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_inventarios_resumen`
--

INSERT INTO `ve_inventarios_resumen` (`id`, `id_empresa`, `gestion`, `idve_producto`, `cantidad_entrada`, `cantidad_salida`, `saldo`, `cantidad_solicitada`, `cantidad_disponible`, `precio_venta_unitario`, `fecha_registro`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 2022, 1, 20, 0, 20, 4, 16, '25.00', '2022-10-29 18:11:00', '2022-10-30 00:10:46', 'AC'),
(2, 1, 2022, 2, 20, 0, 20, 0, 20, '25.00', '2022-10-29 18:11:32', '2022-10-30 00:11:16', 'AC'),
(3, 1, 2022, 3, 45, 0, 45, 5, 40, '4.50', '2022-10-29 18:11:32', '2022-10-30 00:11:16', 'AC'),
(4, 1, 2022, 4, 12, 0, 12, 0, 12, '8.00', '2022-10-29 18:11:46', '2022-10-30 00:11:34', 'AC'),
(5, 1, 2022, 5, 12, 0, 12, 2, 10, '8.00', '2022-10-29 18:11:46', '2022-10-30 00:11:34', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_linea_producto`
--

CREATE TABLE `ve_linea_producto` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) DEFAULT NULL,
  `nombre_liena` varchar(200) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'AC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_linea_producto`
--

INSERT INTO `ve_linea_producto` (`id`, `codad_empresa`, `nombre_liena`, `estado`) VALUES
(1, 1, 'PRODUCCIÓN PROPIA', 'AC'),
(2, 1, 'COCACOLA', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_productos`
--

CREATE TABLE `ve_productos` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) DEFAULT NULL,
  `idve_proveedor` int(11) DEFAULT NULL,
  `idve_linea` int(11) DEFAULT NULL,
  `categoria` int(11) NOT NULL,
  `valor1` varchar(200) DEFAULT NULL,
  `valor2` varchar(200) DEFAULT NULL,
  `composicion` varchar(200) DEFAULT NULL,
  `presentacion` varchar(200) DEFAULT NULL,
  `unidad` varchar(100) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_productos`
--

INSERT INTO `ve_productos` (`id`, `codad_empresa`, `idve_proveedor`, `idve_linea`, `categoria`, `valor1`, `valor2`, `composicion`, `presentacion`, `unidad`, `imagen`, `fecha_registro`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 1, 1, 'BROCHETAS DE POLLO', 'BROCHETAS DE POLLO', NULL, NULL, 'PLATO', NULL, '2022-10-29 18:04:42', '2022-10-30 00:03:07', NULL),
(2, 1, 1, 1, 1, 'LASAGNA DE CARNE', 'LASAGNA DE CARNE', NULL, NULL, 'PLATO', NULL, '2022-10-29 18:04:42', '2022-10-30 00:03:07', NULL),
(3, 1, 1, 1, 1, 'TUCUMANAS MIXTAS', 'TUCUMANAS MIXTAS', NULL, NULL, 'PIEZA', NULL, '2022-10-29 18:05:21', '2022-10-30 00:04:48', NULL),
(4, 1, 2, 2, 2, 'FANTA', 'FANTA', NULL, NULL, 'BOTELLA', NULL, '2022-10-29 18:06:50', '2022-10-30 00:05:57', NULL),
(5, 1, 2, 2, 2, 'COCA COLA 1 LITRO', 'COCA COLA 1 LITRO', NULL, NULL, 'BOTELLA', NULL, '2022-10-29 18:06:50', '2022-10-30 00:05:57', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_proveedores`
--

CREATE TABLE `ve_proveedores` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) DEFAULT NULL,
  `idve_linea` int(11) DEFAULT NULL,
  `nombre_proveedor` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'AC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_proveedores`
--

INSERT INTO `ve_proveedores` (`id`, `codad_empresa`, `idve_linea`, `nombre_proveedor`, `telefono`, `direccion`, `estado`) VALUES
(1, 1, 1, 'PRODUCCIÓN PROPIA', NULL, NULL, 'AC'),
(2, 1, 2, 'COCA COLA', NULL, NULL, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_solicitudes_reserva`
--

CREATE TABLE `ve_solicitudes_reserva` (
  `id` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_confirmacion_venta` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `cantidad_solicitada` int(11) DEFAULT NULL,
  `cantidad_autorizada` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  `precio_total` decimal(8,2) DEFAULT NULL,
  `tipo_solicitud` varchar(3) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'PEN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_ventas`
--

CREATE TABLE `ve_ventas` (
  `id` int(11) NOT NULL,
  `codad_empresa` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `correlativo` int(11) DEFAULT NULL,
  `correlativo_dia` int(11) DEFAULT NULL,
  `codigo_pedido` text DEFAULT NULL,
  `precio_total` decimal(8,2) DEFAULT NULL,
  `tipo_venta` varchar(3) DEFAULT NULL,
  `id_usuario_solicitante` int(11) DEFAULT NULL,
  `id_cliente_solicitante` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_entrega` datetime DEFAULT NULL,
  `fecha_autorizacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'PEN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_ventas`
--

INSERT INTO `ve_ventas` (`id`, `codad_empresa`, `gestion`, `correlativo`, `correlativo_dia`, `codigo_pedido`, `precio_total`, `tipo_venta`, `id_usuario_solicitante`, `id_cliente_solicitante`, `fecha_registro`, `fecha_entrega`, `fecha_autorizacion`, `fecha_modificacion`, `estado`) VALUES
(10, 1, 2022, NULL, 1, NULL, '50.00', 'NOR', 1, 10, '2022-11-02 21:33:27', NULL, NULL, NULL, 'PEN'),
(11, 1, 2022, NULL, 2, NULL, '30.50', 'NOR', 1, 11, '2022-11-02 21:36:05', NULL, NULL, NULL, 'PEN'),
(12, 1, 2022, NULL, 3, NULL, '58.00', 'NOR', 1, 12, '2022-11-02 22:00:02', NULL, NULL, NULL, 'PEN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_venta_detalles`
--

CREATE TABLE `ve_venta_detalles` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `idve_ventas` int(11) DEFAULT 0,
  `idve_producto` int(11) DEFAULT NULL,
  `cantidad_solicitada` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  `precio_total` decimal(8,2) DEFAULT NULL,
  `tipo_solicitud` varchar(3) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'IN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_venta_detalles`
--

INSERT INTO `ve_venta_detalles` (`id`, `id_empresa`, `gestion`, `idve_ventas`, `idve_producto`, `cantidad_solicitada`, `precio_unitario`, `precio_total`, `tipo_solicitud`, `id_usuario`, `fecha_registro`, `fecha_modificacion`, `estado`) VALUES
(13, 1, 2022, 10, 1, 2, '25.00', '50.00', 'NOR', 1, '2022-11-02 21:33:21', NULL, 'PEN'),
(14, 1, 2022, 11, 3, 5, '4.50', '22.50', 'NOR', 1, '2022-11-02 21:35:17', NULL, 'PEN'),
(15, 1, 2022, 11, 5, 1, '8.00', '8.00', 'NOR', 1, '2022-11-02 21:35:49', NULL, 'PEN'),
(16, 1, 2022, 12, 1, 2, '25.00', '50.00', 'NOR', 1, '2022-11-02 21:57:34', NULL, 'PEN'),
(17, 1, 2022, 12, 5, 1, '8.00', '8.00', 'NOR', 1, '2022-11-02 21:59:45', NULL, 'PEN');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ad_aplicaciones`
--
ALTER TABLE `ad_aplicaciones`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ad_configuraciones_empresas`
--
ALTER TABLE `ad_configuraciones_empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ad_control_acceso`
--
ALTER TABLE `ad_control_acceso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ad_empresas`
--
ALTER TABLE `ad_empresas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ad_logs`
--
ALTER TABLE `ad_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ad_modulos`
--
ALTER TABLE `ad_modulos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ad_opciones`
--
ALTER TABLE `ad_opciones`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ad_opciones_usuarios`
--
ALTER TABLE `ad_opciones_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ad_usuarios`
--
ALTER TABLE `ad_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_acumulador_almacen`
--
ALTER TABLE `ve_acumulador_almacen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_acumulador_venta`
--
ALTER TABLE `ve_acumulador_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_castigar_stock`
--
ALTER TABLE `ve_castigar_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_cataegorias`
--
ALTER TABLE `ve_cataegorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_clientes`
--
ALTER TABLE `ve_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_ingresos`
--
ALTER TABLE `ve_ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_ingresos_detalle`
--
ALTER TABLE `ve_ingresos_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_inventarios`
--
ALTER TABLE `ve_inventarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_inventarios_resumen`
--
ALTER TABLE `ve_inventarios_resumen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idve_producto` (`idve_producto`);

--
-- Indices de la tabla `ve_linea_producto`
--
ALTER TABLE `ve_linea_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_productos`
--
ALTER TABLE `ve_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_proveedores`
--
ALTER TABLE `ve_proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_solicitudes_reserva`
--
ALTER TABLE `ve_solicitudes_reserva`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_ventas`
--
ALTER TABLE `ve_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ve_venta_detalles`
--
ALTER TABLE `ve_venta_detalles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ad_aplicaciones`
--
ALTER TABLE `ad_aplicaciones`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ad_configuraciones_empresas`
--
ALTER TABLE `ad_configuraciones_empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ad_control_acceso`
--
ALTER TABLE `ad_control_acceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `ad_empresas`
--
ALTER TABLE `ad_empresas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ad_logs`
--
ALTER TABLE `ad_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ad_modulos`
--
ALTER TABLE `ad_modulos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ad_opciones`
--
ALTER TABLE `ad_opciones`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ad_opciones_usuarios`
--
ALTER TABLE `ad_opciones_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ad_usuarios`
--
ALTER TABLE `ad_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ve_acumulador_almacen`
--
ALTER TABLE `ve_acumulador_almacen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ve_acumulador_venta`
--
ALTER TABLE `ve_acumulador_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ve_castigar_stock`
--
ALTER TABLE `ve_castigar_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ve_cataegorias`
--
ALTER TABLE `ve_cataegorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ve_clientes`
--
ALTER TABLE `ve_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ve_ingresos`
--
ALTER TABLE `ve_ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ve_ingresos_detalle`
--
ALTER TABLE `ve_ingresos_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ve_inventarios`
--
ALTER TABLE `ve_inventarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ve_inventarios_resumen`
--
ALTER TABLE `ve_inventarios_resumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ve_linea_producto`
--
ALTER TABLE `ve_linea_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ve_productos`
--
ALTER TABLE `ve_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ve_proveedores`
--
ALTER TABLE `ve_proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ve_solicitudes_reserva`
--
ALTER TABLE `ve_solicitudes_reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ve_ventas`
--
ALTER TABLE `ve_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ve_venta_detalles`
--
ALTER TABLE `ve_venta_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
