USE INTERCAMBIOCJ3028607;
GO

SELECT name
FROM sys.tables;
GO

SELECT TABLE_NAME AS 'Nome da Tabela'
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND
TABLE_CATALOG = 'INTERCAMBIOCJ3028607';
GO

--CREATE TABLE AlunosCOPIA (
--    CodAluno INT IDENTITY PRIMARY KEY,
--    NomeAluno CHAR(20) NOT NULL,
--    DataNasc DATE NOT NULL,
--    Endereco VARCHAR(60) NOT NULL,
--    Telefone CHAR(12) NOT NULL,
--    Genero CHAR(1),
--    PaisOrigem CHAR(3) NOT NULL FOREIGN KEY REFERENCES PAISES(CodPais),
--    CodViagem INT NOT NULL FOREIGN KEY REFERENCES VIAGENS(CodViagem)
--);
--GO

SELECT CodAluno   AS 'Código',
       NomeAluno  AS 'Nome do Aluno',
       Endereco   AS 'Endereço',
       Genero     AS 'Gênero',
       PaisOrigem AS 'Origem',
       CodViagem  AS 'Código da Viagem'
FROM AlunosCOPIA;
GO

SELECT CodAluno   AS 'Código do Aluno ',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'Gênero do Aluno'
FROM ALUNOS
UNION ALL
SELECT CodAluno   AS 'Código do Aluno',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'Gênero do Aluno'
FROM AlunosCOPIA
ORDER BY CodAluno, NomeAluno;
GO

SELECT CodAluno   AS 'Código do Aluno ',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'Gênero do Aluno'
FROM ALUNOS
	INTERSECT
--UNION ALL
SELECT CodAluno   AS 'Código do Aluno',
       NomeAluno  AS 'Nome do Aluno do Aluno',
       Genero     AS 'Gênero do Aluno'
FROM AlunosCOPIA
ORDER BY CodAluno, NomeAluno;
GO

SELECT CodAluno   AS 'Código do Aluno ',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'Gênero do Aluno'
FROM ALUNOS
	EXCEPT
SELECT CodAluno   AS 'Código do Aluno',
       NomeAluno  AS 'Nome do Aluno',
       Genero     AS 'Gênero do Aluno'
FROM AlunosCOPIA
	ORDER BY CodAluno, NomeAluno;
GO

SELECT NomeAluno  AS 'Nome do Aluno'
FROM ALUNOS
	INTERSECT
SELECT NomeAluno  AS 'Nome do Aluno'
ORDER BY NomeAluno;
GO

SELECT NomeAluno  AS 'Nome do Aluno'
WHERE NomeAluno IN (SELECT  NomeAluno  AS 'Nome do Aluno'
FROM AlunosCOPIA)
ORDER BY NomeAluno;
GO

SELECT  VIAGENS.CodViagem AS 'Código',
		ALUNOS.CodAluno   AS 'Nome do Aluno',
		Alunos.Telefone,
		Alunos.Genero	  AS 'Gênero',
		(SELECT NomePais FROM PAISES WHERE CodPais = ALUNOS.PaisOrigem) AS 'Origem',
		(SELECT NomePais FROM PAISES WHERE CodPais = VIAGENS.PaisDestino) AS 'Destino',
		VIAGENS.DataSaida AS 'Data de saída',
		VIAGENS.DataSaida AS 'Data de retorno',
		VIAGENS.Valor	  AS 'Preço da Viagem R$'
FROM ALUNOS INNER JOIN VIAGENS
	ON ALUNOS.CodViagem=VIAGENS.CodViagem;
GO

SELECT CodPais	   AS 'Código',
		NomePais   AS 'Pais de Destino',
		IdiomaPais AS 'Idioma'
FROM PAISES
WHERE CodPais = ( SELECT DISTINCT PaisDestino
				FROM VIAGENS
				WHERE PaisDestino = 'USA');
GO

SELECT CodPais	   AS 'Código',
		NomePais   AS 'Pais de Destino',
		IdiomaPais AS 'Idioma'
FROM PAISES
WHERE CodPais IN ( 
	SELECT PaisDestino FROM VIAGENS
);
GO

SELECT  P.CodPais		AS 'Código',
		P.NomePais		AS 'Pais de Destino',
		COUNT (CodPais) AS 'Total de Viagens'
FROM PAISES P INNER JOIN VIAGENS V
ON P.CodPais = V.PaisDestino
	GROUP BY P.CodPais, P.NomePais
	HAVING COUNT (P.CodPais) >= ( 
	SELECT COUNT (PaisDestino) FROM VIAGENS
	WHERE PaisDestino = 'MEX'
);
GO

SELECT CodPais	   AS 'Código',
		NomePais   AS 'Pais de Destino',
		IdiomaPais AS 'Idioma'
FROM PAISES
WHERE CodPais = ANY (
	SELECT PaisDestino FROM VIAGENS
		WHERE PaisDestino IN ('USA', 'MEX', 'BRA')
);
GO

