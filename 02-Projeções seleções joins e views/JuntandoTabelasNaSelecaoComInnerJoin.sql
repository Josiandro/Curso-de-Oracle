-- Seleciona todos os campos da tabela
SELECT * FROM TABELA_DE_VENDEDORES;

--------------------------------------------------------------------------------

-- Seleciona todos os campos da tabela
SELECT * FROM NOTAS_FISCAIS;

--------------------------------------------------------------------------------

-- Seleciona o campo especificado e faz um COUNT agrupando por matricula
SELECT MATRICULA, COUNT(*) AS NUMERO_DE_NOTAS FROM NOTAS_FISCAIS 
GROUP BY MATRICULA;

--------------------------------------------------------------------------------
-- Tenta selecionar matrica e nome, porém, o nome fica em outra tabela
SELECT MATRICULA, NOME, COUNT(*) AS NUMERO_DE_NOTAS FROM NOTAS_FISCAIS 
GROUP BY MATRICULA, NOME;

--------------------------------------------------------------------------------

-- Seleciona matricula de uma tabela e nome de outra, para isso, é usado o INNER
-- JOIN
-- É preciso passar o nome da tabela . campo e no FROM as duas tabelas que serão
-- unidas. TABELA_TAL INNER JOIN TABELA_TAL, depois o ON com o critério, neste
-- caso, ambas devem ter a matricula igual
SELECT 
    NOTAS_FISCAIS.MATRICULA, 
    TABELA_DE_VENDEDORES.NOME, 
COUNT(*) AS NUMERO_DE_NOTAS 
FROM 
    TABELA_DE_VENDEDORES 
INNER JOIN
    NOTAS_FISCAIS
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;

--------------------------------------------------------------------------------

-- Faz a mesma coisa que o script de cima, porém usando ALIAS no nome das 
-- tabelas, deixando o código mais simples
SELECT 
    NF.MATRICULA, 
    TV.NOME, 
COUNT(*) AS NUMERO_DE_NOTAS 
FROM 
    TABELA_DE_VENDEDORES TV
INNER JOIN
    NOTAS_FISCAIS NF
ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA, TV.NOME;

--------------------------------------------------------------------------------

-- Totaliza as quantidades vendidas dos produtos com o SUM e GROUP BY e depois
-- usa o HAVING para listar apenas os que venderam mais de 394000
-- Depois, ordem as quantidades de forma decrescente
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) 
FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO
HAVING SUM(QUANTIDADE) > 394000
ORDER BY SUM(QUANTIDADE) DESC;

--------------------------------------------------------------------------------
-- Faz o mesmo select de cima, porém adiciona o nome do produto que fica em 
-- outra tabela
-- É usado o INNER JOIN para juntar as duas tabelas e o ON para passar o 
-- critério, que neste caso é o código do produto ser igual em ambas
SELECT 
    N.CODIGO_DO_PRODUTO, 
    P.NOME_DO_PRODUTO, 
    SUM(N.QUANTIDADE) AS TOTAL_VENDIDO
FROM 
    TABELA_DE_PRODUTOS P
INNER JOIN
    ITENS_NOTAS_FISCAIS N
ON P.CODIGO_DO_PRODUTO = N.CODIGO_DO_PRODUTO
GROUP BY N.CODIGO_DO_PRODUTO, P.NOME_DO_PRODUTO
HAVING SUM(N.QUANTIDADE) > 394000
ORDER BY SUM(N.QUANTIDADE) DESC;

--------------------------------------------------------------------------------



















