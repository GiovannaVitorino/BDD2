-----------------------------------------------
-- Criação do banco de dados
-----------------------------------------------
CREATE DATABASE clube_esportivo
GO

USE clube_esportivo
GO

-- Tabela Modalidade
CREATE TABLE Modalidade (
    id_modalidade INT PRIMARY KEY,
    nome_modalidade VARCHAR(100) NOT NULL
);
GO

-- Tabela Instrutor
CREATE TABLE Instrutor (
    id_instrutor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    id_modalidade INT NOT NULL,
    FOREIGN KEY (id_modalidade) REFERENCES Modalidade(id_modalidade)
);
GO

-- Tabela Funcionario
CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);
GO

-- Tabela Membro
CREATE TABLE Membro (
    id_membro INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(255),
    codigo_matricula VARCHAR(20) NOT NULL,
    data_adesao DATE NOT NULL,
    --status ENUM('ativo', 'inativo') NOT NULL
);
GO

-- Tabela Turma
CREATE TABLE Turma (
    id_turma INT PRIMARY KEY,
    codigo_turma VARCHAR(20) NOT NULL,
    id_modalidade INT NOT NULL,
    FOREIGN KEY (id_modalidade) REFERENCES Modalidade(id_modalidade)
);
GO

-- Associação Membro_Turma (M:N)
CREATE TABLE Membro_Turma (
    id_membro INT,
    id_turma INT,
    PRIMARY KEY (id_membro, id_turma),
    FOREIGN KEY (id_membro) REFERENCES Membro(id_membro),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);
GO

-- Tabela Evento
CREATE TABLE Evento (
    id_evento INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);
GO

-- Associação Funcionario_Evento (M:N)
CREATE TABLE Funcionario_Evento (
    id_funcionario INT,
    id_evento INT,
    PRIMARY KEY (id_funcionario, id_evento),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento)
);
GO

-- Associação Membro_Evento (M:N)
CREATE TABLE Membro_Evento (
    id_membro INT,
    id_evento INT,
    PRIMARY KEY (id_membro, id_evento),
    FOREIGN KEY (id_membro) REFERENCES Membro(id_membro),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento)
);
GO

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
(6, 'Luan Santos', '1981-03-25', '2021-05-15', 3700.00, '11888885678', 'luansantos@example.com', 9),
(7,'Felipe Marcondes', '1985-07-22', '2020-01-10', 3500.00, '11999125896', 'felipemarcondes@example.com', 10),
(8, 'José Pereira', '1986-03-25', '2021-05-15', 3700.00, '11865785588', 'josepereira@example.com', 12),
(9,'Vinícius Souza', '2000-06-12', '2020-01-10', 3500.00, '123598999999', 'viniviussouza@example.com', 15),
(10, 'Marcel Oliveira', '1990-03-22', '2021-05-15', 3700.00, '11888878888', 'moliveira@example.com', 12),
(11,'Júlia Macedo', '1985-06-12', '2020-01-10', 3500.00, '11912345678', 'jmacedo@example.com', 13),
(12, 'Rafaela Ribeiro', '1990-03-22', '2021-05-15', 3700.00, '15869754888', 'rafa.rib@example.com', 2),
(13,'Lúcia Barros', '1985-06-12', '2020-01-10', 3500.00, '119994856239', 'luciabarros@example.com', 11),
(14, 'Nina Ribeiro', '1990-03-22', '2021-05-15', 3700.00, '11888525489', 'nina.rib@example.com', 3),
(15,'Maria Godoi', '1985-06-12', '2020-01-10', 3500.00, '11999945896', 'godoi.m@example.com', 5),
(16, 'Ana Silveira', '1990-03-22', '2021-05-15', 3700.00, '11888125486', 'ana.s@example.com', 6),
(17,'Bárbara Campos', '1985-06-12', '2020-01-10', 3500.00, '11991256899', 'campos.b@example.com', 7),
(18, 'Helena Soares', '1990-03-22', '2021-05-15', 3700.00, '11812458688', 'h.soares@example.com', 14),
(19,'Juliana Felix', '1985-06-12', '2020-01-10', 3500.00, '119999158964', 'j.felix@example.com', 14),
(20, 'Denise Mendes', '1990-03-22', '2021-05-15', 3700.00, '11888888888', 'denisemendes@example.com', 15);
GO

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
GO


