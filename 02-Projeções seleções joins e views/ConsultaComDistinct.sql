SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;

-- Não vai listar embalagens repetidas
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;

-- Lista produtos que são de Maca e lista também a embalagem sem repetir
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';

-- Lista produtos sem repetir as combinações de embalagem e sabor
SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;

SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS;