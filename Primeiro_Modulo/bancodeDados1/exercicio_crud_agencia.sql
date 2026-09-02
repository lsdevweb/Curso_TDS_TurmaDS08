
/* Criando o Banco de Dados */
CREATE DATABASE IF NOT EXISTS pwr_agencia;
USE pwr_agencia;

/* Tabela Destinos */
CREATE TABLE tb_destinos(
    codcidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cidade VARCHAR(100),
    experiencia VARCHAR(100)
);

/* Tabela Pacotes */
CREATE TABLE tb_pacotes(
    codpacote INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pacote_nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    duracao VARCHAR(20) NOT NULL,
    preco_base DECIMAL(10, 2) NOT NULL,
    detalhes TEXT NOT NULL,
    codcidade INT NOT NULL,
    CONSTRAINT fk_pacotes_destinos 
    FOREIGN KEY (codcidade) REFERENCES tb_destinos(codcidade)
);

/* TABELA 3: CADASTROS (CLIENTES E VIAGENS) */
CREATE TABLE tb_cadastros (
    codcadastro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL, 
    data_viagem DATE NOT NULL,
    contato VARCHAR(100) NOT NULL,
    codpacote INT NOT NULL, 
    CONSTRAINT fk_cadastros_pacotes 
    FOREIGN KEY (codpacote) REFERENCES tb_pacotes(codpacote)
);
/* TABELA 4: PAGAMENTOS */
CREATE TABLE tb_pagamentos (
    codpagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    forma_pagamento ENUM('Pix', 'Cartão de Débito', 'Cartão de Crédito') NOT NULL,
    valor_pago DECIMAL(10, 2) NOT NULL,
    codcadastro INT NOT NULL, 
    CONSTRAINT fk_pagamentos_cadastros 
    FOREIGN KEY (codcadastro) REFERENCES tb_cadastros(codcadastro)
);
/* Inserindo Destinos */
INSERT INTO tb_destinos (cidade, experiencia) VALUES 
('Ouro Preto', 'Histórica'),
('São João del-Rei', 'Viagem em Família'), -- Ajustada a aspa dupla
('Tiradentes','Gastronômica');

/* Inserindo Pacotes */
-- Ouro Preto (codcidade = 1) 
INSERT INTO tb_pacotes (id_pacote_nome, categoria, duracao, preco_base, detalhes, codcidade) VALUES
('PWR Uai, Sô! - 2 Pessoas', 'Normal', '3 dias', 798.00, 'Ônibus Leito. Hospedagem no Hotel Pousada do Arcanjo. Café da manhã e almoço inclusos.', 1),
('PWR Trem Bão! - 3 Pessoas', 'Médio', '5 dias', 3842.14, 'Ônibus Leito. Hospedagem no Hotel Solar do Rosário. Café da manhã e almoço inclusos.', 1),
('PWR Bom Demais da Conta! - 5 Pessoas', 'Premium', '7 dias', 14035.00, 'Ônibus Leito. Hospedagem na Pousada do Mondego.', 1);
-- São João del-Rei (codcidade = 2) -> Gera codpacote: 4, 5, 6
INSERT INTO tb_pacotes (id_pacote_nome, categoria, duracao, preco_base, detalhes, codcidade) VALUES
('PWR Uai, Sô! - 2 Pessoas', 'Normal', '3 dias', 798.00, 'Ônibus Leito. Hospedagem na Pousada Villa Magnólia.', 2),
('PWR Trem Bão! - 3 Pessoas', 'Médio', '5 dias', 3842.14, 'Ônibus Leito. Hospedagem no Garden Hill Hotel.', 2),
('PWR Bom Demais da Conta! - 5 Pessoas', 'Premium', '7 dias', 14035.00, 'Ônibus Leito Cama. Hospedagem no Garden Hill Hotel – Suíte Premium.', 2);
-- Tiradentes (codcidade = 3) -> Gera codpacote: 7, 8, 9
INSERT INTO tb_pacotes (id_pacote_nome, categoria, duracao, preco_base, detalhes, codcidade) VALUES
('PWR Uai, Sô! - 2 Pessoas', 'Normal', '3 dias', 798.00, 'Ônibus Leito. Hospedagem na Pousada Tesouro de Minas.', 3),
('PWR Trem Bão! - 3 Pessoas', 'Médio', '5 dias', 3842.14, 'Ônibus Leito. Hospedagem na Pousada Villa Allegra.', 3),
('PWR Bom Demais da Conta! - 5 Pessoas', 'Premium', '7 dias', 14035.00, 'Ônibus Leito Cama. Hospedagem no Santíssimo Resort.', 3);