-- Inserir membros
INSERT INTO Membro (id_membro, nome, data_nascimento, telefone, email, endereco, codigo_matricula, data_adesao) VALUES 
(1, 'Ana Paula', '2000-05-01', '11555555555', 'ana@example.com', 'Rua A, 123', 'M001', '2023-01-01'),
(2, 'Lucas Mendes', '1995-08-18', '11444444444', 'lucas@example.com', 'Rua B, 456', 'M002', '2023-03-10'),
(3, 'Mariana Silva', '1992-11-25', '11988887777', 'mariana@example.com', 'Rua C, 789', 'M003', '2023-02-15'),
(4, 'João Pedro', '1988-07-12', '11333336666', 'joao@example.com', 'Rua D, 321', 'M004', '2023-04-20'),
(5, 'Carla Souza', '1999-09-30', '11777778888', 'carla@example.com', 'Rua E, 654', 'M005', '2023-01-25'),
(6, 'Felipe Rocha', '1990-03-22', '11222223333', 'felipe@example.com', 'Rua F, 987', 'M006', '2023-05-05'),
(7, 'Beatriz Lima', '2001-12-10', '11666667777', 'beatriz@example.com', 'Rua G, 111', 'M007', '2023-02-28'),
(8, 'Rafael Torres', '1985-06-05', '11555556666', 'rafael@example.com', 'Rua H, 222', 'M008', '2023-06-01'),
(9, 'Juliana Costa', '1996-10-15', '11444445555', 'juliana@example.com', 'Rua I, 333', 'M009', '2023-03-22'),
(10, 'Gabriel Nunes', '1998-01-01', '11333334444', 'gabriel@example.com', 'Rua J, 444', 'M010', '2023-04-10'),
(11, 'Amanda Teixeira', '2002-08-08', '11999990000', 'amanda@example.com', 'Rua K, 555', 'M011', '2023-01-18'),
(12, 'Thiago Martins', '1991-02-14', '11888889999', 'thiago@example.com', 'Rua L, 666', 'M012', '2023-02-05'),
(13, 'Camila Dias', '1993-07-07', '11777776666', 'camila@example.com', 'Rua M, 777', 'M013', '2023-03-12'),
(14, 'Bruno Almeida', '1989-11-30', '11666665555', 'bruno@example.com', 'Rua N, 888', 'M014', '2023-04-01'),
(15, 'Letícia Fernandes', '2000-04-04', '11555554444', 'leticia@example.com', 'Rua O, 999', 'M015', '2023-05-18'),
(16, 'Diego Ribeiro', '1997-09-19', '11444443333', 'diego@example.com', 'Rua P, 101', 'M016', '2023-01-30'),
(17, 'Fernanda Gomes', '1994-12-22', '11333332222', 'fernanda@example.com', 'Rua Q, 202', 'M017', '2023-02-20'),
(18, 'Eduardo Barros', '1990-06-06', '11222221111', 'eduardo@example.com', 'Rua R, 303', 'M018', '2023-03-25'),
(19, 'Natália Castro', '2001-03-03', '11111110000', 'natalia@example.com', 'Rua S, 404', 'M019', '2023-04-14'),
(20, 'Henrique Moraes', '1987-08-08', '11900001111', 'henrique@example.com', 'Rua T, 505', 'M020', '2023-05-02'),
(21, 'Isabela Freitas', '1996-05-05', '11888887777', 'isabela@example.com', 'Rua U, 606', 'M021', '2023-01-12'),
(22, 'Murilo Vasconcelos', '1999-10-10', '11777776666', 'murilo@example.com', 'Rua V, 707', 'M022', '2023-02-22'),
(23, 'Patrícia Pires', '1993-01-15', '11666665555', 'patricia@example.com', 'Rua W, 808', 'M023', '2023-03-30'),
(24, 'André Cardoso', '1986-02-20', '11555554444', 'andre@example.com', 'Rua X, 909', 'M024', '2023-04-17'),
(25, 'Elaine Santos', '1995-07-07', '11444443333', 'elaine@example.com', 'Rua Y, 1111', 'M025', '2023-05-07'),
(26, 'Rodrigo Farias', '1992-09-09', '11333332222', 'rodrigo@example.com', 'Rua Z, 1212', 'M026', '2023-01-08'),
(27, 'Tatiane Braga', '1988-03-03', '11222221111', 'tatiane@example.com', 'Rua Alfa, 1313', 'M027', '2023-02-14'),
(28, 'Vinícius Leal', '2000-06-06', '11111110000', 'vinicius@example.com', 'Rua Beta, 1414', 'M028', '2023-03-21'),
(29, 'Lorena Neves', '1991-11-11', '11900001111', 'lorena@example.com', 'Rua Gama, 1515', 'M029', '2023-04-04'),
(30, 'Fábio Cunha', '1989-04-04', '11888887777', 'fabio@example.com', 'Rua Delta, 1616', 'M030', '2023-05-11'),
(31, 'Sabrina Andrade', '1997-02-02', '11777776666', 'sabrina@example.com', 'Rua Ômega, 1717', 'M031', '2023-01-19'),
(32, 'Danilo Queiroz', '1994-08-08', '11666665555', 'danilo@example.com', 'Rua Sigma, 1818', 'M032', '2023-02-27'),
(33, 'Raquel Tavares', '1993-06-06', '11555554444', 'raquel@example.com', 'Rua Ômicron, 1919', 'M033', '2023-03-06'),
(34, 'Pedro Henrique', '2001-01-01', '11444443333', 'pedro@example.com', 'Rua Kappa, 2020', 'M034', '2023-04-22'),
(35, 'Viviane Monteiro', '1990-10-10', '11333332222', 'viviane@example.com', 'Rua Lambda, 2121', 'M035', '2023-05-14'),
(36, 'Alexandre Rezende', '1987-05-05', '11222221111', 'alexandre@example.com', 'Rua Épsilon, 2222', 'M036', '2023-01-26'),
(37, 'Cristina Lopes', '1998-12-12', '11111110000', 'cristina@example.com', 'Rua Zeta, 2323', 'M037', '2023-02-18'),
(38, 'Marcelo Pinto', '1995-03-03', '11900001111', 'marcelo@example.com', 'Rua Eta, 2424', 'M038', '2023-03-11'),
(39, 'Jéssica Araújo', '1986-06-06', '11888887777', 'jessica@example.com', 'Rua Teta, 2525', 'M039', '2023-04-19'),
(40, 'Renato Bastos', '1999-09-09', '11777776666', 'renato@example.com', 'Rua Iota, 2626', 'M040', '2023-05-25'),
(41, 'Vanessa Luz', '1992-04-04', '11666665555', 'vanessa@example.com', 'Rua Sigma, 2727', 'M041', '2023-01-15'),
(42, 'Otávio Brito', '1985-11-11', '11555554444', 'otavio@example.com', 'Rua Rho, 2828', 'M042', '2023-02-03'),
(43, 'Débora Xavier', '2000-07-07', '11444443333', 'debora@example.com', 'Rua Pi, 2929', 'M043', '2023-03-18'),
(44, 'César Assis', '1996-01-01', '11333332222', 'cesar@example.com', 'Rua Fi, 3030', 'M044', '2023-04-07'),
(45, 'Adriana Vieira', '1988-08-08', '11222221111', 'adriana@example.com', 'Rua Psi, 3131', 'M045', '2023-05-03'),
(46, 'Fernando Prado', '1997-05-05', '11111110000', 'fernando@example.com', 'Rua Chi, 3232', 'M046', '2023-01-09'),
(47, 'Mônica Meireles', '1993-09-09', '11900001111', 'monica@example.com', 'Rua Ni, 3333', 'M047', '2023-02-06'),
(48, 'Rogério Lemos', '1990-02-02', '11888887777', 'rogerio@example.com', 'Rua Mi, 3434', 'M048', '2023-03-24'),
(49, 'Luciana Camargo', '1998-06-06', '11777776666', 'luciana@example.com', 'Rua Hi, 3535', 'M049', '2023-04-15'),
(50, 'Igor Ferreira', '1989-12-12', '11666665555', 'igor@example.com', 'Rua Gi, 3636', 'M050', '2023-05-06');
GO


