-- Quando vamos testar algo sem uma tabela de verdade, usamos o FROM DUAL que �
-- uma tabela que n�o existe
SELECT 3.4 FROM DUAL;

--------------------------------------------------------------------------------

-- Arredonda para baixo quando o n�mero ap�s a v�rgula � menor que 5
SELECT ROUND(3.4) FROM DUAL;

--------------------------------------------------------------------------------

-- Arredonda para cima quando o n�mero ap�s a v�rgula � maior ou igual a 5
SELECT ROUND(6.6) FROM DUAL;

--------------------------------------------------------------------------------

-- Arredonda para cima, pois o n�mero ap�s a v�rgula � igual a 5
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

-- N�mero exponencial elevado a 4
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

-- Pega o resto da divis�o
SELECT MOD(10,6) FROM DUAL;

--------------------------------------------------------------------------------