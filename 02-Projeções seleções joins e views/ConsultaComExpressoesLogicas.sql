-- Select usando o OR
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR TAMANHO = '470 ml';

--------------------------------------------------------------------------------

-- Select usando o AND
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' AND TAMANHO = '470 ml';

--------------------------------------------------------------------------------

-- Select usando AND e o NOT para inverter o resultado lógico
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' AND TAMANHO = '470 ml');

--------------------------------------------------------------------------------

-- Select usando o OR e o NOT para inverter o resultado lógico
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' OR TAMANHO = '470 ml');

--------------------------------------------------------------------------------

-- Select usando vários OR, para trazer somente produtos com os sabores informados
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR SABOR = 'Laranja' OR SABOR = 'Melancia';

--------------------------------------------------------------------------------

-- Select usando IN, para trazer produtos que foram definidos "IN"
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Manga', 'Laranja', 'Melancia');

--------------------------------------------------------------------------------

-- Select usando IN e AND como filtro
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Manga', 'Laranja', 'Melancia') AND TAMANHO = '1 Litro';

--------------------------------------------------------------------------------

-- Select usando expressões mais complexas
SELECT * FROM TABELA_DE_CLIENTES;

SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo') AND IDADE > 20;

-- Select possui duas expressões lógicas, então faz elas separadamente primeiro e depois compara os resultados
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo') AND (IDADE > 20 AND IDADE <= 25);

-- Faz o mesmo select, porém usa o Between na idade
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo') AND (IDADE BETWEEN 20 AND 25);

