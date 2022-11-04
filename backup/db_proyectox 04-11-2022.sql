-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-11-2022 a las 21:52:16
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.9

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

DROP TABLE IF EXISTS `ad_aplicaciones`;
CREATE TABLE IF NOT EXISTS `ad_aplicaciones` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) NOT NULL,
  `abreviatura` varchar(20) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `estado` varchar(250) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ad_aplicaciones`
--

INSERT INTO `ad_aplicaciones` (`codigo`, `descripcion`, `abreviatura`, `nombre`, `estado`) VALUES
(1, 'SISTEMAS DE VENTAS PARA RESTAURANT, EMPRESAS DE COMIDA', 'SVT', 'SISTEMAS DE VENTAS RESTAURANT', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_configuraciones_empresas`
--

DROP TABLE IF EXISTS `ad_configuraciones_empresas`;
CREATE TABLE IF NOT EXISTS `ad_configuraciones_empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `valor1` varchar(100) NOT NULL,
  `valor2` varchar(100) NOT NULL,
  `valor3` varchar(100) NOT NULL,
  `valor4` varchar(100) NOT NULL,
  `valor5` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_control_acceso`
--

DROP TABLE IF EXISTS `ad_control_acceso`;
CREATE TABLE IF NOT EXISTS `ad_control_acceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `aplicacion` varchar(100) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

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
(28, 1, '1', '::1', '2022-11-02 21:24:52'),
(29, 1, '1', '::1', '2022-11-04 11:00:30'),
(30, 10, '1', '::1', '2022-11-04 17:28:35'),
(31, 10, '1', '::1', '2022-11-04 17:30:24'),
(32, 10, '1', '::1', '2022-11-04 17:32:23'),
(33, 11, '1', '::1', '2022-11-04 17:36:27'),
(34, 10, '1', '::1', '2022-11-04 17:37:05'),
(35, 1, '1', '::1', '2022-11-04 17:37:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_empresas`
--

DROP TABLE IF EXISTS `ad_empresas`;
CREATE TABLE IF NOT EXISTS `ad_empresas` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `denominacion` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `abreviatura` varchar(100) NOT NULL,
  `propietario` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `descripcion_entidad` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `logo` varchar(100) NOT NULL,
  `estado` varchar(250) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ad_empresas`
--

INSERT INTO `ad_empresas` (`codigo`, `denominacion`, `correo`, `abreviatura`, `propietario`, `telefono`, `direccion`, `descripcion_entidad`, `fecha`, `logo`, `estado`) VALUES
(1, 'LULUZ COMIDA CON AMOR', '', 'LULUZ', 'DAVID DURAN', '', '', '', '2022-10-09 20:53:06', 'logo_madi.jpg', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_logs`
--

DROP TABLE IF EXISTS `ad_logs`;
CREATE TABLE IF NOT EXISTS `ad_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idad_usuario` int(11) DEFAULT NULL,
  `codad_accion` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_modulos`
--

DROP TABLE IF EXISTS `ad_modulos`;
CREATE TABLE IF NOT EXISTS `ad_modulos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codad_aplicacion` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `abreviatura` varchar(20) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `estado` varchar(250) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `ad_opciones`;
CREATE TABLE IF NOT EXISTS `ad_opciones` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codad_modulo` int(11) NOT NULL,
  `cod_aplicacion` int(11) NOT NULL,
  `codad_opcion` int(11) DEFAULT NULL,
  `opcion` varchar(20) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `link` varchar(250) NOT NULL,
  `nivel` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `estado` varchar(250) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `ad_opciones_usuarios`;
