-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2020 a las 17:05:59
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fraterniapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `derecho`
--

CREATE TABLE `derecho` (
  `derechoId` int(11) NOT NULL,
  `fk_perfilId` int(11) DEFAULT NULL,
  `fk_tipoUsuarioId` int(11) DEFAULT NULL,
  `fk_estadoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `derecho`:
--   `fk_estadoId`
--       `estado` -> `estadoId`
--   `fk_tipoUsuarioId`
--       `tipousuario` -> `tipoUsuarioId`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresaId` int(11) NOT NULL,
  `nombreNombre` varchar(150) NOT NULL,
  `nombreContacto` varchar(50) DEFAULT NULL,
  `nombreTelefono` varchar(50) DEFAULT NULL,
  `fk_sectorId` int(11) DEFAULT NULL,
  `fk_estadoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `empresa`:
--   `fk_estadoId`
--       `estado` -> `estadoId`
--   `fk_sectorId`
--       `sector` -> `sectorId`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `estadoId` int(11) NOT NULL,
  `estadoNombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `estado`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glosario`
--

CREATE TABLE `glosario` (
  `glosarioId` int(11) NOT NULL,
  `glosarioDescripction` text NOT NULL,
  `fk_estadoId` int(11) DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `glosario`:
--   `fk_estadoId`
--       `estado` -> `estadoId`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `moduloId` int(11) NOT NULL,
  `moduloNombre` varchar(50) NOT NULL,
  `moduloLink` varchar(50) NOT NULL,
  `fk_estadoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `modulo`:
--   `fk_estadoId`
--       `estado` -> `estadoId`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `perfilId` int(11) NOT NULL,
  `perfilNombre` varchar(50) NOT NULL,
  `fk_estadoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `perfil`:
--   `fk_estadoId`
--       `estado` -> `estadoId`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `publicacionId` int(11) NOT NULL,
  `publicacionTitulo` varchar(140) NOT NULL,
  `publicacionDescripcion` text NOT NULL,
  `publicacionFechaCreacion` datetime NOT NULL,
  `fk_tipoPublicacionId` int(11) DEFAULT NULL,
  `fk_usuarioId` int(11) DEFAULT NULL,
  `fk_estadoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `publicacion`:
--   `fk_estadoId`
--       `estado` -> `estadoId`
--   `fk_tipoPublicacionId`
--       `tipopublicacion` -> `tipoPublicacionId`
--   `fk_usuarioId`
--       `usuario` -> `usuarioId`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `sectorId` int(11) NOT NULL,
  `sectorNombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `sector`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopublicacion`
--

CREATE TABLE `tipopublicacion` (
  `tipoPublicacionId` int(11) NOT NULL,
  `tipoPublicacionNombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tipopublicacion`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `tipoUsuarioId` int(11) NOT NULL,
  `tipoUsuarioNombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tipousuario`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trazabilidad`
--

CREATE TABLE `trazabilidad` (
  `trazabilidadId` int(11) NOT NULL,
  `trazabilidadDescripcion` varchar(250) NOT NULL,
  `fk_estadoId` int(11) DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `trazabilidad`:
--   `fk_estadoId`
--       `estado` -> `estadoId`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidad`
--

CREATE TABLE `universidad` (
  `universidadId` int(11) NOT NULL,
  `universidadNombre` varchar(150) NOT NULL,
  `fk_estadoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `universidad`:
--   `fk_estadoId`
--       `estado` -> `estadoId`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuarioId` int(11) NOT NULL,
  `usuarioNombre` varchar(150) NOT NULL,
  `usuarioEmail` varchar(150) NOT NULL,
  `usuarioPassword` varchar(150) NOT NULL,
  `usuarioTelefonoPrincipal` varchar(150) NOT NULL,
  `fk_universidadId` int(11) DEFAULT NULL,
  `fk_perfilId` int(11) DEFAULT NULL,
  `fk_estadoId` int(11) DEFAULT NULL,
  `fk_tipoUsuarioId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `usuario`:
--   `fk_estadoId`
--       `estado` -> `estadoId`
--   `fk_perfilId`
--       `perfil` -> `perfilId`
--   `fk_tipoUsuarioId`
--       `tipousuario` -> `tipoUsuarioId`
--   `fk_universidadId`
--       `universidad` -> `universidadId`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacante`
--

CREATE TABLE `vacante` (
  `vacanteId` int(11) NOT NULL,
  `vacanteNombre` varchar(150) NOT NULL,
  `vacanteDescripcion` varchar(250) DEFAULT NULL,
  `vacanteSalario` varchar(50) DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `fk_empresaId` int(11) DEFAULT NULL,
  `fk_usuarioId` int(11) DEFAULT NULL,
  `fk_estadoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `vacante`:
--   `fk_empresaId`
--       `empresa` -> `empresaId`
--   `fk_estadoId`
--       `estado` -> `estadoId`
--   `fk_usuarioId`
--       `usuario` -> `usuarioId`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `derecho`
--
ALTER TABLE `derecho`
  ADD PRIMARY KEY (`derechoId`),
  ADD KEY `fk_tipoUsuarioId2` (`fk_tipoUsuarioId`),
  ADD KEY `fk_estadoId5` (`fk_estadoId`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresaId`),
  ADD KEY `fk_estadoId8` (`fk_estadoId`),
  ADD KEY `fk_sectorId` (`fk_sectorId`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`estadoId`);

--
-- Indices de la tabla `glosario`
--
ALTER TABLE `glosario`
  ADD PRIMARY KEY (`glosarioId`),
  ADD KEY `fk_estadoId10` (`fk_estadoId`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`moduloId`),
  ADD KEY `fk_estadoId2` (`fk_estadoId`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`perfilId`),
  ADD KEY `fk_estadoId` (`fk_estadoId`);

--
-- Indices de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`publicacionId`),
  ADD KEY `fk_tipoPublicacionId` (`fk_tipoPublicacionId`),
  ADD KEY `fk_usuarioId` (`fk_usuarioId`),
  ADD KEY `fk_estadoId7` (`fk_estadoId`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`sectorId`);

--
-- Indices de la tabla `tipopublicacion`
--
ALTER TABLE `tipopublicacion`
  ADD PRIMARY KEY (`tipoPublicacionId`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`tipoUsuarioId`);

--
-- Indices de la tabla `trazabilidad`
--
ALTER TABLE `trazabilidad`
  ADD PRIMARY KEY (`trazabilidadId`),
  ADD KEY `fk_estadoId6` (`fk_estadoId`);

--
-- Indices de la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD PRIMARY KEY (`universidadId`),
  ADD KEY `fk_estadoId3` (`fk_estadoId`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioId`),
  ADD KEY `fk_perfilId` (`fk_perfilId`),
  ADD KEY `fk_universidadId` (`fk_universidadId`),
  ADD KEY `fk_estadoId4` (`fk_estadoId`),
  ADD KEY `fk_tipoUsuarioId` (`fk_tipoUsuarioId`);

--
-- Indices de la tabla `vacante`
--
ALTER TABLE `vacante`
  ADD PRIMARY KEY (`vacanteId`),
  ADD KEY `fk_estadoId9` (`fk_estadoId`),
  ADD KEY `fk_usuarioId2` (`fk_usuarioId`),
  ADD KEY `fk_empresaId` (`fk_empresaId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `derecho`
--
ALTER TABLE `derecho`
  MODIFY `derechoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresaId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `estadoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `glosario`
--
ALTER TABLE `glosario`
  MODIFY `glosarioId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `moduloId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `perfilId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `publicacionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `sectorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipopublicacion`
--
ALTER TABLE `tipopublicacion`
  MODIFY `tipoPublicacionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `tipoUsuarioId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trazabilidad`
--
ALTER TABLE `trazabilidad`
  MODIFY `trazabilidadId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `universidad`
--
ALTER TABLE `universidad`
  MODIFY `universidadId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vacante`
--
ALTER TABLE `vacante`
  MODIFY `vacanteId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `derecho`
--
ALTER TABLE `derecho`
  ADD CONSTRAINT `fk_estadoId5` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`),
  ADD CONSTRAINT `fk_tipoUsuarioId2` FOREIGN KEY (`fk_tipoUsuarioId`) REFERENCES `tipousuario` (`tipoUsuarioId`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_estadoId8` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`),
  ADD CONSTRAINT `fk_sectorId` FOREIGN KEY (`fk_sectorId`) REFERENCES `sector` (`sectorId`);

--
-- Filtros para la tabla `glosario`
--
ALTER TABLE `glosario`
  ADD CONSTRAINT `fk_estadoId10` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`);

--
-- Filtros para la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `fk_estadoId2` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`);

--
-- Filtros para la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `fk_estadoId` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`);

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `fk_estadoId7` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`),
  ADD CONSTRAINT `fk_tipoPublicacionId` FOREIGN KEY (`fk_tipoPublicacionId`) REFERENCES `tipopublicacion` (`tipoPublicacionId`),
  ADD CONSTRAINT `fk_usuarioId` FOREIGN KEY (`fk_usuarioId`) REFERENCES `usuario` (`usuarioId`);

