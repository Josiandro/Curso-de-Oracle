-- Seleciona toda a tabela de itens das notas
SELECT * FROM ITENS_NOTAS_FISCAIS;

--------------------------------------------------------------------------------

-- Seleciona a coluna sabor e logo após, todos os registros da tabela
SELECT SABOR, TABELA_DE_PRODUTOS.* FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- [1]
-- Faz um JOIN entre a tabela de notas e itens das notas, para pegar os sabores
-- que mais venderam em 2016 e ordena por quantidade, da maior para a menor
SELECT
    TP.SABOR AS SABORES,
    EXTRACT(YEAR FROM NF.DATA_VENDA) AS ANO,
    SUM(IT.QUANTIDADE) AS TOTAL_SABORES
FROM
    ITENS_NOTAS_FISCAIS IT
INNER JOIN
    TABELA_DE_PRODUTOS TP
ON IT.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
INNER JOIN
    NOTAS_FISCAIS NF
ON NF.NUMERO = IT.NUMERO
WHERE EXTRACT(YEAR FROM NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, EXTRACT(YEAR FROM NF.DATA_VENDA)
ORDER BY TOTAL_SABORES DESC;

--------------------------------------------------------------------------------

-- [2]
-- Faz um JOIN entre a tabela de notas e itens das notas, para pegar o total
-- vendido no ano de 2016
SELECT
    EXTRACT(YEAR FROM NF.DATA_VENDA) AS ANO,
    SUM(INF.QUANTIDADE) AS QUANTIDADE_GERAL
FROM
    NOTAS_FISCAIS NF
INNER JOIN
    ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
WHERE EXTRACT(YEAR FROM NF.DATA_VENDA) = 2016
GROUP BY EXTRACT(YEAR FROM NF.DATA_VENDA);

--------------------------------------------------------------------------------

-- [3]
-- Transforma o SQL número [2] em uma coluna, para ter também o total vendido
-- de 2016. Para isso, é usada a subconsulta, passando uma select dentro da outra 
SELECT
    TP.SABOR AS SABORES,
    EXTRACT(YEAR FROM NF.DATA_VENDA) AS ANO,
    SUM(IT.QUANTIDADE) AS TOTAL_SABORES,
    (
    SELECT TOTAL_ANO.QUANTIDADE_GERAL FROM
    (SELECT
    EXTRACT(YEAR FROM NF.DATA_VENDA) AS ANO,
    SUM(INF.QUANTIDADE) AS QUANTIDADE_GERAL
    FROM
        NOTAS_FISCAIS NF
    INNER JOIN
        ITENS_NOTAS_FISCAIS INF
    ON NF.NUMERO = INF.NUMERO
    WHERE EXTRACT(YEAR FROM NF.DATA_VENDA) = 2016
    GROUP BY EXTRACT(YEAR FROM NF.DATA_VENDA)) TOTAL_ANO
    ) AS QUANTIDADE_GERAL
FROM
    ITENS_NOTAS_FISCAIS IT
INNER JOIN
    TABELA_DE_PRODUTOS TP
ON IT.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
INNER JOIN
    NOTAS_FISCAIS NF
ON NF.NUMERO = IT.NUMERO
WHERE EXTRACT(YEAR FROM NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, EXTRACT(YEAR FROM NF.DATA_VENDA)
ORDER BY TOTAL_SABORES DESC;

--------------------------------------------------------------------------------

-- [4]
-- Transforma o select número [3] em uma subtabela e usa ela para extrair todas
-- as informações necessárias. Depois, divide a quantidade total pela quantidade
-- geral de cada sabor e multiplica por 100, para obter o percentual de participação
SELECT CONSULTA_RELATORIO.SABOR,
       CONSULTA_RELATORIO.ANO,
       CONSULTA_RELATORIO.QUANTIDADE_TOTAL,
       ROUND((CONSULTA_RELATORIO.QUANTIDADE_TOTAL / CONSULTA_RELATORIO.QUANTIDADE_GERAL) * 100, 2) AS PERCENTUAL_PARTICIPACAO
FROM
(SELECT
    TP.SABOR AS SABOR,
    EXTRACT(YEAR FROM NF.DATA_VENDA) AS ANO,
    SUM(IT.QUANTIDADE) AS QUANTIDADE_TOTAL,
    (
    SELECT TOTAL_ANO.QUANTIDADE_GERAL FROM
    (SELECT
    EXTRACT(YEAR FROM NF.DATA_VENDA) AS ANO,
    SUM(INF.QUANTIDADE) AS QUANTIDADE_GERAL
    FROM
        NOTAS_FISCAIS NF
    INNER JOIN
        ITENS_NOTAS_FISCAIS INF
    ON NF.NUMERO = INF.NUMERO
    WHERE EXTRACT(YEAR FROM NF.DATA_VENDA) = 2016
    GROUP BY EXTRACT(YEAR FROM NF.DATA_VENDA)) TOTAL_ANO
    ) AS QUANTIDADE_GERAL
FROM
    ITENS_NOTAS_FISCAIS IT
INNER JOIN
    TABELA_DE_PRODUTOS TP
ON IT.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
INNER JOIN
    NOTAS_FISCAIS NF
ON NF.NUMERO = IT.NUMERO
WHERE EXTRACT(YEAR FROM NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, EXTRACT(YEAR FROM NF.DATA_VENDA)
ORDER BY QUANTIDADE_TOTAL DESC) CONSULTA_RELATORIO;

--------------------------------------------------------------------------------