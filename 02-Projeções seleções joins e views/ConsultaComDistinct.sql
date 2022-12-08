SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;

-- N�o vai listar embalagens repetidas
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;

-- Lista produtos que s�o de Maca e lista tamb�m a embalagem sem repetir
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';

-- Lista produtos sem repetir as combina��es de embalagem e sabor
SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;

SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS;