-- EXTRACT permite extrair uma parte da data, aceitando as seguintes partes:
-- YEAR, MONTH, DAY, HOUR, MINUTE, SECOND, TIMEZONE_HOUR, TIMEZONE_MINUTE,
-- TIMEZONE_REGION e TIMEZONE_ABBR

--------------------------------------------------------------------------------

-- A aplica��o da fun��o EXTRACT est� extraindo da data o m�s, respeitando o 
-- formado espec�ficado no TO_DATE
SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019','DD/MM/YYYY')) FROM DUAL; 

--------------------------------------------------------------------------------

-- A aplica��o da fun��o EXTRACT est� extraindo da data o m�s, respeitando o 
-- formado espec�ficado no TO_DATE
SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019','MM/DD/YYYY')) FROM DUAL; 

--------------------------------------------------------------------------------

-- A aplica��o da fun��o EXTRACT est� extraindo da data o m�s, respeitando o 
-- formado espec�ficado no TO_DATE e pegando do sistema
SELECT EXTRACT(MONTH FROM TO_DATE(SYSDATE,'DD/MM/YYYY')) FROM DUAL; 

--------------------------------------------------------------------------------

-- Est� sendo somando um texto 10 com um n�mero 10. O Oracle consegue 
-- identificar que ambos "s�o" n�meros e fazer a soma
SELECT '10' + 10 FROM DUAL;

--------------------------------------------------------------------------------

-- Est� aplicando a fun��o TO_NUMBER no texto para converter o texto "10" 
-- em n�mero
SELECT TO_NUMBER('10') + 10 FROM DUAL;

--------------------------------------------------------------------------------

-- Est� aplicando a fun��o TO_CHAR e especificando como quero ver a sa�da do 
-- n�mero
SELECT TO_CHAR(1234.123, '9999') FROM DUAL;

--------------------------------------------------------------------------------

-- Est� aplicando a fun��o TO_CHAR e especificando como quero ver a sa�da do 
-- n�mero
SELECT TO_CHAR(1234.123, '9999.999') FROM DUAL;

--------------------------------------------------------------------------------

-- Est� aplicando a fun��o TO_CHAR e especificando como quero ver a sa�da do 
-- n�mero
SELECT TO_CHAR(1234.123, '9999,999') FROM DUAL;

--------------------------------------------------------------------------------

-- Com a fun��o NVL, podemos pegar um resultado que deu NULL e substituir por
-- outro texto
SELECT NVL(10, 0) FROM DUAL;

--------------------------------------------------------------------------------

-- Com a fun��o NVL, podemos pegar um resultado que deu NULL e substituir por
-- outro texto
SELECT NVL(NULL, 0) FROM DUAL;

--------------------------------------------------------------------------------

-- Com a fun��o NVL, podemos pegar um resultado que deu NULL e substituir por
-- outro texto, neste caso, foi usado o texto "N�O ENCONTRADO"
SELECT
    NVL(TV.NOME,'N�O ENCONTRADO') AS NOME_VENDEDOR,
    NVL(TV.BAIRRO,'N�O ENCONTRADO') AS NOME_BAIRRO_VENDEDOR,
    NVL(TC.NOME,'N�O ENCONTRADO') AS NOME_CLIENTE,
    NVL(TC.BAIRRO,'N�O ENCONTRADO') AS NOME_BAIRRO_CLIENTE
FROM
    TABELA_DE_VENDEDORES TV
FULL JOIN
    TABELA_DE_CLIENTES TC
ON TV.BAIRRO = TC.BAIRRO;

--------------------------------------------------------------------------------