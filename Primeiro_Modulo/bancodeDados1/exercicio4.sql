-- 5.1. Criação do Banco de Dados
DROP DATABASE IF EXISTS db_escola_tecnica;
CREATE DATABASE db_escola_tecnica;
USE db_escola_tecnica;
-- 5.2. Criação da Tabela Pai (Cursos)
CREATE TABLE tb_curso (
    cod_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100) NOT NULL
) ENGINE=InnoDB;
-- 5.3. Criação da Tabela Filha (Alunos)
CREATE TABLE tb_aluno (
    cod_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    bairro VARCHAR(50),
    cod_curso INT NOT NULL,
    CONSTRAINT fk_aluno_curso 
        FOREIGN KEY (cod_curso) REFERENCES tb_curso(cod_curso)
) ENGINE=InnoDB;
-- 5.4. Inserção de Dados (Cadastro Inicial)
INSERT INTO tb_curso (nome_curso) VALUES 
('Tecnico em Desenvolvimento'), 
('Tecnico em Enfermagem');
INSERT INTO tb_aluno (nome_aluno, telefone, bairro, cod_curso) VALUES 
('Lucimar', '(31) 99999-0000', 'Carlos Prates', 1),
('Adriana', '(31) 98888-1111', 'Centro', 2);
SELECT * FROM tb_aluno;
SELECT *FROM tb_curso;