-- Inserir turmas
INSERT INTO Turma (id_turma, codigo_turma, id_modalidade) VALUES  
(1, 'T001', 1), (2, 'T002', 2), (3, 'T003', 3), (4, 'T004', 4), (5, 'T005', 5), (6, 'T006', 6), (7, 'T007', 7), (8, 'T008', 8),
(9, 'T009', 9), (10, 'T010', 10), (11, 'T011', 11), (12, 'T012', 12), (13, 'T013', 13), (14, 'T014', 14), (15, 'T015', 15);
GO



-- Inserir associação membro-turma
INSERT INTO Membro_Turma (id_membro, id_turma) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10), (11, 11), (12, 12), (13, 13), (14, 14),
(15, 15), (16, 1),(17, 2),(18, 3),(19, 4),(20, 5),(21, 6),(22, 7),(23, 8),(24, 9),(25, 10),(26, 11),(27, 12),(28, 13),(29, 14),
(30, 15),(31, 1),(32, 2),(33, 3),(34, 4),(35, 5),(36, 6),(37, 7),(38, 8),(39, 9),(40, 10),(41, 11),(42, 12),(43, 13),(44, 14),
(45, 15),(46, 1),(47, 2),(48, 3),(49, 4),(50, 5);
GO


-- Inserir eventos
INSERT INTO Evento (id_evento, nome, descricao) VALUES
(1, 'Torneio de Natação', 'Competição entre os alunos de natação'),
(2, 'Desafio de Musculação', 'Evento para medir desempenho dos alunos de musculação'),
(3, 'Aula Especial de Yoga', 'Sessão aberta com foco em relaxamento e flexibilidade'),
(4, 'Caminhada da Saúde', 'Atividade ao ar livre promovendo hábitos saudáveis'),
(5, 'Campeonato de Futebol', 'Disputa entre turmas da modalidade futebol'),
(6, 'Festival de Dança', 'Apresentação das turmas de dança e convidados'),
(7, 'Treinão Funcional', 'Treino coletivo com foco em resistência e força'),
(8, 'Corrida Interna', 'Corrida de 5 km entre os membros do clube'),
(9, 'Oficina de Nutrição', 'Palestra e oficina sobre alimentação saudável'),
(10, 'Dia do Esporte', 'Evento com diversas atividades esportivas e recreativas');
GO


