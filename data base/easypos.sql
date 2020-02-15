-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2020 a las 05:36:54
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `easypos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id_almacen` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id_almacen`, `nombre`, `ubicacion`, `estado`) VALUES
(3, 'Matriz', 'hermosillo sonora', 1),
(4, 'Almacen prueba', 'aguaprieta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartado`
--

CREATE TABLE `apartado` (
  `id_apartado` int(11) NOT NULL,
  `productos` varchar(500) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_almacen` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha_realizacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_limite` timestamp NOT NULL DEFAULT current_timestamp(),
  `comentario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `apartado`
--

INSERT INTO `apartado` (`id_apartado`, `productos`, `id_cliente`, `id_almacen`, `cantidad`, `total`, `fecha_realizacion`, `fecha_limite`, `comentario`) VALUES
(25, '[{\"id\":\"1\",\"descripcion\":\"Bota cocodrilo\",\"cantidad\":\"3\",\"existencia\":\"43\",\"precio\":\"1050\",\"total\":\"3150\"}]', 17, 3, 3, 3150, '2020-01-24 04:35:01', '2020-01-28 07:00:00', 'jjjjjjjkjkjk');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `RFC` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `compras` int(11) NOT NULL,
  `ultima_compra` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `direccion`, `RFC`, `ciudad`, `email`, `telefono`, `compras`, `ultima_compra`) VALUES
(0, 'Publico en general', 'NA', 'NA', 'NA', 'NA', 'usuario@hotmail.com', '(000) 000-0000', 34, '2020-01-23 21:22:30'),
(17, 'Angel', 'Guardado', 'Calle 34 y 35 Av. 3 y 4, Casa', 'sfsdfsdf', 'Agua Prieta', 'angel@gmail.com', '(555) 555-5555', 3, '2020-01-23 21:15:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `pu` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_producto` int(11) NOT NULL,
  `id_almacen` int(11) NOT NULL,
  `existencia` int(11) NOT NULL,
  `venta` int(11) NOT NULL,
  `apartado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_producto`, `id_almacen`, `existencia`, `venta`, `apartado`) VALUES
(1, 3, 43, 9, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario`
--

CREATE TABLE `movimientos_inventario` (
  `id_movimiento` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_almacen` int(11) NOT NULL,
  `tipo_movimiento` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `descripción` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimientos_inventario`
--

INSERT INTO `movimientos_inventario` (`id_movimiento`, `id_producto`, `id_almacen`, `tipo_movimiento`, `cantidad`, `id_usuario`, `descripción`, `hora`, `fecha`) VALUES
(1, 1, 3, 'Entrada', 50, 25, 'Compra', '21:09:48', '2020-01-23'),
(2, 1, 3, 'Salida', 2, 25, 'Venta', '21:14:52', '2020-01-23'),
(3, 1, 3, 'Salida', 1, 25, 'Venta', '21:15:21', '2020-01-23'),
(4, 1, 3, 'Salida', 1, 25, 'Venta', '21:15:59', '2020-01-23'),
(5, 1, 3, 'Salida', 1, 25, 'Venta', '21:16:11', '2020-01-23'),
(6, 1, 3, 'Salida', 1, 25, 'Venta', '21:16:20', '2020-01-23'),
(7, 1, 3, 'Salida', 1, 25, 'Venta', '21:19:06', '2020-01-23'),
(8, 1, 3, 'Salida', 1, 25, 'Venta', '21:19:46', '2020-01-23'),
(9, 1, 3, 'Salida', 1, 25, 'Venta', '21:22:30', '2020-01-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prod-cat`
--

CREATE TABLE `prod-cat` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `codigo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `imagen` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `codigo`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `id_proveedor`, `imagen`, `marca`) VALUES
(1, '6666', 'Bota cocodrilo', 'bota con piel de cocodrilo', 700, 1050, NULL, 'vistas/img/productos/Bota cocodrilo/162.jpg', 'Mi rancho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `RFC` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `ejecutivo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `almacen` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `almacen`, `estado`, `ultimo_login`, `fecha`) VALUES
(25, 'Demo', 'demo', 'admin123', 'Gerente General', 'vistas/img/usuarios/default/anonymous.png', 3, 1, '2020-01-23 21:30:46', '2020-01-24 04:30:46'),
(32, 'Angel Antonio Guardado Ramos', 'angel', 'admin123', 'Administrador', 'vistas/img/usuarios/default/anonymous.png', 3, 1, '2020-01-23 21:30:05', '2020-01-24 04:30:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `subtotal` float NOT NULL,
  `total` float NOT NULL,
  `iva` float NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `metodo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `id_almacen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `id_cliente`, `id_usuario`, `codigo`, `fecha`, `hora`, `subtotal`, `total`, `iva`, `productos`, `metodo_pago`, `status`, `id_almacen`) VALUES
(1, 0, '25', 10001, '2020-01-23', '21:22:30', 1050, 1050, 1050, '[{\"id\":\"1\",\"descripcion\":\"Bota cocodrilo\",\"cantidad\":\"1\",\"existencia\":\"46\",\"precio\":\"1050\",\"total\":\"1050\"}]', 'Efectivo', 'Activa', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id_almacen`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `prod-cat`
--
ALTER TABLE `prod-cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `idCliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id_almacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `prod-cat`
--
ALTER TABLE `prod-cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
