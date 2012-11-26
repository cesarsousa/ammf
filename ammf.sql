-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: ammf
-- ------------------------------------------------------
-- Server version	5.1.36-community-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ammf`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ammf` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ammf`;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'cesarsonline@gmail.com','César de Sousa junior','f0b854f0-540a-47b0-ba8a-aaf75d2d0836');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texto`
--

DROP TABLE IF EXISTS `texto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `conteudo` longtext,
  `titulo` varchar(255) DEFAULT NULL,
  `postagem` datetime DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `local` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texto`
--

LOCK TABLES `texto` WRITE;
/*!40000 ALTER TABLE `texto` DISABLE KEYS */;
INSERT INTO `texto` VALUES (5,'Café, açúcar, maça, não consigo ver os acentos;.','Café com babagem','2012-11-03 12:16:23','e855f7ab-3478-484e-88a1-392386b287f7',NULL,NULL),(7,'Café, açúcar, maça, não consigo ver os acentos;.','Café com babagem','2012-11-01 12:06:23','e311e033-c8ca-44b9-b1c0-13a740ae0a67',NULL,NULL),(8,'limão não é bom','Café','2012-11-02 12:06:23','ca71dbc3-14f0-4a2d-a91b-53617300bfe1',NULL,NULL),(9,'Texto principal das reflexões do coração','Reflexões','2012-11-03 12:06:23','6dbb65e9-afbe-4980-93df-6436216ae5ae',NULL,NULL),(10,'A consistência da memória possui vários level.','Consistência da Memória','2012-11-03 12:24:36','ec24dff4-6c4e-4940-a27d-ba0a57b50822',NULL,NULL),(11,'A consistência ','Consistência','2012-11-03 12:27:28','34bdacb0-06b6-43ab-83e1-b0dd62817606',NULL,NULL),(12,'Ó Arjuna! O Senhor reside na área do coração de todos os seres, rodopiando todos os seres pelo seu poder (mãyã), como se eles estivesem montados sobre uma máquina (yantra).','sem titulo','2012-11-11 21:40:28','4bf20a2f-9838-444c-bfaa-5f53f17b5fb1','Bhagavad-Gitã.','INDEX'),(13,'Psicologia (do grego psykhologuía, psykhé, \"psique\", \"alma\", \"mente\" e ?????, lógos, \"palavra\", \"razão\" ou \"estudo\") \"é a ciência que estuda o comportamento (tudo o que organismo faz) e os processos mentais (experiências subjetivas inferidas através do comportamento)\".\r\n\r\nO principal foco da psicologia se encontra no indivíduo, em geral humano, mas o estudo do comportamento animal para fins de pesquisa e correlação, na área da psicologia comparada, também desempenha um papel importante (veja também etologia).\r\n\r\nA psicologia científica, tratada neste artigo, não deve confundir-se com a psicologia do senso comum ou psicologia popular que é o conjunto de ideias, crenças e convicções transmitido culturalmente e que cada indivíduo possui a respeito de como as pessoas funcionam, se comportam, sentem e pensam.\r\n\r\nA psicologia usa em parte o mesmo vocabulário, que adquire assim significados diversos de acordo com o contexto em que é usado.\r\n\r\nAssim, termos como \"personalidade\" ou \"depressão\" têm significados diferentes na linguagem científica e na linguagem vulgar. A própria palavra \"psicologia\" é muitas vezes usada na linguagem comum como sinônimo de psicoterapia e, como esta, é muitas vezes confundida com a psicanálise ou mesmo a análise do comportamento.\r\n\r\nO termo parapsicologia, ligado ao vocábulo paranormal, não se refere a um conceito ou a uma disciplina da Psicologia, trata-se de um campo de estudo não reconhecido pela comunidade científica. um campo de estudo não reconhecido pela comunidade científica.','sem título','2012-11-19 12:00:00','97cb0230-e368-4837-9e5a-24afe6e22dd2','Alcindo Miguel Martins Filho','PSICOLOGIA'),(14,'Educação engloba os processos de ensinar e aprender. É um fenômeno observado em qualquer sociedade e nos grupos constitutivos destas, responsável pela sua manutenção e perpetuação a partir da transposição, às gerações que se seguem, dos modos culturais de ser, estar e agir necessários à convivência e ao ajustamento de um membro no seu grupo ou sociedade. Enquanto processo de sociabilização, a educação é exercida nos diversos espaços de convívio social, seja para a adequação do indivíduo à sociedade, do indivíduo ao grupo ou dos grupos à sociedade. Nesse sentido, educação coincide com os conceitos de socialização e endoculturação, mas não se resume a estes.\r\n\r\nA prática educativa formal — que ocorre nos espaços escolarizados, que sejam da Educação Infantil à Pós Graduação — dá-se de forma intencional e com objetivos determinados, como no caso das escolas. No caso específico da educação formal exercida na escola, pode ser definida como Educação Escolar. No caso específico da educação exercida para a utilização dos recursos técnicos e tecnológicos e dos instrumentos e ferramentas de uma determinada comunidade, dá-se o nome de Educação Tecnológica. A educação sofre \r\nmudanças, das mais simples às mais radicais, de acordo com o grupo ao qual ela se aplica, e se ajusta a forma \r\nconsiderada padrão na sociedade. Mas, acontece também no dia-a-dia, na informalidade, no cotidiano do cidadão. Nesse caso sendo ela informal.','sem título','2012-11-20 12:00:01','9c93c167-2597-4b2e-b95c-8d54ad46effc','Alcindo Miguel Martins Filho','EDUCACAO'),(15,'Cultura (do latim colere, que significa cultivar) é um conceito de várias acepções, sendo a mais corrente a definição genérica formulada por Edward B. Tylor, segundo a qual cultura é “aquele todo complexo que inclui o conhecimento, as crenças, a arte, a moral, a lei, os costumes e todos os outros hábitos e capacidades adquiridos pelo homem como membro da sociedade”.','sem título','2012-11-20 10:00:01','55b043b8-2029-4c7f-81b5-dae7bd8f9345','Alcindo Miguel Martins Filho','CULTURA'),(16,'Até bem pouco tempo os orientais achavam que os povos do ocidente não eram civilizados, não tinham cultura e os chamavam de bárbaros. De certa forma tinham razão pois, até o fim da Idade Média - portanto antes do Renascimento - a barbárie campeava na Europa. Com exceção das civilizações grega e romana (depois extintas), todas as outras civilizações e conseqüentes manifestações artísticas, vinham da Ásia - do Oriente Médio e do Extremo Oriente.\r\n\r\nPor outro lado, alguns acreditam que a história das artes européias e até as da bacia do Mediterrâneo pode ser contada desprezando as artes do Extremo Oriente, cuja influência no ocidente só foi exercida esporádica e superficialmente. Também não se pode aceitar a afirmação de que a China possui civilização e artes plásticas mais antigas do mundo, pois nas épocas brilhantes da arte egípcia, a China só produzia uma cerâmica primitiva. E mesmo quando os mármores do Partenon eram trabalhados por Fídias, a China ainda não passara dos vasos de bronze, ainda que esses tivessem grande valor artístico. O que se pode afirmar é que a China possui a mais antiga civilização continuada do mundo.','sem título','2012-11-20 11:10:01','b577021f-3636-4143-883f-64ea9fadc13f','Alcindo Miguel Martins Filho','ARTES_ORIENTAIS');
/*!40000 ALTER TABLE `texto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'alcindomiguel','270879cm',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-26 17:43:32