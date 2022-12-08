-- Faz consultas com simples e com filtros condicionais
SELECT * FROM TB_CLIENTES;

SELECT * FROM TB_CLIENTES WHERE IDADE = 22;

SELECT * FROM TB_CLIENTES WHERE IDADE > 22;

SELECT * FROM TB_CLIENTES WHERE IDADE >= 22;

SELECT * FROM TB_CLIENTES WHERE IDADE <= 22;

SELECT * FROM TB_CLIENTES WHERE IDADE <> 22;

-- Ordena alfabéticamente e pega todos que vem depois do Marcelo Mattos
SELECT * FROM TB_CLIENTES WHERE NOME > 'Marcelo Mattos';

SELECT * FROM TB_CLIENTES WHERE NOME <> 'Marcelo Mattos';

SELECT * FROM TB_PRODUTOS;

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA > 16.008;

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA = 16.008;

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA = 16.00;

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA > 16.00;

SELECT * FROM TB_VENDEDORES WHERE PERCENTUAL_COMISSAO < 0.17;

