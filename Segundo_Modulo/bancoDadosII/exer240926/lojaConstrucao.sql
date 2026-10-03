-- Criação do Banco de Dados
CREATE DATABASE LojaConstrucao;
USE LojaConstrucao;
-- TABELA CLIENTE
CREATE TABLE Cliente (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome_cliente VARCHAR(100) NOT NULL
);
-- TABELA TELEFONE_CLIENTE
-- Um cliente pode ter vários telefones
CREATE TABLE Telefone_Cliente (
id_telefone INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
numero_telefone VARCHAR(20) NOT NULL,
CONSTRAINT fk_telefone_cliente
FOREIGN KEY (id_cliente)
REFERENCES Cliente(id_cliente)
);
-- TABELA PRODUTO
CREATE TABLE Produto (
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR(100) NOT NULL,
preco_unitario DECIMAL(10,2) NOT NULL
);
-- TABELA VENDA
-- Cada venda pertence a um cliente
CREATE TABLE Venda (
id_venda INT PRIMARY KEY,
id_cliente INT NOT NULL,
valor_total DECIMAL(10,2) NOT NULL,
CONSTRAINT fk_venda_cliente
FOREIGN KEY (id_cliente)
REFERENCES Cliente(id_cliente)
);
-- TABELA ITEM_VENDA
-- Relaciona vendas e produtos
CREATE TABLE Item_Venda (
id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
id_venda INT NOT NULL,
id_produto INT NOT NULL,
quantidade INT NOT NULL,
valor_unitario DECIMAL(10,2) NOT NULL,
CONSTRAINT fk_item_venda_venda
FOREIGN KEY (id_venda)
REFERENCES Venda(id_venda),
CONSTRAINT fk_item_venda_produto
FOREIGN KEY (id_produto)
REFERENCES Produto(id_produto)
);
describe LojaConstrucao;
USE  LojaConstrucao;
SHOW TABLES;
INSERT INTO Cliente (nome_cliente)
VALUES
('Carlos Eduardo'),
('Maria Fernanda');
INSERT INTO Telefone_Cliente (id_cliente, numero_telefone)
VALUES
(1, '(31) 98888-1111'),
(1, '(31) 3333-2222'),
(2, '(11) 97777-3333');
INSERT INTO Produto (nome_produto, preco_unitario)
VALUES
('Cimento', 30.00),
('Pá', 45.00),
('Tinta Branca', 120.00);
INSERT INTO Venda (id_venda, id_cliente, valor_total)
VALUES
(1001, 1, 105.00),
(1002, 2, 120.00);
INSERT INTO Item_Venda
(id_venda, id_produto, quantidade, valor_unitario)
VALUES
(1001, 1, 2, 30.00), 
(1001, 2, 1, 45.00), 
(1002, 3, 1, 120.00); 
-- Consultar Estruturas das Tabelas criadas--
DESC Cliente ;
desc Telefone_Cliente;
DESC Produto;
DESC Venda;
DESC Item_Venda;
-- Consultar/verificar dados inseridos
-- SELECT * FROM nome_da_tabela;
SELECT * FROM Cliente;
select *from Telefone_Cliente; -- Escrevi minusculo para teste proprio
SELECT  FROM Produto; -- erro sintaxe
SELECT * FROM Produto;
SELECT * FROM Venda;
SELECT * FROM Item_Venda;
