-- Altera a tabela de clientes e adiciona chave primária no campo CPF
ALTER TABLE TB_CLIENTES ADD CONSTRAINT PK_TB_CLIENTES PRIMARY KEY (CPF);

--------------------------------------------------------------------------------

-- Insere os dados na tabela, inclusive data, porém ser especificar o formato
INSERT INTO TB_CLIENTES (CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, 
ESTADO, CEP, DATA_NASCIMENTO,IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, 
PRIMEIRA_COMPRA)
VALUES
('00333434577', 'João da Silva', 'Rua Projetada número 10', NULL, 'VILA ROMAN',
'TRÊS RIOS', 'RJ' , '22222222','12/10/1965', 56, 'M', 1000000, 2000, 0);

--------------------------------------------------------------------------------

-- Consulta todos os dados da tabela
SELECT * FROM TB_CLIENTES;

--------------------------------------------------------------------------------

-- Consulta os dados da tabela usando a função TO_CHAR para ver o valor 
-- inserido como sendo o mês na data, o padrão americano coloca o mês antes 
-- do dia
SELECT TO_CHAR(DATA_NASCIMENTO, 'MM') FROM TB_CLIENTES;

--------------------------------------------------------------------------------

-- Apagar os registros de clientes que tenham o CPF do WHERE
DELETE FROM TB_CLIENTES WHERE CPF = '00333434577';

--------------------------------------------------------------------------------

-- Insere os registros na tabela, porém usando a função TO_DATE para já informar
-- em qual formato a data será passada, neste caso, o formato brasileiro
INSERT INTO TB_CLIENTES (CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, 
ESTADO, CEP, DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, 
PRIMEIRA_COMPRA)
VALUES
('00333434577', 'João da Silva', 'Rua Projetada número 10', NULL, 'VILA ROMAN',
'TRÊS RIOS', 'RJ' , '22222222', TO_DATE('12/10/1965', 'DD/MM,YYYY'), 56, 
'M', 1000000, 2000, 0);

--------------------------------------------------------------------------------

-- Insere os registros na tabela, porém usando a função TO_DATE para já informar
-- em qual formato a data será passada, neste caso, o formato americano
INSERT INTO TB_CLIENTES (CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, 
ESTADO, CEP, DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, 
PRIMEIRA_COMPRA)
VALUES
('00333434588', 'João da Silva', 'Rua Projetada número 10', NULL, 'VILA ROMAN',
'TRÊS RIOS', 'RJ' , '22222222', TO_DATE('12/10/1965', 'MM/DD,YYYY'), 56, 
'M', 1000000, 2000, 0);

--------------------------------------------------------------------------------

-- Outro exemplo inserindo registros com datas
INSERT INTO TB_VENDEDORES (
    MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
    '00265', 'Jonh Wayne', TO_DATE('03/27/2019', 'MM/DD/YYYY'), 0.12
);

INSERT INTO TB_VENDEDORES (
    MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
    '00777', 'Katy Peterson', TO_DATE('02/04/2020', 'MM/DD/YYYY'), 0.10
);

INSERT INTO TB_VENDEDORES (
    MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
    '00342', 'Rodrigo Almeida', TO_DATE('18/01/2022', 'DD/MM/YYYY'), 0.09
);

INSERT INTO TB_VENDEDORES (
    MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
    '00729', 'Patricia Martins', TO_DATE('02/01/2022', 'DD/MM/YYYY'), 0.09
);

--------------------------------------------------------------------------------

-- Consulta registros da tabela de vendedores
SELECT * FROM TB_VENDEDORES;

--------------------------------------------------------------------------------

-- Consulta os registros da tabela para ver se o mês ficou correto
SELECT TO_CHAR(DATA_ADMISSAO, 'MM') FROM TB_VENDEDORES;






