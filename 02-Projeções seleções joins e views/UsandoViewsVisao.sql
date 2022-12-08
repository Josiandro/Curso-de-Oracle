-- Lista embalagens, cujo preço agrupado é maior ou igual a 80, usando 
-- subconsultas ao invés do HAVING
SELECT SOMA_EMBALAGENS.EMBALAGEM, SOMA_EMBALAGENS.SOMA_PRECO
FROM 
    (SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
    FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM) SOMA_EMBALAGENS
WHERE 
    SOMA_EMBALAGENS.SOMA_PRECO >= 80;
    
--------------------------------------------------------------------------------

-- Criar uma VIEW (tabela virtual) com o resultado da subconsulta do código 
-- acima, com as colunas de embalagem e preco agregado
CREATE VIEW VW_SOMA_EMBALAGENS AS 
SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Faz um select na VIEW como se ela fosse uma tabela
SELECT EMBALAGEM, SOMA_PRECO FROM VW_SOMA_EMBALAGENS
WHERE SOMA_PRECO >= 80;

--------------------------------------------------------------------------------

-- Faz um select na tabela de produtos, juntando com a VIEW criada e lista todos
-- os campos se a condição do WHERE for atendida
SELECT * FROM
    TABELA_DE_PRODUTOS TP
INNER JOIN
    VW_SOMA_EMBALAGENS VW
ON TP.EMBALAGEM = VW.EMBALAGEM
WHERE VW.SOMA_PRECO >= 80;

--------------------------------------------------------------------------------

-- Cria uma VIEW dos produtos vendidos, conforme SELECT feita
CREATE VIEW VW_PRODUTOS_VENDIDOS AS 
SELECT 
    INF.CODIGO_DO_PRODUTO, 
    TP.NOME_DO_PRODUTO, 
    SUM(INF.QUANTIDADE) AS QUANTIDADE
FROM 
    ITENS_NOTAS_FISCAIS INF
INNER JOIN 
    TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO;

--------------------------------------------------------------------------------

-- Consulta todos os produtos que constam na VIEW
SELECT * FROM VW_PRODUTOS_VENDIDOS;

--------------------------------------------------------------------------------

-- Consulta produtos da VIEW considerando o WHERE e ordenando
SELECT * FROM VW_PRODUTOS_VENDIDOS
WHERE QUANTIDADE > 394000
ORDER BY QUANTIDADE DESC;

--------------------------------------------------------------------------------