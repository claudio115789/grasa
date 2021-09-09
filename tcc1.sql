-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2020 at 03:53 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tcc1`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(520) NOT NULL,
  `slug` varchar(220) NOT NULL,
  `tag` varchar(220) NOT NULL,
  `description` varchar(550) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nome` (`nome`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `slug`, `tag`, `description`, `created`, `modified`) VALUES
(7, 'Documentos Contabeis', '', '', '', '2020-09-18 18:35:18', NULL),
(8, 'Documentos Institucionais', '', '', '', '2020-09-18 18:35:41', NULL),
(9, 'Plano de Trabalho', '', '', '', '2020-09-18 18:35:56', '2020-09-18 18:46:57'),
(11, 'Outros', '', '', '', '2020-09-20 18:04:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contatos`
--

CREATE TABLE IF NOT EXISTS `contatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(550) NOT NULL,
  `email` varchar(550) NOT NULL,
  `telefone` varchar(550) NOT NULL,
  `assunto` varchar(550) NOT NULL,
  `mensagem` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `contatos`
--

INSERT INTO `contatos` (`id`, `nome`, `email`, `telefone`, `assunto`, `mensagem`, `created`, `modified`) VALUES
(1, 'teste1', 'teste1@teste1', 'teste1', 'teste1', 'teste1', '2015-10-06 15:06:17', NULL),
(2, 'teste2', 'teste2@teste2', 'teste2', 'teste2', 'teste2', '2015-10-06 15:06:58', NULL),
(3, 'teste3', 'teste3@teste3', 'teste3', 'teste3', 'teste3', '2015-10-06 15:08:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documentos`
--

CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(520) CHARACTER SET latin1 NOT NULL,
  `validade` varchar(520) CHARACTER SET latin1 NOT NULL,
  `imagem` varchar(220) CHARACTER SET latin1 NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=153 ;

--
-- Dumping data for table `documentos`
--

INSERT INTO `documentos` (`id`, `nome`, `validade`, `imagem`, `modified`, `created`, `categoria_id`) VALUES
(67, 'Anexo_RP 12_2020-2021_GRASA_2017_21.623', '02/2020', 'bb856460e6f5b0f1d72acda50e8bf498', '2020-09-18 15:18:38', '2020-09-18 15:15:27', 1),
(68, 'Apostilamento  fonte de repasses  Janeiro e Fevereiro 2020', '2020', '81ad0dee9da9cbf15544a00e4f8eabbe', NULL, '2020-09-19 20:53:51', 8),
(69, 'Apostilamento fonte de repasse  dezembro 2018', '2018', '7a69efe21b21e9c6815f10490b050d6f', NULL, '2020-09-19 20:54:20', 8),
(70, 'Apostilamento fonte de repasse  Junho 2020', '2020', '26090eb66e6391988eba7ffb2301f92e', NULL, '2020-09-19 20:54:51', 8),
(71, 'CertidÃ£o de  Apostilamento 2019', '2019', '67d80d2329e6f47094ea1174e8610f55', NULL, '2020-09-19 20:55:14', 8),
(72, 'Ata de ConstituicÃ£o GRASA 001', '1999', 'f2b7a8d94c6b3801469abbe3f9bd1967', NULL, '2020-09-19 20:58:31', 8),
(73, 'Ata de ReuniÃ£o 2017-2019', '2019', '0d17920ab4d35eb397c8c2eab76347e7', NULL, '2020-09-19 20:59:01', 8),
(74, 'Ata ReuniÃ£o 2019-2021', '2021', '4c01784eda789dc95fac6c78918cc16a', NULL, '2020-09-19 20:59:27', 8),
(75, 'BalanÃ§o patrimonial  2019', '2019', 'a985af0cbecd98d4f73a30f09afbc141', NULL, '2020-09-19 21:00:45', 7),
(76, 'BalanÃ§o patrimonial 2017-001', '2017', '3917330f8a415d768b78a2e291988065', NULL, '2020-09-19 21:01:10', 7),
(77, 'BalanÃ§o patrimonial 2017-2018', '2018', '328000f8bb33e40fc3c6c9be4125ac23', NULL, '2020-09-19 21:01:37', 7),
(78, 'Editais de chamamento publico  NÂº 01-25 de 2017', '2017', '42044823f409ef9743b13f64b2803199', NULL, '2020-09-19 21:04:19', 10),
(79, 'Edital de chamamento publico 05 2017', '2017', '0cf8616fe3fc89d180a40386e090e874', NULL, '2020-09-19 21:04:46', 10),
(80, 'DeclaraÃ§Ã£o de  funcionamento grasa', '2017', '5e355029d954c23f40fd9b5d26ccfce3', NULL, '2020-09-19 21:06:59', 10),
(86, 'Plano de trabalho - prorrogaÃ§Ã£o  2020-2021 - GRASA_2017_21.623', '2021', '3fa6d1a02fcda9e029100d96f02f7b6c', NULL, '2020-09-19 21:13:24', 9),
(87, 'Plano SEDES 2017', '2017', 'cc92e910fe7a67c6624b0bfc8c14c41c', NULL, '2020-09-19 21:13:58', 9),
(88, 'Plano SIAS 2019-2020', '2020', 'd2babe7d62e4c493d1021163981ad77b', NULL, '2020-09-19 21:14:26', 9),
(89, 'Relatorio de atividades 2018', '2018', 'e40adf6611efcf62e36e1791b306e911', NULL, '2020-09-19 21:15:16', 10),
(90, 'Terceiro termo de prorrogaÃ§Ã£o 2020-2021 GRASA_2017_21.623', '2021', '3aff6367952048a4044c46c4d478a0d3', NULL, '2020-09-19 21:15:51', 10),
(91, 'RelaÃ§Ã£o de FuncionÃ¡rios  2Âª Parcela do  13Âº SalÃ¡rio 2019', '2019', '2bacf34b3811ae825c3ef19612d02646', '2020-09-19 21:28:04', '2020-09-19 21:18:09', 6),
(92, 'RelaÃ§Ã£o de FuncionnÃ¡rios 1Âª Parcela do  13Âº SalÃ¡rio  2019', '2019', 'f85b5163044d97ab8555727b9d87fb22', NULL, '2020-09-19 21:18:35', 6),
(93, 'RemuneraÃ§Ã£o de  empregados 2019', '2019', '59ccd4cfd52988c22b6221e54819d2b1', NULL, '2020-09-19 21:19:01', 6),
(94, 'RemuneraÃ§Ã£o de empregados 2020', '2020', '1232c063ed3eccc58bce77b40d1ee396', NULL, '2020-09-19 21:19:26', 6),
(95, 'Anexo  RP-12 prorrogaÃ§Ã£o  2019-2020 GRASA - PA 2017-21623', '2020', '6d51ccfc58a7be911dc6bdaed4f770a6', NULL, '2020-09-19 21:29:44', 8),
(96, 'Anexo_RP 12_2020-2021_GRASA_2017_21.623', '2021', 'bb856460e6f5b0f1d72acda50e8bf498', NULL, '2020-09-19 21:30:09', 8),
(97, 'Relatorio de ExecuÃ§Ã£o do Objeto - 2017', '2017', '8960cc866cd29c7d5e7ca34b4fd9bf9b', NULL, '2020-09-19 21:30:43', 10),
(98, 'Relatorio de ExecuÃ§Ã£o do Objeto - 2018', '2018', 'b9b97f9f07840e9f46bce391361badfe', NULL, '2020-09-19 21:31:13', 10),
(99, 'Relatorio de ExecuÃ§Ã£o Financeira RP14_2Âº Semestre Estadual 001', '2017', 'a8daba03de954ed497a1d3f3d4c3d9a9', NULL, '2020-09-19 21:32:18', 10),
(100, 'RP14 Grasa 1Âº semestre  Municipal 2017', '2017', '4191c1e768a3e0c0f9ac154fb3753345', NULL, '2020-09-19 21:33:08', 7),
(101, 'RP14 Grasa 2Âº semestre Estadual 2017', '2017', '1ef224ad1e3e484d228ba7eac154db23', NULL, '2020-09-19 21:33:41', 10),
(102, 'RP14 Grasa 2Âº semestre Municipal 2017', '2017', 'ebcc8c1698a5e418fcd516cdd018c909', NULL, '2020-09-19 21:34:15', 10),
(103, 'RP14 Grasa Municipal   2018-21623', '2018', '7345f06a01f99bfa5faedc5fb5ba7990', NULL, '2020-09-19 21:34:40', 10),
(104, 'RP-14 MUNICIPAL GRASA 2018-21623', '2018', '55d83723d1dc6f9d3874dfc836c52393', NULL, '2020-09-19 21:35:04', 10),
(105, 'Termo Aditivo Grasa 2017- 2018', '2018', 'a63074c3a0f161520fa45b05fc19f1e8', NULL, '2020-09-19 21:43:08', 10),
(106, 'Termo de ColaboraÃ§Ã£o Estadual', '2017', 'd5dab14afd834a5b182aaff06a29a081', NULL, '2020-09-19 21:43:35', 10),
(107, 'Termo de ColaboraÃ§Ã£o Municipal', '2017', 'bce8d3be94591857ac2eeaff0724ee19', NULL, '2020-09-19 21:44:39', 10),
(108, 'Termo de ColaboraÃ§Ã£o SIAS 062017- 062018', '2017', '65309656669467d4a09ebb12422cd2a2', NULL, '2020-09-19 21:45:15', 10),
(109, 'Termo Prorrogacao 2018- 2019', '2019', '0a24e21dc34e201a7aa9b31d3d74ca0f', NULL, '2020-09-19 21:45:44', 10),
(110, 'Termo ProrrogaÃ§Ã£o 2019-2020', '2020', 'c1a64563eebaee2ed695654ee3e300d0', NULL, '2020-09-19 21:46:30', 10),
(113, 'InscriÃ§Ã£o CMAS 2019', '2019', 'de29e8ee68e1fc214448f3487fa87c52', NULL, '2020-09-19 21:54:21', 10),
(114, 'InscriÃ§Ã£o municipal unidades', '01', '0373812392e256e115e37f1bde2eabc8', NULL, '2020-09-19 21:55:28', 10),
(116, 'InscriÃ§Ã£o municipal unidades', '01', '2ff09d521cc550c92465c996fab366d1', NULL, '2020-09-19 21:56:16', 10),
(117, '', '', '', NULL, '2020-09-19 22:03:52', 0),
(118, 'Regulamento de  contrataÃ§Ã£o RH', '01', 'd0cc9a58382b3ea35fc38928575b7a9a', NULL, '2020-09-19 22:04:46', 10),
(119, 'RelaÃ§Ã£o de dirigentes  2019-2021', '2021', '0df8baf9ff6e4e2ca9d6d81672070583', NULL, '2020-09-19 22:05:30', 10),
(120, 'RelaÃ§Ã£o de dirigentes 2017-2019', '2019', '8f5308b030b30d691ec725d9ad62b18a', NULL, '2020-09-19 22:06:02', 10),
(121, 'RelaÃ§Ã£o de Fornecedores', '01', 'cca90db3832411c83f451d712a04a3e9', NULL, '2020-09-19 22:06:28', 10),
(122, 'Utilidade publica 2000', '2000', '20fd1a485544c303d8ef54a26976b73e', NULL, '2020-09-19 22:06:56', 10),
(123, 'PrestaÃ§Ã£o de  Contas Estadual Novembro 2017', '2017', '014f237e193d27ad50df4858cb486eec', NULL, '2020-09-20 07:43:09', 6),
(124, 'PrestaÃ§Ã£o de Contas  Estadual Outubro 2017', '2017', 'cca70142b5bd02f9a15c8b1df43d7635', NULL, '2020-09-20 07:43:45', 6),
(125, 'PrestaÃ§Ã£o de Contas Estadual Dezembro 2017', '2017', '3e2a901268cc94e7fd15abd72d04839a', NULL, '2020-09-20 07:46:24', 6),
(126, 'PrestaÃ§Ã£o de Contas Estadual Setembro 2017', '2017', '036fcd9e96cfc508dac85fab2e174a3e', NULL, '2020-09-20 07:46:52', 6),
(127, 'PrestaÃ§Ã£o de  Contas Estadual Fevereiro 2018', '2018', '45ededa77170437903514da881278003', NULL, '2020-09-20 07:49:20', 6),
(128, 'PrestaÃ§Ã£o de Contas Estadual Agosto 2018', '2018', '69c0b7382f1feb1e52de3ffe7c671e94', NULL, '2020-09-20 07:49:49', 6),
(129, '', '', '', NULL, '2020-09-20 07:50:56', 0),
(130, '', '', '', NULL, '2020-09-20 07:54:06', 0),
(131, '', '', '', NULL, '2020-09-20 07:58:55', 0),
(132, 'PrestaÃ§Ã£o de Contas Estadual Janeiro 2018', '2018', 'ad38c61da583bd620816950df943761d', NULL, '2020-09-20 08:00:51', 6),
(133, 'PrestaÃ§Ã£o de Contas Estadual Julho 2018', '2018', '2e95b8c87f0ddb2032414b3a23d2d1ef', NULL, '2020-09-20 08:01:21', 6),
(134, 'PrestaÃ§Ã£o de Contas Estadual Maio 2018', '2018', '3e9bd500c97cae672e37f6925674e616', NULL, '2020-09-20 08:01:44', 6),
(135, 'PrestaÃ§Ã£o de Contas Estadual Marco 2018', '2018', 'f5b370bdb1e48b43ee763b6c95ce10a9', NULL, '2020-09-20 08:02:13', 6),
(136, 'PrestaÃ§Ã£o de Contas Estadual Novembro 2018', '2018', '7ca1d0ab34d0c87594afa426337cbf3c', NULL, '2020-09-20 08:02:47', 6),
(137, '', '', '', NULL, '2020-09-20 08:03:09', 0),
(138, 'PrestaÃ§Ã£o de Contas Estadual Setembro 2018', '2018', '459e7532e434d1258bc3d7fe1db25433', NULL, '2020-09-20 08:04:11', 6),
(139, '', '', '', NULL, '2020-09-20 08:05:38', 0),
(140, '', '', '', NULL, '2020-09-20 08:14:15', 0),
(141, '', '', '', NULL, '2020-09-20 08:17:45', 0),
(142, '', '', '', NULL, '2020-09-20 08:20:13', 0),
(143, '', '', '', NULL, '2020-09-20 08:30:12', 0),
(144, '', '', '', NULL, '2020-09-20 08:39:38', 0),
(145, '', '', '', NULL, '2020-09-20 08:52:36', 0),
(146, '', '', '', NULL, '2020-09-20 08:54:51', 0),
(147, '', '', '', NULL, '2020-09-20 08:56:11', 0),
(148, '', '', '', NULL, '2020-09-20 09:10:47', 0),
(149, 'PrestaÃ§Ã£o de  Contas  Estadual Novembro 2019', '2019', 'c15d92dc54a95c71661a66b8cb0d895d', NULL, '2020-09-20 09:11:27', 6),
(150, '', '', '', NULL, '2020-09-20 09:13:18', 0),
(151, '', '', '', NULL, '2020-09-20 09:14:35', 0),
(152, '', '', '', NULL, '2020-09-20 09:15:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nivel_acessos`
--

CREATE TABLE IF NOT EXISTS `nivel_acessos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_nivel` varchar(220) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nivel_acessos`
--

INSERT INTO `nivel_acessos` (`id`, `nome_nivel`, `created`, `modified`) VALUES
(1, 'Administrador', '2015-09-19 00:00:00', NULL),
(2, 'UsuÃ¡rio', '2015-09-27 17:30:26', '2015-09-27 17:34:37');

-- --------------------------------------------------------

--
-- Table structure for table `situacaos`
--

CREATE TABLE IF NOT EXISTS `situacaos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(220) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(220) NOT NULL,
  `email` varchar(220) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `nivel_acesso_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `login`, `senha`, `nivel_acesso_id`, `created`, `modified`) VALUES
(5, 'claudio', 'claudio115789@gmail.com', 'claudio', 'sara', 1, '2020-09-04 12:17:10', '2020-09-05 18:06:47');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
