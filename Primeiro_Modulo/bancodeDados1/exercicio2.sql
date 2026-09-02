CREATE DATABASE sistema_vendas;
USE sistema_vendas;

-- PRODUTOS
CREATE TABLE tbproduto (
    codProduto INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(100) NOT NULL,
    qtdEstoque INT NOT NULL,
    vlCompra DECIMAL(10,2) NOT NULL,
    vlVenda DECIMAL(10,2) NOT NULL
);

-- FORMA DE PAGAMENTO
CREATE TABLE tbforma_pagamento (
    codFormaPag INT AUTO_INCREMENT PRIMARY KEY,
    formaPag VARCHAR(30) NOT NULL,
    chavePix VARCHAR(100)
);

-- CLIENTES
CREATE TABLE tbcliente (
    codCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50), -- Coluna correta aqui
    uf CHAR(2),
    cep VARCHAR(10)
);

-- VENDAS (PVD)
CREATE TABLE tbpvd (
    codVenda INT AUTO_INCREMENT PRIMARY KEY,
    dtVenda DATE NOT NULL,
    codCliente INT NOT NULL,
    codFormaPag INT NOT NULL,

    FOREIGN KEY (codCliente)
        REFERENCES tbcliente(codCliente),

    FOREIGN KEY (codFormaPag)
        REFERENCES tbforma_pagamento(codFormaPag)
);

-- ITENS DA VENDA
CREATE TABLE tbitem_pvd (
    codVenda INT NOT NULL,
    codProduto INT NOT NULL,
    quantidade INT NOT NULL,
    vlUnitario DECIMAL(10,2) NOT NULL,
    vlTotal DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (codVenda, codProduto),

    FOREIGN KEY (codVenda)
        REFERENCES tbpvd(codVenda),

    FOREIGN KEY (codProduto)
        REFERENCES tbproduto(codProduto)
);

-- DADOS DE TESTE
INSERT INTO tbforma_pagamento (formaPag, chavePix)
VALUES ('PIX', '31999999999');

-- CORRIGIDO: Alterado 'city' para 'cidade'
INSERT INTO tbcliente (nome, telefone, endereco, bairro, cidade, uf, cep) 
VALUES ('Kaio Augusto', '31988887777', 'Rua Hoffman', 'Centro', 'Belo Horizonte', 'MG', '30100-000');

INSERT INTO tbproduto (produto, qtdEstoque, vlCompra, vlVenda)
VALUES ('Bola Futebol', 10000, 10.00, 25.00);

INSERT INTO tbpvd (dtVenda, codCliente, codFormaPag)
VALUES ('2026-06-08', 1, 1);

INSERT INTO tbitem_pvd (codVenda, codProduto, quantidade, vlUnitario, vlTotal)
VALUES (1, 1, 2, 25.00, 50.00);

-- CONSULTAS DE TESTE
SELECT * FROM tbproduto;
SELECT * FROM tbcliente;
SELECT * FROM tbforma_pagamento;
SELECT * FROM tbpvd;
SELECT * FROM tbitem_pvd;