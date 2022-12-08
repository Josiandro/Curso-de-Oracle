-- Consulta dois campos específicos na tabela
SELECT
    PRODUTO,
    NOME
FROM TB_PRODUTOS;

-- Consulta dois campos específicos na tabela, porém renomeia um destes campos 
-- com o uso do Alias
SELECT
    PRODUTO AS "CÓDIGO",
    NOME
FROM TB_PRODUTOS;

--------------------------------------------------------------------------------

-- Consulta todos os campos da tabela
SELECT * FROM TB_CLIENTES;

-- Consulta todos os campos, usando os "paipes" para concatenar as informações 
-- em uma coluna única
SELECT
    NOME,
    ENDERECO1 || ', ' || BAIRRO || ', ' || CIDADE || ' - ' || ESTADO
FROM TB_CLIENTES;

-- Faz a mesma consulta, porém adiciona um Alias para a coluna única que foi 
-- criada
SELECT
    NOME,
    ENDERECO1 || ', ' || BAIRRO || ', ' || CIDADE || ' - ' || ESTADO AS Endereço
FROM TB_CLIENTES;

-- Faz novamente a mesma consulta, porém adiciona um Alias formado por duas 
-- palavras
SELECT
    NOME,
    ENDERECO1 || ', ' || BAIRRO || ', ' || CIDADE || ' - ' || ESTADO 
    AS "Endereço completo"
FROM TB_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona todas as colunas de duas tabelas ao mesmo tempo
SELECT * FROM TB_VENDEDORES, TB_CLIENTES;

-- Tentar selecionar as duas colunas NOME de ambas as tabelas ao mesmo tempo, 
-- mas retorna erro
SELECT 
    NOME, 
    NOME 
FROM TB_VENDEDORES, TB_CLIENTES;

-- Seleciona a coluna NOME de duas tabelas, espeficificando de qual tabela é 
-- cada NOME
SELECT 
    TB_VENDEDORES.NOME, 
    TB_CLIENTES.NOME 
FROM TB_VENDEDORES, TB_CLIENTES;

-- Seleciona a coluna NOME de duas tabelas, porém usa Alias para as colunas e 
-- também para as tabelas
SELECT 
    C.NOME AS CLIENTE, 
    V.NOME AS VENDEDOR
FROM TB_VENDEDORES V, TB_CLIENTES C;

--------------------------------------------------------------------------------

-- Seleciona a coluna NOME da tabela
SELECT
    NOME
FROM TB_CLIENTES;

-- Seleciona a coluna NOME da outra tabela usando Alias para coluna e tabela
SELECT 
    V.NOME VENDEDOR
FROM TB_VENDEDORES V;

-- Seleciona o NOME da sub-consulta que recebeu Alias e também da tabela 
-- externa que também recebeu alias
SELECT
    X.NOME CLIENTE,
    V.NOME VENDEDOR
FROM
    (SELECT NOME, CPF FROM TB_CLIENTES) X,
    TB_VENDEDORES V;