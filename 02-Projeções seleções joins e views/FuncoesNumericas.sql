-- Quando vamos testar algo sem uma tabela de verdade, usamos o FROM DUAL que é
-- uma tabela que não existe
SELECT 3.4 FROM DUAL;

--------------------------------------------------------------------------------

-- Arredonda para baixo quando o número após a vírgula é menor que 5
SELECT ROUND(3.4) FROM DUAL;

--------------------------------------------------------------------------------

-- Arredonda para cima quando o número após a vírgula é maior ou igual a 5
SELECT ROUND(6.6) FROM DUAL;

--------------------------------------------------------------------------------

-- Arredonda para cima, pois o número após a vírgula é igual a 5
SELECT ROUND(3.5) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre arredonda para baixo
SELECT TRUNC(3.4) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre arredonda para baixo
SELECT TRUNC(6.6) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre arredonda para baixo
SELECT TRUNC(3.5) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre arredonda para cima
SELECT CEIL(3.4) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre arredonda para cima
SELECT CEIL(6.6) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre arredonda para cima
SELECT CEIL(3.5) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre pega a parte inteira
SELECT FLOOR(3.4) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre pega a parte inteira
SELECT FLOOR(6.6) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre pega a parte inteira
SELECT FLOOR(3.5) FROM DUAL;

--------------------------------------------------------------------------------

-- 10 elevado a 4
SELECT POWER(10, 4) FROM DUAL;

--------------------------------------------------------------------------------

-- 34 elevado a 4
SELECT POWER(34, 4) FROM DUAL;

--------------------------------------------------------------------------------

-- Número exponencial elevado a 4
SELECT EXP(4) FROM DUAL;

--------------------------------------------------------------------------------

-- Raiz quadrada
SELECT SQRT(144) FROM DUAL;

--------------------------------------------------------------------------------

-- Raiz quadrada
SELECT SQRT(10) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre pega o valor absoluto, ou seja, valor inteiro
SELECT ABS(10) FROM DUAL;

--------------------------------------------------------------------------------

-- Sempre pega o valor absoluto, ou seja, valor inteiro
SELECT ABS(-10) FROM DUAL;

--------------------------------------------------------------------------------

-- Pega o resto da divisão
SELECT MOD(10,6) FROM DUAL;

--------------------------------------------------------------------------------

-- Na tabela de notas fiscais, temos o valor do imposto. Já na tabela de itens, 
-- temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de
-- 2016, arredondando para o menor inteiro.
SELECT 
    TO_CHAR(NF.DATA_VENDA, 'YYYY') AS ANO_VENDA,
    'R$ ' || FLOOR(SUM(NF.IMPOSTO * (IT.PRECO * IT.QUANTIDADE))) AS IMPOSTO_PAGO
FROM
    NOTAS_FISCAIS NF
INNER JOIN
    ITENS_NOTAS_FISCAIS IT
ON NF.NUMERO = IT.NUMERO
WHERE TO_CHAR(NF.DATA_VENDA, 'YYYY') = 2016
GROUP BY TO_CHAR(NF.DATA_VENDA, 'YYYY');

--------------------------------------------------------------------------------