-- phpMyAdmin SQL Dump
-- version 3.4.11.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 01-12-2012 a las 10:23:41
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
-- Estructura de tabla para la tabla `wsb_bebida`
--

CREATE TABLE IF NOT EXISTS `wsb_bebida` (
  `id_bebida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  `id_tipoBebida` int(11) NOT NULL,
  `id_categoriaBebida` int(11) DEFAULT NULL,
  `precio_principal` int(11) DEFAULT NULL,
  `precio_media` int(11) DEFAULT NULL,
  `precio_trago` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bebida`),
  KEY `id_tipoBebida` (`id_tipoBebida`),
  KEY `id_categoriaBebida` (`id_categoriaBebida`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=145 ;

--
-- Volcado de datos para la tabla `wsb_bebida`
--

INSERT INTO `wsb_bebida` (`id_bebida`, `nombre`, `descripcion`, `id_tipoBebida`, `id_categoriaBebida`, `precio_principal`, `precio_media`, `precio_trago`) VALUES
(1, 'JUGO DE MANDARINA', NULL, 1, NULL, 6500, NULL, NULL),
(2, 'LIMONADA DE COCO', NULL, 1, NULL, 6500, NULL, NULL),
(3, 'JUGO DE MANGO BICHE', NULL, 1, NULL, 6500, NULL, NULL),
(4, 'LIMONADA NATURAL', NULL, 1, NULL, 6500, NULL, NULL),
(5, 'JUGO DE FRESA ', NULL, 1, NULL, 6500, NULL, NULL),
(6, 'JUGO DE MANGO', NULL, 1, NULL, 6500, NULL, NULL),
(7, 'JUGO DE MARACUYA', NULL, 1, NULL, 6500, NULL, NULL),
(8, 'JUGO DE MORA ', NULL, 1, NULL, 6500, NULL, NULL),
(9, 'JUGO DE PIÑA', NULL, 1, NULL, 6500, NULL, NULL),
(10, 'JUGO DE GUANABANA', NULL, 1, NULL, 6500, NULL, NULL),
(11, 'JUGO DE FEIJOA', NULL, 1, NULL, 6500, NULL, NULL),
(12, 'JUGO DE FRESA-LIMÓN', NULL, 1, NULL, 6500, NULL, NULL),
(13, 'JUGO DE LULO-LIMÓN', NULL, 1, NULL, 6500, NULL, NULL),
(14, 'JUGO DE FRESA-NARANJA', NULL, 1, NULL, 6500, NULL, NULL),
(15, 'JUGO DE FRESA-MANDARINA', NULL, 1, NULL, 6500, NULL, NULL),
(16, 'COCA COLA', NULL, 2, NULL, 3500, NULL, NULL),
(17, 'COCA COLA ZERO', NULL, 2, NULL, 3500, NULL, NULL),
(18, 'COCA COLA LIGHT ', NULL, 2, NULL, 3500, NULL, NULL),
(19, 'SPRITE', NULL, 2, NULL, 3500, NULL, NULL),
(20, 'SPRITE LIGHT', NULL, 2, NULL, 3500, NULL, NULL),
(21, 'GINGER', NULL, 2, NULL, 3500, NULL, NULL),
(22, 'SODA', NULL, 2, NULL, 3500, NULL, NULL),
(23, 'AGUA', NULL, 2, NULL, 3500, NULL, NULL),
(24, 'AGUA CON GAS', NULL, 2, NULL, 3500, NULL, NULL),
(25, 'AGUA TONICA', NULL, 2, NULL, 3500, NULL, NULL),
(26, 'FUZE TEA', NULL, 2, NULL, 4500, NULL, NULL),
(27, 'RED BULL', NULL, 2, NULL, 10500, NULL, NULL),
(28, 'ASAHI ', NULL, 3, NULL, 8000, NULL, NULL),
(29, 'PERONI', NULL, 3, NULL, 8000, NULL, NULL),
(30, 'KIRINI', NULL, 3, NULL, 8000, NULL, NULL),
(31, 'NEGRA MODELO', NULL, 3, NULL, 8000, NULL, NULL),
(32, 'CLUB COLOMBIA', NULL, 3, NULL, 6000, NULL, NULL),
(33, 'AGUILA LIGHT', NULL, 3, NULL, 5000, NULL, NULL),
(34, 'GUINEAS IRISH SCOUT', NULL, 3, NULL, 12000, NULL, NULL),
(35, 'CORONA', NULL, 3, NULL, 9000, NULL, NULL),
(36, 'BAILEYS', NULL, 4, NULL, 10000, NULL, NULL),
(37, 'SAMBUCA', NULL, 4, NULL, 15000, NULL, NULL),
(38, 'COINTREAU', NULL, 4, NULL, 14000, NULL, NULL),
(39, 'AMARETTO', NULL, 4, NULL, 14000, NULL, NULL),
(40, 'RICARDO', NULL, 4, NULL, 15000, NULL, NULL),
(41, 'TE', NULL, 5, NULL, 5000, NULL, NULL),
(42, 'INFUSIÓN DE FRUTAS', NULL, 5, NULL, 4000, NULL, NULL),
(43, 'EXPRESSO RISTRETTO', NULL, 5, NULL, 4000, NULL, NULL),
(44, 'EXPRESSO LUNEO', NULL, 5, NULL, 4000, NULL, NULL),
(45, 'CAFÉ AMERICANO', NULL, 5, NULL, 4000, NULL, NULL),
(46, 'CAFÉ LATTE', NULL, 5, NULL, 5000, NULL, NULL),
(47, 'MOCACCINO', NULL, 5, NULL, 7000, NULL, NULL),
(48, 'MACCIATO ', NULL, 5, NULL, 4000, NULL, NULL),
(49, 'CAPUCCINO', NULL, 5, NULL, 6000, NULL, NULL),
(50, 'CAPUCCINO SABORIZADO', NULL, 5, NULL, 7000, NULL, NULL),
(51, 'UNDURRAGA CARMENERE RESERVA ', NULL, 6, 1, 93000, NULL, NULL),
(52, 'UNDURRAGA PINOT NOIR', NULL, 6, 1, 93000, NULL, NULL),
(53, 'UNDURRAGA CABERNET PINOT', NULL, 6, 1, 60000, 36000, NULL),
(54, 'UNDURRAGA CABERNET SAUVIGNON', NULL, 6, 1, 57000, 33000, NULL),
(55, 'SANTA RITA CABERNET SAUVIGNON', NULL, 6, 1, 60000, 35000, NULL),
(56, 'UNDURRAGA RIESLING', NULL, 6, 2, 60000, 36000, NULL),
(57, 'UNDURRAGA SAUVIGNON BLANCO', NULL, 6, 2, 56000, 35000, NULL),
(58, 'UNDURRAGA GEWURZTRAMINER', NULL, 6, 2, 65000, NULL, NULL),
(59, 'ALIWEN CHARDONNAY ', NULL, 6, 2, 87000, NULL, NULL),
(60, 'DA TARIFA SAUVIGNON', NULL, 6, 2, 60000, 45000, NULL),
(61, 'FREYXENET NEGRO', NULL, 6, 3, 80000, NULL, NULL),
(62, 'FREYXENET PICCOLO', NULL, 6, 3, 27000, NULL, NULL),
(63, 'NUVO', NULL, 6, 3, 120000, NULL, NULL),
(64, 'CHANDON EXTRA BRUT', NULL, 6, 3, 80000, NULL, NULL),
(65, 'DOM PERIGNON BOTELLA', NULL, 6, 4, 1160000, NULL, NULL),
(66, 'MOET AND CHANDON BRUT - IMPERIAL ROSETTA', NULL, 6, 4, 400000, NULL, NULL),
(67, 'VEUVE CLICQUOT BRUT', NULL, 6, 4, 380000, NULL, NULL),
(68, 'ALEXANDER', NULL, 7, NULL, 17000, NULL, NULL),
(69, 'BLODY MARY', NULL, 7, NULL, 17000, NULL, NULL),
(70, 'COSMOPOLITAN', NULL, 7, NULL, 18000, NULL, NULL),
(71, 'DRY MARTINI', NULL, 7, NULL, 20000, NULL, NULL),
(72, 'MARTINI WASABI', NULL, 7, NULL, 20000, NULL, NULL),
(73, 'MARTINI MÉDIUM ', NULL, 7, NULL, 17000, NULL, NULL),
(74, 'MARTINI DULCE', NULL, 7, NULL, 19000, NULL, NULL),
(75, 'MATINI APADAGO', NULL, 7, NULL, 17000, NULL, NULL),
(76, 'PERRO SALADO CON GINEBRA', NULL, 7, NULL, 17000, NULL, NULL),
(77, 'TOM COLLINS ', NULL, 7, NULL, 17000, NULL, NULL),
(78, 'CUBA LIBRE', NULL, 7, NULL, 15000, NULL, NULL),
(79, 'PIÑA COLADA', NULL, 7, NULL, 17000, NULL, NULL),
(80, 'ZOMBIE', NULL, 7, NULL, 17000, NULL, NULL),
(81, 'ESCORPION', NULL, 7, NULL, 17000, NULL, NULL),
(82, 'DAIFURI DE GINEBRA', NULL, 7, NULL, 15000, NULL, NULL),
(83, 'MARGARITA FRAPPE', NULL, 7, NULL, 18000, NULL, NULL),
(84, 'MARGARITA MARACUYA', NULL, 7, NULL, 20000, NULL, NULL),
(85, 'MARGARITA FRESA', NULL, 7, NULL, 20000, NULL, NULL),
(86, 'MARGARITA MANGO', NULL, 7, NULL, 20000, NULL, NULL),
(87, 'MARGARITA PIN?A', NULL, 7, NULL, 20000, NULL, NULL),
(88, 'ROMEO Y JULIETA', NULL, 7, NULL, 20000, NULL, NULL),
(89, 'LABIOS DE FRESA ', NULL, 7, NULL, 17000, NULL, NULL),
(90, 'TEQUILA SUNRISE', NULL, 7, NULL, 17000, NULL, NULL),
(91, 'TEQUILA TO?NICA', NULL, 7, NULL, 15000, NULL, NULL),
(92, 'BESO ROJO', NULL, 7, NULL, 17000, NULL, NULL),
(93, 'MOJITO', NULL, 7, NULL, 17000, NULL, NULL),
(94, 'PERRO SALADO DE VODKA', NULL, 7, NULL, 17000, NULL, NULL),
(95, 'VODKAINI', NULL, 7, NULL, 17000, NULL, NULL),
(96, 'VODKA TO?NIKA', NULL, 7, NULL, 15000, NULL, NULL),
(97, 'VODKA ESCARCHADO', NULL, 7, NULL, 17000, NULL, NULL),
(98, 'VINO CALIENTE', NULL, 7, NULL, 17000, NULL, NULL),
(99, 'CON?AC TROPICAL', NULL, 7, NULL, 18000, NULL, NULL),
(100, 'BESO DE CEREZA', NULL, 7, NULL, 18000, NULL, NULL),
(101, 'CON?AC DE NARANJA', NULL, 7, NULL, 17000, NULL, NULL),
(102, 'MANHATAN DRY', NULL, 7, NULL, 17000, NULL, NULL),
(103, 'MANHATAN SWEET', NULL, 7, NULL, 17000, NULL, NULL),
(104, 'CORONEL COLLINS', NULL, 7, NULL, 17000, NULL, NULL),
(105, 'AMOR DE WASABI', NULL, 7, NULL, 20000, NULL, NULL),
(106, 'ATARDECER EN MIAMI ', NULL, 7, NULL, 18000, NULL, NULL),
(107, 'WASABI ', NULL, 7, NULL, 20000, NULL, NULL),
(108, 'CAMPARI', NULL, 8, NULL, 11000, NULL, NULL),
(109, 'DUBONNET', NULL, 8, NULL, 11000, NULL, NULL),
(110, 'JEREZ LA INA', NULL, 8, NULL, 13000, NULL, NULL),
(111, 'JEREZ TIO PEPE', NULL, 8, NULL, 11000, NULL, NULL),
(112, 'JARRA SAKE', NULL, 8, NULL, 11000, NULL, NULL),
(113, 'REMI MARTIN V.S.O.P.', NULL, 9, 5, 23000, NULL, NULL),
(114, 'HENNESY V.S.O.P.', NULL, 9, 5, 23000, NULL, NULL),
(115, 'BOMBAY', NULL, 9, 6, 166000, NULL, 13000),
(116, 'TRES ESQUINAS', NULL, 9, 8, 94000, 57000, 9000),
(117, 'TANQUERAY', NULL, 9, 6, 153000, NULL, 11000),
(118, 'TANQUERAY TEN', NULL, 9, 6, 232000, NULL, 16000),
(119, 'BEEFEATER', NULL, 9, 6, 153000, NULL, 11000),
(120, 'HERRADURA', NULL, 9, 7, 179000, NULL, 16000),
(121, 'JIMADOR REPOSADO', NULL, 9, 7, 179000, NULL, 16000),
(122, 'JOSE CUERVO', NULL, 9, 7, 153000, NULL, 13000),
(123, 'DON JULIO', NULL, 9, 7, 232000, NULL, 16000),
(124, 'BACARDI CARTA BLANCA', NULL, 9, 8, 96000, NULL, 10000),
(125, 'BACARDI ORO', NULL, 9, 8, 94000, NULL, 9000),
(126, 'RON ZAPACA 15 AN?OS', NULL, 9, 8, 130000, NULL, 13000),
(127, 'RON ZAPACA 23 AN?OS', NULL, 9, 8, 180000, NULL, NULL),
(128, 'CIROC', NULL, 9, 9, 179000, NULL, 19000),
(129, 'ABSOLUT BLUE', NULL, 9, 9, 153000, 89000, 13000),
(130, 'ABSOLUT CITRON', NULL, 9, 9, NULL, NULL, 13000),
(131, 'SMIRNOFF', NULL, 9, 9, 100000, 50000, 9000),
(132, 'BELVEDERE', NULL, 9, 9, 217000, NULL, NULL),
(133, 'BUCHANANS 18 AN?OS', NULL, 9, 10, 350000, NULL, 25000),
(134, 'BUCHANANS 12 AN?OS', NULL, 9, 10, 204000, 130000, 13000),
(135, 'CHIVAS REGAL', NULL, 9, 10, 204000, NULL, 19000),
(136, 'OLD PAR 12 AN?OS', NULL, 9, 10, 204000, 130000, 13000),
(137, 'OLD PAR SUPERIOR', NULL, 9, 10, 350000, NULL, NULL),
(138, 'SELLO NEGRO', NULL, 9, 10, 204000, 121000, 19000),
(139, 'SELLO ROJO', NULL, 9, 10, 140000, 89000, 15000),
(140, 'SELLO AZUL', NULL, 9, 10, 815000, NULL, NULL),
(141, 'SELLO DORADO', NULL, 9, 10, 340000, NULL, NULL),
(142, 'SELLO VERDE', NULL, 9, 10, 270000, NULL, NULL),
(143, 'BALLANTINES 12 AN?OS', NULL, 9, 10, 204000, NULL, 19000),
(144, 'BALLANTINES 8 AN?OS', NULL, 9, 10, 145000, NULL, 15000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_bebidaxpedido`
--

CREATE TABLE IF NOT EXISTS `wsb_bebidaxpedido` (
  `id_bebidaxpedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_bebida` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_bebidaxpedido`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_bebida` (`id_bebida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_categoriaBebida`
--

CREATE TABLE IF NOT EXISTS `wsb_categoriaBebida` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `wsb_categoriaBebida`
--

INSERT INTO `wsb_categoriaBebida` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'TINTOS', NULL),
(2, 'BLANCOS', NULL),
(3, 'ESPUMOSOS', NULL),
(4, 'CHAMPAGNE', NULL),
(5, 'COGÑAC', NULL),
(6, 'GINEBRA', NULL),
(7, 'TEQUILA', NULL),
(8, 'RON', NULL),
(9, 'VODKA', NULL),
(10, 'WHISKEY', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_estado`
--

CREATE TABLE IF NOT EXISTS `wsb_estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `wsb_estado`
--

INSERT INTO `wsb_estado` (`id_estado`, `nombre`, `descripcion`) VALUES
(1, 'Ocupada', 'Cuando la mesa no está disponible ya que hay clientes en ella.'),
(2, 'Disponible', 'Cuando la mesa esta disponible para su uso.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_mesa`
--

CREATE TABLE IF NOT EXISTS `wsb_mesa` (
  `id_mesa` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `descripcion` longtext CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  PRIMARY KEY (`id_mesa`),
  KEY `id_estado` (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `wsb_mesa`
--

INSERT INTO `wsb_mesa` (`id_mesa`, `id_estado`, `numero`, `descripcion`) VALUES
(1, 1, 1, 'Salón 1 - Mesa 1 - Pared izquierda'),
(2, 1, 2, 'Salón 1 - Mesa 2 - Pared izquierda'),
(3, 2, 3, 'Salón 1 - Mesa 3 - Pared izquierda'),
(4, 2, 4, 'Salón 1 - Mesa 4 - Pared izquierda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_pedido`
--

CREATE TABLE IF NOT EXISTS `wsb_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_mesa` int(11) NOT NULL,
  `totalCuenta` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_mesa` (`id_mesa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- Volcado de datos para la tabla `wsb_pedido`
--

INSERT INTO `wsb_pedido` (`id_pedido`, `id_mesa`, `totalCuenta`, `estado`, `fecha`) VALUES
(75, 2, 53800, 'solicitado', '2012-11-28 16:35:36'),
(76, 0, 27900, 'solicitado', '2012-11-28 16:35:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_plato`
--

CREATE TABLE IF NOT EXISTS `wsb_plato` (
  `id_plato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  `id_tipoplato` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `img_grande` varchar(50) NOT NULL,
  `img_pequena` varchar(50) NOT NULL,
  `img_principal` varchar(50) NOT NULL,
  PRIMARY KEY (`id_plato`),
  KEY `id_tipoplato` (`id_tipoplato`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Volcado de datos para la tabla `wsb_plato`
--

INSERT INTO `wsb_plato` (`id_plato`, `nombre`, `descripcion`, `id_tipoplato`, `precio`, `img_grande`, `img_pequena`, `img_principal`) VALUES
(2, 'Beef Teppan', 'Lomo fino de res acompañado de vegetales a la plancha.', 5, 1800, 'teppanyaki_carnes_g.png', 'teppanyaki_carnes_p.png', 'teppanyaki_carnes.png'),
(3, 'Spicy roll sake', 'Salmón picante, cebolla, mayonesa japonesa, shiracha y jengibre.', 6, 12345, 'sushi_spicy_roll_sake_g.png', 'sushi_spicy_roll_sake_p.png', 'sushi_spicy_roll_sake.png'),
(4, 'Ojo de tigre', 'Salmón, atún, palmito de cangrejo en temparatura, masago, aguacate y salsa TNT.', 6, 21900, 'sushi_spicy_roll_sake_g.png', 'sushi_ojo_de_tigre_p.png', 'sushi_spicy_roll_sake.png'),
(5, 'California spicy', 'Palmito de cangrejo con salsa TNT, forrado en aguacate.', 6, 22900, 'sushi_california_spicy_g.png', 'sushi_california_spicy_p.png', 'sushi_california_spicy.png'),
(6, 'Ebi tempura', 'Langostino tempura, mayonesa japonesa, aguacate y verduras tempura.', 6, 22900, 'sushi_ebi_tempura_g.png', 'sushi_ebi_tempura_p.png', 'sushi_ebi_tempura.png'),
(7, 'Skin roll', 'Aguacate, espárragos, ajonjolí y piel de salmón crocante.', 6, 22900, 'sushi_skin_roll_g.png', 'sushi_skin_roll_p.png', 'sushi_skin_roll.png'),
(8, 'Ebi'' kan roll', 'Langostino cocinado, palmito de cangrejo y lechuga forrado en salmón y aguacate, bañado con dip de wasabi.', 6, 26000, 'sushi_ebikan_roll_g.png', 'sushi_ebikan_roll_p.png', 'sushi_ebikan_roll.png'),
(9, 'Spider roll', 'Cangrejo de concha blanda, mayonesa japonesa, masago y aguacate, forrado en ajonjolí.', 6, 26000, 'sushi_spider_roll_g.png', 'sushi_spider_roll_p.png', 'sushi_spider_roll.png'),
(10, 'Sake tempura', 'Salmón tempura, mayonesa japonesa, lechuga y ajonjoli.', 6, 21900, 'sushi_sake_tempura_g.png', 'sushi_sake_tempura_p.png', 'sushi_sake_tempura.png'),
(11, 'Kappa maki', 'Pepino, aguacate y ajonjolí.', 6, 11900, 'sushi_kappa_maki_g.png', 'sushi_kappa_maki_p.png', 'sushi_kappa_maki.png'),
(12, 'Kani - zu', 'Palmito de cangrejo, masago y aguacate, envuelto en pepino.', 6, 17900, 'sushi_kani_-_zu_g.png', 'sushi_kani_-_zu_p.png', 'sushi_kani_-_zu.png'),
(13, 'Fabi roll', 'Samón crispy y aguacate, cubierto con palmito de cangrejo y salsa TNT.', 6, 25000, 'sushi_fabi_roll_g.png', 'sushi_fabi_roll_p.png', 'sushi_fabi_roll.png'),
(14, 'Ell - sake', 'Salmón y queso crema, forrado en anguila y salsa teriyaki.', 6, 26000, 'sushi_fabi_roll_g.png', 'sushi_ell_-_sake_p.png', 'sushi_fabi_roll.png'),
(15, 'Jho''els roll', 'Langostino crispy y aguacate, forrado en anguila y salsa teriyaki.', 6, 28900, 'sushi_jhoels_roll_g.png', 'sushi_jhoels_roll_p.png', 'sushi_jhoels_roll.png'),
(16, 'Spicy roll tuna', 'Atún picante, cebolla, mayonesa japonesa, shiracha y jengibre.', 6, 23900, 'sushi_spicy_roll_tuna_g.png', 'sushi_spicy_roll_tuna_p.png', 'sushi_spicy_roll_tuna.png'),
(17, 'Wasabi roll', 'Salmón, queso crema, durazno apanado al estilo katzu, con nuestra salsa especial.', 6, 23900, 'sushi_wasabi_roll.png', 'sushi_wasabi_roll_p.png', 'sushi_wasabi_roll.png'),
(18, 'California roll', 'Palmito de cangrejo, pepino y aguacate forrado en masago.', 6, 21900, 'sushi_california_g.png', 'sushi_california_p.png', 'sushi_california.png'),
(19, 'Ebi roll', 'Langostino precocido, pepino, mango biche y masago forrado en aguacate.', 6, 22900, 'sushi_california_g.png', 'sushi_ebi_roll_p.png', 'sushi_california.png'),
(20, 'Philadelphia roll', 'Salmón  y queso crema forrados en ajonjolí.', 6, 21900, 'sushi_philadephia_roll_g.png', 'sushi_philadephia_roll_p.png', 'sushi_philadephia_roll.png'),
(21, 'Vegetariano', 'Queso crema, pepino, aguacate, mango, espárragos, lechuga y ajonjolí.', 6, 15900, 'sushi_vegetariano_g.png', 'sushi_vegetariano_p.png', 'sushi_vegetariano.png'),
(22, 'Crazy roll', 'Queso crema, pepino, aguacate, y piel de salmón crocante, forrado en masago.', 6, 20900, 'sushi_crazy_roll_g.png', 'sushi_crazy_roll_p.png', 'sushi_crazy_roll.png'),
(23, 'Anago maki', 'Anguila caliente con un toque de salsa teriyaki.', 6, 24900, 'sushi_crazy_roll_g.png', 'sushi_anago_maki_p.png', 'sushi_anago_maki.png'),
(24, 'Kani roll', 'Palmito de cangrejo, mayonesa japonesa, aguacate y verduras tempura, forrado en ajonjolí.', 6, 22900, 'sushi_crazy_roll_g.png', 'sushi_kaniroll_p.png', 'sushi_anago_maki.png'),
(25, 'Tekka maki', 'Rollo de atún', 6, 20900, 'sushi_tekka_maki_g.png', 'sushi_tekka_maki_p.png', 'sushi_tekka_maki.png'),
(26, 'Jen''s roll', 'Salmón, mayonesa japonesa y verduras tempura, forrado en palmito de cangrejo.', 6, 23900, 'sushi_tekka_maki_g.png', 'sushi_jensroll_p.png', 'sushi_tekka_maki.png'),
(27, 'Sake maki', 'Rollo de salmón.', 6, 20900, 'sushi_sake_maki_g.png', 'sushi_sake_maki_p.png', 'sushi_sake_maki.png'),
(28, 'Katsu roll', 'Pargo rojo al estilo katsu, aguacate, cebollin, y salsa TNT.', 6, 21900, 'sushi_katsu_roll_g.png', 'sushi_katsu_roll_p.png', 'sushi_katsu_roll.png'),
(29, 'Peach roll mix', 'Anguila y langostino en tempura con queso crema, palmito de cangrejo forrado en durazno con nuestra salsa especial de la casa.', 6, 24900, 'sushi_peach_roll_mix_g.png', 'sushi_peach_roll_mix_p.png', 'sushi_peach_roll_mix.png'),
(30, 'Tiradito roll', 'Pescado blanco marinado al estilo ceviche con aguacate y palmito cubierto con cebollín.', 6, 22900, 'sushi_tiradito_roll_g.png', 'sushi_tiradito_roll_p.png', 'sushi_tiradito_roll.png'),
(31, 'Rainbow', 'Clásico California forrado en diferentes cortes de pescado.', 6, 23900, 'sushi_tiradito_roll_g.png', 'sushi_rainbow_p.png', 'sushi_tiradito_roll.png'),
(32, 'Magic roll', 'Langostino y anguila en tempura con queso crema cubierto de masago y aguacate.', 6, 25900, 'sushi_magic_roll_g.png', 'sushi_magic_roll_p.png', 'sushi_magic_roll.png'),
(33, 'Avocado crispy', 'Salmón, queso crema, forrado en aguacate, cubierto de kani kamma en salsa dinamita con crispy tempura.', 6, 24900, 'sushi_avocado_crispy_g.png', 'sushi_avocado_crispy_p.png', 'sushi_avocado_crispy.png'),
(34, 'Hot cream roll', 'Pescado blanco apanado y queso crema. Cubierto por un gratinado de scalops, kani kamma y salsa TNT.', 6, 27900, 'sushi_hot_cream_roll_g.png', 'sushi_hot_cream_roll_p.png', 'sushi_hot_cream_roll.png'),
(35, 'Ban'' anguil sweet', 'Anguila, banana, queso crema, forrado en palmito de cangrejo, acompañado de salsa teriyaki.', 6, 23900, 'sushi_crazy_roll_g.png', 'sushi_ban_anguil_sweet_p.png', 'sushi_hot_cream_roll.png'),
(36, 'Tropical roll', 'Fresa, durazno, queso crema, forrado en fina tempura crocante con salsa agridulce.', 6, 14000, 'sushi_tropical_roll_g.png', 'sushi_tropical_roll_p.png', 'sushi_tropical_roll.png'),
(37, 'Ebi tropical', 'Langostino crispy, queso crema, palmito, forrado en mango biche.', 6, 21000, 'sushi_tropical_roll_g.png', 'sushi_ebi_tropical_p.png', 'sushi_tropical_roll.png'),
(38, 'Mar'' mari roll', 'Langostino crispí, palmito de cangrejo, queso crema y aguacate forrado en verduras crocantes.', 6, 24900, 'sushi_tropical_roll_g.png', 'sushi_mar_mari_roll_p.png', 'sushi_anago_maki.png'),
(39, 'Ceviche mixto', 'Variedad de mariscos macerados en jugo de limón con el especial aderezo de la casa.', 1, 25200, 'entrada_ceviche_mixto_g.png', 'entrada_ceviche_mixto_p.png', 'entrada_ceviche_mixto.png'),
(40, 'Kani-kama ball', 'Bolitas de palmito de cangrejo crocantes, acompañadas de salsa de maní y agridulce.', 1, 11900, 'entrada_kani-kama_ball_g.png', 'entrada_kani-kama_ball_p.png', 'entrada_kani-kama_ball.png'),
(41, 'Oriental taste', 'Una especial combinación de algunas de nuestras entradas.', 1, 28900, 'entrada_oriental_taste_g.png', 'entrada_oriental_taste_p.png', 'entrada_oriental_taste.png'),
(42, 'Sea mix open', 'Composición de Vegetales frescos y langostinos en tempura acompañados de una especial vinagreta.', 1, 17900, 'entrada_sea_mix_open_g.png', 'entrada_sea_mix_open_p.png', 'entrada_sea_mix_open.png'),
(43, 'Summer roll - vegetales', 'Vegetales fríos envueltos en papel de arroz con mango biche y cebollín.', 1, 10500, 'entrada_summer_roll_g.png', 'entrada_summer_roll_p.png', 'entrada_summer_roll.png'),
(44, 'Summer roll - pollo', 'Vegetales fríos envueltos en papel de arroz con mango biche y cebollín.', 1, 13300, 'entrada_summer_roll_g.png', 'entrada_summer_roll_p.png', 'entrada_summer_roll.png'),
(45, 'Summer roll - camarón', 'Vegetales fríos envueltos en papel de arroz con mango biche y cebollín.', 1, 16400, 'entrada_summer_roll_g.png', 'entrada_summer_roll_p.png', 'entrada_summer_roll.png'),
(46, 'Tacos thai - Pollo', 'Dos tortillas de harina de trigo rellenas de aguacate, tomate, espinaca y mayonesa japonesa.', 1, 13900, 'entrada_tacos_thai_g.png', 'entrada_tacos_thai_p.png', 'entrada_tacos_thai.png'),
(47, 'Tacos thai - Mixto', 'Dos tortillas de harina de trigo rellenas de aguacate, tomate, espinaca y mayonesa japonesa.', 1, 14300, 'entrada_tacos_thai_g.png', 'entrada_tacos_thai_p.png', 'entrada_tacos_thai.png'),
(48, 'Tacos thai - Lomo', 'Dos tortillas de harina de trigo rellenas de aguacate, tomate, espinaca y mayonesa japonesa.', 1, 14900, 'entrada_tacos_thai_g.png', 'entrada_tacos_thai_p.png', 'entrada_tacos_thai.png'),
(49, 'Tiradito de mero', 'Finos cortes de mero, macerados en jugo de limón y adobados en nuestras especias orientales, con una adición de aguacate y maíz tierno.', 1, 19900, 'entrada_tiradito_de_mero_g.png', 'entrada_tiradito_de_mero_p.png', 'entrada_tiradito_de_mero.png'),
(50, 'Ensalada de pollo', 'Variedad de lechugas frescas, aguacate, croutones, queso parmesano y pepino con pechuga de pollo en salsa teriyaki.', 2, 18600, 'ensaladas_ensalada_de_pollo_g.png', 'ensaladas_ensalada_de_pollo_p.png', 'ensaladas_ensalada_de_pollo.png'),
(51, 'Tom-Yam', 'Sopa con calamares, camarones, pescado blanco, al mejor estilo thai, picante con pasta, champiñones y especies.', 3, 30900, 'sopa_tom-yam_g.png', 'sopa_tom-yam_p.png', 'sopa_tom-yam.png'),
(52, 'Costillitas agridulces wasabi', 'Costillas de res en una salsa agridulce acompañadas de nuestra especial ensalada de la casa y papas a la francesa.', 4, 27900, 'wok_costillitas_agridulces_wasabi_g.png', 'wok_costillitas_agridulces_wasabi_p.png', 'wok_costillitas_agridulces_wasabi.png'),
(53, 'Eby yaki', '6 langostinos acompañados de arroz yakimeshi y vegetales a la plancha.', 5, 35800, 'teppanyaki_eby_yaky_g.png', 'teppanyaki_eby_yaky_p.png', 'teppanyaki_eby_yaky.png'),
(54, 'Titanic wasabi', '2 variedades en sashimi, 5 variedades en niguiri y 10 piezas de nuestros rolls (30 unidades).', 7, 89900, 'especiales_titanic_wasabi_g.png', 'especiales_titanic_wasabi_p.png', 'especiales_titanic_wasabi.png'),
(55, 'Citrus sensation', 'Delicioso postre de frutas citricas.', 8, 8500, 'postre_citrus_sensation_g.png', 'postre_citrus_sensation_p.png', 'postre_citrus_sensation.png'),
(56, 'Nutella fruit roll', 'Elegante combinación de frutas, helado y nutella.', 8, 8500, 'postre_nutella-fruit-roll_g.png', 'postre_nutella-fruit-roll_p.png', 'postre_nutella-fruit-roll.png'),
(57, 'Postre de las tres leches', 'Tradicional postre de las tres leches con un toque wasabi.', 8, 7500, 'postres_postre_de_las_tres_leches_g.png', 'postres_postre_de_las_tres_leches_p.png', 'postres_postre_de_las_tres_leches.png'),
(63, 'Yols'' car roll', 'Langostino crispy y aguacate, forrado en salmón y atún.', 6, 28500, 'sushi_yols_car_roll_g.png', 'sushi_yols_car_roll_p.png', 'sushi_yols_car_roll.png'),
(64, 'Combo comida caliente', 'Tempura de vegetales, filete de mero en salsa teriyaki y papas a la francesa. Postre de la casa y coca cola.', 11, 24900, 'combo_comida_caliente_g.png', 'combo_comida_caliente_p.png', 'combo_comida_caliente.png'),
(65, 'Combo light', 'Sopa miso ramen acompañada de medio katzu roll, porción de summer roll y coca cola zero.', 11, 24900, 'combo_light_g.png', 'combo_light_p.png', 'combo_light.png'),
(66, 'Combo special mix', 'Un katzu roll acompañado de spring rolls de vegetales, coca cola y postre de la casa.', 11, 26900, 'combo_special_mix_g.png', 'combo_special_mix_peq.png', 'combo_special_mix.png'),
(67, 'Combo comida fria', 'Medio Ebi roll, medio tiradito de mero acompañado de postre de la casa y coca cola.', 11, 24900, 'combo_comida_fria_g.png', 'combo_comida_fria_p.png', 'combo_comida_fria.png'),
(68, 'Combo infantil', 'Tres nugets de pollo, porción de arroz yakimeshi acompañado de papas a la francesa, postre de la casa, jugo natural y un obsequio sorpresa.', 11, 17900, 'combo_infantil_g.png', 'combo_infantil_p.png', 'combo_infantil.png'),
(69, 'Yols'' car roll', 'Langostino crispy y aguacate, forrado en salmón y atún.', 6, 28500, 'sushi_yols_car_roll_g.png', 'sushi_yols_car_roll_p.png', 'sushi_yols_car_roll.png'),
(70, 'Lychees con arequipe', 'Lychees con arequipe', 8, 7500, 'postre_lychees_con_arequipe_g.png', 'postre_lychees_con_arequipe_p.png', 'postre_lychees_con_arequipe.png'),
(71, 'Temaki Ebi Tempura', 'Rollo en forma de cono con diferentes pescados y mariscos.', 7, 10900, 'especiales_temaki_ebi_tempura_g.png', 'especiales_temaki_ebi_tempura_p.png', 'especiales_temaki_ebi_tempura.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_platoxpedido`
--

CREATE TABLE IF NOT EXISTS `wsb_platoxpedido` (
  `id_platoxpedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_plato` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_platoxpedido`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_plato` (`id_plato`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Volcado de datos para la tabla `wsb_platoxpedido`
--

INSERT INTO `wsb_platoxpedido` (`id_platoxpedido`, `id_pedido`, `id_plato`, `cantidad`) VALUES
(68, 75, 5, 1),
(69, 75, 51, 1),
(70, 76, 52, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_tipoBebida`
--

CREATE TABLE IF NOT EXISTS `wsb_tipoBebida` (
  `id_tipoBebida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  `img_silueta` varchar(50) NOT NULL,
  `img_pequena` varchar(50) NOT NULL,
  `img_principal` varchar(50) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_tipoBebida`),
  KEY `id_tipo` (`id_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `wsb_tipoBebida`
--

INSERT INTO `wsb_tipoBebida` (`id_tipoBebida`, `nombre`, `descripcion`, `img_silueta`, `img_pequena`, `img_principal`, `id_tipo`) VALUES
(1, 'Jugos', NULL, 'jugos_silueta.png', 'jugos_p.png', 'jugos.png', 0),
(2, 'Gaseosas', NULL, 'gaseosas_silueta.png', 'gaseosas_p.png', 'gaseosas.png', 0),
(3, 'Cervezas', NULL, 'cervezas_silueta.png', 'cervezas_p.png', 'cervezas.png', 0),
(4, 'Pousse cafes', NULL, 'pousse_cafes_silueta.png', 'pousse_cafes_p.png', 'pousse_cafes.png', 0),
(5, 'Bebidas Calientes', NULL, 'bebidas_calientes_silueta.png', 'bebidas_calientes_p.png', 'bebidas_calientes.png', 0),
(6, 'Vinos', NULL, 'vinos_silueta.png', 'vinos_p.png', 'vinos.png', 0),
(7, 'Cocteles', NULL, 'cocteles_silueta.png', 'cocteles_p.png', 'cocteles.png', 0),
(8, 'Aperitivos', NULL, 'aperitivos_silueta.png', 'aperitivos_p.png', 'aperitivos.png', 0),
(9, 'Licores', NULL, 'licores_silueta.png', 'licores_p.png', 'licores.png', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wsb_tipoPlato`
--

CREATE TABLE IF NOT EXISTS `wsb_tipoPlato` (
  `id_tipoPlato` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipoPlato`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `wsb_tipoPlato`
--

INSERT INTO `wsb_tipoPlato` (`id_tipoPlato`, `nombre`) VALUES
(1, 'entradas'),
(2, 'ensaladas'),
(3, 'sopas'),
(4, 'wok'),
(5, 'teppanyaki'),
(6, 'sushi'),
(7, 'especiales'),
(8, 'postres'),
(9, 'bebidas'),
(10, 'licores'),
(11, 'combos');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `wsb_bebida`
--
ALTER TABLE `wsb_bebida`
  ADD CONSTRAINT `wsb_bebida_ibfk_1` FOREIGN KEY (`id_tipoBebida`) REFERENCES `wsb_tipoBebida` (`id_tipoBebida`),
  ADD CONSTRAINT `wsb_bebida_ibfk_2` FOREIGN KEY (`id_categoriaBebida`) REFERENCES `wsb_categoriaBebida` (`id_categoria`);

--
-- Filtros para la tabla `wsb_mesa`
--
ALTER TABLE `wsb_mesa`
  ADD CONSTRAINT `wsb_mesa_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `wsb_estado` (`id_estado`);

--
-- Filtros para la tabla `wsb_plato`
--
ALTER TABLE `wsb_plato`
  ADD CONSTRAINT `wsb_plato_ibfk_1` FOREIGN KEY (`id_tipoplato`) REFERENCES `wsb_tipoPlato` (`id_tipoPlato`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
