-- Seleciona a coluna nome da tabela de clientes
SELECT NOME FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome da tabela de clientes e aplica a função LOWER para o
-- texto da coluna ficar minúsculo
SELECT NOME, LOWER(NOME) FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome da tabela de clientes e aplica a função UPPER para o 
-- texto da coluna fica maiúsculo
SELECT NOME, UPPER(NOME) FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome do produto da tabela de produtos
SELECT NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome do produto da tabela de produtos e aplica a função
-- INITCAP para deixar maiúscula a primeira letra de cada palavra
SELECT NOME_DO_PRODUTO, INITCAP(NOME_DO_PRODUTO) FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona as colunas endereço 1 e bairro da tabela de clientes
SELECT ENDERECO_1, BAIRRO FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona as colunas endereço 1 e bairro da tabela de clientes e depois
-- concatena em uma nova coluna aplicando a função CONCAT
-- A função só aceita dois parâmetros, como foram duas colunas, tem uma função
-- dentro da outra, para poder funcionar
SELECT ENDERECO_1, BAIRRO, CONCAT(CONCAT(ENDERECO_1, ' '), BAIRRO) 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona várias colunas e concatena ambas usando || paipes
SELECT ENDERECO_1 || ' ' || BAIRRO || ' ' || CIDADE || ' ' || ESTADO || ' ' 
|| CEP FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome do produto e depois cria outra coluna aplicando a 
-- função LPAD que vai preencher os espaços a esquerda com ****** até atingir
-- a quantidade de caracteres definida na função
SELECT NOME_DO_PRODUTO, LPAD(NOME_DO_PRODUTO,70,'*') FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome do produto e depois cria outra coluna aplicando a 
-- função RPAD que vai preencher os espaços a direita com ****** até atingir
-- a quantidade de caracteres definida na função
SELECT NOME_DO_PRODUTO, RPAD(NOME_DO_PRODUTO,70,'*') FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Aplica a função SUBSTR na coluna nome do produto, essa função vai pegar o 
-- texto a partir da posição inicial que passou na função e ir até a posição 
-- final que é o terceiro parâmetro
SELECT NOME_DO_PRODUTO, SUBSTR(NOME_DO_PRODUTO, 3, 5) FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Aplica a função INSTR na coluna nome do produto procurando o texto "Campo"
-- e então descobre a posição inicial do texto
SELECT NOME_DO_PRODUTO, INSTR(NOME_DO_PRODUTO, 'Campo') FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Procura nomes que tenho "Mattos", se encontrar, a função INSTR retorna a
-- posição, caso não encontre, vai retornar zero
SELECT NOME, INSTR(NOME, 'Mattos') FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Procura nomes na tabela de cliente que tenham "Mattos" e só lista se o 
-- resultado for diferente de 0, ou seja, tem o nome na tabela
SELECT NOME FROM TABELA_DE_CLIENTES WHERE INSTR(NOME, 'Mattos') <> 0;

--------------------------------------------------------------------------------
-- Testa remoção de espaços nas colunas, usando as funções LTRIM, RTRIM e TRIM

SELECT '   TESTE   ' FROM DUAL;

SELECT '   TESTE   ' AS X, LTRIM('   TESTE   ') AS Y FROM DUAL;

SELECT '   TESTE   ' AS X, LTRIM('   TESTE   ') AS Y, RTRIM('   TESTE   ') AS Z, 
TRIM('   TESTE   ') AS W FROM DUAL;

--------------------------------------------------------------------------------

-- Seleciona o nome do produto na tabela de produtos
SELECT NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona o nome do produto e substitui o nome por outro, aplicando a função
-- REPLACE

SELECT NOME_DO_PRODUTO, REPLACE(NOME_DO_PRODUTO, 'Litro', 'L') 
FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Faz o mesmo que o SQL acima, porém a tabela possui registro Litro e Litros o
-- causa uma diferença e com isso é preciso aplicar um REPLACE dentro do outro
SELECT NOME_DO_PRODUTO, REPLACE(REPLACE(NOME_DO_PRODUTO, 'Litro', 'L'), 'Ls',
'L') FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------