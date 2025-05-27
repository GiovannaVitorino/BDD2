
----------------------------------
--AULA 23/05/25
----------------------------------
USE INTERCAMBIOCJ3028607;
GO

CREATE TABLE Aeronaves (
	CodAeronave INT IDENTITY PRIMARY KEY,
	Modelo VARCHAR(50) NOT NULL
);
GO

INSERT INTO Aeronaves VALUES
	('Boeing 707'),
	('Boeing 737'),
	('Boeing 747'),
	('Embraer ERJ-145'),
	('Vickers VC-10');
GO

SELECT * FROM Aeronaves;
GO

SET IDENTITY_INSERT Aeronaves ON;
GO

INSERT INTO Aeronaves(CodAeronave, Modelo) VALUES
	(6, 'Airbus A300');
GO

SELECT * FROM Aeronaves;
GO

SET IDENTITY_INSERT Aeronaves OFF;
GO

CREATE TABLE Veiculos (
	Codigo INT IDENTITY (1,10) PRIMARY KEY,
	Modelo VARCHAR(50) NOT NULL
);
GO

INSERT INTO Veiculos VALUES
('Ferrari'),
('Camaro'),
('Fusca');
GO

SELECT * FROM Veiculos;
GO

SELECT IDENT_INCR('Aeronaves') AS 'Inc. AERONAVES',
		IDENT_INCR('Veiculos')AS 'Inc. VEICULOS';
GO

SELECT @@IDENTITY AS 'Último IDENTITY',
		IDENT_CURRENT('VEICULOS') AS 'IDENTITY (VEICULOS)',
		IDENT_CURRENT('Aeronaves') AS 'IDENTITY (AERONAVES)';
GO

CREATE SEQUENCE Incrementa1 AS INT
	START WITH 1
	INCREMENT BY 1;
GO

CREATE SEQUENCE Incrementa100 AS INT
	START WITH 10
	INCREMENT BY 1000;
GO

CREATE SEQUENCE Incrementa1000 AS INT
	START WITH 1000
	INCREMENT BY -100;
GO

SELECT name AS 'Nome',
		create_date AS 'Data de criação',
		start_value AS 'Valor Iniccial',
		increment AS 'Incremento',
		minimum_value as 'Valor mínimo',
		maximum_value AS 'Valor Máximo',
		current_value AS 'Valor atual'
FROM sys.sequences;
GO

CREATE SEQUENCE IncrementaDecimal AS DECIMAL
	START WITH 123
	INCREMENT BY 25
	MINVALUE 100
	MAXVALUE 200
	CYCLE
	CACHE 3;
GO

--EXIBE O PRIMEIRO VALOR DA SEQUÊNCIA
SELECT NEXT VALUE FOR Incrementa1 AS 'Incrementa1',
		VALUE FOR Incrementa100 AS 'Incrementa100',
		VALUE FOR Incrementa1000 AS 'Incrementa1000',
		VALUE FOR IncrementaDecimal AS 'IncrementaDecimal';
GO

CREATE TABLE #TesteDaSequencia(
ID INT,
Nome CHAR (20)
);
GO

ALTER SEQUENCE Incrementa100
RESTART WITH 10;
GO

INSERT INTO #TesteDaSequencia (ID, Nome) VALUES
(NEXT VALUE FOR Incrementa100,'Ana'),
(NEXT VALUE FOR Incrementa100,'Maria'),
(NEXT VALUE FOR Incrementa100,'João');
GO

SELECT * FROM #TesteDaSequencia;
GO

SELECT current_value AS 'Valor atual' 
	FROM sys.sequences
	WHERE name = 'Incrementa100';
GO

DROP SEQUENCE Incrementa100;
GO

INSERT INTO  #TesteDaSequencia (ID, Nome) VALUES
(NEXT VALUE FOR Incrementa100,'José');
GO

DECLARE @nome AS VARCHAR (100); 
SET @nome = 'Carlos Pereira';

SELECT CodAluno AS 'Código',
		NomeAluno AS 'Nome',
		Endereco AS 'Endereço'
		FROM ALUNOS

		WHERE NomeAluno LIKE @nome;
GO

DECLARE @nome AS VARCHAR (100) = 'Carlos Pereira';

SELECT CodAluno AS 'Código',
		NomeAluno AS 'Nome',
		Endereco AS 'Endereço'
		FROM ALUNOS

		WHERE NomeAluno LIKE @nome;
GO

DECLARE @rows AS INT;
SET @rows = (SELECT COUNT (*) FROM VIAGENS);

SELECT @rows AS 'Total de Viagens';
GO

DECLARE @A AS INT = 10,
@B AS INT = 100,
@maior AS INT;

IF @A > @B 
SET @maior = @A;
ELSE 
SET @maior = @B;

PRINT 'O maior valor é: ' + CAST(@maior AS VARCHAR);
GO

DECLARE @numero AS INT = 240,


IF ((@numero % 2) =0)
PRINT 'O número ' + CAST(@numero AS VARCHAR) + 'é par!';
ELSE 
PRINT 'O número ' + CAST(@numero AS VARCHAR) + 'é impar!';
GO