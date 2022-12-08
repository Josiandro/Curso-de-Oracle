-- Consultando registros inseridos
SELECT * FROM TB_VENDEDORES;

--------------------------------------------------------------------------------

-- Inserindo registros na tabelas de produtos
INSERT INTO TB_PRODUTOS
(PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR,PRECO_LISTA)
VALUES
('1037797', 'Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01);

--------------------------------------------------------------------------------

-- Apagando registros considerando o WHERE
DELETE FROM TB_PRODUTOS WHERE PRODUTO = '1037797';

--------------------------------------------------------------------------------

-- Alterando as tabelas, adicionando a restrição e definindo o campo que será
-- primary key (campo que não podera ter valor repetido)
ALTER TABLE TB_PRODUTOS ADD CONSTRAINT PK_TB_PRODUTOS PRIMARY KEY (PRODUTO);

ALTER TABLE TB_VENDEDORES ADD CONSTRAINT PK_TB_VENDEDORES PRIMARY KEY 
(MATRICULA);