SELECT CodViagem AS 'Código da viagem',
DataSaida		 AS 'Data de saída',
DataRetorno		 AS 'Data de Retorno',
PaisDestino		 AS 'Destino'
FROM VIAGENS
WHERE CodViagem > ALL (
SELECT CodViagem FROM ALUNOS
);
GO

SELECT '3.1415' AS 'PI',
PI()			AS 'PI',
ABS(-3.1415)	AS 'ABS',
CEILING(3.1415) AS 'CEILING',
FLOOR(3.1415)	AS 'FLOOR',
EXP(1.0)		AS 'EXP',
POWER(2, 3.0)	AS 'POWER',
RAND(5)			AS 'RAND',
ROUND(PI(), 2)	AS 'ROUND',
SQRT(100)		AS 'SQRT',
SIGN(-1)		AS 'SIGN',
SQUARE(3)		AS 'SQUARE';
GO

SELECT V.CodViagem AS 'Código da Viagem',
A.NomeAluno		   AS 'Nome do Aluno',
V.Valor			   AS 'Preço da Viagem',
V.Valor * 0.05	   AS 'Desconto de 5%',
V.Valor * 0.95     AS 'Total a pagar (ROUND)'
FROM VIAGENS V INNER JOIN ALUNOS A
ON V.CodViagem = A.CodViagem;
GO

--------------
--12/05/2025--
--------------

SELECT SYSDATETIME()		AS 'SYSDATETIE',
	   SYSDATETIMEOFFSET()  AS 'SYSDATETIMEOFFSET',
	   SYSUTCDATETIME()		AS 'SYSUTCDATETIME',
	   CURRENT_TIMESTAMP()  AS 'CURRENT_TIMESTAMP',
	   GETDATE()			AS 'GETDATE'
       GETUTCDATE()		    AS 'GETUTCDATE';
GO

SELECT Codaluno AS 'Código',
DataNasc AS 'Data de nascimento',
DAY(DataNasc) AS 'Dia do nascimento',
MONTH(DataNasc) AS 'Mês do nascimento',
YEAR(DataNasc) AS 'Ano do nascimento',
DATEPART(WEEKDAY, DataNasc) as 'Dia da semana do nascimento'
FROM ALUNOS;
GO

DECLARE @dia AS INT,
@mes		 AS CHAR(20),
@ano		 AS INT,
@data1		 AS DATE,
@data2		 AS DATETIME;

SET @dia = DAY(GETDATE());
SET @mes = MONTH(GETDATE());
SET @ano = YEAR(GETDATE());

SET @data1 = DATEFROMPARTS(@ano, @mes, @dia);
SET @data2 = DATETIMEFROMPARTS (@ano, @mes, @dia, 0, 0, 0, 0);

SELECT @dia AS 'Dia',
@mes		AS 'Mês',
@ano		AS 'Ano',
@data1		AS 'Data 1',
@data2		AS 'Data 2';
GO

DECLARE @data1 AS DATE,
@data2 AS DATE;

SET DATEFORMAT DMY;

SET @data1 ='01/01/2024';
SET @data2 = GETDATE();

SELECT @data1				   AS 'Data inicial',
	   @data2				   AS 'Data de hoje',
DATEDIFF(DAY, @data1, @data2)  AS 'Qtd. Meses',
DATEDIFF(HOUR, @data1, @data2) AS 'Qtd. Horas';

SELECT GETDATE()						 AS 'Data atual',
	   DATEADD (MONTH, 5 , GETDATE())	 AS 'Próximos 5 meses',
	   EOMONTH(GETDATE(), 5)			 AS 'Final do mês(daqui 5 meses)',
	   SWITCHOFFSET(GETDATE(), '+10:00') AS 'Alteração de fuso-horário (+10 horas)';
GO

SELECT @@LANGUAGE  AS 'Idioma utilizado',
	   @@DATEFIRST AS 'Primeiro dia da semana';
GO

SELECT @@LANGUAGE AS 'Idioma utilizado',
	CASE
		WHEN @@DATEFIRST = 1 THEN 'Segunda-Feira'
		WHEN @@DATEFIRST = 2 THEN 'Terça-Feira'
		WHEN @@DATEFIRST = 3 THEN 'Quarta-Feira'
		WHEN @@DATEFIRST = 4 THEN 'Quinta-Feira'
		WHEN @@DATEFIRST = 5 THEN 'Sexta-Feira'
		WHEN @@DATEFIRST = 6 THEN 'Sábado'
		WHEN @@DATEFIRST = 7 THEN 'Domingo'
	END AS 'Primeiro dia da semana';
GO

SELECT * FROM sys.syslanguages;
GO

SELECT  langid		AS 'ID do idioma',
		dateformat	AS 'Formato de data',
		datefirst	AS 'Primeiro dia da semana',
		name		AS 'Nome do idioma',
		alias		AS 'Nome alternativo do idioma',
		months		AS 'Nomes dos meses',
		shortmonths AS 'Abreviatura dos meses',
		days		AS 'Nomes dos dias'
		FROM sys.syslanguages
