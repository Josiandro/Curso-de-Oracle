-- EXTRACT permite extrair uma parte da data, aceitando as seguintes partes:
-- YEAR, MONTH, DAY, HOUR, MINUTE, SECOND, TIMEZONE_HOUR, TIMEZONE_MINUTE,
-- TIMEZONE_REGION e TIMEZONE_ABBR

--------------------------------------------------------------------------------

-- A aplicação da função EXTRACT está extraindo da data o mês, respeitando o 
-- formado específicado no TO_DATE
SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019','DD/MM/YYYY')) FROM DUAL; 

--------------------------------------------------------------------------------

-- A aplicação da função EXTRACT está extraindo da data o mês, respeitando o 
-- formado específicado no TO_DATE
SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019','MM/DD/YYYY')) FROM DUAL; 

--------------------------------------------------------------------------------

-- A aplicação da função EXTRACT está extraindo da data o mês, respeitando o 
-- formado específicado no TO_DATE e pegando do sistema
SELECT EXTRACT(MONTH FROM TO_DATE(SYSDATE,'DD/MM/YYYY')) FROM DUAL; 

--------------------------------------------------------------------------------

-- Está sendo somando um texto 10 com um número 10. O Oracle consegue 
-- identificar que ambos "são" números e fazer a soma
SELECT '10' + 10 FROM DUAL;

--------------------------------------------------------------------------------

-- Está aplicando a função TO_NUMBER no texto para converter o texto "10" 
-- em número
SELECT TO_NUMBER('10') + 10 FROM DUAL;

--------------------------------------------------------------------------------

-- Está aplicando a função TO_CHAR e especificando como quero ver a saída do 
-- número
SELECT TO_CHAR(1234.123, '9999') FROM DUAL;

--------------------------------------------------------------------------------

-- Está aplicando a função TO_CHAR e especificando como quero ver a saída do 
-- número
SELECT TO_CHAR(1234.123, '9999.999') FROM DUAL;

--------------------------------------------------------------------------------

-- Está aplicando a função TO_CHAR e especificando como quero ver a saída do 
-- número
SELECT TO_CHAR(1234.123, '9999,999') FROM DUAL;

--------------------------------------------------------------------------------

-- Com a função NVL, podemos pegar um resultado que deu NULL e substituir por
-- outro texto
SELECT NVL(10, 0) FROM DUAL;

--------------------------------------------------------------------------------

-- Com a função NVL, podemos pegar um resultado que deu NULL e substituir por
-- outro texto
SELECT NVL(NULL, 0) FROM DUAL;

--------------------------------------------------------------------------------

-- Com a função NVL, podemos pegar um resultado que deu NULL e substituir por
-- outro texto, neste caso, foi usado o texto "NÃO ENCONTRADO"
SELECT
    NVL(TV.NOME,'NÃO ENCONTRADO') AS NOME_VENDEDOR,
    NVL(TV.BAIRRO,'NÃO ENCONTRADO') AS NOME_BAIRRO_VENDEDOR,
    NVL(TC.NOME,'NÃO ENCONTRADO') AS NOME_CLIENTE,
    NVL(TC.BAIRRO,'NÃO ENCONTRADO') AS NOME_BAIRRO_CLIENTE
FROM
    TABELA_DE_VENDEDORES TV
FULL JOIN
    TABELA_DE_CLIENTES TC
ON TV.BAIRRO = TC.BAIRRO;

--------------------------------------------------------------------------------