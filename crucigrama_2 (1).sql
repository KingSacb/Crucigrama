-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2022 a las 23:46:14
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crucigrama_2`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertRespTest` (IN `cantidad_uso` INT, IN `token_test` VARCHAR(50), IN `token_compra` VARCHAR(50), IN `nombre_usuario` VARCHAR(50), IN `apellido_usuario` VARCHAR(50), IN `cedula_usuario` VARCHAR(50), IN `correo_usuario` VARCHAR(50), IN `puntos` INT, IN `paquete_id` INT, IN `universidad_id` INT, IN `carrera_id` INT, IN `edad_usuario` INT)  BEGIN
	UPDATE paquete_empresa
	SET cantidad = cantidad - cantidad_uso
	WHERE token_empresa_id = token_compra;
	
	INSERT INTO test(nombre_usuario,apellido_usuario,cedula_usuario,correo_usuario,edad_usuario,puntos_test,paquete_id) VALUES (nombre_usuario,apellido_usuario,cedula_usuario,correo_usuario,edad_usuario,puntos,paquete_id);
		
	SELECT test_id INTO @id_t FROM test  ORDER BY test_id DESC LIMIT 1;
	
	INSERT INTO test_universidad_carrera(token_id,universidad_id,carrera_id,test_id) VALUES(token_test,universidad_id,carrera_id,@id_t);


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertRespTestProv` (IN `cantidad_uso` INT, IN `token_test` VARCHAR(50), IN `token_compra` VARCHAR(50), IN `nombre_usuario` VARCHAR(50), IN `apellido_usuario` VARCHAR(50), IN `cedula_usuario` VARCHAR(50), IN `correo_usuario` VARCHAR(50), IN `respuesta` VARCHAR(255), IN `paquete_id` INT, IN `universidad_id` INT, IN `carrera_id` INT, IN `edad_usuario` INT)  NO SQL
BEGIN
	UPDATE paquete_empresa
	SET cantidad = cantidad - cantidad_uso
	WHERE token_empresa_id = token_compra;
	
	INSERT INTO test_provisional (nombre_usuario,apellido_usuario,cedula_usuario,correo_usuario,edad_usuario,resultado_test,paquete_id) VALUES (nombre_usuario,apellido_usuario,cedula_usuario,correo_usuario,edad_usuario,respuesta,paquete_id);
		
	SELECT test_id INTO @id_t FROM test_provisional  ORDER BY test_id DESC LIMIT 1;
	
	INSERT INTO test_universidad_carrera(token_id,universidad_id,carrera_id,test_id) VALUES(token_test,universidad_id,carrera_id,@id_t);


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `pregunta_id` int(11) NOT NULL,
  `texto` varchar(250) NOT NULL,
  `tipo` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`pregunta_id`, `texto`, `tipo`, `created_at`, `update_at`) VALUES
(11, 'Según la ______ el conecpto de calidad es un nivel en la cual un conjunto de características cumple con los requisitos.', 1, '2022-10-17 20:15:04', '2022-11-05 22:22:18'),
(13, 'Es una práctica gerencial para el mejoramiento continuo de los resultados en cada área de actividad de la empresa.', 1, '2022-10-17 20:26:42', '2022-11-05 22:31:25'),
(15, 'Características de gestión de calidad de software:', 1, '2022-10-17 20:26:42', '2022-10-27 01:52:40'),
(17, '¿Según la ISO 8402 el concepto de calidad es?', 1, '2022-10-17 20:26:42', '2022-10-27 01:52:45'),
(18, 'Marcos terminó de programar un software que pidió su profesor, lo ejecutó y funcionó correctamente. ¿Qué concepto es?', 1, '2022-10-17 20:26:42', '2022-10-27 01:52:50'),
(19, 'Marta pidió que su programa pudiera sumar, pero este no tenía esa funcionalidad. ¿Qué concepto no cumplió?', 1, '2022-10-17 20:26:42', '2022-10-27 01:52:58'),
(20, 'Un programador aseguró que su software es muy eficiente, lo probó mediante acciones planificadas y sistemáticas. ¿Qué concepto fue aplicado?', 1, '2022-10-17 20:26:42', '2022-10-27 01:53:04'),
(21, 'Una empresa responsable realiza:', 1, '2022-10-17 20:26:42', '2022-10-27 01:53:10'),
(22, 'Es uno de los procesos de aseguramiento de la calidad:', 1, '2022-10-17 20:26:42', '2022-10-27 01:53:18'),
(23, 'Pedro necesita una herramienta que sea cómoda, rápida y de fácil manejo. ¿Qué vista se apega a este caso?', 1, '2022-10-17 20:26:42', '2022-10-27 01:53:25'),
(24, 'Probabilidad de que un producto no falle en un periodo de tiempo determinado:', 1, '2022-10-17 20:26:42', '2022-10-27 01:53:31'),
(25, 'Se toma como centro de acción las necesidades del cliente, incluso en la postventa como principal indicador de calidad:', 1, '2022-10-17 20:26:42', '2022-10-27 01:53:38'),
(26, 'Procesos que se vieron favorecidos por los avances tecnológicos de la época (1930-1950):', 1, '2022-10-17 20:26:42', '2022-10-27 01:53:44'),
(27, 'Cuál es el término que se utilizó en el siglo XIX cuando el trabajo manual es reemplazado por trabajo mecánico:', 1, '2022-10-17 20:26:42', '2022-10-27 01:53:51'),
(28, 'Desarrolló lo que se conoce como ingeniería de la calidad:', 1, '2022-10-17 20:26:42', '2022-10-27 01:54:02'),
(29, 'Recordado como un experto de la gestión de la calidad:', 1, '2022-10-17 20:26:42', '2022-10-27 01:54:09'),
(30, 'Conocido por su trabajo en gestión de calidad, en Kaizen:', 1, '2022-10-17 20:26:42', '2022-10-27 01:54:16'),
(31, 'En el 2012 cual fue la empresa que reconoció un fallo de software que afecto a 1,53 millones de vehículos:', 1, '2022-10-17 20:26:42', '2022-10-27 01:54:22'),
(32, 'Cuál es la empresa que perdió 440 millones de dólares:', 1, '2022-10-17 20:26:42', '2022-10-27 01:54:28'),
(33, '¿Qué sucedió con American Airlines en el 2013?:', 1, '2022-10-17 20:26:42', '2022-10-27 01:54:34'),
(34, 'Cuáles de estas opciones no es una ventaja de calidad de software que aporta a las empresas a evolucionar:', 1, '2022-10-17 20:26:42', '2022-10-27 01:54:40'),
(35, '¿La inteligencia artificial permitirá que las herramientas de pruebas automatizadas hagan cosas sin tener que aprender?', 1, '2022-10-17 20:26:42', '2022-10-27 01:54:45'),
(37, 'Cuáles de las siguientes opciones no es un proceso de medición de software:\r\n\r\n', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(38, 'En que época el desarrollo de programas presentaba dificultades como: baja calidad y aplicaciones entregadas tarde.', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(40, 'Indique cuales de las siguientes opciones es un ejemplo de valor cuantitativo:\r\n\r\n', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(41, 'Cuando se habla de asignación de los recursos necesarios para el desarrollo de un sistema de métricas de calidad son:', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(43, 'Que se logra mediante la ejecución de frecuentes inspecciones a las metodologías de trabajo y al uso de las herramientas. ', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(44, '¿A que nos referimos al hablar de una indicación cuantitativa de la cantidad y tamaño de algunos atributos del producto?', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(45, '¿A que nos referimos al hablar de una asignación de un valor a un atributo de una entidad software?', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(46, '¿Cuál es la métrica que define la medición por volumen, tamaño y configuración?', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(47, 'Métrica que mide la conducta de módulos y sistemas de un software, bajo la supervisión del SO o hardware.', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(48, 'Métrica que intenta valorar o medir las actividades de productividad de los programadores.', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(49, 'Nos proporciona una visión profunda de un proceso de software.', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(50, '¿Qué concepto utiliza la siguiente ecuación? Tamaño / Esfuerzo', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(51, '¿Qué concepto utiliza la siguiente ecuación? Defectos / Tamaño', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(52, 'Un programa que haga sumas y restas puede ser un ejemplo de…', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(53, 'Un programa tiene 1000 líneas de código puede ser un ejemplo de…', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(54, 'Un estudiante es invitado a una encuesta en donde debe responder con 1 si está de acuerdo y 2 si no está de acuerdo. ¿Qué escala se aplica aquí?', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(55, 'Que incluye los entregables y documentos resultantes de las actividades de los procesos.', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(56, 'En este atributo se pueden medir las métricas de complejidad, métricas de defectos y métricas de calidad del diseño.', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(59, '¿Qué es la eficacia en la eliminación de defectos (EDD)?', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(60, 'Es uno de los objetivos al iniciar actividades de mejoras del proceso de software', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(63, 'Es un objetivo de las métricas del proyecto', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(65, 'Las métricas de productos se dividen en 2 clases:', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(66, '¿Cuántos procesos de medición de productos hay (Cantidad)?', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(68, 'Pressman sugiere cuatro categorías de recursos de software que se deberán tener en cuenta a medida que se avanza con la planificación:', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(69, 'De acuerdo con Pressman las métricas del proceso de software se utilizan para:', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(70, 'Las métricas del proceso son medidas:', 2, '2022-10-17 20:59:34', '2022-10-17 20:59:34'),
(71, 'Se enfoca en identificar y evaluar los defectos que puedan afectar al software. \r\n', 1, '2022-11-05 22:34:50', '2022-11-05 22:34:50'),
(72, 'Su principal objetivo es eliminar las causas de los defectos en las diferentes fases del ciclo de vida.\r\n', 1, '2022-11-05 22:36:39', '2022-11-05 22:36:39'),
(73, 'Comprueba que el software funciona, es decir que técnicamente se ha construido de acuerdo con los requisitos del usuario.\r\n', 1, '2022-11-05 22:36:39', '2022-11-05 22:36:39'),
(75, 'Conjunto de acciones planificadas y sistemáticas necesarias para proporcionar la confianza adecuada de que un producto o servicio.', 1, '2022-11-05 22:38:27', '2022-11-05 22:38:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `respuesta_id` int(11) NOT NULL,
  `texto` varchar(250) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`respuesta_id`, `texto`, `Tipo`, `created_at`, `update_at`) VALUES
(11, 'ISO9000', 1, '2022-11-05 22:16:34', '2022-11-05 22:32:20'),
(13, 'Gestion', 1, '2022-11-05 22:32:01', '2022-11-05 22:32:01'),
(71, 'Aseguramiento', 1, '2022-11-05 22:39:51', '2022-11-05 22:39:51'),
(72, 'Control', 1, '2022-11-05 22:39:51', '2022-11-05 22:39:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_pregunta`
--

