-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2024 a las 17:06:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nomada tours1`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_destino` (`c1_Destino` INT(11), `c2_nombre` VARCHAR(45), `c3_pais` VARCHAR(45))   UPDATE destino
SET des_nombre = c2_nombre, des_pais = c3_pais
WHERE id_Destino = c1_Destino$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_guia` (`c1_guia` INT(11), `c2_nom_guia` VARCHAR(45), `c3_idio_guia` VARCHAR(45), `c4_tel_guia` VARCHAR(45), `c5_via_id_via` INT(11))   UPDATE guia SET nombre_guia = nombre_guia, idioma_guia = idioma_guia, telefono_guia = telefono_guia, Viaje_id_Viaje = Viaje_id_Viaje
WHERE id_guia = id_guia$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta_clientervvj` ()   BEGIN 
SELECT cliente.clie_nombre, cliente.clie_apellido, cliente.clie_telefono, reserva.fecha_reserva, viaje.nom_viaje , viaje.fecha_inicioviaje, viaje.fecha_finviaje
FROM cliente
INNER JOIN reserva
ON cliente.idCliente = reserva.Cliente_idCliente 
INNER JOIN viaje
ON reserva.Viaje_id_Viaje= viaje.id_Viaje;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta_reserva_viaje_paquete` ()   BEGIN 
SELECT reserva.fecha_reserva, reserva.id_viaje, viaje.nom_viaje, viaje.viaje_precio, paquete.paq_nombres, paquete.precio_paquetes
FROM reserva
INNER JOIN viaje
ON reserva.Viaje_id_Viaje= viaje.id_Viaje
INNER JOIN paquete
ON viaje.id_Viaje= paquete.Viaje_id_Viaje;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_destino` (`c1_Destino` INT(11), `c2_nombre` VARCHAR(45), `c3_pais` VARCHAR(45))   BEGIN
DELETE FROM destino 
WHERE des_nombre = des_nombre;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_guia` (`c1_guia` INT(11), `c2_nom_guia` VARCHAR(45), `c3_idio_guia` VARCHAR(45), `c4_tel_guia` VARCHAR(45), `c5_via_id_via` INT(11))   BEGIN
DELETE FROM guia 
WHERE id_guia = id_guia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_destino` (`c1_Destino` INT(11), `c2_nombre` VARCHAR(45), `c3_pais` VARCHAR(45))   INSERT INTO destino (id_Destino, des_nombre, des_pais)
VALUES (c1_Destino, c2_nombre, c3_pais)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_guia` (`c1_guia` INT(11), `c2_nom_guia` VARCHAR(45), `c3_idio_guia` VARCHAR(45), `c4_tel_guia` VARCHAR(45), `c5_via_id_via` INT(11))   INSERT INTO destino (id_guia, nombre_guia, idioma_guia, telefono_guia, Viaje_id_Viaje)
VALUES (c1_guia, c2_nom_guia, c3_idio_guia, c4_tel_guia, c5_via_id_via)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_transporte`
--

