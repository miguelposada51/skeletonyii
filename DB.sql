-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-01-2017 a las 21:12:14
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '2', NULL),
('create-carros', '2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'admin can do everything with cars', NULL, NULL, NULL, NULL),
('create-carros', 1, 'crear carro en el sistema', NULL, NULL, NULL, NULL),
('update-carros', 1, 'update car values', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'create-carros'),
('admin', 'update-carros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carros`
--

CREATE TABLE `carros` (
  `id` int(11) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `serie` varchar(30) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carros`
--

INSERT INTO `carros` (`id`, `modelo`, `serie`, `placa`, `color`, `id_empresa`) VALUES
(1, '2001', 'soul', 'ngh78', 'negro', 1),
(2, '2005', 'corsa', 'een33', 'rojo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `nit` varchar(40) NOT NULL,
  `pais` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre`, `nit`, `pais`) VALUES
(1, 'kia', '232443554-7', 'korea'),
(2, 'chevrolet', '98897879-0', 'japon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `name`, `parent`, `route`, `order`, `data`) VALUES
(1, 'Reportes', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1484624973),
('m140602_111327_create_menu_table', 1484624985),
('m160312_050000_create_user', 1484624986);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'miguel', '-Amo7nsBdlysgr3jbMe1CMinQUjrcDae', '$2y$13$GLMZrJlmwgGlD2KdP8Zswu2a/IiQx.CiFCgBQw8ZY9u0CgSLUqD3m', NULL, 'miguel@yiitest.com', 10, 1484625299, 1484625299),
(2, 'luciana', '43-WOTe1er3QpkVRTNwZ6AgbsR_G6WWN', '$2y$13$T.N1N86eRod31dYtKoJvhO8.HGltpB3niymio/drciwA6kO57KefW', NULL, 'luci@yii.com', 10, 1484664963, 1484664963),
(3, 'test', 'XD8n9dsiS87wcGEIGMhtDTi8Bun5Apa8', '$2y$13$GO/NVjQS2ycHYQCNv8yZYuBjAyAqcOudiatQrQt0K0HVzMBX0jgdS', NULL, 'testuser@yii.com', 10, 1484665041, 1484665041),
(4, 'testuser2', 'uLWElbqz-7D4572sElOPPjPTNdfskUqH', '$2y$13$m1T91zXBuf9057wNXGkz0.nP2k/GELAjbCzCkwr8q45FHTMgQhgiq', NULL, 'testuser2@yii.com', 10, 1484666886, 1484666886),
(5, 'testuser3', 'kdmQDctwFmr8CntZughL93WqR9cEzHMr', '$2y$13$BbpqCPjrwX63RP5YwIVHqeoR0pLHonkgknIBBSQvy7eoT8sb8JYDS', NULL, 'testuser3@yii.com', 10, 1484667216, 1484667216);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carros`
--
ALTER TABLE `carros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
