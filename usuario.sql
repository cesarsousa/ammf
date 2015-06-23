-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 22-Jun-2015 às 20:52
-- Versão do servidor: 5.5.42-cll
-- versão do PHP: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `quironps_ammf`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `localizacao` longtext,
  `login` varchar(255) DEFAULT NULL,
  `mostrarMapa` bit(1) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `emailAtivado` bit(1) DEFAULT NULL,
  `emailNotificacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `endereco`, `linkedin`, `localizacao`, `login`, `mostrarMapa`, `nome`, `senha`, `telefone`, `uuid`, `emailAtivado`, `emailNotificacao`) VALUES
(1, 'site@quiron.psc.br', 'Rua da Conceição 13 sala 602, centro. Niterói - RJ.', 'http://br.linkedin.com/pub/alcindo-miguel-martins-filho/2b/28b/364', '<iframe width="1000" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.br/maps?f=q&source=s_q&hl=pt-BR&geocode=&q=Rua+da+Concei%C3%A7%C3%A3o,+13,+Niter%C3%B3i+-+Rio+de+Janeiro&aq=0&oq=rua+da+concei%C3%A7%C3%A3o+13&sll=-22.066441,-42.924029&sspn=3.278118,5.377808&ie=UTF8&hq=&hnear=R.+da+Concei%C3%A7%C3%A3o,+13+-+Centro,+Niter%C3%B3i+-+Rio+de+Janeiro,+24020-080&t=m&ll=-22.893967,-43.123484&spn=0.027674,0.085831&z=14&iwloc=A&output=embed"></iframe>', 'quiron.psc.br', b'1', 'Site Quiron Brasil', '270879cm', '21 99601 1143', '7833a2d1-d514-453c-8c67-a593e380c074', b'1', 'alcindomiguel@gmail.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
