-- Seleciona todos os campos da tabela de clientes
SELECT * FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- JOIN da tabela de notas fiscais com a tabela de itens das notas
-- Esse SQL agrupa as quantidades vendidas de cada cliente durante o mês
SELECT
    NF.CPF,
    TO_CHAR(NF.DATA_VENDA, 'MM/YYYY') AS MES_ANO,
    SUM(IT.QUANTIDADE) AS QUANTIDADE_TOTAL
FROM
    NOTAS_FISCAIS NF
INNER JOIN
    ITENS_NOTAS_FISCAIS IT
ON NF.NUMERO = IT.NUMERO
GROUP BY NF.CPF, TO_CHAR(NF.DATA_VENDA, 'MM/YYYY');

--------------------------------------------------------------------------------

-- JOIN da tabela de clientes com a consulta de cima, que uniu as tabelas de 
-- notas fiscais e a tabela de itens das notas
-- Esse SQL compara o valor do volume de compra (limite do cliente) com o 
-- resultado da agregação (soma) das vendas na outra seleção e depois, aplica o
-- CASE WHEN para ver se o cliente passou do limite ou não.
SELECT
    TC.CPF,
    TC.NOME,
    TC.VOLUME_DE_COMPRA,
    TV.MES_ANO,
    TV.QUANTIDADE_TOTAL,
    (CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL 
    THEN 'VENDAS VÁLIDAS' ELSE 'VENDAS INVÁLIDAS' END) AS RESULTADO
FROM
    TABELA_DE_CLIENTES TC
INNER JOIN
    (SELECT
        NF.CPF,
        TO_CHAR(NF.DATA_VENDA, 'MM/YYYY') AS MES_ANO,
        SUM(IT.QUANTIDADE) AS QUANTIDADE_TOTAL
    FROM
        NOTAS_FISCAIS NF
    INNER JOIN
        ITENS_NOTAS_FISCAIS IT
    ON NF.NUMERO = IT.NUMERO
    GROUP BY NF.CPF, TO_CHAR(NF.DATA_VENDA, 'MM/YYYY')) TV
ON TC.CPF = TV.CPF
WHERE TV.MES_ANO = '02/2015';

--------------------------------------------------------------------------------

-- Listar apenas clientes com vendas inválidas
SELECT
    TC.CPF,
    TC.NOME,
    TC.VOLUME_DE_COMPRA,
    TV.MES_ANO,
    TV.QUANTIDADE_TOTAL,
    (CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL 
    THEN 'VENDAS VÁLIDAS' ELSE 'VENDAS INVÁLIDAS' END) AS RESULTADO,
    ROUND((1 - (TC.VOLUME_DE_COMPRA / TV.QUANTIDADE_TOTAL)) * 100, 2)
FROM
    TABELA_DE_CLIENTES TC
INNER JOIN
    (SELECT
        NF.CPF,
        TO_CHAR(NF.DATA_VENDA, 'MM/YYYY') AS MES_ANO,
        SUM(IT.QUANTIDADE) AS QUANTIDADE_TOTAL
    FROM
        NOTAS_FISCAIS NF
    INNER JOIN
        ITENS_NOTAS_FISCAIS IT
    ON NF.NUMERO = IT.NUMERO
    GROUP BY NF.CPF, TO_CHAR(NF.DATA_VENDA, 'MM/YYYY')) TV
ON TC.CPF = TV.CPF
WHERE TV.MES_ANO = '02/2015' 
AND (TC.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL) < 0;