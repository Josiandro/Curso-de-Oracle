-- INNER JOIN listando clientes e vendedores que possuem o bairro em comum
SELECT DISTINCT
    TV.NOME AS NOME_DO_VENDEDOR,
    TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
    TC.NOME AS NOME_DO_CLIENTE,
    TC.BAIRRO AS BAIRRO_DO_CLIENTE
FROM
    TABELA_DE_CLIENTES TC
INNER JOIN
    TABELA_DE_VENDEDORES TV
ON TV.BAIRRO = TC.BAIRRO;

--------------------------------------------------------------------------------

-- Faz um COUNT dos vendedores cadastrados na tabela
SELECT COUNT(*) FROM TABELA_DE_VENDEDORES;

--------------------------------------------------------------------------------
-- LEFT JOIN Lista todos os registros da tabela da esquerda (clientes) e os 
-- registros da tabela da direita (vendedores) que possuem o bairro em comum
SELECT DISTINCT
    TV.NOME AS NOME_DO_VENDEDOR,
    TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
    TC.NOME AS NOME_DO_CLIENTE,
    TC.BAIRRO AS BAIRRO_DO_CLIENTE
FROM
    TABELA_DE_CLIENTES TC
LEFT JOIN
    TABELA_DE_VENDEDORES TV
ON TV.BAIRRO = TC.BAIRRO;

--------------------------------------------------------------------------------

-- RIGHT JOIN Lista todos os registros da tabela da direita (vendedores) e os 
-- registros da tabela da esquerda (clientes) que possuem o bairro em comum
SELECT DISTINCT
    TV.NOME AS NOME_DO_VENDEDOR,
    TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
    TC.NOME AS NOME_DO_CLIENTE,
    TC.BAIRRO AS BAIRRO_DO_CLIENTE
FROM
    TABELA_DE_CLIENTES TC
RIGHT JOIN
    TABELA_DE_VENDEDORES TV
ON TV.BAIRRO = TC.BAIRRO;

--------------------------------------------------------------------------------
-- Lista todos os registros de ambas as tabelas
SELECT DISTINCT
    TV.NOME AS NOME_DO_VENDEDOR,
    TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
    TC.NOME AS NOME_DO_CLIENTE,
    TC.BAIRRO AS BAIRRO_DO_CLIENTE
FROM
    TABELA_DE_CLIENTES TC
FULL JOIN
    TABELA_DE_VENDEDORES TV
ON TV.BAIRRO = TC.BAIRRO;

--------------------------------------------------------------------------------