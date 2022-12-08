SELECT * FROM TABELA_DE_PRODUTOS;

-- Mostra a coluna ROWNUM. N�o � poss�vel deixar o * sozinho quando tem comando antes, por isso foi colocado o nome da tabela .*
SELECT ROWNUM, TABELA_DE_PRODUTOS.* FROM TABELA_DE_PRODUTOS;

-- Neste exemplo, criei um Alias para a tabela e usei ele junto como .*
SELECT ROWNUM, TP.* FROM TABELA_DE_PRODUTOS TP;

-- Lista apenas as 5 primeiras linhas
SELECT ROWNUM, TP.* FROM TABELA_DE_PRODUTOS TP WHERE ROWNUM <= 5;

-- N�o mostra a coluna ROWNUM, mas usa ela como filtro do WHERE
SELECT TP.* FROM TABELA_DE_PRODUTOS TP WHERE ROWNUM <= 5;

-- N�o � poss�vel fazer essa compara��o com o ROWNUM, pois ele � l�gico
SELECT TP.* FROM TABELA_DE_PRODUTOS TP WHERE ROWNUM >= 2 AND ROWNUM <= 3;

-- Lista os primeiros 5 registros que possuem o tamanho 700 ml
SELECT * FROM TABELA_DE_PRODUTOS WHERE TAMANHO = '700 ml' AND ROWNUM <= 5;