-- Faz consultas simples e com filtros
SELECT * FROM TB_PRODUTOS;

SELECT * FROM TB_PRODUTOS WHERE PRODUTO = '1040107';

SELECT * FROM TB_PRODUTOS WHERE SABOR = 'Melancia';

SELECT * FROM TB_PRODUTOS WHERE SABOR = 'Limao';

UPDATE TB_PRODUTOS SET SABOR = 'Citricos' WHERE SABOR = 'Limao';

SELECT * FROM TB_PRODUTOS WHERE SABOR = 'Citricos';