-- Associação membro-evento
INSERT INTO Membro_Evento (id_membro, id_evento) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 6),(7, 7),(8, 8),(9, 9),(10, 10),(11, 1),(12, 2),(13, 3),(14, 4),(15, 5),(16, 6),(17, 7),
(18, 8),(19, 9),(20, 10),(21, 1),(22, 2),(23, 3),(24, 4),(25, 5),(26, 6),(27, 7),(28, 8),(29, 9),(30, 10),(31, 1),(32, 2),(33, 3),
(34, 4),(35, 5),(36, 6),(37, 7),(38, 8),(39, 9),(40, 10),(41, 1),(42, 2),(43, 3),(44, 4),(45, 5),(46, 6),(47, 7),(48, 8),(49, 9),(50, 10);
GO


-- Associação funcionario-evento
INSERT INTO Funcionario_Evento (id_funcionario, id_evento) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 6),(7, 7),(8, 8),(9, 9),(10, 10);
GO

--------------------------------------------------------------
--CONSULTAS
--------------------------------------------------------------

SELECT id_modalidade AS 'ID', nome_modalidade AS 'Modalidade'
FROM Modalidade;
GO

SELECT id_instrutor AS 'ID', nome AS 'Nome', salario AS 'Salário'
FROM Instrutor;
GO

SELECT id_funcionario AS 'ID', nome AS 'Nome', telefone AS 'Telefone', email AS 'Email'
FROM Funcionario;

SELECT id_membro, nome, telefone AS 'Contato', endereco AS 'Endereco Residencial'
FROM Membro;

SELECT id_turma AS 'Turma', codigo_turma AS 'Código', id_modalidade AS 'Modalidade'
FROM Turma;

SELECT id_membro AS 'Membro' , id_turma AS 'Turma'
FROM Membro_Turma;

SELECT id_evento, nome, descricao AS 'descrição'
FROM Evento;

SELECT id_funcionario, id_evento
FROM Funcionario_Evento;

SELECT id_membro, id_evento
FROM Membro_Evento;

SELECT i.id_instrutor, i.nome AS instrutor, m.nome_modalidade AS modalidade
FROM Instrutor i
JOIN Modalidade m ON i.id_modalidade = m.id_modalidade;

SELECT t.codigo_turma AS turma, m.nome_modalidade AS modalidade
FROM Turma t
JOIN Modalidade m ON t.id_modalidade = m.id_modalidade;

SELECT m.nome AS membro, t.codigo_turma AS turma
FROM Membro_Turma mt
JOIN Membro m ON mt.id_membro = m.id_membro
JOIN Turma t ON mt.id_turma = t.id_turma;

SELECT id_funcionario, nome AS funcionario, salario
FROM Funcionario
WHERE salario > 3300;

SELECT id_instrutor, nome, data_admissao AS admissao
FROM Instrutor
WHERE data_admissao > '2020-01-01';

SELECT id_membro, nome, data_adesao AS adesao
FROM Membro
ORDER BY data_adesao DESC;

SELECT id_modalidade, nome_modalidade AS modalidade
FROM Modalidade
WHERE nome_modalidade LIKE 'G%';

SELECT id_turma, COUNT(id_membro) AS total_membros
FROM Membro_Turma
GROUP BY id_turma;

SELECT id_modalidade, AVG(salario) AS salario_medio
FROM Instrutor
GROUP BY id_modalidade;

SELECT e.nome AS evento, COUNT(fe.id_funcionario) AS num_funcionarios
FROM Evento e
LEFT JOIN Funcionario_Evento fe ON e.id_evento = fe.id_evento
GROUP BY e.id_evento, e.nome;

SELECT m.nome AS membro, e.nome AS evento
FROM Membro_Evento me
JOIN Membro m ON me.id_membro = m.id_membro
JOIN Evento e ON me.id_evento = e.id_evento;