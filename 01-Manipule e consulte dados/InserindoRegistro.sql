-- A inserção dos registros pode ser individual, um INSERT por vez, ou podem ser
-- selecionados todos os INSERT e executados de uma só vez
INSERT INTO TB_PRODUTOS
(PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR,PRECO_LISTA)
VALUES
('1037797', 'Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01);

INSERT INTO TB_PRODUTOS
(PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR,PRECO_LISTA)
VALUES
('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 
'Uva', 6.31);

INSERT INTO TB_PRODUTOS
(PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR,PRECO_LISTA)
VALUES
('1004327', 'Videira do Campo - 1,5 Litros - Melância', 'PET', '1,5 Litros',
'Melância', 19.51);

--------------------------------------------------------------------------------

-- Consultando registros inseridos
SELECT * FROM TB_PRODUTOS;

--------------------------------------------------------------------------------

-- Mesmo exemplo em outra tabela
INSERT INTO TB_VENDEDORES
(MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO)
VALUES
('00400', 'Maria do Rosario', '23/07/2012', 0.15);

INSERT INTO TB_VENDEDORES
(MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO)
VALUES
('00810', 'Marcia Almeida', '14/12/2016', 0.18);

INSERT INTO TB_VENDEDORES
(MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO)
VALUES
('00414', 'Carlos Moreira', '13/11/2015', 0.14);

INSERT INTO TB_VENDEDORES
(MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO)
VALUES
('00934', 'Juvenildo Martins', '09/03/2010', 0.20);