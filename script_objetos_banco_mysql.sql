/*CRIANDO A TABELA DE GRUPOS*/
CREATE TABLE tb_grupo
(
  
  id_grupo     INT           auto_increment PRIMARY KEY NOT NULL,
  ds_nome      VARCHAR(50)   NOT NULL,
  ds_descricao VARCHAR(200)  NOT NULL
);


/*CRIANDO A TABELA DE PERMISSÕES*/
CREATE TABLE tb_permissao
(
   id_permissao INT auto_increment PRIMARY KEY NOT NULL,
   ds_permissao VARCHAR(50)    NOT NULL,
   ds_descricao VARCHAR(200)   NOT NULL   
);



/*CRIANDO A TABELA DE USUÁRIOS*/
CREATE TABLE tb_usuario
(
  id_usuario INT auto_increment PRIMARY KEY NOT NULL,
  ds_nome    VARCHAR(60)      NOT NULL,
  ds_login   VARCHAR(60)      NOT NULL,
  ds_senha   VARCHAR(400)     NOT NULL,
  fl_ativo   smallint        NOT NULL
);

/*CRIANDO A TABELA DE USUÁRIO X GRUPO*/
CREATE TABLE tb_usuario_x_grupo
(
  id_usuario INT NOT NULL,  
  id_grupo   INT NOT NULL,
  CONSTRAINT PK_USU_GRUP   PRIMARY KEY(id_usuario,id_grupo),
  FOREIGN KEY(id_usuario) REFERENCES tb_usuario(id_usuario), 
  FOREIGN KEY(id_grupo)  REFERENCES tb_grupo(id_grupo)
);

/*CRIANDO A TABELA DE PERMISSÃO X GRUPO*/
CREATE TABLE tb_permissao_x_grupo
(
  id_permissao INT NOT NULL,  
  id_grupo     INT NOT NULL,
  CONSTRAINT PK_PER_GRUP   PRIMARY KEY(id_permissao,id_grupo),
  CONSTRAINT FK_PERM_1 FOREIGN KEY(id_permissao) REFERENCES tb_permissao(id_permissao), 
  CONSTRAINT FK_GRUP_1 FOREIGN KEY(id_grupo)  REFERENCES tb_grupo(id_grupo)
);


INSERT INTO tb_grupo(id_grupo,
                             ds_nome,
                             ds_descricao) 
                      VALUES(1,
                              'ADMINISTRADOR', 
                              'Administrador');

INSERT INTO tb_grupo(id_grupo,
                             ds_nome,
                             ds_descricao) 
                      VALUES(2,
                              'USUARIO', 
                              'Usuário Comum');

INSERT INTO tb_grupo(id_grupo,
                             ds_nome,
                             ds_descricao) 
                      VALUES(3,
                              'GERENTE', 
                              'Gerente');

INSERT INTO tb_grupo(id_grupo,
                             ds_nome,
                             ds_descricao) 
                      VALUES(4,
                              'COOPERADOR', 
                              'Cooperador');
                              
INSERT INTO tb_usuario (id_usuario,
                                ds_nome,
                                ds_login,
                                ds_senha,
                                fl_ativo)
                        VALUES(2,
                                'João Franco',
                                'joao.franco',
                                '$2a$10$i4U6mldgvVkRy1irPkV7QuV4pgb8sE/QvI571dskbacRugwmxAR4u',
                                 1);
                                 
                                 

INSERT INTO tb_permissao(id_permissao,
                                  ds_permissao,
                                  ds_descricao)
                           VALUES(1,
                                   'ROLE_CADASTRO',
                                   'CADASTRO DE NOVOS USUÁRIOS');
                                   
INSERT INTO tb_permissao(id_permissao,
                                  ds_permissao,
                                  ds_descricao)
                           VALUES(2,
                                   'ROLE_CONSULTA',
                                   'CONSULTA DE USUÁRIOS');                                   

INSERT INTO tb_permissao(id_permissao,
                                  ds_permissao,
                                  ds_descricao)
                           VALUES(3,
                                   'ROLE_ADMIN',
                                   'ADMINISTRAÇÂO COMPLETA');                                   


INSERT INTO tb_usuario_x_grupo(id_usuario,id_grupo)VALUES(1,1);



/*ROLE_CADASTRO x GERENTE*/
INSERT INTO tb_permissao_x_grupo(id_permissao,id_grupo)VALUES(1,3); 

/*ROLE_CONSULTA x COOPERADOR*/
INSERT INTO tb_permissao_x_grupo(id_permissao,id_grupo)VALUES(2,4);

/*ROLE_CONSULTA x USUARIO*/
INSERT INTO tb_permissao_x_grupo(id_permissao,id_grupo)VALUES(2,2);

/*ROLE_ADMIN x ADMINISTRADOR*/
INSERT INTO tb_permissao_x_grupo(id_permissao,id_grupo)VALUES(3,1);




SELECT
  TB_PERMISSAO_X_GRUPO.ID_PERMISSAO,
  TB_PERMISSAO.DS_PERMISSAO,
  TB_PERMISSAO.DS_DESCRICAO,
  TB_PERMISSAO_X_GRUPO.ID_GRUPO,
  TB_GRUPO.DS_NOME
FROM
  TB_PERMISSAO_X_GRUPO TB_PERMISSAO_X_GRUPO
INNER JOIN  TB_GRUPO TB_GRUPO ON  TB_GRUPO.ID_GRUPO = TB_PERMISSAO_X_GRUPO.ID_GRUPO 
INNER JOIN  TB_PERMISSAO TB_PERMISSAO ON TB_PERMISSAO.ID_PERMISSAO  = TB_PERMISSAO_X_GRUPO.ID_PERMISSAO;
