-- Consultando registros inseridos
SELECT * FROM TB_CLIENTES;
SELECT * FROM TB_PRODUTOS;

--------------------------------------------------------------------------------

-- Consultando registros inseridos passando colunas espec�ficas
SELECT PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA FROM TB_PRODUTOS;

SELECT PRECO_LISTA , NOME, PRODUTO, EMBALAGEM, TAMANHO, SABOR FROM TB_PRODUTOS;

SELECT PRODUTO, NOME FROM TB_PRODUTOS;

--------------------------------------------------------------------------------

-- Consultando registros inseridos passando colunas espec�ficas e criando alias
SELECT 
    PRODUTO AS "CODIGO DO PRODUTO", 
    NOME AS "NOME DO PRODUTO", 
    EMBALAGEM, 
    TAMANHO, 
    SABOR, 
    PRECO_LISTA 
FROM TB_PRODUTOS;