CREATE TABLE IF NOT EXISTS `ad_opciones_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idad_usuario` int(11) DEFAULT NULL,
  `codad_opcion` int(11) DEFAULT NULL,
  `idad_logs` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'AC',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

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
(11, 1, 15, NULL, '2022-10-09 21:06:20', NULL, 'AC'),
(12, 10, 1, NULL, '2022-11-04 17:30:11', NULL, 'AC'),
(13, 10, 2, NULL, '2022-11-04 17:30:11', NULL, 'AC'),
(14, 10, 3, NULL, '2022-11-04 17:30:11', NULL, 'AC'),
(15, 10, 4, NULL, '2022-11-04 17:30:11', NULL, 'AC'),
(16, 10, 6, NULL, '2022-11-04 17:30:11', NULL, 'AN'),
(17, 10, 11, NULL, '2022-11-04 17:30:11', NULL, 'AC'),
(18, 10, 12, NULL, '2022-11-04 17:30:11', NULL, 'AC'),
(19, 10, 13, NULL, '2022-11-04 17:30:11', NULL, 'AC'),
(20, 10, 14, NULL, '2022-11-04 17:30:11', NULL, 'AC'),
(21, 11, 1, NULL, '2022-11-04 17:30:17', NULL, 'AC'),
(22, 11, 2, NULL, '2022-11-04 17:30:17', NULL, 'AC'),
(23, 11, 3, NULL, '2022-11-04 17:30:17', NULL, 'AC'),
(24, 11, 4, NULL, '2022-11-04 17:30:17', NULL, 'AC'),
(25, 11, 6, NULL, '2022-11-04 17:30:17', NULL, 'AN'),
(26, 11, 11, NULL, '2022-11-04 17:30:17', NULL, 'AC'),
(27, 11, 12, NULL, '2022-11-04 17:30:17', NULL, 'AC'),
(28, 11, 13, NULL, '2022-11-04 17:30:17', NULL, 'AC'),
(29, 11, 14, NULL, '2022-11-04 17:30:17', NULL, 'AC'),
(30, 10, 5, NULL, '2022-11-04 17:31:11', NULL, 'AC'),
(31, 11, 5, NULL, '2022-11-04 17:31:17', NULL, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_usuarios`
--

DROP TABLE IF EXISTS `ad_usuarios`;
CREATE TABLE IF NOT EXISTS `ad_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `estado` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ad_usuarios`
--

INSERT INTO `ad_usuarios` (`id`, `codad_aplicacion`, `codad_empresa`, `nombres`, `primer_apellido`, `segundo_apellido`, `nro_documento`, `tipo_documento`, `idad_logs`, `direccion`, `tel_cel`, `fecha_nacimiento`, `correo`, `cargo`, `login`, `clave`, `tipo_user`, `estado`) VALUES
(1, 1, 1, 'ADMIN', 'MADI', '', '4567891013', 'NIT', NULL, 'AV. CHAYANTA', '', NULL, '', '', 'ADMINMADI.SUPER', '952c4c39d5460b647fa9f7f4cf36fb13', 'SUPER ADMINISTRADOR', 'AC'),
(10, 1, 1, 'LUIS DAVID', 'DURAN', 'ARANCIBIA', '6660131', 'CI', NULL, '', '', NULL, '', 'ADMINISTRADOR', 'DAVIDDURAN.ADM', '3be09cbaa12cce5e39db474e168a6f48', 'ADMINISTRADOR', 'AC'),
(11, 1, 1, 'LETICIA DORIS', 'DAZA', 'ALCARAZ', '6651949', 'CI', NULL, '', '', NULL, '', '', 'LETICIADAZA.ADM', '3af8c06cb6bba46ee30045cce84c5985', 'ADMINISTRADOR', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_acumulador_almacen`
--

DROP TABLE IF EXISTS `ve_acumulador_almacen`;
CREATE TABLE IF NOT EXISTS `ve_acumulador_almacen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_acumulador_venta`
--

DROP TABLE IF EXISTS `ve_acumulador_venta`;
CREATE TABLE IF NOT EXISTS `ve_acumulador_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) DEFAULT NULL,
  `idad_usuario` int(11) DEFAULT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `idve_porcentaje` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_compra` float DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_castigar_stock`
--

DROP TABLE IF EXISTS `ve_castigar_stock`;
CREATE TABLE IF NOT EXISTS `ve_castigar_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idve_almacen` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `respaldo` varchar(200) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_cataegorias`
--

DROP TABLE IF EXISTS `ve_cataegorias`;
CREATE TABLE IF NOT EXISTS `ve_cataegorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) NOT NULL,
  `descripcion_categoria` varchar(20) NOT NULL,
  `estado` varchar(5) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `ve_clientes`;
CREATE TABLE IF NOT EXISTS `ve_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) DEFAULT NULL,
  `num_documento` varchar(200) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'AC',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_ingresos`
--

DROP TABLE IF EXISTS `ve_ingresos`;
CREATE TABLE IF NOT EXISTS `ve_ingresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `order_compra` varchar(100) DEFAULT NULL,
  `nro_factura` varchar(20) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `monto_total_factura` float DEFAULT '0',
  `id_provedor` int(11) DEFAULT NULL,
  `descripcion_ingreso` text,
  `fecha_ingreso` date DEFAULT NULL,
  `id_usuario_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_update` int(11) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'ELB',
  `activo` varchar(3) DEFAULT 'SI',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_ingresos_detalle`
--

DROP TABLE IF EXISTS `ve_ingresos_detalle`;
CREATE TABLE IF NOT EXISTS `ve_ingresos_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) NOT NULL,
  `id_ingreso` int(11) DEFAULT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `cantidad_ingreso` float DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `precio_venta` float NOT NULL,
  `precio_total` float DEFAULT NULL,
  `id_usuario_registro` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_update` int(11) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'ELB',
  `activo` varchar(3) DEFAULT 'SI',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_inventarios`
