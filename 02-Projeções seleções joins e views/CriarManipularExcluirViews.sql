-- Seleciona todas as colunas da tabela de produtos
SELECT * FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona a coluna sabor e aplica o comando de agregação AVG na coluna 
-- PRECO_DE_LISTA da tabela de produtos e agrupa por sabor
SELECT SABOR, AVG(PRECO_DE_LISTA) AS MEDIA FROM TABELA_DE_PRODUTOS GROUP BY SABOR;

--------------------------------------------------------------------------------

-- Seleciona o sabor e a média usando o SQL anterior como subtabela
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

-- Criação de View via assistênte:
-- 1 - Copia o SQL que vai ser transformado em View
-- 2 - Clicar com o botão direito em Views
-- 3 - Escolher a opção nova View
-- 4 - Dar um nome e colar o SQL selecionado

--------------------------------------------------------------------------------

-- Criação de View via comandos SQL:
CREATE VIEW VW_MEDIA_POR_SABOR AS
SELECT SABOR, AVG(PRECO_DE_LISTA) AS MEDIA FROM TABELA_DE_PRODUTOS GROUP BY SABOR;

--------------------------------------------------------------------------------

-- Alteração de View via assistênte:
-- 1 - Clicar em Views
-- 2 - Botão direito na View  e escolher a opção editar
-- 3 - Fazer ajuste no SQL e clicar em OK para salvar

--------------------------------------------------------------------------------

-- Alteração de View via comandos SQL:
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

-- Remoção/Exclusão da View via assistênte
-- 1 - Botão direito na View e depois clicar em Eliminar

--------------------------------------------------------------------------------

-- Remoção/Exclusão da View via SQL
DROP VIEW VIEW_MEDIA_POR_SABOR;

--------------------------------------------------------------------------------