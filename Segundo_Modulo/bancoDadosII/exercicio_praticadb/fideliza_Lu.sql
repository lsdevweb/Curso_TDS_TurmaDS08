-- ==========================================
-- CRIAÇÃO DO BANCO DE DADOS
-- ==========================================
CREATE DATABASE IF NOT EXISTS FidelizaDrogaLu;
USE FidelizaDrogaLu;
CREATE TABLE Cliente (
    cod_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(150),
    cep CHAR(8),
    CONSTRAINT pk_cliente PRIMARY KEY (cod_cliente),
    CONSTRAINT uq_cliente_cpf UNIQUE (cpf)
);

CREATE TABLE Categoria (
    cod_categoria INT AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (cod_categoria)
);

CREATE TABLE Produto (
    cod_produto INT AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco_produto DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0,
    cod_categoria INT NOT NULL,
    CONSTRAINT pk_produto PRIMARY KEY (cod_produto),
    CONSTRAINT fk_produto_categoria FOREIGN KEY (cod_categoria) REFERENCES Categoria(cod_categoria)
);

CREATE TABLE Vendedor (
    cod_vendedor INT AUTO_INCREMENT,
    nome_vendedor VARCHAR(100) NOT NULL,
    email_vendedor VARCHAR(100),
    CONSTRAINT pk_vendedor PRIMARY KEY (cod_vendedor),
    CONSTRAINT uq_vendedor_email UNIQUE (email_vendedor)
);

CREATE TABLE Pedido (
    cod_pedido INT AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2) DEFAULT 0.00,
    cod_cliente INT NOT NULL,
    cod_vendedor INT NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY (cod_pedido),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cod_cliente) REFERENCES Cliente(cod_cliente),
    CONSTRAINT fk_pedido_vendedor FOREIGN KEY (cod_vendedor) REFERENCES Vendedor(cod_vendedor)
);

CREATE TABLE Item_Pedido (
    cod_item_pedido INT AUTO_INCREMENT,
    cod_pedido INT NOT NULL,
    cod_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_item_pedido PRIMARY KEY (cod_item_pedido),
    CONSTRAINT fk_itempedido_pedido FOREIGN KEY (cod_pedido) REFERENCES Pedido(cod_pedido),
    CONSTRAINT fk_itempedido_produto FOREIGN KEY (cod_produto) REFERENCES Produto(cod_produto),
    CONSTRAINT chk_quantidade CHECK (quantidade > 0)
);
SHOW DATABASES;
SHOW TABLES;
-- 1. Inserir Clientes
INSERT INTO Cliente (nome_cliente, cpf, telefone, endereco, cep) VALUES
('Maria Oliveira', '12345678901', '31988887777', 'Rua das Flores, 120', '30100000'),
('João Souza', '98765432100', '31977776666', 'Av. Central, 450', '30200000');
-- 2. Inserir Categorias
INSERT INTO Categoria (nome_categoria) VALUES
('Medicamentos'),
('Higiene Pessoal'),
('Cosméticos');
-- 3. Inserir Vendedores
INSERT INTO Vendedor (nome_vendedor, email_vendedor) VALUES
('Carlos Vendas', 'carlos@drogalu.com'),
('Ana Balcão', 'ana@drogalu.com');
-- 4. Inserir Produtos (Referenciando os IDs das categorias acima: 1, 2 e 3)
INSERT INTO Produto (nome_produto, preco_produto, estoque, cod_categoria) VALUES
('Dipirona 500mg', 5.50, 100, 1),
('Shampoo Anticaspa 200ml', 22.90, 45, 2),
('Protetor Solar FPS 50', 59.90, 30, 3);
-- 5. Inserir um Pedido (Cliente 1 e Vendedor 1)
INSERT INTO Pedido (data_pedido, valor_total, cod_cliente, cod_vendedor) VALUES
('2026-10-14', 28.40, 1, 1);
-- 6. Inserir Itens no Pedido 1 (1 Dipirona [Produto 1] e 1 Shampoo [Produto 2])
INSERT INTO Item_Pedido (cod_pedido, cod_produto, quantidade, valor_unitario) VALUES
(1, 1, 1, 5.50),  
(1, 2, 1, 22.90);
-- 1. Consulta Geral (Simples)
SELECT * FROM Cliente;
SELECT * FROM Produto;
SELECT * FROM Pedido;

-- 2.Consulta com Filtro Condicional (WHERE)
SELECT nome_produto, estoque, preco_produto 
FROM Produto 
WHERE estoque < 50;

-- 3. Consulta com Junção Relacional (INNER JOIN)
/*Gera um relatório de vendas limpo, substituindo os códigos numéricos
 pelos nomes reais do cliente e do vendedor envolvidos no pedido.*/
 SELECT 
    p.cod_pedido,
    p.data_pedido,
    c.nome_cliente,
    v.nome_vendedor,
    p.valor_total
FROM Pedido p
INNER JOIN Cliente c ON p.cod_cliente = c.cod_cliente
INNER JOIN Vendedor v ON p.cod_vendedor = v.cod_vendedor;
-- Update
UPDATE Cliente
SET telefone = '31999998888', 
    endereco = 'Rua das Flores, 125 - Apto 201'
WHERE cod_cliente = 1;
UPDATE Vendedor
SET email_vendedor = 'carlos.silva@drogalu.com'
WHERE cod_vendedor = 1;
-- Delete
DELETE FROM Item_Pedido
WHERE cod_item_pedido = 1;