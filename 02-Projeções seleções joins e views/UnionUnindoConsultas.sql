-- Lista os bairros da tabela sem repetir linhas iguais (12 bairros)
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Lista os bairros da tabela sem repetir linhas iguais (4 bairros)
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

--------------------------------------------------------------------------------

-- Lista os bairros das tabelas sem repetir linhas iguais, o UNION faz 
-- automaticamente um DISTINCT e n�o repete linhas iguais
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

--------------------------------------------------------------------------------

-- Lista os bairros das tabelas e desta vez, repete linhas iguais entre elas
-- o UNION ALL mostra os registros iguais entre elas
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

--------------------------------------------------------------------------------

-- Lista os bairros das tabelas e cria uma segunda coluna com a origem do 
-- registro, se vem da tabela de cliente ou de vendedor
SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;

--------------------------------------------------------------------------------

-- Lista os bairros das tabelas e cria uma segunda coluna com a origem do 
-- registro, por�m, como tem a segunda coluna, alguns bairros se repetem no 
-- cliente e no vendedor, pois � considerada a linha inteira e n�o s� o campo do
-- bairro
SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;

--------------------------------------------------------------------------------

-- Foi removido o DISTINCT das sele��es individuais, pois o UNION j� faz isso
SELECT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES
UNION
SELECT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;