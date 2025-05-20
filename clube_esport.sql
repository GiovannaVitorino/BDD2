-----------------------------------------------
-- Criação do banco de dados
-----------------------------------------------
CREATE DATABASE IF NOT EXISTS clube_esportivo;
USE clube_esportivo;

-- Tabela Modalidade
CREATE TABLE Modalidade (
    id_modalidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_modalidade VARCHAR(100) NOT NULL
);

-- Tabela Instrutor
CREATE TABLE Instrutor (
    id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    id_modalidade INT NOT NULL,
    FOREIGN KEY (id_modalidade) REFERENCES Modalidade(id_modalidade)
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela Membro
CREATE TABLE Membro (
    id_membro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(255),
    codigo_matricula VARCHAR(20) NOT NULL,
    data_adesao DATE NOT NULL,
    status ENUM('ativo', 'inativo') NOT NULL
);

-- Tabela Turma
CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    codigo_turma VARCHAR(20) NOT NULL,
    id_modalidade INT NOT NULL,
    FOREIGN KEY (id_modalidade) REFERENCES Modalidade(id_modalidade)
);

-- Associação Membro_Turma (M:N)
CREATE TABLE Membro_Turma (
    id_membro INT,
    id_turma INT,
    PRIMARY KEY (id_membro, id_turma),
    FOREIGN KEY (id_membro) REFERENCES Membro(id_membro),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

-- Tabela Evento
CREATE TABLE Evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Associação Funcionario_Evento (M:N)
CREATE TABLE Funcionario_Evento (
    id_funcionario INT,
    id_evento INT,
    PRIMARY KEY (id_funcionario, id_evento),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento)
);

-- Associação Membro_Evento (M:N)
CREATE TABLE Membro_Evento (
    id_membro INT,
    id_evento INT,
    PRIMARY KEY (id_membro, id_evento),
    FOREIGN KEY (id_membro) REFERENCES Membro(id_membro),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento)
);

------------------------------------------
-- INSERINDO DADOS
------------------------------------------

-- Inserir modalidades
INSERT INTO Modalidade (id_modalidade, nome_modalidade) VALUES 
(1, 'Natação'), (2, 'Musculação'), (3, 'Yoga'), (4, 'Basquete'), (5,'Vôlei'), 
(6, 'Futebol'), (7, 'Futsal'), (8, 'Karatê'), (9, 'Judô'), 
(10, 'Ginástica artísitica'), (11, 'Ginástica ritmmica'), (12, 'Jiu-Jitsu'), 
(13,'Atletismo'),(14, 'Skate'), (15, 'Muay-Thai');

-- Inserir instrutores
INSERT INTO Instrutor (id_instrutor, nome, data_nascimento, data_admissao, salario, telefone, email, id_modalidade) VALUES 
(1,'Carlos Silva', '1985-06-12', '2020-01-10', 3500.00, '11999999999', 'carlos.s@gmail.com', 1),
(2, 'Fernanda Lima', '1990-03-22', '2021-05-15', 3700.00, '11888888888', 'fernandalima@gmail.com', 2),
(3,'Pedro Campos', '1990-09-12', '2015-12-11', 4500.00, '11123456988', 'campos.p@gmail.com', 4),
(4, 'André Lima', '1992-03-15', '2012-05-01', 5700.00, '12123456789', 'andrelima@gmail.com', 8),
(5,'João Fernandes', '1987-12-07', '2018-01-11', 3600.00, '16965784236', 'j.fernandea@gmail.com', 9),
(6, 'Luan Santos', '1981-03-25', '2021-05-15', 3700.00, '11888888888', 'fernanda@example.com', 9),
(7,'Felipe Marcondes', '1985-07-22', '2020-01-10', 3500.00, '11999999999', 'carlos@example.com', 10),
(8, 'José Pereira', '1986-03-25', '2021-05-15', 3700.00, '11888888888', 'fernanda@example.com', 12),
(9,'Vinícius Souza', '2000-06-12', '2020-01-10', 3500.00, '11999999999', 'carlos@example.com', 15),
(10, 'Marcel Oliveira', '1990-03-22', '2021-05-15', 3700.00, '11888888888', 'fernanda@example.com', 12),
(11,'Júlia Macedo', '1985-06-12', '2020-01-10', 3500.00, '11999999999', 'carlos@example.com', 13),
(12, 'Rafaela Ribeiro', '1990-03-22', '2021-05-15', 3700.00, '11888888888', 'fernanda@example.com', 2),
(13,'Lúcia Barros', '1985-06-12', '2020-01-10', 3500.00, '11999999999', 'carlos@example.com', 11),
(14, 'Nina Ribeiro', '1990-03-22', '2021-05-15', 3700.00, '11888888888', 'fernanda@example.com', 3),
(15,'Maria Godoi', '1985-06-12', '2020-01-10', 3500.00, '11999999999', 'carlos@example.com', 5),
(16, 'Ana Silveira', '1990-03-22', '2021-05-15', 3700.00, '11888888888', 'fernanda@example.com', 6),
(17,'Bárbara Campos', '1985-06-12', '2020-01-10', 3500.00, '11999999999', 'carlos@example.com', 7),
(18, 'Helena Soares', '1990-03-22', '2021-05-15', 3700.00, '11888888888', 'fernanda@example.com', 14),
(19,'Juliana Felix', '1985-06-12', '2020-01-10', 3500.00, '11999999999', 'carlos@example.com', 14),
(20, 'Denise Mendes', '1990-03-22', '2021-05-15', 3700.00, '11888888888', 'fernanda@example.com', 15);

