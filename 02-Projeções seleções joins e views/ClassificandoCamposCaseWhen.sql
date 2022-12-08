-- Seleciona duas colunas da tabela
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA 
FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona duas colunas da tabela e cria uma nova coluna com a classificação
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
      WHEN PRECO_DE_LISTA > 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'BARATO'
      END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona duas colunas da tabela e cria uma nova coluna com a classificação,
-- depois faz o ORDER BY passando o mesmo CASE WHEN para ser considerado nesta
-- classificação
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
      WHEN PRECO_DE_LISTA > 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'BARATO'
      END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga'
ORDER BY (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
      WHEN PRECO_DE_LISTA > 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'BARATO'
      END);

--------------------------------------------------------------------------------

-- Seleciona duas colunas da tabela e cria uma nova coluna com a classificação,
-- depois faz o RODER BY passando o ALIAS do CASE WHEN, assim o código fica mais
-- simples de entender
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
      WHEN PRECO_DE_LISTA > 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'BARATO'
      END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga'
ORDER BY CLASSIFICACAO;

--------------------------------------------------------------------------------

-- Liste somente os nomes dos clientes e os classifique por:
-- Acima ou igual a 150.000 de limite de crédito - Clientes grandes
-- Entre 150.000 e 110.000 de limite de crédito - Clientes médios
-- Menores que 110.000 de limite de crédito - Clientes pequenos
SELECT NOME,
(CASE WHEN LIMITE_DE_CREDITO >= 150000 THEN 'Clientes grandes'
      WHEN LIMITE_DE_CREDITO < 150000 AND LIMITE_DE_CREDITO >= 110000 THEN 'Clientes médios'
      ELSE 'Clientes pequenos'
      END) AS CLASSIFICACAO_CLIENTES
FROM TABELA_DE_CLIENTES
ORDER BY CLASSIFICACAO_CLIENTES;

--------------------------------------------------------------------------------















