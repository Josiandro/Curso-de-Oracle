SELECT * FROM TABELA_DE_PRODUTOS;

-- Sem informar ASC/DESC o default é ASC
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA;

-- Informando DESC lista do mais caro para o mais barato
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

-- Ordena textos alfabéticamente
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO;

-- Ordena considerando duas colunas
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM, NOME_DO_PRODUTO;

-- Ordena considerando a primeira coluna como DESC
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO;

-- Ordena considerando as duas colunas como DESC
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO DESC;

--------------------------------------------------------------------------------

-- Utilizando duas queries SQL, qual foi a maior venda do produto Linha Refrescante - 1 Litro - Morango/Limao, em quantidade?
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limao';

SELECT * FROM ITENS_NOTAS_FISCAIS WHERE CODIGO_DO_PRODUTO = '1101035' ORDER BY QUANTIDADE DESC;