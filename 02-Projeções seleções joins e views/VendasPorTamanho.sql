-- Exerc�cio, ranking das vendas por tamanho

-- Seleciona todos os campos da tabela de produtos
SELECT * FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- [1]
-- Faz um INNER JOIN das tr�s tabelas para pegar as informa��es de tamanho, ano
-- e quantidade acumulada por tamanho
SELECT
    TB_PRODUTOS.TAMANHO AS TAMANHO,
    EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) AS ANO,
    SUM(TB_ITEMNF.QUANTIDADE) AS QUANTIDADE_TAMANHO
FROM
    NOTAS_FISCAIS TB_NOTAS
INNER JOIN  
    ITENS_NOTAS_FISCAIS TB_ITEMNF
ON TB_NOTAS.NUMERO = TB_ITEMNF.NUMERO
INNER JOIN
    TABELA_DE_PRODUTOS TB_PRODUTOS
ON TB_ITEMNF.CODIGO_DO_PRODUTO = TB_PRODUTOS.CODIGO_DO_PRODUTO
WHERE EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) = 2016
GROUP BY TAMANHO , EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA)
ORDER BY SUM(TB_ITEMNF.QUANTIDADE) DESC;

--------------------------------------------------------------------------------

-- [2]
-- Faz um INNER JOIN das tabelas de notas e item das notas, para pegar a 
-- quantidade geral das vendas por tamanho em 2016

SELECT
    EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) AS ANO,
    SUM(TB_ITEMNF.QUANTIDADE) AS QUANTIDADE_GERAL
FROM
    NOTAS_FISCAIS TB_NOTAS
INNER JOIN
    ITENS_NOTAS_FISCAIS TB_ITEMNF
ON TB_NOTAS.NUMERO = TB_ITEMNF.NUMERO
WHERE EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) = 2016
GROUP BY EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA);

--------------------------------------------------------------------------------

-- [3]
-- Transforma a select 2 em uma subtabela e depois usa como campo para adicionar
-- uma nova coluna com a quntidade geral de vendas no ano
SELECT
    TB_PRODUTOS.TAMANHO AS TAMANHO,
    EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) AS ANO,
    SUM(TB_ITEMNF.QUANTIDADE) AS QUANTIDADE_TAMANHO,
    (
    SELECT TOTAL_ANO.QUANTIDADE_GERAL
    FROM
        (SELECT
        EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) AS ANO,
        SUM(TB_ITEMNF.QUANTIDADE) AS QUANTIDADE_GERAL
        FROM
            NOTAS_FISCAIS TB_NOTAS
        INNER JOIN
            ITENS_NOTAS_FISCAIS TB_ITEMNF
        ON TB_NOTAS.NUMERO = TB_ITEMNF.NUMERO
        WHERE EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) = 2016
        GROUP BY EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA)) TOTAL_ANO
        ) AS QUANTIDADE_GERAL
FROM
    NOTAS_FISCAIS TB_NOTAS
INNER JOIN  
    ITENS_NOTAS_FISCAIS TB_ITEMNF
ON TB_NOTAS.NUMERO = TB_ITEMNF.NUMERO
INNER JOIN
    TABELA_DE_PRODUTOS TB_PRODUTOS
ON TB_ITEMNF.CODIGO_DO_PRODUTO = TB_PRODUTOS.CODIGO_DO_PRODUTO
WHERE EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) = 2016
GROUP BY TAMANHO , EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA)
ORDER BY SUM(TB_ITEMNF.QUANTIDADE) DESC;

--------------------------------------------------------------------------------

-- [4]

SELECT
    CONSULTA_RELATORIO.TAMANHO,
    CONSULTA_RELATORIO.ANO,
    ROUND((CONSULTA_RELATORIO.QUANTIDADE_TAMANHO / CONSULTA_RELATORIO.QUANTIDADE_GERAL) * 100, 2) AS PERCENTUAL_CONTRIBUICAO
FROM
(SELECT
    TB_PRODUTOS.TAMANHO AS TAMANHO,
    EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) AS ANO,
    SUM(TB_ITEMNF.QUANTIDADE) AS QUANTIDADE_TAMANHO,
    (
    SELECT TOTAL_ANO.QUANTIDADE_GERAL
    FROM
        (SELECT
        EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) AS ANO,
        SUM(TB_ITEMNF.QUANTIDADE) AS QUANTIDADE_GERAL
        FROM
            NOTAS_FISCAIS TB_NOTAS
        INNER JOIN
            ITENS_NOTAS_FISCAIS TB_ITEMNF
        ON TB_NOTAS.NUMERO = TB_ITEMNF.NUMERO
        WHERE EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) = 2016
        GROUP BY EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA)) TOTAL_ANO
        ) AS QUANTIDADE_GERAL
    FROM
        NOTAS_FISCAIS TB_NOTAS
    INNER JOIN  
        ITENS_NOTAS_FISCAIS TB_ITEMNF
    ON TB_NOTAS.NUMERO = TB_ITEMNF.NUMERO
    INNER JOIN
        TABELA_DE_PRODUTOS TB_PRODUTOS
    ON TB_ITEMNF.CODIGO_DO_PRODUTO = TB_PRODUTOS.CODIGO_DO_PRODUTO
    WHERE EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA) = 2016
    GROUP BY TAMANHO , EXTRACT(YEAR FROM TB_NOTAS.DATA_VENDA)
    ORDER BY SUM(TB_ITEMNF.QUANTIDADE) DESC) CONSULTA_RELATORIO;
    
--------------------------------------------------------------------------------