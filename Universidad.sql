-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-11-2023 a las 04:40:45
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Universidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `aula_id` int(11) NOT NULL,
  `aula_descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `car_id` int(11) NOT NULL,
  `car_nombre` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE `dias` (
  `dia_id` int(11) NOT NULL,
  `dia_descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `est_id` int(11) NOT NULL,
  `est_descripcion` varchar(11) NOT NULL,
  `est_fechaInicio` date NOT NULL,
  `est_fechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosTarea`
--

CREATE TABLE `estadosTarea` (
  `estta_id` int(11) NOT NULL,
  `estta_descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `mat_id` int(11) NOT NULL,
  `mat_nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasDia`
--

CREATE TABLE `materiasDia` (
  `matd_id` int(11) NOT NULL,
  `mat_id` int(11) NOT NULL,
  `matd_horaInicio` time DEFAULT NULL,
  `matd_horaFin` time DEFAULT NULL,
  `dia_id` int(11) NOT NULL,
  `aula_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `sem_idSemestre` int(11) NOT NULL,
  `sem_descipcion` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `tare_id` int(11) NOT NULL,
  `tare_nombre` varchar(100) NOT NULL,
  `tare_descripcion` varchar(100) NOT NULL,
  `tare_fecha` date NOT NULL,
  `estta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_documento` int(20) NOT NULL,
  `usu_nombres` varchar(100) NOT NULL,
  `usu_apellidos` varchar(100) NOT NULL,
  `usu_correoElectronico` varchar(100) NOT NULL,
  `usu_contraseña` varchar(100) NOT NULL,
  `car_id` int(11) NOT NULL,
  `sem_idSemestre` int(11) NOT NULL,
  `est_id` int(11) NOT NULL,
  `tare_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosMateriasDia`
--

CREATE TABLE `usuariosMateriasDia` (
  `usumat_id` int(11) NOT NULL,
  `usu_documento` int(11) NOT NULL,
  `matd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`aula_id`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`car_id`);

--
-- Indices de la tabla `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`dia_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`est_id`);

--
-- Indices de la tabla `estadosTarea`
--
ALTER TABLE `estadosTarea`
  ADD PRIMARY KEY (`estta_id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`mat_id`);

--
-- Indices de la tabla `materiasDia`
--
ALTER TABLE `materiasDia`
  ADD PRIMARY KEY (`matd_id`),
  ADD KEY `mat_id` (`mat_id`),
  ADD KEY `aula_id` (`aula_id`),
  ADD KEY `dia_id` (`dia_id`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`sem_idSemestre`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`tare_id`),
  ADD KEY `estta_id` (`estta_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_documento`),
  ADD KEY `sem_idSemestre` (`sem_idSemestre`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `est_id` (`est_id`),
  ADD KEY `tare_id` (`tare_id`);

--
-- Indices de la tabla `usuariosMateriasDia`
--
ALTER TABLE `usuariosMateriasDia`
  ADD PRIMARY KEY (`usumat_id`),
  ADD KEY `usu_documento` (`usu_documento`),
  ADD KEY `matd_id` (`matd_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `aula_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dias`
--
ALTER TABLE `dias`
  MODIFY `dia_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `est_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadosTarea`
--
ALTER TABLE `estadosTarea`
  MODIFY `estta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `mat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materiasDia`
--
ALTER TABLE `materiasDia`
  MODIFY `matd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `sem_idSemestre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `tare_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuariosMateriasDia`
--
ALTER TABLE `usuariosMateriasDia`
  MODIFY `usumat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `materiasDia`
--
ALTER TABLE `materiasDia`
  ADD CONSTRAINT `materiasdia_ibfk_1` FOREIGN KEY (`mat_id`) REFERENCES `materias` (`mat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materiasdia_ibfk_2` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`aula_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materiasdia_ibfk_3` FOREIGN KEY (`dia_id`) REFERENCES `dias` (`dia_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`estta_id`) REFERENCES `estadosTarea` (`estta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`sem_idSemestre`) REFERENCES `semestre` (`sem_idSemestre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `carreras` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`est_id`) REFERENCES `estados` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`tare_id`) REFERENCES `tareas` (`tare_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariosMateriasDia`
--
ALTER TABLE `usuariosMateriasDia`
  ADD CONSTRAINT `usuariosmateriasdia_ibfk_1` FOREIGN KEY (`usu_documento`) REFERENCES `usuarios` (`usu_documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuariosmateriasdia_ibfk_2` FOREIGN KEY (`matd_id`) REFERENCES `materiasDia` (`matd_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
