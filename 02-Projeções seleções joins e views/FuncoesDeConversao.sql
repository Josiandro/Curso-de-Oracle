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

-- Queremos construir um SQL cujo resultado seja, para cada cliente:
-- O cliente NOME DO CLIENTE faturou QUANTIDADE no ano de ANO
-- Faça isso somente para o ano de 2016.
SELECT
    'O cliente ' || CLIENTES.NOME || 
    ' faturou ' || ROUND(VENDAS.QUANTIDADE, 2) || 
    ' no ano de ' || VENDAS.DATA
FROM
    TABELA_DE_CLIENTES CLIENTES
INNER JOIN
    (SELECT
        NOTAS.CPF AS CPF,
        TO_CHAR(NOTAS.DATA_VENDA, 'YYYY') AS DATA,
        SUM(ITENS.QUANTIDADE * ITENS.PRECO) AS QUANTIDADE
    FROM
        NOTAS_FISCAIS NOTAS
    INNER JOIN
        ITENS_NOTAS_FISCAIS ITENS
    ON NOTAS.NUMERO = ITENS.NUMERO
    WHERE TO_CHAR(NOTAS.DATA_VENDA, 'YYYY') = 2016
    GROUP BY CPF, TO_CHAR(NOTAS.DATA_VENDA, 'YYYY')
    ORDER BY QUANTIDADE DESC) VENDAS
ON CLIENTES.CPF = VENDAS.CPF;

--------------------------------------------------------------------------------

-- Exercício usando dois INNER JOIN (Minha resolução)
SELECT
    'O cliente ' || TB_CLI.NOME ||
    ' faturou ' || ROUND(SUM(TB_ITNF.PRECO * TB_ITNF.QUANTIDADE),2) ||
    ' no ano de ' || TO_CHAR(TB_NF.DATA_VENDA, 'YYYY')
FROM
    TABELA_DE_CLIENTES TB_CLI
INNER JOIN
    NOTAS_FISCAIS TB_NF
ON TB_CLI.CPF = TB_NF.CPF
INNER JOIN
    ITENS_NOTAS_FISCAIS TB_ITNF
ON TB_NF.NUMERO = TB_ITNF.NUMERO
WHERE TO_CHAR(TB_NF.DATA_VENDA, 'YYYY') = 2016
GROUP BY TB_CLI.NOME, TO_CHAR(TB_NF.DATA_VENDA, 'YYYY');
--------------------------------------------------------------------------------

-- Resolução da ALURA (fez INNER JOIN com 3 tabelas)
SELECT 
    'O cliente ' || TC.NOME ||
    ' faturou ' || TO_CHAR(ROUND(SUM(INF.QUANTIDADE * INF.preco),2)) || 
    ' no ano de ' || TO_CHAR(DATA_VENDA, 'YYYY') AS SENTENCA 
FROM 
    notas_fiscais NF
INNER JOIN 
    ITENS_NOTAS_FISCAIS INF 
ON NF.NUMERO = INF.NUMERO
INNER JOIN 
    TABELA_DE_CLIENTES TC 
ON NF.CPF = TC.CPF
WHERE TO_CHAR(DATA_VENDA, 'YYYY') = '2016'
GROUP BY TC.NOME, TO_CHAR(DATA_VENDA, 'YYYY');
--------------------------------------------------------------------------------