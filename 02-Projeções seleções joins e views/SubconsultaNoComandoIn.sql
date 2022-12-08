-- Seleciona todos os bairros da tabelas e sem listar os repetidos
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

--------------------------------------------------------------------------------

-- Seleciona os registros de clientes, cujo bairro seja igual a algum dos 
-- que foram passados no IN
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO IN (
'Tijuca',
'Jardins',
'Copacabana',
'Santo Amaro');

--------------------------------------------------------------------------------

-- Seleciona os registros de clientes, cujo bairro seja igual a algum dos
-- que forem resultado da subconsulta na tabela vendedores
-- A subconsulta é tratada como um ARRAY, vai retornar um bairro por vez
SELECT * FROM TABELA_DE_CLIENTES 
WHERE BAIRRO 
IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES);

--------------------------------------------------------------------------------

-- Lista o código, nome e quantidade dos produtos mais vendidos, cuja quantidade
-- vendida, passou de 394000
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

-- SOLUÇÃO DA ALURA
-- Lista os produtos da tabela de itens das notas, que venderam mais de 394000
-- quantidades, aproveitando o select acima
SELECT DISTINCT SABOR 
FROM TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO
IN (
    SELECT INF.CODIGO_DO_PRODUTO
    FROM 
        ITENS_NOTAS_FISCAIS INF
    INNER JOIN 
        TABELA_DE_PRODUTOS TP 
    ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
    GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO 
    HAVING SUM(INF.QUANTIDADE) > 394000 
);

--------------------------------------------------------------------------------

-- Lista os produtos da tabela de itens das notas, que venderam mais de 394000
-- quantidades
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) 
FROM ITENS_NOTAS_FISCAIS
GROUP BY CODIGO_DO_PRODUTO
HAVING SUM(QUANTIDADE) > 394000
ORDER BY SUM(QUANTIDADE) DESC;

--------------------------------------------------------------------------------

-- Lista os sabores dos produtos que venderam acima de 394000 quantidades, para 
-- isso, o WHERE da tabela de produtos, recebe um select feito na tabela de 
-- itens das notas fiscais (select acima)
-- Para funcionar, foi removida a coluna quantidade com agregação e o ORDER BY
-- Não foi necessário usar o INNER JOIN
SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO IN (
    SELECT CODIGO_DO_PRODUTO 
    FROM ITENS_NOTAS_FISCAIS
    GROUP BY CODIGO_DO_PRODUTO
    HAVING SUM(QUANTIDADE) > 394000
);

--------------------------------------------------------------------------------