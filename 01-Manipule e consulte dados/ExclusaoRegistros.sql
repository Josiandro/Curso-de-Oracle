-- Consultando registros inseridos
SELECT * FROM TB_VENDEDORES;

--------------------------------------------------------------------------------

-- Apaga registros das tabelas considerando a condição WHERE
-- Sem usar o WHERE, vai apagar tudo que tem na tabela
DELETE FROM TB_PRODUTOS WHERE PRODUTO = '1037797';

DELETE FROM TB_VENDEDORES WHERE MATRICULA = '00400';