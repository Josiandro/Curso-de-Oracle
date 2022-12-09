-- FROM DUAL representa uma tabela que não existe, porém, é preciso usa-lo e 
-- neste caso, vai retornar a data do SO
SELECT SYSDATE AS DATA_ATUAL FROM DUAL;

--------------------------------------------------------------------------------

-- Retorna a soma da data de hoje mais 127 dias
SELECT SYSDATE + 127 FROM DUAL;

--------------------------------------------------------------------------------
-- Retorna a data de hoje, considerando a data do servidor onde o Oracel está
-- instalado. Como a função TO_CHAR não tem o formato de saída informado, acaba
-- listando a data da mesma forma que o SQL acima
SELECT TO_CHAR(SYSDATE) AS DATA_HORA FROM DUAL;

--------------------------------------------------------------------------------

-- Retorna a data de hoje com a hora junto. Isto foi definido ao passar o 
-- formato na função TO_CHAR
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH:MI:SS') AS DATA_HORA FROM DUAL;

--------------------------------------------------------------------------------

-- Retorna o nome e a data de nascimento da tabela de clientes
SELECT NOME, DATA_DE_NASCIMENTO FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Retorna o nome e a data de nascimento da tabela de clientes, aplicando outra
-- forma de saída/máscara na data
SELECT NOME, TO_CHAR(DATA_DE_NASCIMENTO, 'DD MONTH YYYY, DAY') 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Retorno o nome, idade e data de nascimento da tabela de clientes, listando a
-- data de nascimento por extenso
SELECT NOME, IDADE, TO_CHAR(DATA_DE_NASCIMENTO, 'DD "de" MONTH "de" YYYY, DAY')
AS DATA_POR_EXTENSO 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Retorna o número de DIAS entre o dia de hoje SYSDATE e a data de nascimento
-- do cliente.
SELECT NOME, IDADE, SYSDATE - DATA_DE_NASCIMENTO AS MESES 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Divide o número de dias por 365, para obter o número de anos entre a data de hoje
-- e a data de nascimento do cliente
SELECT NOME, IDADE, (SYSDATE - DATA_DE_NASCIMENTO) / 365 AS IDADE_ATUAL 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Aplica a função SUBSTR sobre o cálculo dos anos, para obter apenas a parte
-- inteira
SELECT NOME, IDADE, SUBSTR((SYSDATE - DATA_DE_NASCIMENTO) / 365, 1, 2) 
AS IDADE_ATUAL 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------
-- Retorno o número de meses entre a data de hoje e a data de nascimento do 
-- cliente, aplicando a função MONTHS_BETWEEN. Depois, divide o número de meses
-- por 12, para encontrar o número de anos
SELECT NOME, IDADE, MONTHS_BETWEEN(SYSDATE, DATA_DE_NASCIMENTO) / 12 
AS IDADE_ATUAL 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Aplica a função SUBSTR na função MONTHS_BETWEEN para pegar apenas a parte 
-- inteira do número de anos
SELECT NOME, IDADE, 
SUBSTR(MONTHS_BETWEEN(SYSDATE, DATA_DE_NASCIMENTO) / 12, 1, 2) AS IDADE_ATUAL 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Ao aplicar a função ADD_MONTHS, vai aplicar mais meses sobre a data informada
SELECT ADD_MONTHS(SYSDATE, 10) FROM DUAL;

--------------------------------------------------------------------------------

-- A função NEXT_DAY vai retornar o próximo dia a partir da data informada
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SEXTA') AS PROXIMA_SEXTA FROM DUAL;

--------------------------------------------------------------------------------

-- A função LAST_DAY vai retornar o último dia do mês, a partir da data 
-- informada
SELECT SYSDATE, LAST_DAY(SYSDATE) AS ULTIMO_DIA_DO_MES FROM DUAL;

--------------------------------------------------------------------------------

-- Aplicando a função TRUNC, vai retornar o primeiro dia do ano, relativo a data
-- que foi passada dentro da função, e considerando o parâmetro YEAR
SELECT SYSDATE, TRUNC(SYSDATE, 'YEAR') FROM DUAL;

--------------------------------------------------------------------------------

-- Aplicando a função TRUNC, vai retornar o primeiro dia do mês, relativo a data
-- que foi passada dentro da função, e considerando o parâmetro MONTH
SELECT SYSDATE, TRUNC(SYSDATE, 'MONTH') FROM DUAL;

--------------------------------------------------------------------------------

-- Faz o mesmo que o SQL acima, porém as datas são somadas com o valor 200
-- então a data inicial fica diferente do SYSDATE
SELECT SYSDATE + 200, TRUNC(SYSDATE + 200, 'MONTH') FROM DUAL;

--------------------------------------------------------------------------------
-- A função ROUND faz o arredondamento do ano, se já passou do meio do ano,
-- lista o primeiro dia do ano seguinte, se ainda não passou, lista o primeiro
-- dia do ano atual

SELECT SYSDATE, ROUND(SYSDATE, 'YEAR') FROM DUAL;

--------------------------------------------------------------------------------
-- A função ROUND faz o arredondamento do ano, se já passou do meio do ano,
-- lista o primeiro dia do ano seguinte, se ainda não passou, lista o primeiro
-- dia do ano atual
SELECT SYSDATE + 220, ROUND(SYSDATE + 220, 'YEAR') FROM DUAL;

--------------------------------------------------------------------------------

-- A função ROUND faz o arredondamento do mês, se já passou do meio do mês,
-- lista o primeiro dia do mes seguinte, se ainda não passou, lista o primeiro
-- dia do mes atual
SELECT SYSDATE, ROUND(SYSDATE, 'MONTH') FROM DUAL;
--------------------------------------------------------------------------------