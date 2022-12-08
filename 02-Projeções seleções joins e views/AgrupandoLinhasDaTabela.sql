-- SUM Soma
-- AVG Média
-- MIN Mínimo
-- MAX Máximo
-- Count Contar registros

--------------------------------------------------------------------------------
-- Seleciona todos os campos da tabela
SELECT * FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------
-- Seleciona dois campos e faz a ordenação deles
SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES ORDER BY CIDADE, IDADE;

--------------------------------------------------------------------------------

-- Seleciona dois campos, faz a ordenação deles e lista apenas os distintos
SELECT DISTINCT CIDADE, IDADE FROM TABELA_DE_CLIENTES ORDER BY CIDADE, IDADE;

--------------------------------------------------------------------------------

-- Seleciona dois campos e faz a ordenação deles
SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES ORDER BY CIDADE, IDADE;

--------------------------------------------------------------------------------

-- Seleciona dois campos e ordena e agrupa pela cidade, mas é preciso usar um
-- comando de agregação na IDADE, pois é um campo numérico
-- Pelo fato da IDADE ser usada com o comando de agregação, ele deve ser
-- removida do ORDER BY
SELECT CIDADE, SUM(IDADE) FROM TABELA_DE_CLIENTES GROUP BY CIDADE 
ORDER BY CIDADE;

--------------------------------------------------------------------------------

-- Mais um exemplo agrupando por CIDADE e somando o LIMITE_DE_CREDITO
SELECT CIDADE, SUM(LIMITE_DE_CREDITO), SUM(IDADE) FROM TABELA_DE_CLIENTES 
GROUP BY CIDADE;

--------------------------------------------------------------------------------
-- Mais um exemplo, agrupando por EMBALAGEM, pegando o maior valor da coluna
-- PRECO_DE_LISTA e criando um Alias
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM TABELA_DE_PRODUTOS 
GROUP BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Seleciona dois campos e ordena por embalagem
SELECT EMBALAGEM, NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Seleciona o campo, agrupa e ordena por EMBALAGEM e faz um COUNT dos registros
SELECT EMBALAGEM, COUNT(*) FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM 
ORDER BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Seleciona o campo, agrupa e ordena por EMBALAGEM e faz um COUNT dos registros
-- considerando o clausula que consta no WHERE
SELECT EMBALAGEM, COUNT(*) FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja' 
GROUP BY EMBALAGEM ORDER BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Seleciona o campo, agrupa e ordena por EMBALAGEM e faz um COUNT dos registros
-- considerando o clausula que consta no WHERE, esse COUNT recebe um Alias
SELECT EMBALAGEM, COUNT(*) AS NUMERO_DE_PRODUTOS FROM TABELA_DE_PRODUTOS 
WHERE SABOR = 'Laranja' 
GROUP BY EMBALAGEM ORDER BY EMBALAGEM;

--------------------------------------------------------------------------------

-- Lista a contagem das vendas que se encaixam no WHERE
SELECT COUNT(*) AS NUMERO_VENDAS FROM ITENS_NOTAS_FISCAIS 
WHERE CODIGO_DO_PRODUTO = '1101035' 
AND QUANTIDADE = 99;

--------------------------------------------------------------------------------

-- Lista a contagem das vendas que se encaixam no WHERE e agrupa por 
-- CODIGO_DO_PRODUTO
SELECT CODIGO_DO_PRODUTO, COUNT(*) AS NUMERO_VENDAS FROM ITENS_NOTAS_FISCAIS 
WHERE CODIGO_DO_PRODUTO = '1101035' 
AND QUANTIDADE = 99 
GROUP BY CODIGO_DO_PRODUTO;

--------------------------------------------------------------------------------
