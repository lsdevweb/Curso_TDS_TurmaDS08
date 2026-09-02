DROP DATABASE IF EXISTS agencia_veiculos_montadora;

CREATE DATABASE agencia_veiculos_montadora;

USE agencia_veiculos_montadora;

-- tbmontadora (Tabela Pai)
CREATE TABLE tbmontadora (
    codmont INT NOT NULL AUTO_INCREMENT,
    montadora VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    PRIMARY KEY (codmont)
) ENGINE=InnoDB;
-- tbveiculo (Tabela Filha) - 
CREATE TABLE tbveiculo (
    codveiculo INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(50) NOT NULL,
    cor VARCHAR(20),
    ano INT,
    preco DECIMAL(10, 2),
    codmont INT NOT NULL,
    PRIMARY KEY (codveiculo),
    CONSTRAINT fk_veiculo_montadora 
        FOREIGN KEY (codmont) REFERENCES tbmontadora(codmont)
) ENGINE=InnoDB;
-- Povoamento de Teste (DML)
INSERT INTO tbmontadora (montadora, estado) VALUES
('FIAT', 'MG'),
('VOLKSWAGEN', 'SP'),
('GM', 'SP'),
('TOYOTA', 'SP');

INSERT INTO tbveiculo (modelo, cor, ano, preco, codmont) VALUES
('Mobi', 'Branco', 2024, 65000.00, 1),  
('Onix', 'Prata', 2024, 85000.00, 3),    
('Corolla', 'Cinza', 2024, 150000.00, 4); 
SELECT * FROM tbveiculo;
SELECT * FROM tbmontadora;
SELECT * FROM tbveiculo;


