-- Consultando registros inseridos
SELECT * FROM TB_PRODUTOS;

--------------------------------------------------------------------------------

-- Faz update/alteração do registro de acordo com a condição WHERE
UPDATE TB_PRODUTOS 
SET EMBALAGEM = 'Lata' 
WHERE PRODUTO = '1037797';

UPDATE TB_PRODUTOS 
SET NOME = 'Clean - 350 ml - Laranja', TAMANHO = '350 ml', PRECO_LISTA = 5.50
WHERE PRODUTO = '1037797';

--------------------------------------------------------------------------------

-- Consultando registros inseridos
SELECT * FROM TB_VENDEDORES;

-- Faz update/alteração do registro de acordo com a condição WHERE
UPDATE TB_VENDEDORES SET PERCENTUAL_COMISSAO = 0.18 WHERE MATRICULA = '00233';
UPDATE TB_VENDEDORES SET PERCENTUAL_COMISSAO = 0.18 WHERE MATRICULA = '00400';
UPDATE TB_VENDEDORES SET PERCENTUAL_COMISSAO = 0.18 WHERE MATRICULA = '00414';