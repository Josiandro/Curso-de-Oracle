-- Sele��o aberta na tabela
SELECT * FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Sele��o agrupando por estado e somando o limite de cr�dito
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES GROUP BY ESTADO;

--------------------------------------------------------------------------------

-- Sele��o agrupando por estado e somando o limite de cr�dito, por�m, tenta
-- trazer apenas resultados cujo limite passou de 900000, mas da erro
-- N�o � poss�vel usar o WHERE com o comando de agrega��o
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES 
WHERE SUM(LIMITE_DE_CREDITO) >= 900000 GROUP BY ESTADO;

--------------------------------------------------------------------------------

-- Sele��o agrupando por estado e somando o limite de cr�dito e trazendo apenas
-- resultados cujo limite passou de 900000. Dessa vez d� certo, pois o HAVING �
-- espec�fico para isso, aplicar um filtro no resultado da agrega��o
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

--------------------------------------------------------------------------------

-- Sele��o agrupando por embalagem e listando o maior e menor pre�o com uso do
-- GROUP BY
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Sele��o agrupando por embalagem e listando o maior e menor pre�o com uso do
-- GROUP BY se o pre�o de lista for maior ou igual a 10
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS 
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Sele��o agrupando por embalagem e listando o maior e menor pre�o com uso do
-- GROUP BY se o pre�o de lista for maior ou igual a 10. Depois, lista apenas os
-- resultados da agrega��o que s�o maiores ou iguais a 20. Ou seja, tem o filtro
-- antes da agrega��o e depois da agrega��o
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