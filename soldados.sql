-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-08-2024 a las 02:01:45
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `soldados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañia`
--

CREATE TABLE `compañia` (
  `ID_COMPAÑIA` int(10) NOT NULL,
  `ACTIVIDAD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles`
--

CREATE TABLE `cuarteles` (
  `ID_CUARTELES` int(10) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `UBICACION` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles_compañia`
--

CREATE TABLE `cuarteles_compañia` (
  `ID_CUARTEL` int(10) DEFAULT NULL,
  `ID_COMPAÑ` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpos`
--

CREATE TABLE `cuerpos` (
  `ID_CUERPO` int(10) NOT NULL,
  `DENOMINACION` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `ID_SERVICIO` int(10) NOT NULL,
  `ACTIVIDAD_SERVICIO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `ID_SOLDADO` int(10) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `APELLIDO` varchar(20) DEFAULT NULL,
  `GRADO` varchar(10) DEFAULT NULL,
  `ID_CUARTEL1` int(10) DEFAULT NULL,
  `ID_CUERPO1` int(10) DEFAULT NULL,
  `ID_COMPAÑIA` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado_servicio`
--

CREATE TABLE `soldado_servicio` (
  `ID_SOLDADO1` int(10) DEFAULT NULL,
  `ID_SERVICIO1` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD PRIMARY KEY (`ID_COMPAÑIA`);

--
-- Indices de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD PRIMARY KEY (`ID_CUARTELES`);

--
-- Indices de la tabla `cuarteles_compañia`
--
ALTER TABLE `cuarteles_compañia`
  ADD KEY `fk_ID_SEIS` (`ID_CUARTEL`),
  ADD KEY `fk_ID_SIETE` (`ID_COMPAÑ`);

--
-- Indices de la tabla `cuerpos`
--
ALTER TABLE `cuerpos`
  ADD PRIMARY KEY (`ID_CUERPO`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ID_SERVICIO`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`ID_SOLDADO`),
  ADD KEY `fk_ID_UNO` (`ID_CUARTEL1`),
  ADD KEY `fk_ID_DOS` (`ID_CUERPO1`),
  ADD KEY `fk_ID_TRES` (`ID_COMPAÑIA`);

--
-- Indices de la tabla `soldado_servicio`
--
ALTER TABLE `soldado_servicio`
  ADD KEY `fk_ID_CUATRO` (`ID_SOLDADO1`),
  ADD KEY `fk_ID_CINCO` (`ID_SERVICIO1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañia`
--
ALTER TABLE `compañia`
  MODIFY `ID_COMPAÑIA` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  MODIFY `ID_CUARTELES` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpos`
--
ALTER TABLE `cuerpos`
  MODIFY `ID_CUERPO` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID_SERVICIO` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldado`
--
ALTER TABLE `soldado`
  MODIFY `ID_SOLDADO` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuarteles_compañia`
--
ALTER TABLE `cuarteles_compañia`
  ADD CONSTRAINT `fk_ID_SEIS` FOREIGN KEY (`ID_CUARTEL`) REFERENCES `cuarteles` (`ID_CUARTELES`),
  ADD CONSTRAINT `fk_ID_SIETE` FOREIGN KEY (`ID_COMPAÑ`) REFERENCES `compañia` (`ID_COMPAÑIA`);

--
-- Filtros para la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `fk_ID_DOS` FOREIGN KEY (`ID_CUERPO1`) REFERENCES `cuerpos` (`ID_CUERPO`),
  ADD CONSTRAINT `fk_ID_TRES` FOREIGN KEY (`ID_COMPAÑIA`) REFERENCES `compañia` (`ID_COMPAÑIA`),
  ADD CONSTRAINT `fk_ID_UNO` FOREIGN KEY (`ID_CUARTEL1`) REFERENCES `cuarteles` (`ID_CUARTELES`);

--
-- Filtros para la tabla `soldado_servicio`
--
ALTER TABLE `soldado_servicio`
  ADD CONSTRAINT `fk_ID_CINCO` FOREIGN KEY (`ID_SERVICIO1`) REFERENCES `servicio` (`ID_SERVICIO`),
  ADD CONSTRAINT `fk_ID_CUATRO` FOREIGN KEY (`ID_SOLDADO1`) REFERENCES `soldado` (`ID_SOLDADO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