CREATE TABLE `auditoria_transporte` (
  `id_transporteAnterior` int(11) DEFAULT NULL,
  `tipo_transporteAnterior` varchar(45) NOT NULL,
  `capacidad_transporteAnterior` varchar(45) NOT NULL,
  `empresa_transporteAnterior` varchar(45) NOT NULL,
  `id_viajeAnterior` varchar(45) NOT NULL,
  `Viaje_id_ViajeAnterior` int(11) DEFAULT NULL,
  `id_transporteNuevo` int(11) DEFAULT NULL,
  `tipo_transporteNuevo` varchar(45) NOT NULL,
  `capacidad_transporteNuevo` varchar(45) NOT NULL,
  `empresa_transporteNuevo` varchar(45) NOT NULL,
  `id_viajeNuevo` varchar(45) NOT NULL,
  `Viaje_id_ViajeNuevo` int(11) DEFAULT NULL,
  `audi_usuario` varchar(12) NOT NULL,
  `audi_accion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria_transporte`
--

INSERT INTO `auditoria_transporte` (`id_transporteAnterior`, `tipo_transporteAnterior`, `capacidad_transporteAnterior`, `empresa_transporteAnterior`, `id_viajeAnterior`, `Viaje_id_ViajeAnterior`, `id_transporteNuevo`, `tipo_transporteNuevo`, `capacidad_transporteNuevo`, `empresa_transporteNuevo`, `id_viajeNuevo`, `Viaje_id_ViajeNuevo`, `audi_usuario`, `audi_accion`) VALUES
(3211, 'Avion', '100', 'Turkish Airlines', '2797', 2797, 3211, 'Avion', '120', 'Turkish Airlines', '2797', 2797, 'root@localho', 'Actulizacion'),
(3923, 'Avion', '100', 'Turkish Airlines', '2898', 2898, 0, ' ', ' ', ' ', ' ', 0, 'root@localho', 'Registro elimin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_viaje`
--

CREATE TABLE `auditoria_viaje` (
  `id_ViajeAnterior` int(11) DEFAULT NULL,
  `nom_viajeAnterior` varchar(45) DEFAULT NULL,
  `fecha_inicioviajeAnterior` varchar(45) NOT NULL,
  `fecha_finviajeAnterior` varchar(45) NOT NULL,
  `viaje_precioAnterior` varchar(45) NOT NULL,
  `id_destinoAnterior` varchar(45) NOT NULL,
  `Destino_id_DestinoAnterior` int(11) DEFAULT NULL,
  `id_ViajeNuevo` int(11) DEFAULT NULL,
  `nom_viajeNuevo` varchar(45) DEFAULT NULL,
  `fecha_inicioviajeNuevo` varchar(45) NOT NULL,
  `fecha_finviajeNuevo` varchar(45) NOT NULL,
  `viaje_precioNuevo` varchar(45) NOT NULL,
  `id_destinoNuevo` varchar(45) NOT NULL,
  `Destino_id_DestinoNuevo` int(11) DEFAULT NULL,
  `audi_usuario` varchar(12) NOT NULL,
  `audi_accion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `clie_nombre` varchar(45) NOT NULL,
  `clie_apellido` varchar(45) NOT NULL,
  `clie_mail` varchar(45) DEFAULT NULL,
  `clie_telefono` varchar(45) DEFAULT NULL,
  `clie_direccion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `clie_nombre`, `clie_apellido`, `clie_mail`, `clie_telefono`, `clie_direccion`) VALUES
(1, 'Juan', 'Ardila', 'gmail.com', '3224035202', 'Calle27a'),
(2, 'Santiago', 'Caballero', 'gmail.com', '3138537959', 'cr09a'),
(3, 'Andres', 'Cabargas', 'gmail.com', '3224033992', 'calle28b'),
(4, 'Venes', 'Perez', 'gmail.com', '3142678405', 'crr36a'),
(5, 'Julian', 'Saltes', 'gmail.com', '3216547812', 'calle36a'),
(6, 'Hernan', 'Minor', 'gmail.com', '3126875926', 'crr39a'),
(7, 'Daniel', 'Orrego', 'gmail.com', '3126879562', 'calle99a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino`
--

CREATE TABLE `destino` (
  `id_Destino` int(11) NOT NULL,
  `des_nombre` varchar(45) NOT NULL,
  `des_pais` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `destino`
--

INSERT INTO `destino` (`id_Destino`, `des_nombre`, `des_pais`) VALUES
(11, 'Machupicho', 'Peru'),
(12, 'Peñol', 'colombia'),
(13, 'Ciudad de chile', 'chile'),
(14, 'Garzon', 'Colombia'),
(15, 'Artestina', 'Argentina'),
(16, 'Playa', 'Venezuela'),
(17, 'Medellin', 'Colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia`
--

CREATE TABLE `guia` (
  `id_guia` int(11) NOT NULL,
  `nombre_guia` varchar(45) NOT NULL,
  `idioma_guia` varchar(45) DEFAULT NULL,
  `telefono_guia` varchar(45) DEFAULT NULL,
  `Viaje_id_Viaje` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `guia`
--

INSERT INTO `guia` (`id_guia`, `nombre_guia`, `idioma_guia`, `telefono_guia`, `Viaje_id_Viaje`) VALUES
(0, 'Anderson', 'Ingles', '3006549878', 2292),
(1, 'Valeria', 'Español', '3549871623', 2393),
(2, 'Camila', 'Ingles', '3696549832', 2494),
(3, 'Juan', 'Ingles', '3546873265', 2595),
(4, 'Deivi', 'Español', '3871562626', 2696),
(5, 'Sebastian', 'Ingles', '3149876532', 2797),
(6, 'Oswal', 'Ingles', '3156549872', 2898);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id_Hotel` int(11) NOT NULL,
  `nombre_hotel` varchar(45) NOT NULL,
  `direccion_hotel` varchar(45) DEFAULT NULL,
  `estrellas_hotel` varchar(45) DEFAULT NULL,
  `id_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id_Hotel`, `nombre_hotel`, `direccion_hotel`, `estrellas_hotel`, `id_destino`) VALUES
(31, 'Tribago', '21crr', '3', 11),
(32, 'Zadael', '25calle', '4', 12),
(33, 'Dunez', '29calle', '4', 13),
(34, 'Vivir', '30crr', '4', 14),
(35, 'Salten', '31crr', '5', 15),
(36, 'Oporsum', '32crr', '5', 16),
(37, 'Galnez', '30calle', '5', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `id_Paquete` int(11) NOT NULL,
  `paq_nombres` varchar(45) DEFAULT NULL,
  `precio_paquetes` varchar(45) DEFAULT NULL,
  `descripcion_paquete` varchar(45) DEFAULT NULL,
  `id_viaje` varchar(45) DEFAULT NULL,
  `Viaje_id_Viaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`id_Paquete`, `paq_nombres`, `precio_paquetes`, `descripcion_paquete`, `id_viaje`, `Viaje_id_Viaje`) VALUES
(111, 'Basico', '20000', 'Es paquete basico', '2292', 2292),
(112, 'Bronce', '40000', 'es un paquete bronce', '2393', 2393),
(113, 'Plata', '50000', 'es un paquete plata', '2494', 2494);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_Reserva` int(11) NOT NULL,
  `fecha_reserva` varchar(45) NOT NULL,
  `id_cliente` varchar(45) DEFAULT NULL,
  `id_viaje` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Viaje_id_Viaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_Reserva`, `fecha_reserva`, `id_cliente`, `id_viaje`, `Cliente_idCliente`, `Viaje_id_Viaje`) VALUES
(1414, 'sep-24', '1', '2292', 1, 2292),
(2014, 'mar-24', '4', '2595', 4, 2595),
(3054, 'mar-20', '5', '2696', 5, 2696),
(3541, 'jul-23', '3', '2494', 3, 2494),
(3549, 'oct-24', '6', '2797', 6, 2797),
(4562, 'oct-22', '7', '2898', 7, 2898),
(4565, 'oct-24', '2', '2393', 2, 2393);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte`
--

CREATE TABLE `transporte` (
  `id_transporte` int(11) NOT NULL,
  `tipo_transporte` varchar(45) DEFAULT NULL,
  `capacidad_transporte` varchar(45) DEFAULT NULL,
  `empresa_transporte` varchar(45) DEFAULT NULL,
  `id_viaje` varchar(45) DEFAULT NULL,
  `Viaje_id_Viaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transporte`
--

INSERT INTO `transporte` (`id_transporte`, `tipo_transporte`, `capacidad_transporte`, `empresa_transporte`, `id_viaje`, `Viaje_id_Viaje`) VALUES
(1129, 'Barco', '500', 'Maersk line', '2595', 2595),
(1132, 'Barco', '200', 'Maersk line', '2494', 2494),
(1198, 'Bus', '20', 'Sitp', '2393', 2393),
(1291, 'Bus', '30', 'Sitp', '2292', 2292),
(1380, 'Barco', '100', 'Maersk line', '2696', 2696),
(3211, 'Avion', '120', 'Turkish Airlines', '2797', 2797);

--
-- Disparadores `transporte`
--
DELIMITER $$
CREATE TRIGGER `auditoria_Eliminaciontransporte` AFTER DELETE ON `transporte` FOR EACH ROW BEGIN
INSERT INTO auditoria_transporte (
    id_transporteAnterior,
    tipo_transporteAnterior,
    capacidad_transporteAnterior,
    empresa_transporteAnterior,
    id_viajeAnterior,
    Viaje_id_ViajeAnterior,
    id_transporteNuevo,
    tipo_transporteNuevo,
    capacidad_transporteNuevo,
    empresa_transporteNuevo,
    id_viajeNuevo,
    Viaje_id_ViajeNuevo,
    audi_usuario,
    audi_accion 
    ) 
VALUES (
    old.id_transporte,
    old.tipo_transporte,
    old.capacidad_transporte,
    old.empresa_transporte,
    old.id_viaje,
    old.Viaje_id_Viaje,
    ' ', 
    ' ', 
    ' ', 
    ' ', 
    ' ', 
    ' ', 
CURRENT_USER(), 
'Registro eliminado');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria_Modificaciontransporte` BEFORE UPDATE ON `transporte` FOR EACH ROW BEGIN
INSERT INTO auditoria_transporte (
    id_transporteAnterior,
    tipo_transporteAnterior,
    capacidad_transporteAnterior,
    empresa_transporteAnterior,
    id_viajeAnterior,
    Viaje_id_ViajeAnterior,
    id_transporteNuevo,
    tipo_transporteNuevo,
    capacidad_transporteNuevo,
    empresa_transporteNuevo,
    id_viajeNuevo,
    Viaje_id_ViajeNuevo,
    audi_usuario,
    audi_accion 
    )
VALUES (
    old.id_transporte,
    old.tipo_transporte,
    old.capacidad_transporte,
    old.empresa_transporte,
    old.id_viaje,
    old.Viaje_id_Viaje,
    new.id_transporte,
    new.tipo_transporte,
    new.capacidad_transporte,
    new.empresa_transporte,
    new.id_viaje,
    new.Viaje_id_Viaje,
    current_user(), 
    'Actulizacion'
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria_inserciontransporte` AFTER INSERT ON `transporte` FOR EACH ROW BEGIN
INSERT INTO auditoria_transporte (
    id_transporteAnterior,
    tipo_transporteAnterior,
    capacidad_transporteAnterior,
    empresa_transporteAnterior,
    id_viajeAnterior,
    Viaje_id_ViajeAnterior,
    id_transporteNuevo,
    tipo_transporteNuevo,
    capacidad_transporteNuevo,
    empresa_transporteNuevo,
    id_viajeNuevo,
    Viaje_id_ViajeNuevo,
    audi_usuario,
    audi_accion 
    )
VALUES (
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    new.id_transporte,
    new.tipo_transporte,
    new.capacidad_transporte,
    new.empresa_transporte,
    new.id_viaje,
    new.Viaje_id_Viaje,
    current_user(),
    'Inserción'
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `id_Viaje` int(11) NOT NULL,
  `nom_viaje` varchar(45) NOT NULL,
  `fecha_inicioviaje` varchar(45) DEFAULT NULL,
  `fecha_finviaje` varchar(45) DEFAULT NULL,
  `viaje_precio` varchar(45) DEFAULT NULL,
  `id_destino` varchar(45) DEFAULT NULL,
  `Destino_id_Destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `viaje`
--

INSERT INTO `viaje` (`id_Viaje`, `nom_viaje`, `fecha_inicioviaje`, `fecha_finviaje`, `viaje_precio`, `id_destino`, `Destino_id_Destino`) VALUES
(2292, 'San Andres', '2024-10-20', '2024-11-15', '1349873', '3123', 11),
(2393, 'Cartagena', '2024-10-23', '2024-11-27', '2849619', '3301', 12),
(2494, 'Santa marta', '2024-10-07', '2024-11-24', '1061414', '3327', 13),
(2595, 'Punta Cana', '2024-10-06', '2024-11-26', '5532412', '2911', 14),
(2696, 'Cali', '2024-10-12', '2024-11-21', '1133242', '2821', 15),
(2797, 'Medellin', '2024-10-19', '2024-11-16', '1225255', '2941', 16),
(2898, 'Medellin', '2024-10-26', '2024-11-01', '1025051', '1772', 17);

--
-- Disparadores `viaje`
--
DELIMITER $$
CREATE TRIGGER `auditoria_Eliminacionviaje` AFTER DELETE ON `viaje` FOR EACH ROW BEGIN
INSERT INTO auditoria_viaje (
    id_ViajeAnterior,
    nom_viajeAnterior,
    fecha_inicioviajeAnterior,
    fecha_finviajeAnterior,
    viaje_precioAnterior,
    id_destinoAnterior,
    Destino_id_DestinoAnterior,
    id_ViajeNuevo,
    nom_viajeNuevo,
    fecha_inicioviajeNuevo,
    fecha_finviajeNuevo,
    viaje_precioNuevo,
    id_destinoNuevo,
    Destino_id_DestinoNuevo
    )
VALUES (
    old.id_Viaje,
    old.nom_viaje,
    old.fecha_inicioviaje,
    old.fecha_finviaje,
    old.viaje_precio,
    old.id_destino,
    old.Destino_id_Destino,
' ', 
' ', 
' ', 
' ', 
' ', 
' ',
' ',
now(), 
CURRENT_USER(), 
'Registro eliminado');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria_Modificacionviaje` BEFORE UPDATE ON `viaje` FOR EACH ROW BEGIN
INSERT INTO auditoria_viaje (
    id_ViajeAnterior,
    nom_viajeAnterior,
    fecha_inicioviajeAnterior,
    fecha_finviajeAnterior,
    viaje_precioAnterior,
    id_destinoAnterior,
    Destino_id_DestinoAnterior,
    id_ViajeNuevo,
    nom_viajeNuevo,
    fecha_inicioviajeNuevo,
    fecha_finviajeNuevo,
    viaje_precioNuevo,
    id_destinoNuevo,
    Destino_id_DestinoNuevo
    )
VALUES (
    old.id_Viaje,
    old.nom_viaje,
    old.fecha_inicioviaje,
    old.fecha_finviaje,
    old.viaje_precio,
    old.id_destino,
    old.Destino_id_Destino,
    new.id_Viaje,
    new.nom_viaje,
    new.fecha_inicioviaje,
    new.fecha_finviaje,
    new.viaje_precio,
    new.id_destino,
    new.Destino_id_Destino,
    now(), 
    current_user(), 
    'Actulizacion'
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria_insercionviaje` AFTER INSERT ON `viaje` FOR EACH ROW BEGIN
INSERT INTO auditoria_viaje (
    id_ViajeAnterior,
    nom_viajeAnterior,
    fecha_inicioviajeAnterior,
    fecha_finviajeAnterior,
    viaje_precioAnterior,
    id_destinoAnterior,
    Destino_id_DestinoAnterior,
    id_ViajeNuevo,
    nom_viajeNuevo,
    fecha_inicioviajeNuevo,
    fecha_finviajeNuevo,
    viaje_precioNuevo,
    id_destinoNuevo,
    Destino_id_DestinoNuevo
    )
VALUES (
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    new.id_Viaje,
    new.nom_viaje,
    new.fecha_inicioviaje,
    new.fecha_finviaje,
    new.viaje_precio,
    new.id_destino,
    new.Destino_id_Destino,
    now(), 
    current_user(),
    'Inserción'
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistaclientesreservas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistaclientesreservas` (
`idCliente` int(11)
,`clie_nombre` varchar(45)
,`clie_apellido` varchar(45)
,`id_Reserva` int(11)
,`fecha_reserva` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistatransporteviaje`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistatransporteviaje` (
`id_transporte` int(11)
,`tipo_transporte` varchar(45)
,`id_Viaje` int(11)
,`nom_viaje` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vistaclientesreservas`
--
DROP TABLE IF EXISTS `vistaclientesreservas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistaclientesreservas`  AS SELECT `cliente`.`idCliente` AS `idCliente`, `cliente`.`clie_nombre` AS `clie_nombre`, `cliente`.`clie_apellido` AS `clie_apellido`, `reserva`.`id_Reserva` AS `id_Reserva`, `reserva`.`fecha_reserva` AS `fecha_reserva` FROM (`reserva` join `cliente` on(`reserva`.`Cliente_idCliente` = `cliente`.`idCliente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistatransporteviaje`
--
DROP TABLE IF EXISTS `vistatransporteviaje`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistatransporteviaje`  AS SELECT `transporte`.`id_transporte` AS `id_transporte`, `transporte`.`tipo_transporte` AS `tipo_transporte`, `viaje`.`id_Viaje` AS `id_Viaje`, `viaje`.`nom_viaje` AS `nom_viaje` FROM (`transporte` join `viaje` on(`transporte`.`Viaje_id_Viaje` = `viaje`.`Destino_id_Destino`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `destino`
--
ALTER TABLE `destino`
  ADD PRIMARY KEY (`id_Destino`);

--
-- Indices de la tabla `guia`
--
ALTER TABLE `guia`
  ADD PRIMARY KEY (`id_guia`),
  ADD KEY `Viaje_id_Viaje` (`Viaje_id_Viaje`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_Hotel`),
  ADD KEY `id_destino` (`id_destino`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`id_Paquete`),
  ADD KEY `Viaje_id_Viaje` (`Viaje_id_Viaje`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_Reserva`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`),
  ADD KEY `Viaje_id_Viaje` (`Viaje_id_Viaje`);

--
-- Indices de la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD PRIMARY KEY (`id_transporte`),
  ADD KEY `Viaje_id_Viaje` (`Viaje_id_Viaje`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`id_Viaje`),
  ADD KEY `Destino_id_Destino` (`Destino_id_Destino`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `guia`
--
ALTER TABLE `guia`
  ADD CONSTRAINT `guia_ibfk_1` FOREIGN KEY (`Viaje_id_Viaje`) REFERENCES `viaje` (`id_Viaje`);

--
-- Filtros para la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`id_destino`) REFERENCES `destino` (`id_Destino`);

--
-- Filtros para la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`Viaje_id_Viaje`) REFERENCES `viaje` (`id_Viaje`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`Viaje_id_Viaje`) REFERENCES `viaje` (`id_Viaje`);

--
-- Filtros para la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD CONSTRAINT `transporte_ibfk_1` FOREIGN KEY (`Viaje_id_Viaje`) REFERENCES `viaje` (`id_Viaje`);

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`Destino_id_Destino`) REFERENCES `destino` (`id_Destino`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