/* 1. Cliente Lucimar (codcadastro = 1)Pacote 1 (Ouro Preto Normal) */
INSERT INTO tb_cadastros (nome, idade, data_viagem, contato, codpacote) VALUES
('Lucimar Santos', 25, '2026-08-15', 'lucimar@email.com', 1);
INSERT INTO tb_pagamentos (forma_pagamento, valor_pago, codcadastro) VALUES
('Pix', 798.00, 1);

/* 2. Cliente Maria Souza (codcadastro = 2)  Pacote 2 (Ouro Preto Médio) */
INSERT INTO tb_cadastros (nome, idade, data_viagem, contato, codpacote) VALUES
('Maria Souza', 45, '2026-08-15', 'maria@email.com', 2);
INSERT INTO tb_pagamentos (forma_pagamento, valor_pago, codcadastro) VALUES
('Cartão de Débito', 3842.14, 2); 

/* 3. Cliente Ana Clara (codcadastro = 3)  Pacote 6 (São João del-Rei Premium) */
INSERT INTO tb_cadastros (nome, idade, data_viagem, contato, codpacote) VALUES
('Ana Clara', 50, '2026-08-15', 'anaclara@email.com', 6);
INSERT INTO tb_pagamentos (forma_pagamento, valor_pago, codcadastro) VALUES
('Cartão de Crédito', 14035.00, 3);

/* CONTEXTO COMPLETO DO FLUXO (RELATÓRIO) */
/*INNER JOIN é o comando do SQL que serve para juntar duas ou mais tabelas que possuem alguma informação em comum*/
/*FROM tb_cadastros c: Pegue a tabela de cadastros e dê o apelido de c.
INNER JOIN tb_pacotes p: Conecte com a tabela de pacotes (apelido p).
ON c.codpacote = p.codpacote: A regra da ponte! "Apenas junte a linha do cadastro com a linha do pacote se o número do codpacote for exatamente igual nas duas tabelas".
INNER JOIN tb_destinos d ON p.codcidade = d.codcidade: Faz a mesma coisa para trazer o nome da cidade de destino.*/
SELECT 
    c.codcadastro AS 'ID',
    c.nome AS 'Cliente',
    d.cidade AS 'Destino',
    p.id_pacote_nome AS 'Pacote Escolhido',
    pag.forma_pagamento AS 'Pagamento',
    pag.valor_pago AS 'Valor'
FROM tb_pagamentos pag
INNER JOIN tb_cadastros c ON pag.codcadastro = c.codcadastro
INNER JOIN tb_pacotes p ON c.codpacote = p.codpacote
INNER JOIN tb_destinos d ON p.codcidade = d.codcidade;

