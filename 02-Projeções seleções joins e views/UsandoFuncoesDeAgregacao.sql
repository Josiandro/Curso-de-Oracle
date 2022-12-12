-- Faz o COUNT das linhas e agrupa pela coluna de embalagens
SELECT 
    EMBALAGEM
    , COUNT(*) as CONTAGEM 
FROM 
    TABELA_DE_PRODUTOS 
    GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Faz a média dos preços e agrupo pela coluna embalagem
SELECT 
    EMBALAGEM
    , ROUND(AVG(PRECO_DE_LISTA),2) AS MEDIA 
FROM 
    TABELA_DE_PRODUTOS 
    GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Faz o máximo e mínimo do preço e agrupa pela coluna embalagem
SELECT 
    EMBALAGEM
    , MAX(PRECO_DE_LISTA) AS MAXIMO
    , MIN(PRECO_DE_LISTA) AS MINIMO 
FROM 
    TABELA_DE_PRODUTOS 
    GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Faz a soma da do preço e agrupa por embalagem
SELECT 
    EMBALAGEM
    , SUM(PRECO_DE_LISTA) AS SOMA 
FROM
    TABELA_DE_PRODUTOS 
    GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------