CREATE TABLE `respuesta_pregunta` (
  `rp_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `respuesta_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuesta_pregunta`
--

INSERT INTO `respuesta_pregunta` (`rp_id`, `pregunta_id`, `respuesta_id`, `created_at`, `update_at`) VALUES
(1, 1, 5, '2022-06-12 00:35:33', '2022-06-12 00:35:33'),
(2, 2, 7, '2022-06-12 00:35:33', '2022-06-12 00:35:33'),
(3, 3, 6, '2022-06-12 00:35:33', '2022-06-12 00:35:33'),
(4, 4, 8, '2022-06-12 00:35:33', '2022-06-12 00:35:33'),
(5, 5, 7, '2022-07-14 01:06:33', '2022-07-14 01:06:33'),
(6, 6, 9, '2022-07-14 01:12:31', '2022-07-14 01:12:31'),
(7, 7, 10, '2022-07-14 01:24:19', '2022-07-14 01:24:19'),
(8, 8, 7, '2022-07-14 01:26:41', '2022-07-14 01:26:41'),
(9, 9, 11, '2022-07-14 01:34:34', '2022-07-14 01:34:34'),
(10, 10, 7, '2022-07-14 01:36:30', '2022-07-14 01:36:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_pregunta_provicional`
--

CREATE TABLE `respuesta_pregunta_provicional` (
  `rp_id` int(11) NOT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `respuesta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_provicional`
--

CREATE TABLE `respuesta_provicional` (
  `respuesta_id` int(11) NOT NULL,
  `texto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuesta_provicional`
--

INSERT INTO `respuesta_provicional` (`respuesta_id`, `texto`) VALUES
(1, 'Salud'),
(2, 'Ciencias'),
(3, 'Tecnología'),
(4, 'Administración Empresarial'),
(5, 'Deporte'),
(6, 'Pasar tiempo con la computadora/móvil'),
(7, 'Pasear con amistades'),
(8, 'Dormir'),
(9, 'Si'),
(10, 'No'),
(11, 'Curioso (a)'),
(12, 'Atento (a)'),
(13, 'Paciente'),
(14, 'Organizado (a)'),
(15, 'Empático (a)'),
(16, 'No me gusta hablar en público'),
(17, 'Nervioso (a)'),
(18, 'No tengo ningún inconveniente en hacerlo con frecuencia'),
(19, 'Relajado(a)'),
(20, 'Biología'),
(21, 'Química'),
(22, 'Física'),
(23, 'Anatomía'),
(24, 'Odontología'),
(25, 'Geología'),
(26, '1 hora - 2 Horas'),
(27, '3 horas - 4 Horas'),
(28, '5 horas - 6 Horas'),
(29, 'Proactivo (a)');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`pregunta_id`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`respuesta_id`);

--
-- Indices de la tabla `respuesta_pregunta`
--
ALTER TABLE `respuesta_pregunta`
  ADD PRIMARY KEY (`rp_id`),
  ADD KEY `pregunta_id_uk` (`pregunta_id`),
  ADD KEY `respuesta_id_uk` (`respuesta_id`);

--
-- Indices de la tabla `respuesta_pregunta_provicional`
--
ALTER TABLE `respuesta_pregunta_provicional`
  ADD PRIMARY KEY (`rp_id`),
  ADD KEY `pregunta_id_respuesta_id` (`pregunta_id`,`respuesta_id`),
  ADD KEY `FK_respuesta_pregunta_provicional_respuesta_provicional` (`respuesta_id`);

--
-- Indices de la tabla `respuesta_provicional`
--
ALTER TABLE `respuesta_provicional`
  ADD PRIMARY KEY (`respuesta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `pregunta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `respuesta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `respuesta_pregunta`
--
ALTER TABLE `respuesta_pregunta`
  MODIFY `rp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `respuesta_pregunta_provicional`
--
ALTER TABLE `respuesta_pregunta_provicional`
  MODIFY `rp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuesta_provicional`
--
ALTER TABLE `respuesta_provicional`
  MODIFY `respuesta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `respuesta_pregunta_provicional`
--
ALTER TABLE `respuesta_pregunta_provicional`
  ADD CONSTRAINT `FK_respuesta_pregunta_provicional_respuesta_provicional` FOREIGN KEY (`respuesta_id`) REFERENCES `respuesta_provicional` (`respuesta_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pregunta_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`pregunta_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