WHERE alias IN ('English', 'Brazillian', 'German', 'Japanese',
'Russian');
GO

EXEC sp_helplanguage [Brazillian];
GO

EXEC sp_helplanguage [Japanese];
GO

EXEC sp_helplanguage [English];
GO

DECLARE @data DATETIME;

SET @data = GETDATE();

SELECT @data		   AS 'Data atual',
DATEPART(DAY, @data)   AS 'Dia do mês',
DATENAME(DW, @data)	   AS 'Dia da semana',
DATEPART(MONTH, @data) AS 'Mês',
DATENAME(MONTH, @data) AS 'Nome do mês',
DATEPART(YEAR, @data)  AS 'Ano';
GO

DECLARE @data DATETIME;

SET @data = GETDATE();

SELECT @data	   AS 'Data atual',
DATEPART(DW, @data)AS 'Dia do mês',
DATENAME(WK, @data)AS 'Dia da semana',
DATEPART(M, @data) AS 'Mês',
DATENAME(D, @data) AS 'Nome do mês',
DATEPART(DY, @data)AS 'Ano';
GO

SET LANGUAGE Brazillian;
GO

DECLARE @data DATETIME;

SET @data = GETDATE();

SELECT @@LANGUAGE		  AS 'Idioma',
	   DATENAME(WK, @data)AS 'Dia da semana',
	   DATENAME(D, @data) AS 'Nome do mês';
GO

SET DATEFORMAT DMY;
GO

IF ISDATE('20/01/2015 00:10:50.000') = 1
	PRINT 'Data válida!';
ELSE
	PRINT 'Data inválida!';
GO

SET DATEFORMAT MDY;
GO

IF ISDATE('20/01/2015 00:10:50.000') = 1
	PRINT 'Data válida!';
ELSE
	PRINT 'Data inválida!';
GO

SET LANGUAGE US_english;
SET DATEFORMAT MDY;
GO


SELECT ASCII('A')						 AS 'ASCII: A',
	   UNICODE('A')						 AS 'UNICODE: A',
	   CHAR(65)							 AS 'CHAR: 65',
	   NCHAR(65)						 AS 'NCHAR: 65',
	   ASCII(N'私')						 AS 'ASCII: 私',
	   UNICODE(N'私')					 AS 'UNICODE: 私',
	   CHAR(31169)						 AS 'CHAR: 31169',
	   NCHAR(31169)						 AS 'CHAR: 31169',
	   CHARINDEX('S', 'Microsoft SQL')   AS 'CHARINDEX: S',
	   CHARINDEX('SQL', 'Microsoft SQL') AS 'CHARINDEX: SQL'
GO

SELECT 'Paulo' +'Giovani'				AS 'SPACE 1',
	   'Paulo' + ' ' + 'Giovani'		AS 'SPACE 2',
	   'paulo' + SPACE(10) + 'Giovani'  AS 'SPACE 3',
	   QUOTENAME ('Paulo Giovani', '{') AS 'QUOTENAME 1',
	   QUOTENAME ('Paulo Giovani', '"') AS 'QUOTENAME 2',
	   QUOTENAME ('Paulo Giovani', '[') AS 'QUOTENAME 3',
	   STR(100)							AS 'STR 1',
	   STR(100.0)						AS 'STR 2',
	   STR(100.45, 6, 2)				AS 'STR 3',
	   LEN('Paulo Giovani')				AS 'LEN 1';
GO

SELECT PATINDEX('soft', 'Microsoft SQL') AS 'PATINDEX 1',
	   PATINDEX('%soft%', 'Microsoft SQL') AS 'PATINDEX 2';
GO

SELECT SOUNDEX('Paulo')			   AS 'SOUNDEX: Paulo',
	   SOUNDEX('Paul')			   AS 'SOUNDEX: Paul',
	   SOUNDEX('Cris')			   AS 'SOUNDEX: Cris',
	   DIFFERENCE('Paulo', 'Paul') AS 'DIFF 1',
	   DIFFERENCE('Paulo', 'Cris') AS 'DIFF 2';
GO

DECLARE @d DATETIME = GETDATE();

SELECT FORMAT (@d, 'D', 'en-us')AS 'Inglês Americano',
	   FORMAT (@d, 'D', 'en-gb')AS 'Inglês Britânico',
	   FORMAT (@d, 'D', 'de-de')AS 'Alemão',
	   FORMAT (@d, 'D', 'zh-cn')AS 'Chinês Simplificado',
	   FORMAT (@d, 'D', 'pt-br')AS 'Português Brasileiro';
GO

SELECT NomeAluno AS 'Nome do aluno',
	   DataNasc AS 'Data de Nascimento',
	   FORMAT(DataNasc, 'D', 'pt-br') AS 'Data de Nascimento'
FROM ALUNOS;
GO