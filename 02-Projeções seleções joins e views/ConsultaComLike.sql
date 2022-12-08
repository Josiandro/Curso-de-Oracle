SELECT * FROM TABELA_DE_PRODUTOS;

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Lima/Limao', 'Morango/Limao');

-- % antes do texto, vai retornar registros que no valor da coluna termine com o Limao
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Limao';

-- % antes e depois do texto, vai retornar registros que contêm o texto Maca
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Maca%';

-- % depois do texto, vai retornar registros que começam com o texto Morango 
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%';

-- % antes do texto, vai retornar registros que no valor da coluna termine com o Morango
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Morango';

-- Pode ser usado o LIKE junto de outros operadores
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%' AND EMBALAGEM = 'PET';