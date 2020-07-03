-- --------------------------------------------------------
-- Servidor:                     us-cdbr-iron-east-04.cleardb.net
-- Versão do servidor:           5.5.56-log - MySQL Community Server (GPL)
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para heroku_9488aafb7ee0cc2
CREATE DATABASE IF NOT EXISTS `heroku_9488aafb7ee0cc2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `heroku_9488aafb7ee0cc2`;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.categoria: 1 rows
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nome`) VALUES
	(1, 'Cria Padrão');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.cidade
CREATE TABLE IF NOT EXISTS `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkworrwk40xj58kevvh3evi500` (`estado_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.cidade: 5 rows
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` (`id`, `nome`, `estado_id`) VALUES
	(1, 'Belo Horizonte', 2),
	(2, 'São José dos Campos', 1),
	(3, 'Jacareí', 1),
	(4, 'Caçapava', 1),
	(5, 'São Paulo', 1);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.endereco
CREATE TABLE IF NOT EXISTS `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atividade` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `entidade` varchar(255) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `cidade_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8b1kcb3wucapb8dejshyn5fsx` (`cidade_id`),
  KEY `FKekdpb8k6gmp3lllla9d1qgmxk` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.endereco: 5 rows
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`id`, `atividade`, `bairro`, `cep`, `complemento`, `entidade`, `logradouro`, `numero`, `cidade_id`, `usuario_id`) VALUES
	(1, 'Acesso inicial ADMIN', 'Vila Nair', '12220834', '', 'UNIFESP', 'Rua Talim', '330', 2, 1),
	(2, 'Assistente Social', 'Centro', '38777012', 'Sala 100', 'APAE', 'Avenida Matos', '105', 1, 2),
	(3, 'Criador do SisWeb-CRIA', 'Centro', '12377012', NULL, 'FATEC SJC', 'Avenida Floriano', '210', 3, 3),
	(4, 'Mestrando', 'Eldorado', '12289070', NULL, 'UNIFESP SJC', 'Rua Geraldo de Oliveira', '57', 4, 4),
	(22, NULL, 'Nome do Bairro', '12828384', 'Apto 3', NULL, 'Rua Nome da Via', '25', 3, 22);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.entrega
