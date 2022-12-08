-- Seleção aberta na tabela
SELECT * FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleção agrupando por estado e somando o limite de crédito
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES GROUP BY ESTADO;

--------------------------------------------------------------------------------

-- Seleção agrupando por estado e somando o limite de crédito, porém, tenta
-- trazer apenas resultados cujo limite passou de 900000, mas da erro
-- Não é possível usar o WHERE com o comando de agregação
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES 
WHERE SUM(LIMITE_DE_CREDITO) >= 900000 GROUP BY ESTADO;

--------------------------------------------------------------------------------

-- Seleção agrupando por estado e somando o limite de crédito e trazendo apenas
-- resultados cujo limite passou de 900000. Dessa vez dá certo, pois o HAVING é
-- específico para isso, aplicar um filtro no resultado da agregação
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

--------------------------------------------------------------------------------

-- Seleção agrupando por embalagem e listando o maior e menor preço com uso do
-- GROUP BY
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Seleção agrupando por embalagem e listando o maior e menor preço com uso do
-- GROUP BY se o preço de lista for maior ou igual a 10
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS 
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Seleção agrupando por embalagem e listando o maior e menor preço com uso do
-- GROUP BY se o preço de lista for maior ou igual a 10. Depois, lista apenas os
-- resultados da agregação que são maiores ou iguais a 20. Ou seja, tem o filtro
-- antes da agregação e depois da agregação
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS 
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM
HAVING MAX(PRECO_DE_LISTA) >= 20;

--------------------------------------------------------------------------------

-- Verifique as quantidades totais de vendas de cada produto e ordene da maior
-- para a menor
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS TOTAL_VENDAS 
FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO 
ORDER BY SUM(QUANTIDADE) DESC;

--------------------------------------------------------------------------------

-- Liste somente os produtos que venderam mais que 394000 litros.
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS LITROS_VENDIDOS 
FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO 
HAVING SUM(QUANTIDADE) > 394000
ORDER BY SUM(QUANTIDADE) DESC;