--

DROP TABLE IF EXISTS `ve_inventarios`;
CREATE TABLE IF NOT EXISTS `ve_inventarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) NOT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `id_ingreso` int(11) DEFAULT NULL,
  `id_ingreso_detalle` int(11) DEFAULT NULL,
  `id_salida` int(11) DEFAULT NULL,
  `id_salida_detalle` int(11) DEFAULT NULL,
  `tipo_proceso` text,
  `tipo_ingreso_egreso` text,
  `cantidad_entrada` int(11) DEFAULT NULL,
  `cantidad_salida` int(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `precio_total` decimal(8,2) DEFAULT NULL,
  `precio_venta_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha` date DEFAULT NULL,
  `id_inventario` int(11) DEFAULT NULL,
  `id_inventario_inicial_ingreso` int(11) DEFAULT NULL,
  `id_cliente_solicitante` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'AC',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_inventarios_resumen`
--

DROP TABLE IF EXISTS `ve_inventarios_resumen`;
CREATE TABLE IF NOT EXISTS `ve_inventarios_resumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `idve_producto` int(11) DEFAULT NULL,
  `cantidad_entrada` int(11) DEFAULT '0',
  `cantidad_salida` int(11) DEFAULT '0',
  `saldo` int(11) DEFAULT '0',
  `cantidad_solicitada` int(11) DEFAULT '0',
  `cantidad_disponible` int(11) DEFAULT '0',
  `precio_venta_unitario` decimal(8,2) DEFAULT '0.00',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'AC',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idve_producto` (`idve_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_inventarios_resumen`
--

INSERT INTO `ve_inventarios_resumen` (`id`, `id_empresa`, `gestion`, `idve_producto`, `cantidad_entrada`, `cantidad_salida`, `saldo`, `cantidad_solicitada`, `cantidad_disponible`, `precio_venta_unitario`, `fecha_registro`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 2022, 1, 0, 0, 0, 0, 0, '0.00', '2022-10-29 18:11:00', '2022-10-30 00:10:46', 'AC'),
(2, 1, 2022, 2, 0, 0, 0, 0, 0, '0.00', '2022-10-29 18:11:32', '2022-10-30 00:11:16', 'AC'),
(3, 1, 2022, 3, 0, 0, 0, 0, 0, '0.00', '2022-10-29 18:11:32', '2022-10-30 00:11:16', 'AC'),
(4, 1, 2022, 4, 0, 0, 0, 0, 0, '0.00', '2022-10-29 18:11:46', '2022-10-30 00:11:34', 'AC'),
(5, 1, 2022, 5, 0, 0, 0, 0, 0, '0.00', '2022-10-29 18:11:46', '2022-10-30 00:11:34', 'AC'),
(6, 1, 2022, 6, 0, 0, 0, 0, 0, '0.00', '2022-11-04 17:49:27', NULL, 'AC'),
(7, 1, 2022, 7, 0, 0, 0, 0, 0, '0.00', '2022-11-04 17:49:27', NULL, 'AC'),
(8, 1, 2022, 8, 0, 0, 0, 0, 0, '0.00', '2022-11-04 17:49:27', NULL, 'AC'),
(9, 1, 2022, 9, 0, 0, 0, 0, 0, '0.00', '2022-11-04 17:49:27', NULL, 'AC'),
(10, 1, 2022, 10, 0, 0, 0, 0, 0, '0.00', '2022-11-04 17:49:27', NULL, 'AC'),
(11, 1, 2022, 11, 0, 0, 0, 0, 0, '0.00', '2022-11-04 17:49:27', NULL, 'AC'),
(12, 1, 2022, 12, 0, 0, 0, 0, 0, '0.00', '2022-11-04 17:49:27', NULL, 'AC'),
(13, 1, 2022, 13, 0, 0, 0, 0, 0, '0.00', '2022-11-04 17:49:27', NULL, 'AC'),
(14, 1, 2022, 14, 0, 0, 0, 0, 0, '0.00', '2022-11-04 17:49:27', NULL, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_linea_producto`
--

DROP TABLE IF EXISTS `ve_linea_producto`;
CREATE TABLE IF NOT EXISTS `ve_linea_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) DEFAULT NULL,
  `nombre_liena` varchar(200) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'AC',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `ve_productos`;
CREATE TABLE IF NOT EXISTS `ve_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'AC',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ve_productos`
--

INSERT INTO `ve_productos` (`id`, `codad_empresa`, `idve_proveedor`, `idve_linea`, `categoria`, `valor1`, `valor2`, `composicion`, `presentacion`, `unidad`, `imagen`, `fecha_registro`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 1, 1, 'BROCHETAS DE POLLO', 'BROCHETAS DE POLLO', NULL, NULL, 'PLATO', NULL, '2022-10-29 18:04:42', '2022-10-30 00:03:07', 'AC'),
(2, 1, 1, 1, 1, 'LASAGNA DE CARNE', 'LASAGNA DE CARNE', NULL, NULL, 'PLATO', NULL, '2022-10-29 18:04:42', '2022-10-30 00:03:07', 'AC'),
(3, 1, 1, 1, 1, 'TUCUMANAS MIXTAS', 'TUCUMANAS MIXTAS', NULL, NULL, 'PIEZA', NULL, '2022-10-29 18:05:21', '2022-10-30 00:04:48', 'AC'),
(4, 1, 2, 2, 2, 'FANTA 2 LITROS', 'FANTA 2 LITROS', NULL, NULL, 'BOTELLA', NULL, '2022-10-29 18:06:50', '2022-10-30 00:05:57', 'AC'),
(5, 1, 2, 2, 2, 'COCA COLA 1 LITRO', 'COCA COLA 1 LITRO', NULL, NULL, 'BOTELLA', NULL, '2022-10-29 18:06:50', '2022-10-30 00:05:57', 'AC'),
(6, 1, 2, 2, 2, 'COCA COLA DE 2 LITROS', NULL, NULL, NULL, 'BOTELLA', NULL, '2022-11-04 17:42:24', NULL, 'AC'),
(7, 1, 2, 2, 2, 'COCA COLA 500 ML', NULL, NULL, NULL, 'BOTELLA', NULL, '2022-11-04 17:42:24', NULL, 'AC'),
(8, 1, 2, 2, 2, 'FANTA 500 ML', 'FANTA 500 ML', NULL, NULL, 'BOTELLA', NULL, '2022-11-04 17:44:14', NULL, 'AC'),
(9, 1, 2, 2, 2, 'AGUA VITAL 350 ML', 'AGUA VITAL 350 ML', NULL, NULL, 'BOTELLA', NULL, '2022-11-04 17:44:14', NULL, 'AC'),
(10, 1, 2, 2, 2, 'AGUA VITAL 990 ML', 'AGUA VITAL 990 ML', NULL, NULL, 'BOTELLA', NULL, '2022-11-04 17:45:18', NULL, 'AC'),
(11, 1, 2, 2, 2, 'DEL VALLE MANZANA 2 L', 'DEL VALLE MANZANA 2 L', NULL, NULL, 'BOTELLA', NULL, '2022-11-04 17:45:18', NULL, 'AC'),
(12, 1, 2, 2, 2, 'DEL VALLE MANZANA 300 ML', 'DEL VALLE MANZANA 300 ML', NULL, NULL, 'BOTELLA', NULL, '2022-11-04 17:46:04', NULL, 'AC'),
(13, 1, 2, 2, 2, 'DEL VALLE DURAZNO 2L', 'DEL VALLE DURAZNO 2L', NULL, NULL, 'BOTELLA', NULL, '2022-11-04 17:46:04', NULL, 'AC'),
(14, 1, 2, 2, 2, 'DEL VALLE DURAZNO 300 ML', 'DEL VALLE DURAZNO 300 ML', NULL, NULL, 'BOTELLA', NULL, '2022-11-04 17:46:33', NULL, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_proveedores`
--

DROP TABLE IF EXISTS `ve_proveedores`;
CREATE TABLE IF NOT EXISTS `ve_proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) DEFAULT NULL,
  `idve_linea` int(11) DEFAULT NULL,
  `nombre_proveedor` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'AC',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `ve_solicitudes_reserva`;
CREATE TABLE IF NOT EXISTS `ve_solicitudes_reserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'PEN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_ventas`
--

DROP TABLE IF EXISTS `ve_ventas`;
CREATE TABLE IF NOT EXISTS `ve_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codad_empresa` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `correlativo` int(11) DEFAULT NULL,
  `correlativo_dia` int(11) DEFAULT NULL,
  `codigo_pedido` text,
  `precio_total` decimal(8,2) DEFAULT NULL,
  `tipo_venta` varchar(3) DEFAULT NULL,
  `id_usuario_solicitante` int(11) DEFAULT NULL,
  `id_cliente_solicitante` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_entrega` datetime DEFAULT NULL,
  `fecha_autorizacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'PEN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_venta_detalles`
--

DROP TABLE IF EXISTS `ve_venta_detalles`;
CREATE TABLE IF NOT EXISTS `ve_venta_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `gestion` int(11) DEFAULT NULL,
  `idve_ventas` int(11) DEFAULT '0',
  `idve_producto` int(11) DEFAULT NULL,
  `cantidad_solicitada` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  `precio_total` decimal(8,2) DEFAULT NULL,
  `tipo_solicitud` varchar(3) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(3) DEFAULT 'IN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
