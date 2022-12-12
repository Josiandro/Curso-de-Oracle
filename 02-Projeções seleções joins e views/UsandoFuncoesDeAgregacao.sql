-- Faz o COUNT das linhas e agrupa pela coluna de embalagens
SELECT 
    EMBALAGEM
    , COUNT(*) as CONTAGEM 
FROM 
    TABELA_DE_PRODUTOS 
    GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Faz a m�dia dos pre�os e agrupo pela coluna embalagem
SELECT 
    EMBALAGEM
    , ROUND(AVG(PRECO_DE_LISTA),2) AS MEDIA 
FROM 
    TABELA_DE_PRODUTOS 
    GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Faz o m�ximo e m�nimo do pre�o e agrupa pela coluna embalagem
SELECT 
    EMBALAGEM
    , MAX(PRECO_DE_LISTA) AS MAXIMO
    , MIN(PRECO_DE_LISTA) AS MINIMO 
FROM 
    TABELA_DE_PRODUTOS 
    GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Faz a soma da do pre�o e agrupa por embalagem
SELECT 
    EMBALAGEM
    , SUM(PRECO_DE_LISTA) AS SOMA 
FROM
    TABELA_DE_PRODUTOS 
    GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------