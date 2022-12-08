-- LEFT JOIN vai listar todos os registros da tabela da esquerda e apenas os 
-- registros em comum, na tabela da direita
-- Quando não tem um registro em comum na tabela da direita, lista ele como NULL

--------------------------------------------------------------------------------
-- Junta a tabela de clientes e notas, depois traz apenas os registros que
-- possuem o mesmo CPF em ambas as tabelas
SELECT DISTINCT
    TC.CPF AS CPF_DO_CLIENTE,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_NOTAS_FISCAIS
FROM 
    TABELA_DE_CLIENTES TC
INNER JOIN
    NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
ORDER BY TC.NOME;

--------------------------------------------------------------------------------

-- Retorna o total de clientes que tem cadastrado na tabela
SELECT COUNT(*) FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Retorna os registros da tabela de clientes (LEFT) e na tabela de notas
-- (RIGHT) retorna os registros em comum, clientes sem venda, retorna NULL
-- Como desejo ver somente cliente sem venda, faço um WHERE na tabela da direita
-- conferindo se o conteúdo do campo é NULL
SELECT
    TC.CPF AS CPF_DO_CLIENTE,
    TC.NOME AS NOME_DO_CLIENTE
FROM 
    TABELA_DE_CLIENTES TC
LEFT JOIN
    NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
WHERE NF.CPF IS NULL
ORDER BY TC.NOME;

--------------------------------------------------------------------------------
