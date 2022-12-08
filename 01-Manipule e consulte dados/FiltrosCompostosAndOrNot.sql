SELECT * FROM TB_PRODUTOS;

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA >= 16;

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA >= 16 AND PRECO_LISTA <= 21;

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA >= 16 AND SABOR = 'Laranja';

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA >= 16 OR SABOR = 'Laranja';

--------------------------------------------------------------------------------

-- O NOT vai inverter o resultado lógico, o que é verdadeiro, passa a ser falso
-- e o que é falso passa a ser verdadeiro
SELECT * FROM TB_PRODUTOS WHERE NOT (PRECO_LISTA > 16 OR SABOR = 'Laranja');

SELECT * FROM TB_CLIENTES WHERE (IDADE >= 18 AND SEXO = 'F') 
AND BAIRRO = 'Jardins';

--------------------------------------------------------------------------------

-- Ordem de precedência
SELECT * FROM TB_CLIENTES WHERE (IDADE >= 18 AND SEXO = 'F')
AND (CIDADE = 'Sao Paulo' OR BAIRRO = 'Barra da Tijuca');

SELECT * FROM TB_CLIENTES WHERE (IDADE >= 18 AND SEXO = 'F'
AND CIDADE = 'Sao Paulo') OR BAIRRO = 'Barra da Tijuca';