-- Inserir funcionários
INSERT INTO Funcionario 
(id_funcionario, nome, data_nascimento, data_admissao, salario, telefone, email) 
VALUES 
(1, 'João Oliveira', '1980-09-15', '2018-02-20', 3200.00, '11777777777', 'joao@example.com'),
(2, 'Maria Souza', '1978-11-05', '2017-10-10', 3400.00, '11666666666', 'maria@example.com'),
(3, 'Jose Campos', '1980-09-15', '2015-02-28', 3200.00, '11545844444', 'jose@example.com'),
(4, 'Marina Lima', '1978-11-05', '2007-10-11', 3400.00, '11158645976', 'marina@example.com'),
(5, 'Anderson Santos', '1980-09-15', '2019-12-20', 3200.00, '18458426740', 'anderson@example.com'),
(6, 'Andreia Alves', '1978-11-05', '2017-10-10', 3400.00, '19445774680', 'a.alves@example.com'),
(7, 'Marcelo Nunes', '1980-09-15', '2018-02-20', 3200.00, '11888888888', 'mnunes@example.com'),
(8, 'Marcia Garcia', '1978-11-05', '2017-10-10', 3400.00, '11645697835', 'mgarcia@example.com'),
(9, 'Diego Izaias', '1980-11-09', '2018-02-20', 3200.00, '11756914727', 'diego.i@example.com'),
(10, 'Shirley Dias', '1981-01-02', '2017-10-10', 3400.00, '11612658966', 'shirley.d@example.com');


-- Inserir membros
INSERT INTO Membro (nome, data_nascimento, telefone, email, endereco, codigo_matricula, data_adesao, status) VALUES 
('Ana Paula', '2000-05-01', '11555555555', 'ana@example.com', 'Rua A, 123', 'M001', '2023-01-01', 'ativo'),
('Lucas Mendes', '1995-08-18', '11444444444', 'lucas@example.com', 'Rua B, 456', 'M002', '2023-03-10', 'ativo');

-- Inserir turmas
INSERT INTO Turma (codigo_turma, id_modalidade) VALUES 
('T001', 1), ('T002', 2);

-- Inserir associação membro-turma
INSERT INTO Membro_Turma (id_membro, id_turma) VALUES 
(1, 1), (2, 2);

-- Inserir eventos
INSERT INTO Evento (nome, descricao) VALUES 
('Torneio de Natação', 'Competição entre os alunos de natação'),
('Desafio de Musculação', 'Evento para medir desempenho dos alunos de musculação');

-- Associação membro-evento
INSERT INTO Membro_Evento (id_membro, id_evento) VALUES 
(1, 1), (2, 2);

-- Associação funcionario-evento
INSERT INTO Funcionario_Evento (id_funcionario, id_evento) VALUES 
(1, 1), (2, 2);

