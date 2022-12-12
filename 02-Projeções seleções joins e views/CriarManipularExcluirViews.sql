-- Seleciona todas as colunas da tabela de produtos
SELECT * FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona a coluna sabor e aplica o comando de agrega��o AVG na coluna 
-- PRECO_DE_LISTA da tabela de produtos e agrupa por sabor
SELECT SABOR, AVG(PRECO_DE_LISTA) AS MEDIA FROM TABELA_DE_PRODUTOS GROUP BY SABOR;

--------------------------------------------------------------------------------

-- Seleciona o sabor e a m�dia usando o SQL anterior como subtabela
SELECT 
    MEDIA_SABOR.SABOR
    , MEDIA_SABOR.MEDIA
FROM
    (SELECT 
        SABOR
        , AVG(PRECO_DE_LISTA) AS MEDIA 
    FROM 
        TABELA_DE_PRODUTOS 
        GROUP BY SABOR) MEDIA_SABOR 
WHERE MEDIA_SABOR.MEDIA > 10;

--------------------------------------------------------------------------------

-- Cria��o de View via assist�nte:
-- 1 - Copia o SQL que vai ser transformado em View
-- 2 - Clicar com o bot�o direito em Views
-- 3 - Escolher a op��o nova View
-- 4 - Dar um nome e colar o SQL selecionado

--------------------------------------------------------------------------------

-- Cria��o de View via comandos SQL:
CREATE VIEW VW_MEDIA_POR_SABOR AS
SELECT SABOR, AVG(PRECO_DE_LISTA) AS MEDIA FROM TABELA_DE_PRODUTOS GROUP BY SABOR;

--------------------------------------------------------------------------------

-- Altera��o de View via assist�nte:
-- 1 - Clicar em Views
-- 2 - Bot�o direito na View  e escolher a op��o editar
-- 3 - Fazer ajuste no SQL e clicar em OK para salvar

--------------------------------------------------------------------------------

-- Altera��o de View via comandos SQL:
CREATE OR REPLACE VIEW VW_MEDIA_POR_SABOR AS
SELECT SABOR, AVG(PRECO_DE_LISTA) AS MEDIA FROM TABELA_DE_PRODUTOS GROUP BY SABOR;

--------------------------------------------------------------------------------

-- Fazendo consulta SQL na View
SELECT * FROM VIEW_MEDIA_POR_SABOR;

--------------------------------------------------------------------------------

-- Fazendo consulta SQL na View
SELECT
    SABOR
    , MEDIA
FROM
    VW_MEDIA_POR_SABOR
WHERE
    MEDIA > 10;

--------------------------------------------------------------------------------

-- Remo��o/Exclus�o da View via assist�nte
-- 1 - Bot�o direito na View e depois clicar em Eliminar

--------------------------------------------------------------------------------

-- Remo��o/Exclus�o da View via SQL
DROP VIEW VIEW_MEDIA_POR_SABOR;

--------------------------------------------------------------------------------