/*CREATE*/
-- Adicionando Diamantina à lista de destinos
INSERT INTO tb_destinos (cidade, experiencia) VALUES 
('Diamantina', 'Histórica e Cultural');
select *from tb_destinos;
/*Inserindo os Pacotes de Diamantina*/
INSERT INTO tb_pacotes (id_pacote_nome, categoria, duracao, preco_base, detalhes, codcidade) VALUES
('PWR Uai, Sô! - 2 Pessoas', 'Normal', '3 dias', 798.00, 'Ônibus Leito. Hospedagem na Pousada Tesouro de Minas. Café da manhã e almoço inclusos.', 4),
('PWR Trem Bão! - 3 Pessoas', 'Médio', '5 dias', 3842.14, 'Ônibus Leito. Hospedagem na Pousada Villa Allegra. Café da manhã e almoço inclusos. Experiência gastronômica no Tragaluz.', 4),
('PWR Bom Demais da Conta! - 5 Pessoas', 'Premium', '7 dias', 14035.00, 'Ônibus Leito Cama. Hospedagem no Santíssimo Resort – Suíte Premium. Degustação de vinhos e queijos mineiros artesanais. Jantar no Pacco & Bacco.', 4);
Select *From tb_pacotes;
/*UPADTE*/
Select *From tb_pacotes;
UPDATE tb_pacotes 
SET preco_base = 850.00 
WHERE codpacote = 10;
UPDATE tb_pacotes 
SET preco_base = 3900.00
WHERE codpacote = 11;
UPDATE tb_pacotes 
SET preco_base = 15000.00
WHERE codpacote = 12;
Select *From tb_pacotes;
/*READ (Lendo e Filtrando os Dados)*/
--  Consulta simples-pacotes de Diamantina
SELECT * FROM tb_pacotes 
WHERE codcidade = 4;
-- 1.2 Consulta com Ordenação: Listar todos os pacotes do mais barato ao mais caro
SELECT id_pacote_nome, categoria, preco_base 
FROM tb_pacotes 
ORDER BY preco_base ASC;
-- 1.3 Consulta com Relacionamento (INNER JOIN): Ver o pacote e a cidade juntos
SELECT 
    d.cidade AS 'Destino',
    p.categoria AS 'Categoria',
    p.id_pacote_nome AS 'Pacote',
    p.preco_base AS 'Preço Atualizado'
FROM tb_pacotes p
INNER JOIN tb_destinos d ON p.codcidade = d.codcidade
WHERE d.cidade = 'Diamantina';
/*DELETE (Excluindo com Segurança)*/
--  Apagar primeiro os pacotes vinculados à cidade 4 (Diamantina)
DELETE FROM tb_pacotes 
WHERE codcidade = 4;
-- Apagar a cidade da tabela de destinos
DELETE FROM tb_destinos 
WHERE codcidade = 4;
--  Conferir se os dados de Diamantina foi aṕagada sem afetar os outros destinos
SELECT * FROM tb_destinos;
SELECT * FROM tb_pacotes;
/*Ver a Estrutura (Quais tabelas existem no banco*/
-- Garante que está usando o banco da agência
USE pwr_agencia;
-- Mostra a lista de todas as tabelas do seu banco
SHOW TABLES;
/*Ver o Conteúdo Tabela por Tabela*/
-- 1. Destinos cadastrados
SELECT * FROM tb_destinos;
-- 2. Pacotes disponíveis
SELECT * FROM tb_pacotes;
-- 3. Clientes cadastrados e suas datas de viagem
SELECT * FROM tb_cadastros;
-- 4. Histórico de pagamentos
SELECT * FROM tb_pagamentos;
/*Para ver exatamente como o seu banco está funcionando no mundo real — mostrando quem comprou, para onde vai, qual pacote escolheu e como pagou — rode esta consulta com INNER JOIN*/
SELECT 
    c.codcadastro AS 'ID Cliente',
    c.nome AS 'Cliente',
    c.contato AS 'Contato',
    d.cidade AS 'Destino',
    p.id_pacote_nome AS 'Pacote Escolhido',
    p.duracao AS 'Duração',
    c.data_viagem AS 'Data da Viagem',
    pag.forma_pagamento AS 'Forma de Pagamento',
    pag.valor_pago AS 'Valor Pago (R$)'
FROM tb_cadastros c
INNER JOIN tb_pacotes p ON c.codpacote = p.codpacote
INNER JOIN tb_destinos d ON p.codcidade = d.codcidade
INNER JOIN tb_pagamentos pag ON pag.codcadastro = c.codcadastro;
/*Ver a estrutura das colunas*/
DESCRIBE tb_destinos;
DESCRIBE tb_pacotes;
DESCRIBE tb_cadastros;
DESCRIBE tb_pagamentos;