--
-- Filtros para la tabla `trazabilidad`
--
ALTER TABLE `trazabilidad`
  ADD CONSTRAINT `fk_estadoId6` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`);

--
-- Filtros para la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD CONSTRAINT `fk_estadoId3` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_estadoId4` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`),
  ADD CONSTRAINT `fk_perfilId` FOREIGN KEY (`fk_perfilId`) REFERENCES `perfil` (`perfilId`),
  ADD CONSTRAINT `fk_tipoUsuarioId` FOREIGN KEY (`fk_tipoUsuarioId`) REFERENCES `tipousuario` (`tipoUsuarioId`),
  ADD CONSTRAINT `fk_universidadId` FOREIGN KEY (`fk_universidadId`) REFERENCES `universidad` (`universidadId`);

--
-- Filtros para la tabla `vacante`
--
ALTER TABLE `vacante`
  ADD CONSTRAINT `fk_empresaId` FOREIGN KEY (`fk_empresaId`) REFERENCES `empresa` (`empresaId`),
  ADD CONSTRAINT `fk_estadoId9` FOREIGN KEY (`fk_estadoId`) REFERENCES `estado` (`estadoId`),
  ADD CONSTRAINT `fk_usuarioId2` FOREIGN KEY (`fk_usuarioId`) REFERENCES `usuario` (`usuarioId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
