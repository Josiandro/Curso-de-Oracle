-- Seleciona a coluna nome da tabela de clientes
SELECT NOME FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome da tabela de clientes e aplica a fun��o LOWER para o
-- texto da coluna ficar min�sculo
SELECT NOME, LOWER(NOME) FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome da tabela de clientes e aplica a fun��o UPPER para o 
-- texto da coluna fica mai�sculo
SELECT NOME, UPPER(NOME) FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome do produto da tabela de produtos
SELECT NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome do produto da tabela de produtos e aplica a fun��o
-- INITCAP para deixar mai�scula a primeira letra de cada palavra
SELECT NOME_DO_PRODUTO, INITCAP(NOME_DO_PRODUTO) FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona as colunas endere�o 1 e bairro da tabela de clientes
SELECT ENDERECO_1, BAIRRO FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona as colunas endere�o 1 e bairro da tabela de clientes e depois
-- concatena em uma nova coluna aplicando a fun��o CONCAT
-- A fun��o s� aceita dois par�metros, como foram duas colunas, tem uma fun��o
-- dentro da outra, para poder funcionar
SELECT ENDERECO_1, BAIRRO, CONCAT(CONCAT(ENDERECO_1, ' '), BAIRRO) 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona v�rias colunas e concatena ambas usando || paipes
SELECT ENDERECO_1 || ' ' || BAIRRO || ' ' || CIDADE || ' ' || ESTADO || ' ' 
|| CEP FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome do produto e depois cria outra coluna aplicando a 
-- fun��o LPAD que vai preencher os espa�os a esquerda com ****** at� atingir
-- a quantidade de caracteres definida na fun��o
SELECT NOME_DO_PRODUTO, LPAD(NOME_DO_PRODUTO,70,'*') FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona a coluna nome do produto e depois cria outra coluna aplicando a 
-- fun��o RPAD que vai preencher os espa�os a direita com ****** at� atingir
-- a quantidade de caracteres definida na fun��o
SELECT NOME_DO_PRODUTO, RPAD(NOME_DO_PRODUTO,70,'*') FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Aplica a fun��o SUBSTR na coluna nome do produto, essa fun��o vai pegar o 
-- texto a partir da posi��o inicial que passou na fun��o e ir at� a posi��o 
-- final que � o terceiro par�metro
SELECT NOME_DO_PRODUTO, SUBSTR(NOME_DO_PRODUTO, 3, 5) FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Aplica a fun��o INSTR na coluna nome do produto procurando o texto "Campo"
-- e ent�o descobre a posi��o inicial do texto
SELECT NOME_DO_PRODUTO, INSTR(NOME_DO_PRODUTO, 'Campo') FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Procura nomes que tenho "Mattos", se encontrar, a fun��o INSTR retorna a
-- posi��o, caso n�o encontre, vai retornar zero
SELECT NOME, INSTR(NOME, 'Mattos') FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Procura nomes na tabela de cliente que tenham "Mattos" e s� lista se o 
-- resultado for diferente de 0, ou seja, tem o nome na tabela
SELECT NOME FROM TABELA_DE_CLIENTES WHERE INSTR(NOME, 'Mattos') <> 0;

--------------------------------------------------------------------------------
-- Testa remo��o de espa�os nas colunas, usando as fun��es LTRIM, RTRIM e TRIM

SELECT '   TESTE   ' FROM DUAL;

SELECT '   TESTE   ' AS X, LTRIM('   TESTE   ') AS Y FROM DUAL;

SELECT '   TESTE   ' AS X, LTRIM('   TESTE   ') AS Y, RTRIM('   TESTE   ') AS Z, 
TRIM('   TESTE   ') AS W FROM DUAL;

--------------------------------------------------------------------------------

-- Seleciona o nome do produto na tabela de produtos
SELECT NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Seleciona o nome do produto e substitui o nome por outro, aplicando a fun��o
-- REPLACE

SELECT NOME_DO_PRODUTO, REPLACE(NOME_DO_PRODUTO, 'Litro', 'L') 
FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------

-- Faz o mesmo que o SQL acima, por�m a tabela possui registro Litro e Litros o
-- causa uma diferen�a e com isso � preciso aplicar um REPLACE dentro do outro
SELECT NOME_DO_PRODUTO, REPLACE(REPLACE(NOME_DO_PRODUTO, 'Litro', 'L'), 'Ls',
'L') FROM TABELA_DE_PRODUTOS;

--------------------------------------------------------------------------------