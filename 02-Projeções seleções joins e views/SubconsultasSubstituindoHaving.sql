-- Agrupa as embalagens da tabela e soma o preço
SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Agrupa as embalagens da tabela e soma o preço, porém, lista apenas embalagens
-- onde o preço somado deu maior que 80 (HAVING)
SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA) > 80;

--------------------------------------------------------------------------------

-- Agrupa as embalagens da tabela e soma o preço, porém, lista apenas ambalagens
-- onde o preço somado deu maior que 80 (SEM O HAVING)
-- Dentro do FROM é usado o primeiro select para agrupar e somar a quantidade
-- das embalagens, então ele se torna uma "tabela"
-- Depois o primeiro select consulta o resultado dentro do outro select que foi 
-- feito
SELECT SOMA_EMBALAGENS.EMBALAGEM, SOMA_EMBALAGENS.SOMA_PRECO
FROM 
    (SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
    FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM) SOMA_EMBALAGENS
WHERE 
    SOMA_EMBALAGENS.SOMA_PRECO >= 80;
    
--------------------------------------------------------------------------------

-- Redesenhar esta consulta, usando subconsultas:
SELECT 
    INF.CODIGO_DO_PRODUTO, 
    TP.NOME_DO_PRODUTO, 
    SUM(INF.QUANTIDADE) 
FROM 
    ITENS_NOTAS_FISCAIS INF
INNER JOIN 
    TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO 
HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;

--------------------------------------------------------------------------------

-- Lista os campos indicados se a quantidade vendida for maior que 394000
-- Para não usar o HEAVEN, foi criada uma tabela com uma consulta agrupando as
-- quantidades vendidas na tabela de itens das notas
SELECT 
    PRODUTOS_VENDIDOS.CODIGO,
    PRODUTOS_VENDIDOS.NOME,
    PRODUTOS_VENDIDOS.QUANTIDADE
FROM
    (SELECT 
        INF.CODIGO_DO_PRODUTO AS CODIGO, 
        TP.NOME_DO_PRODUTO AS NOME, 
        SUM(INF.QUANTIDADE) AS QUANTIDADE 
    FROM 
        ITENS_NOTAS_FISCAIS INF
    INNER JOIN 
        TABELA_DE_PRODUTOS TP 
    ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
    GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO) PRODUTOS_VENDIDOS
WHERE
    PRODUTOS_VENDIDOS.QUANTIDADE > 394000
    ORDER BY PRODUTOS_VENDIDOS.QUANTIDADE DESC;

--------------------------------------------------------------------------------