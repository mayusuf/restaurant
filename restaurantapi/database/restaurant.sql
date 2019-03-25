-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2018 at 03:22 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpts` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_categories`
--

CREATE TABLE IF NOT EXISTS `menu_categories` (
  `cat_id` int(3) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `menu_categories`
--

INSERT INTO `menu_categories` (`cat_id`, `cat_name`, `created_date`, `updated_date`, `is_deleted`) VALUES
(1, 'FOOD', '2018-06-19 10:19:27', '2018-06-19 10:19:27', 0),
(2, 'Starters', '2018-06-27 20:14:21', '2018-06-27 20:14:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `item_id` smallint(6) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_desc` varchar(255) DEFAULT NULL,
  `item_price` float NOT NULL,
  `currency` varchar(20) NOT NULL DEFAULT 'euro',
  `res_id` int(3) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`item_id`, `item_name`, `item_desc`, `item_price`, `currency`, `res_id`, `cat_id`, `created_date`, `updated_date`, `is_deleted`) VALUES
(91, 'Antipasti all‘Italiana', 'Gemischter VorspeisentellerMixed starter plateA, F, G, 4, 5, 12', 13.6, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(92, 'Caprese di Bufala', 'Büffel-Mozzarella mit Tomaten, Basilikum und Olivenöl extra VergineMozzarella with tomatoes, basilicum and native oilG, 4', 11.5, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(93, 'Vitello Tonnato', 'Zarte Scheiben vom rosa gebratenen Kalbsrücken mit Kapern in würziger ThunfischsauceTender slices of pink roasted saddle of veal with capers in a spicy tuna sauceC, D, F, G, 4', 11.8, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(94, 'Carpaccio di Manzo su Rucola e grana', 'Mariniertes Rinderfilet mit Zitrone, Olivenöl und ParmesanMarinated beef with lemon, olive oil and ParmesanG, J', 11.8, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(95, 'Carpaccio di Salmone', 'Mariniertes Lachscarpaccio auf ZitronensauceMarinated salmon carpaccio on lemon sauceG, J, 4', 11.8, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(96, 'Carpaccio di Tonno', 'Thunfischcarpaccio, Olivenöl und RosenpfefferTuna carpaccio, olive oil and rose pepperG, J, 4', 11.8, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(97, 'Zuppa di Verdure', 'Gemüsesuppe mit Olivenöl extra VergineVegetable soup with extra virgin olive oilA, C, F, G, I, J, 1, 4, 13', 6.8, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(98, 'Vellutata di Pomodoro e Basilico', 'Tomatencremesuppe mit BasilikumTomato cream soup with basil4', 6.8, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(99, 'Zuppa di Patate e Tartufo', 'Kartoffelcremesuppe mit TrüffelölPotato soup with truffle oilA, C, F, G, I, J, 1, 4, 13', 7.5, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(100, 'Selezione d’insalata', 'Saisonale Blattsalate mit Balsamico-Senf-VinaigretteSeasonal leaf salad with balsamic vinaigrette mustardJ, 1, 4, 12', 7.9, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(101, 'Pomodori', 'Tomatensalat mit roten ZwiebelnTomato salad with red onionsJ, 1, 4', 7.9, 'euro', 5, 1, '2018-06-28 17:19:59', '2018-06-28 17:19:59', 0),
(102, 'Rucola e Parmigiano', 'Rucolasalat mit Strauchtomaten und ParmesanRocket salad with vine tomatoes and ParmesanG, J, 1, 4', 10.8, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(103, 'Insalata Favorita', 'Großer gemischter Salat mit Thunfisch und roten ZwiebelnLarge mixed salad with tuna and red onionsD, F, J, 1, 4', 12.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(104, 'Insalata con Filetto', 'Großer gemischter Salat mitgebratenen FiletstreifenLarge mixed salad with roasted filetJ, 1, 4', 13.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(105, 'Insalata con Scampi', 'Großer gemischter Salat mit ScampiLarge mixed salad with scampiB, J, 1, 4', 13.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(106, 'Insalata Contadina', 'Salat mit Schafskäse, Rucola, Tomaten und gebratenen Lachsstreifen auf Balsamico-Olivenöl-JusSalad with feta cheese, arugula, tomatoes and roasted salmon strips on balsamicolive oilD, G, J, 1, 4, 12', 13.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(107, 'Spaghetti al Pomodoro', 'Spaghetti mit Tomatensauce und BasilikumSpaghetti with tomato sauce and basilA, C, 4', 8.9, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(108, 'Penne all’Arrabiata', 'Penne mit Tomaten, Olivenöl und Basilikum (pikant)Penne with tomato , olive oil and basil (spicy)A, C, 4', 9.8, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(109, 'Spaghetti aglio olio e peperoncino', 'Spaghetti mit Knoblauch, Olivenöl extra Vergine und Chili (leicht scharf)Spaghetti with garlic , extra virgin olive oil and chili (slightly spicy)A, C, 4', 9.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(110, 'Gnocchi di patate  con pesto di basilico e formaggio di pecora grattugiato', 'Hausgemachte Kartoffelgnocchi mit Basilikumpesto und geriebenem SchafskäseHomemade potato gnocchi with basil pesto and sheep cheese', 11.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(111, 'Gnocchi pomodoro e mozzarella', 'Hausgemachte Kartoffelgnocchi mit Tomatensoße und MozzarellaHomemade potato gnocchi with tomato sauce and mozzarellaA, C, F, G, H, I, J, 1, 13', 11.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(112, 'Gnocchi con tartufo e caprino', 'Hausgemachte Kartoffelgnocchi mit Trüffel und Ziegenkäse an Trüffel-Butter-SoßeHomemade potato gnocchi with truffle, goat-cheese and truffel-butter-sauceA, C, F, G, H, I, J, 1, 4, 9, 13', 15.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(113, 'Mezzelune al porcini', 'Hausgemachte Halbmond-Teigtaschen mit SteinpilzenHomemade halfmoon-dumplings with porcini mushroomsA, C, F, G, H, I, J, 1, 4, 6, 13', 12.7, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(114, 'Tagliatelle con pollo marinato e porcini', 'Bandnudeln mit marinierten Hähnchenbruststreifen und SteinpilzenTagliatelle with marinated chicken-breast and porcini-mushroomsA, C, F, G, I, J, 4, 6, 9', 12.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(115, 'Tagliatelle al salmone', 'Bandnudeln mit frischen Lachsstreifen in HummersauceTagliatelle with fresh salmon in lobster sauceA, B, C, F, G, I, J, 1, 4, 6, 9', 12.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(116, 'Tagliatelle con punte di filetto  e funghi freschi', 'Bandnudeln mit Filetspitzen und frischen ChampignonsTagliatelle with fillet and fresh mushroomsA, C, F, G, I, J, 4, 6, 9', 13.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(117, 'Spaghetti aglio olio e Scampi', 'Spaghetti mit Knoblauch, Olivenöl extra Vergine, Chili und Scampi (leicht scharf)Spaghetti with garlic, extra virgin olive oil, chili and scampi (slightly spicy)A, B, C, F, I', 14.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(118, 'Saltimbocca alla Romana', 'Schweinefiletmedaillons mit Parmaschinken und SalbeiPork medallions with Parma ham and sageA, C, F, G, I, J, 1, 4, 12, 13', 18.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(119, 'Fagottini al Gorgonzola', 'Schweinefiletmedaillons gefüllt mit Spinat in GorgonzolasaucePork medallions stuffed with spinach in gorgonzola sauceA, C, F, G, I, J, 1, 4, 9, 13', 18.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(120, 'Piccata ai Porcini', 'Schweinefiletmedallions mit SteinpilzenPork medallions with porcini mushroomsC, F, G, I, J, 9, 12', 19.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(121, 'Tagliata alla Griglia al profumo di Rosmarino', 'Rumpsteak vom Grill mit frischem RosmarinGrilled rump steak with fresh rosemary4', 20.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(122, 'Costolette d’Agnello', 'Zarte Lammkotletts vom Grill mit frischem Rosmarin und gebratenem KnoblauchTender lamb chops grilled with fresh rosemary and roasted garlic4', 20.9, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(123, 'Filetti d’Agnello al Profumo di Bosco', 'Lammfilets mit frischen Kräutern in RotweinsauceLamb fillet with fresh herbs in red wine sauceA, C, F, G, I, J, 4, 6', 21.9, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(124, 'Terra e Mare', 'Rinderfilet und Scampis mit frischen Kräutern aus dem PiemontBeef and scampi with fresh herbs from PiedmontA, B, C, F, G, I, J, 1, 4, 12, 13', 23.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(125, 'Cuore di filetto alla griglia', 'Rinderfilet vom GrillGrilled beef fillet', 24.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(126, 'Filetto al gorgonzola', 'Rinderfilet mit GorgonzolasauceFillet of beef with gorgonzola sauceA, C, F, G, I, J, 4, 6, 9', 26.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(127, 'Il piatto del Re', 'Rinderfilet in BarolosauceBeef filet in Barolo sauceA, C, F, G, I, J, 4, 6, 12', 26.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(128, 'Salmone in Crosta', 'Filet vom isländischen Lachs in Dijon-SenfsauceFillet of Icelandic salmon in Dijon mustard sauceC, D, F, G, I, J, 9, 12', 18.5, 'euro', 5, 1, '2018-06-28 17:20:00', '2018-06-28 17:20:00', 0),
(129, 'Branzino selvatico', 'Filet vom Wolfsbarsch mit kandierten Gemüse und pikantem OlivenölFillet of sea bass with candied vegetables and spicy olive oilD, 4', 19.5, 'euro', 5, 1, '2018-06-28 17:20:01', '2018-06-28 17:20:01', 0),
(130, 'Filetto di Orata', 'Filet von der Dorade mit Rosmarin und KnoblauchFillet of sea bream with rosemary and garlicD, 4', 19.5, 'euro', 5, 1, '2018-06-28 17:20:01', '2018-06-28 17:20:01', 0),
(131, 'Luccioperca al Burro', 'Gebratenes Zanderfilet in Kapern-ButtersauceRoasted zander filet in caper butter sauceD, G, 4', 19.5, 'euro', 5, 1, '2018-06-28 17:20:01', '2018-06-28 17:20:01', 0),
(132, 'Scampi alla Griglia', 'Salzwassergarnelen vom Grill mit einem Schuss kaltgepresstem OlivenölKing prawns grilled with a dash of extra virgin olive oilB, 4', 23.5, 'euro', 5, 1, '2018-06-28 17:20:01', '2018-06-28 17:20:01', 0),
(133, 'Scampi al Pepe', 'Salzwassergarnelen mit grünem Pfeffer in Cognac-SahnesauceKing prawns with green pepper in cognac cream sauceA, B, C, F, G, I, J, 1, 4, 9, 12, 13', 24.5, 'euro', 5, 1, '2018-06-28 17:20:01', '2018-06-28 17:20:01', 0),
(134, 'Serrano Ham', '\n							', 7.5, 'pound', 6, 1, '2018-06-28 17:20:18', '2018-06-28 17:20:18', 0),
(135, 'Scampi', '\n							', 7.5, 'pound', 6, 1, '2018-06-28 17:20:18', '2018-06-28 17:20:18', 0),
(136, 'Prawns in Garlic', '\n							', 8.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(137, 'Prawns in Filo Pastry', '\n							', 6.9, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(138, 'Prawn Cocktail', '\n							', 7.9, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(139, 'Mushrooms in Breadcrumbs', '\n							', 7.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(140, 'Mushrooms', '\n							', 6.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(141, 'Moules Mariniere', '\n							', 7.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(142, 'Mediterranean Prawns', '\n							', 4.2, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(143, 'Grilled Sardines', '\n							', 6.9, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(144, 'Avocado Prawns', '\n							', 8.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(145, 'Calamares', '\n							', 7.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(146, 'Chicken Goujons', '\n							', 7.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(147, 'Chipirones Fried Baby Squid', '\n							', 7.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(148, 'Croquetas', '\n							', 6.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(149, 'Fried Crab Claws', '\n							', 7.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(150, 'Grilled Halloumi Cheese', '\n							', 6.9, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(151, 'Grilled Sardines', '\n							', 6.9, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(152, 'Mediterranean Prawns', '\n							', 4.2, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(153, 'Bocconcini Di Pollo', '\n							', 16.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(154, 'Grilled Chicken', '\n							', 16.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(155, 'Pollo Sorpresa', '\n				Breast of Chicken Stuffed with Garlic Butter\n			', 16.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(156, 'Pollo Valdostana', '\n							', 16.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(157, 'Supreme De Volaille Maison', '\n				Chicken cooked in Mushroom, Red Pepper and Cream Sauce with wine\nServed with Sauté Potatoes and Fresh Vegetables in Season\n			', 16.5, 'pound', 6, 1, '2018-06-28 17:20:19', '2018-06-28 17:20:19', 0),
(158, 'Lau chingri, luchi G', 'Shrimp, gourd, Bengali five spices', 7.95, 'pound', 7, 2, '2018-06-28 17:20:25', '2018-06-28 17:20:25', 0),
(159, 'Griddled scallops', 'Spiced pea puree, red pepper reduction, roasted cumin', 8.75, 'pound', 7, 2, '2018-06-28 17:20:25', '2018-06-28 17:20:25', 0),
(160, 'Tilapia fish tikka, gunpowder D/N', 'Fresh herbs, coriander, smoked aubergine ', 7.95, 'pound', 7, 2, '2018-06-28 17:20:25', '2018-06-28 17:20:25', 0),
(161, 'Afghani chicken tikka D/N', 'Cashew paste, cream cheese, green chilli', 7.25, 'pound', 7, 2, '2018-06-28 17:20:25', '2018-06-28 17:20:25', 0),
(162, 'Quail breast D/N', 'Black sesame seed, green papaya salad, sweet chilli ', 7.5, 'pound', 7, 2, '2018-06-28 17:20:25', '2018-06-28 17:20:25', 0),
(163, 'Gurkhali ostrich tikka D/N', 'Szechwan pepper, celery, mooli sesame chutney', 8.5, 'pound', 7, 2, '2018-06-28 17:20:25', '2018-06-28 17:20:25', 0),
(164, 'Hiran ki botiD', 'Balmoral Estate red deer, Bikaneri chilli, red onion yoghurt', 7.95, 'pound', 7, 2, '2018-06-28 17:20:25', '2018-06-28 17:20:25', 0),
(165, 'Clove-smoked lamb chops D', 'Best end baby chops, roasted garlic yoghurt', 8.25, 'pound', 7, 2, '2018-06-28 17:20:25', '2018-06-28 17:20:25', 0),
(166, 'Beetroot cutlet, papaya chutney V', 'Warm spice, fennel, crispy tapioca coating', 6.75, 'pound', 7, 2, '2018-06-28 17:20:26', '2018-06-28 17:20:26', 0),
(167, 'Paneer ke soole D/V', 'Char-grilled, Rajasthani masala, mango chutney  ', 7.25, 'pound', 7, 2, '2018-06-28 17:20:26', '2018-06-28 17:20:26', 0),
(168, 'Spinach and sweet potato shingara D/G/V', 'Wrapped in homemade Bengali pastry', 6.95, 'pound', 7, 2, '2018-06-28 17:20:26', '2018-06-28 17:20:26', 0),
(169, 'Gemischter Salat', NULL, 2, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(170, 'HÃ¼hnerfleischsuppe mit Tomaten, scharf sauer', NULL, 2, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(171, 'GemÃ¼sepfanne mit Reis und pikanter Sauce', NULL, 3, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(172, 'Gebratener Tofu mit GemÃ¼se und Reis', NULL, 5, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(173, 'Gebratene Eiernudeln', NULL, 3, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(174, 'Gebratene Eiernudeln mit HÃ¼hnerfleisch', NULL, 3, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(175, 'Gebratener Reis', NULL, 3, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(176, 'Gebratener Reis mit HÃ¼hnerfleisch', NULL, 3, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(177, 'Knusprige Ente mit Brokkoli und Reis, pikante Sauce', NULL, 7, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(178, 'Knusprige Ente mit Bratnudeln, pikante Sauce', NULL, 6, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(179, 'Pho Ga Breitbandnudelsuppe mit HÃ¼hnerfleisch', NULL, 5, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0),
(180, 'Pho Bo Breitbandnudelsuppe mit Rindfleisch', NULL, 6, 'euro', 8, 1, '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_06_14_221511_create_articles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE IF NOT EXISTS `restaurants` (
  `res_id` int(3) NOT NULL,
  `res_name` varchar(255) NOT NULL,
  `res_address` varchar(255) DEFAULT NULL,
  `res_desc` text,
  `url` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`res_id`, `res_name`, `res_address`, `res_desc`, `url`, `created_date`, `updated_date`, `is_deleted`) VALUES
(5, 'Ristorante a Mano', 'Strausberger Platz 210243 Berlin', 'Phone: 030 / 95 59 82 43 Open: 12 pm to 11 pm', 'http://www.amano-ristorante.de', '2018-06-28 17:19:57', '2018-06-28 17:19:57', 0),
(6, 'Bar61', ' 61a Streatham Hill, London, UK', 'Phone:   020 8671 0444 Email:  metinahmet61@yahoo.com', 'http://www.bar61.com/', '2018-06-28 17:20:10', '2018-06-28 17:20:10', 0),
(7, 'Babur', '119 Brockley Rise, Forest Hill, London SE23 1JP', 'Phone: 020 8291 2400', 'http://www.babur.info', '2018-06-28 17:20:24', '2018-06-28 17:20:24', 0),
(8, 'Salathai', 'Wladimir-Sagorski-Str. 22 \r 09122 Chemnitz\r', 'Tel. 0371 / 2802027\r', 'www.salathai-chemnitz.de\r', '2018-06-28 17:20:30', '2018-06-28 17:20:30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_token` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_token`, `created_at`, `updated_at`) VALUES
(5, 'Abu Yusuf', 'yusuf@gmail.com', '$2y$10$eSzyYtdf1.OXez03pxWRB.fy6bucQL5y3RNI3mRjXpm.rVwNE.ggS', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjUsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdjEvbG9naW4iLCJpYXQiOjE1MzA0NDA2NjMsImV4cCI6MTUzMDQ0NDI2MywibmJmIjoxNTMwNDQwNjYzLCJqdGkiOiJOWHFtRjlQNnZmU3JuaDZ4In0.osM4XmqeXphbQV8NF78ZFKfHZzqls4dxD2E3A8YrkGk', '2018-06-14 21:07:27', '2018-07-01 08:24:23'),
(6, 'Taaza Bin Yusuf', 'yafi@gmail.com', '$2y$10$uwpF9l1IWe/yAV7J9goofOg7oenkxUDTlKg.UsC5f3YGBJINNfsEq', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjYsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdjEvbG9naW4iLCJpYXQiOjE1MzA0NDA1ODEsImV4cCI6MTUzMDQ0NDE4MSwibmJmIjoxNTMwNDQwNTgxLCJqdGkiOiIyV0N2dk5UWkhrVVRWQVhLIn0.nTg7jWw8NzpxLaohuDm6RQFFKFfs5z7F_qw1OVwu1EA', '2018-06-16 12:01:33', '2018-07-01 08:23:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`),
  ADD KEY `articles_user_id_foreign` (`user_id`);

--
-- Indexes for table `menu_categories`
--
ALTER TABLE `menu_categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`res_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_categories`
--
ALTER TABLE `menu_categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `item_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `res_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
