-- phpMyAdmin SQL Dump
-- version 3.4.11.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 01-12-2012 a las 10:37:50
-- Versión del servidor: 5.1.65
-- Versión de PHP: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `brain140_wasabi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_tipoBebida`
--

CREATE TABLE IF NOT EXISTS `wsb_tipoBebida` (
  `id_tipoBebida` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo` int(11) DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  `img_silueta` varchar(50) NOT NULL,
  `img_pequena` varchar(50) NOT NULL,
  `img_principal` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipoBebida`),
  KEY `id_tipo` (`id_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `wsb_tipoBebida`
--

INSERT INTO `wsb_tipoBebida` (`id_tipoBebida`, `id_tipo`, `nombre`, `descripcion`, `img_silueta`, `img_pequena`, `img_principal`) VALUES
(1, 9, 'Jugos', NULL, 'jugos_silueta.png', 'jugos_p.png', 'jugos.png'),
(2, 9, 'Gaseosas', NULL, 'gaseosas_silueta.png', 'gaseosas_p.png', 'gaseosas.png'),
(3, 9, 'Cervezas', NULL, 'cervezas_silueta.png', 'cervezas_p.png', 'cervezas.png'),
(4, 9, 'Pousse cafes', NULL, 'pousse_cafes_silueta.png', 'pousse_cafes_p.png', 'pousse_cafes.png'),
(5, 9, 'Bebidas Calientes', NULL, 'bebidas_calientes_silueta.png', 'bebidas_calientes_p.png', 'bebidas_calientes.png'),
(6, 10, 'Vinos', NULL, 'vinos_silueta.png', 'vinos_p.png', 'vinos.png'),
(7, 10, 'Cocteles', NULL, 'cocteles_silueta.png', 'cocteles_p.png', 'cocteles.png'),
(8, 10, 'Aperitivos', NULL, 'aperitivos_silueta.png', 'aperitivos_p.png', 'aperitivos.png'),
(9, 10, 'Licores', NULL, 'licores_silueta.png', 'licores_p.png', 'licores.png');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `wsb_tipoBebida`
--
ALTER TABLE `wsb_tipoBebida`
  ADD CONSTRAINT `wsb_tipoBebida_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `wsb_tipoPlato` (`id_tipoPlato`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