CREATE TABLE IF NOT EXISTS `entrega` (
  `pedido_id` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`pedido_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.entrega: 3 rows
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` (`pedido_id`, `estado`) VALUES
	(1, 1),
	(2, 1),
	(12, 1);
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.entrega_correios
CREATE TABLE IF NOT EXISTS `entrega_correios` (
  `numero_de_dias` int(11) DEFAULT NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`pedido_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.entrega_correios: 2 rows
/*!40000 ALTER TABLE `entrega_correios` DISABLE KEYS */;
INSERT INTO `entrega_correios` (`numero_de_dias`, `pedido_id`) VALUES
	(5, 1),
	(7, 2);
/*!40000 ALTER TABLE `entrega_correios` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.estado: 2 rows
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`id`, `nome`) VALUES
	(1, 'São Paulo'),
	(2, 'Minas Gerais');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.item_pedido
CREATE TABLE IF NOT EXISTS `item_pedido` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `med_a` int(11) DEFAULT NULL,
  `med_b` int(11) DEFAULT NULL,
  `med_c` int(11) DEFAULT NULL,
  `med_d` int(11) DEFAULT NULL,
  `med_e` int(11) DEFAULT NULL,
  `med_f` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `pedido_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pedido_id`,`produto_id`),
  KEY `FKtk55mn6d6bvl5h0no5uagi3sf` (`produto_id`),
  KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.item_pedido: 2 rows
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` (`codigo`, `descricao`, `med_a`, `med_b`, `med_c`, `med_d`, `med_e`, `med_f`, `nome`, `quantidade`, `pedido_id`, `produto_id`) VALUES
	(1, 'Emiplegia, destro', 38, 27, 32, 31, 16, 27, 'Paulo Silva', 1, 1, 1),
	(2, 'Emiplegia, canhoto', 40, 28, 33, 32, 17, 28, 'Victor Alves', 1, 2, 2);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.pagamento
CREATE TABLE IF NOT EXISTS `pagamento` (
  `pedido_id` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`pedido_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.pagamento: 3 rows
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` (`pedido_id`, `estado`) VALUES
	(1, 2),
	(2, 2),
	(12, 2);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.pagamento_com_boleto
CREATE TABLE IF NOT EXISTS `pagamento_com_boleto` (
  `data_pagamento` datetime DEFAULT NULL,
  `data_vencimento` datetime DEFAULT NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`pedido_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.pagamento_com_boleto: 1 rows
/*!40000 ALTER TABLE `pagamento_com_boleto` DISABLE KEYS */;
INSERT INTO `pagamento_com_boleto` (`data_pagamento`, `data_vencimento`, `pedido_id`) VALUES
	('2020-02-12 09:46:58', '2020-02-12 09:46:59', 1);
/*!40000 ALTER TABLE `pagamento_com_boleto` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.pagamento_com_cartao
CREATE TABLE IF NOT EXISTS `pagamento_com_cartao` (
  `numero_de_parcelas` int(11) DEFAULT NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`pedido_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.pagamento_com_cartao: 1 rows
/*!40000 ALTER TABLE `pagamento_com_cartao` DISABLE KEYS */;
INSERT INTO `pagamento_com_cartao` (`numero_de_parcelas`, `pedido_id`) VALUES
	(1, 12);
/*!40000 ALTER TABLE `pagamento_com_cartao` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aprovado` tinyint(1) DEFAULT '0',
  `data_entrega` datetime DEFAULT NULL,
  `data_envio` datetime DEFAULT NULL,
  `entrega` int(11) DEFAULT NULL,
  `instante` datetime DEFAULT NULL,
  `endereco_de_entrega_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1fihyy2fnocpuwc74674qmfkv` (`endereco_de_entrega_id`),
  KEY `FK6uxomgomm93vg965o8brugt00` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.pedido: 2 rows
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`id`, `aprovado`, `data_entrega`, `data_envio`, `entrega`, `instante`, `endereco_de_entrega_id`, `usuario_id`) VALUES
	(1, 1, NULL, NULL, 1, '2020-02-08 10:02:16', 1, 1),
	(2, 1, NULL, NULL, 2, '2020-02-08 10:02:57', 2, 2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.perfis
CREATE TABLE IF NOT EXISTS `perfis` (
  `usuario_id` int(11) NOT NULL,
  `perfis` int(11) DEFAULT NULL,
  KEY `FKiso72ajmkk36lw7dqjva1h8hl` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.perfis: 6 rows
/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
INSERT INTO `perfis` (`usuario_id`, `perfis`) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 1),
	(3, 2),
	(22, 2);
/*!40000 ALTER TABLE `perfis` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.produto: 2 rows
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `nome`) VALUES
	(1, 'CRIA direita'),
	(2, 'CRIA esquerda');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.produto_categoria
CREATE TABLE IF NOT EXISTS `produto_categoria` (
  `produto_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  KEY `FKq3g33tp7xk2juh53fbw6y4y57` (`categoria_id`),
  KEY `FK1c0y58d3n6x3m6euv2j3h64vt` (`produto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.produto_categoria: 2 rows
/*!40000 ALTER TABLE `produto_categoria` DISABLE KEYS */;
INSERT INTO `produto_categoria` (`produto_id`, `categoria_id`) VALUES
	(1, 1),
	(2, 1);
/*!40000 ALTER TABLE `produto_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.telefone
CREATE TABLE IF NOT EXISTS `telefone` (
  `usuario_id` int(11) NOT NULL,
  `telefones` varchar(255) DEFAULT NULL,
  KEY `FK92q33nmw94rylnpis5mgcy3v` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.telefone: 9 rows
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` (`usuario_id`, `telefones`) VALUES
	(1, '1293838393'),
	(1, '1227363323'),
	(2, '3127363323'),
	(2, '3193838393'),
	(3, '12982161650'),
	(3, '1234252625'),
	(4, '12996519618'),
	(22, ''),
	(22, '12978707060');
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;

-- Copiando estrutura para tabela heroku_9488aafb7ee0cc2.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) DEFAULT '0',
  `cpf_ou_cnpj` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5171l57faosmj8myawaucatdw` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela heroku_9488aafb7ee0cc2.usuario: 5 rows
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `ativo`, `cpf_ou_cnpj`, `email`, `nome`, `senha`, `tipo`) VALUES
	(1, 1, '96486444000158', 'unifesp@unifesp.gov.br', 'UNIFESP SJC', '$2a$10$pWammrD48VVDPmsWq8nB3etg1jui.2F01qbnDqoT9F8n8u4Y.kW3q', 2),
	(2, 1, '36378912377', 'maria@gmail.com', 'Maria Silva', '$2a$10$emZZ7rGqauD.2Th7JNKL0.G28I8KalGWDKeRCQOaG7TrbIjrPZV.6', 1),
	(3, 1, '31628382740', 'francojmf31@gmail.com', 'Joao Franco', '$2a$10$j5CtUa3HRHnJmg2YQwXMEOwQD/n.ghmP3DFoholC29yEAHoETIl4a', 1),
	(4, 1, '25993358840', 'ander.limabr@gmail.com', 'Anderson Lima', '$2a$10$pafqk9.tUQv4hwjXhrARqeGSdSloAf4KfyIEl2eyBIoH8aR2BTxB6', 1),
	(22, 0, '06134596280', 'joaquim-exemplo@gmail.com', 'Joaquim Exemplo', '$2a$10$gDWIPtwLKe/RkxIORyrX/.9U2Hycu9ootFn6LEjfTSYyLgbV8qXnq', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
