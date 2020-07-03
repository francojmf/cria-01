USE `heroku_4b3597385c741b0`;

-- Copiando estrutura para tabela projeto_cria_1.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.categoria: 6 rows
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nome`) VALUES
	(1, 'EmE'),
	(2, 'EmD'),
	(3, 'Par'),
	(4, 'ParCE'),
	(5, 'ParCD'),
	(6, 'AmP');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.cidade
CREATE TABLE IF NOT EXISTS `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkworrwk40xj58kevvh3evi500` (`estado_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.cidade: 3 rows
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` (`id`, `nome`, `estado_id`) VALUES
	(1, 'Uberlândia', 1),
	(2, 'São José dos Campos', 2),
	(3, 'Jacareí', 2);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.endereco
CREATE TABLE IF NOT EXISTS `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bairro` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `cidade_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8b1kcb3wucapb8dejshyn5fsx` (`cidade_id`),
  KEY `FKekdpb8k6gmp3lllla9d1qgmxk` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.endereco: 3 rows
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`id`, `bairro`, `cep`, `complemento`, `logradouro`, `numero`, `cidade_id`, `usuario_id`) VALUES
	(1, 'Jardim', '38220834', 'Apto 303', 'Rua Flores', '300', 1, 1),
	(2, 'Centro', '38777012', 'Sala 800', 'Avenida Matos', '105', 2, 1),
	(3, 'Centro', '281777012', NULL, 'Avenida Floriano', '2106', 2, 2);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.estado: 2 rows
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`id`, `nome`) VALUES
	(1, 'Minas Gerais'),
	(2, 'São Paulo');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.item_pedido
CREATE TABLE IF NOT EXISTS `item_pedido` (
  `quantidade` int(11) DEFAULT NULL,
  `pedido_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  PRIMARY KEY (`pedido_id`,`produto_id`),
  KEY `FKtk55mn6d6bvl5h0no5uagi3sf` (`produto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.item_pedido: 0 rows
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.pedido
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.pedido: 0 rows
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.perfis
CREATE TABLE IF NOT EXISTS `perfis` (
  `usuario_id` int(11) NOT NULL,
  `perfis` int(11) DEFAULT NULL,
  KEY `FKiso72ajmkk36lw7dqjva1h8hl` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.perfis: 5 rows
/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
INSERT INTO `perfis` (`usuario_id`, `perfis`) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 1),
	(3, 2);
/*!40000 ALTER TABLE `perfis` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `med_a` int(11) DEFAULT NULL,
  `med_b` int(11) DEFAULT NULL,
  `med_c` int(11) DEFAULT NULL,
  `med_d` int(11) DEFAULT NULL,
  `med_e` int(11) DEFAULT NULL,
  `med_f` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.produto: 12 rows
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `descricao`, `med_a`, `med_b`, `med_c`, `med_d`, `med_e`, `med_f`, `nome`) VALUES
	(1, 'Emiplegia usa esquerda', 36, 27, 33, 30, 14, 25, 'Andre'),
	(2, 'Emiplegia usa direita', 38, 27, 33, 30, 16, 27, 'Gustavo'),
	(3, 'Paralisia da cintura para baixo', 36, 25, 30, 28, 14, 25, 'Andriana'),
	(4, 'Paralisia cerebral, usa esquerda', 37, 26, 31, 29, 15, 26, 'Matheus'),
	(5, 'Paralisia cerebral, usa direita', 35, 24, 30, 27, 15, 26, 'Vinicius'),
	(6, 'Amputação de pernas', 37, 26, 31, 30, 16, 27, 'Roberto'),
	(7, 'Emiplegia usa esquerda', 35, 24, 29, 27, 13, 24, 'Maria'),
	(8, 'Emiplegia usa direita', 38, 27, 33, 29, 15, 26, 'Ricardo'),
	(9, 'Paralisia da cintura para baixo', 35, 24, 30, 28, 15, 26, 'Vanessa'),
	(10, 'Paralisia cerebral, usa esquerda', 39, 28, 34, 31, 17, 28, 'Marcelo'),
	(11, 'Paralisia cerebral, usa direita', 37, 27, 32, 29, 16, 26, 'Murilo'),
	(12, 'Amputação de pernas', 38, 28, 33, 30, 17, 27, 'Adriano');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.produto_categoria
CREATE TABLE IF NOT EXISTS `produto_categoria` (
  `produto_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  KEY `FKq3g33tp7xk2juh53fbw6y4y57` (`categoria_id`),
  KEY `FK1c0y58d3n6x3m6euv2j3h64vt` (`produto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.produto_categoria: 24 rows
/*!40000 ALTER TABLE `produto_categoria` DISABLE KEYS */;
INSERT INTO `produto_categoria` (`produto_id`, `categoria_id`) VALUES
	(1, 1),
	(1, 1),
	(2, 2),
	(2, 2),
	(3, 3),
	(3, 3),
	(4, 4),
	(4, 4),
	(5, 5),
	(5, 5),
	(6, 6),
	(6, 6),
	(7, 1),
	(7, 1),
	(8, 2),
	(8, 2),
	(9, 3),
	(9, 3),
	(10, 4),
	(10, 4),
	(11, 5),
	(11, 5),
	(12, 6),
	(12, 6);
/*!40000 ALTER TABLE `produto_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.telefone
CREATE TABLE IF NOT EXISTS `telefone` (
  `usuario_id` int(11) NOT NULL,
  `telefones` varchar(255) DEFAULT NULL,
  KEY `FK92q33nmw94rylnpis5mgcy3v` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.telefone: 6 rows
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` (`usuario_id`, `telefones`) VALUES
	(1, '27363323'),
	(1, '93838393'),
	(2, '27363323'),
	(2, '93838393'),
	(3, '93883321'),
	(3, '34252625');
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_cria_1.usuario
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_cria_1.usuario: 3 rows
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `ativo`, `cpf_ou_cnpj`, `email`, `nome`, `senha`, `tipo`) VALUES
	(1, 0, '96486444000158', 'unifesp@gmail.com', 'UNFESP SJC', '$2a$10$J1FEw6R0Ec3lCDwQnUZ2RO6T0XiXPUFxqyz.ST/whxHFKqbMsvTei', 2),
	(2, 0, '36378912377', 'maria@gmail.com', 'Maria Silva', '$2a$10$wEShi1xnaOwcDibpRxG3neEvvYh419yOR2mbuWUbDFRUTarjLLqbS', 1),
	(3, 0, '31628382740', 'francojmf31@gmail.com', 'Joao Franco', '$2a$10$Dx.QpRJe29j3CO94nTiy9uywaGhtGU0pjpgD1qmuEHAA4yybFpfii', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
