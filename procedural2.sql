----------------------------------
--AULA 02/06/25
----------------------------------
USE INTERCAMBIOCJ3028607;
GO

SELECT name 
FROM sys.tables;
GO

CREATE PROCEDURE AloMundo
AS PRINT 'Alô mundo!';
GO

EXECUTE AloMundo;
GO

CREATE PROCEDURE uspAlunosMasculinos
AS	SELECT	CodAluno	AS 'Código do Aluno',
			NomeAluno	AS 'Nome do Aluno',
			DataNasc	AS 'Data de nascimento',
			Endereco	AS 'Endereço',
			Telefone,
			Genero		AS 'Gênero',
			PaisOrigem	AS 'Nacionalidade',
			CodViagem	AS 'Código da viagem'
	FROM ALUNOS
	WHERE Genero = 'M';
GO

EXEC uspAlunosMasculinos;
GO

SELECT * FROM sys.procedures;
GO

SELECT	name		AS 'Procedure',
		create_date AS 'Datade criação',
		modify_date AS 'Data de alteração'
FROM sys.procedures;
GO

ALTER PROCEDURE AloMUndo
AS PRINT 'Hello world!';
GO

EXECUTE AloMundo;
GO

EXEC XP_SUBDIRS 'C:\';
GO

EXEC XP_FILEEXIST 'E:\01-Intercambio.sql';
GO

EXEC SP_HELPEXTENDEDPROC;
GO

CREATE PROCEDURE uspSaudacao
@nome VARCHAR(200)
AS
PRINT 'Olá, '+ @nome + '!';
GO

EXEC uspSaudacao 'Paulo';
EXEC uspSaudacao 'Cris';
GO

----------------------------------
--AULA 09/06/25
----------------------------------