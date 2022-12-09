-- FROM DUAL representa uma tabela que n�o existe, por�m, � preciso usa-lo e 
-- neste caso, vai retornar a data do SO
SELECT SYSDATE AS DATA_ATUAL FROM DUAL;

--------------------------------------------------------------------------------

-- Retorna a soma da data de hoje mais 127 dias
SELECT SYSDATE + 127 FROM DUAL;

--------------------------------------------------------------------------------
-- Retorna a data de hoje, considerando a data do servidor onde o Oracel est�
-- instalado. Como a fun��o TO_CHAR n�o tem o formato de sa�da informado, acaba
-- listando a data da mesma forma que o SQL acima
SELECT TO_CHAR(SYSDATE) AS DATA_HORA FROM DUAL;

--------------------------------------------------------------------------------

-- Retorna a data de hoje com a hora junto. Isto foi definido ao passar o 
-- formato na fun��o TO_CHAR
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH:MI:SS') AS DATA_HORA FROM DUAL;

--------------------------------------------------------------------------------

-- Retorna o nome e a data de nascimento da tabela de clientes
SELECT NOME, DATA_DE_NASCIMENTO FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Retorna o nome e a data de nascimento da tabela de clientes, aplicando outra
-- forma de sa�da/m�scara na data
SELECT NOME, TO_CHAR(DATA_DE_NASCIMENTO, 'DD MONTH YYYY, DAY') 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Retorno o nome, idade e data de nascimento da tabela de clientes, listando a
-- data de nascimento por extenso
SELECT NOME, IDADE, TO_CHAR(DATA_DE_NASCIMENTO, 'DD "de" MONTH "de" YYYY, DAY')
AS DATA_POR_EXTENSO 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Retorna o n�mero de DIAS entre o dia de hoje SYSDATE e a data de nascimento
-- do cliente.
SELECT NOME, IDADE, SYSDATE - DATA_DE_NASCIMENTO AS MESES 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Divide o n�mero de dias por 365, para obter o n�mero de anos entre a data de hoje
-- e a data de nascimento do cliente
SELECT NOME, IDADE, (SYSDATE - DATA_DE_NASCIMENTO) / 365 AS IDADE_ATUAL 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Aplica a fun��o SUBSTR sobre o c�lculo dos anos, para obter apenas a parte
-- inteira
SELECT NOME, IDADE, SUBSTR((SYSDATE - DATA_DE_NASCIMENTO) / 365, 1, 2) 
AS IDADE_ATUAL 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------
-- Retorno o n�mero de meses entre a data de hoje e a data de nascimento do 
-- cliente, aplicando a fun��o MONTHS_BETWEEN. Depois, divide o n�mero de meses
-- por 12, para encontrar o n�mero de anos
SELECT NOME, IDADE, MONTHS_BETWEEN(SYSDATE, DATA_DE_NASCIMENTO) / 12 
AS IDADE_ATUAL 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Aplica a fun��o SUBSTR na fun��o MONTHS_BETWEEN para pegar apenas a parte 
-- inteira do n�mero de anos
SELECT NOME, IDADE, 
SUBSTR(MONTHS_BETWEEN(SYSDATE, DATA_DE_NASCIMENTO) / 12, 1, 2) AS IDADE_ATUAL 
FROM TABELA_DE_CLIENTES;

--------------------------------------------------------------------------------

-- Ao aplicar a fun��o ADD_MONTHS, vai aplicar mais meses sobre a data informada
SELECT ADD_MONTHS(SYSDATE, 10) FROM DUAL;

--------------------------------------------------------------------------------

-- A fun��o NEXT_DAY vai retornar o pr�ximo dia a partir da data informada
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SEXTA') AS PROXIMA_SEXTA FROM DUAL;

--------------------------------------------------------------------------------

-- A fun��o LAST_DAY vai retornar o �ltimo dia do m�s, a partir da data 
-- informada
SELECT SYSDATE, LAST_DAY(SYSDATE) AS ULTIMO_DIA_DO_MES FROM DUAL;

--------------------------------------------------------------------------------

-- Aplicando a fun��o TRUNC, vai retornar o primeiro dia do ano, relativo a data
-- que foi passada dentro da fun��o, e considerando o par�metro YEAR
SELECT SYSDATE, TRUNC(SYSDATE, 'YEAR') FROM DUAL;

--------------------------------------------------------------------------------

-- Aplicando a fun��o TRUNC, vai retornar o primeiro dia do m�s, relativo a data
-- que foi passada dentro da fun��o, e considerando o par�metro MONTH
SELECT SYSDATE, TRUNC(SYSDATE, 'MONTH') FROM DUAL;

--------------------------------------------------------------------------------

-- Faz o mesmo que o SQL acima, por�m as datas s�o somadas com o valor 200
-- ent�o a data inicial fica diferente do SYSDATE
SELECT SYSDATE + 200, TRUNC(SYSDATE + 200, 'MONTH') FROM DUAL;

--------------------------------------------------------------------------------
-- A fun��o ROUND faz o arredondamento do ano, se j� passou do meio do ano,
-- lista o primeiro dia do ano seguinte, se ainda n�o passou, lista o primeiro
-- dia do ano atual

SELECT SYSDATE, ROUND(SYSDATE, 'YEAR') FROM DUAL;

--------------------------------------------------------------------------------
-- A fun��o ROUND faz o arredondamento do ano, se j� passou do meio do ano,
-- lista o primeiro dia do ano seguinte, se ainda n�o passou, lista o primeiro
-- dia do ano atual
SELECT SYSDATE + 220, ROUND(SYSDATE + 220, 'YEAR') FROM DUAL;

--------------------------------------------------------------------------------

-- A fun��o ROUND faz o arredondamento do m�s, se j� passou do meio do m�s,
-- lista o primeiro dia do mes seguinte, se ainda n�o passou, lista o primeiro
-- dia do mes atual
SELECT SYSDATE, ROUND(SYSDATE, 'MONTH') FROM DUAL;
--------------------------------------------------------------------------------