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
WHERE NomeAluno IN
(SELECT  NomeAluno  AS 'Nome do Aluno'
FROM AlunosCOPIA)
ORDER BY NomeAluno;
GO

SELECT  VIAGENS.CodViagem AS 'Código',
		ALUNOS.CodAluno AS 'Nome do Aluno',
		Alunos.Telefone,
		Alunos.Genero AS 'Gênero',
		(SELECT NomePais FROM PAISES WHERE CodPais = ALUNOS.PaisOrigem) AS 'Origem',
		(SELECT NomePais FROM PAISES WHERE CodPais = VIAGENS.PaisDestino) AS 'Destino',
		VIAGENS.DataSaida AS 'Data de saída',
		VIAGENS.DataSaida AS 'Data de retorno',
		VIAGENS.Valor AS 'Preço da Viagem R$'
FROM ALUNOS INNER JOIN VIAGENS
	ON ALUNOS.CodViagem=VIAGENS.CodViagem;
GO

SELECT CodPais AS 'Código',
		NomePais AS 'Pais de Destino',
		IdiomaPais AS 'Idioma'
FROM PAISES
WHERE CodPais = ( SELECT DISTINCT PaisDestino
				FROM VIAGENS
				WHERE PaisDestino = 'USA');
				GO

SELECT CodPais AS 'Código',
		NomePais AS 'Pais de Destino',
		IdiomaPais AS 'Idioma'
FROM PAISES
WHERE CodPais IN ( 
	SELECT PaisDestino FROM VIAGENS
);
GO

SELECT P.CodPais AS 'Código',
		P.NomePais AS 'Pais de Destino',
		COUNT (CodPais) AS 'Total de Viagens'
FROM PAISES P INNER JOIN VIAGENS V
ON P.CodPais = V.PaisDestino
	GROUP BY P.CodPais, P.NomePais
	HAVING COUNT (P.CodPais) >= ( 
	SELECT  COUNT (PaisDestino) FROM VIAGENS
	WHERE PaisDestino = 'MEX'
);
GO

SELECT CodPais AS 'Código',
		NomePais AS 'Pais de Destino',
		IdiomaPais AS 'Idioma'
FROM PAISES
WHERE CodPais = ANY (
	SELECT PaisDestino FROM VIAGENS
		WHERE PaisDestino IN ('USA', 'MEX', 'BRA')
);
GO

SELECT CodViagem AS 'Código da viagem',
DataSaida AS 'Data de saída',
DataRetorno AS 'Data de Retorno',
PaisDestino AS 'Destino'
FROM VIAGENS
WHERE CodViagem > ALL (
SELECT CodViagem FROM ALUNOS
);
GO

SELECT '3.1415' AS 'PI',
PI() AS 'PI',
ABS(-3.1415) AS 'ABS',
CEILING(3.1415) AS 'CEILING',
FLOOR(3.1415) AS 'FLOOR',
EXP(1.0) AS 'EXP',
POWER(2, 3.0) AS 'POWER',
RAND(5) AS 'RAND',
ROUND(PI(), 2) AS 'ROUND',
SQRT(100) AS 'SQRT',
SIGN(-1) AS 'SIGN',
SQUARE(3) AS 'SQUARE';
GO

SELECT V.CodViagem AS 'Código da Viagem',
A.NomeAluno AS 'Nome do Aluno',
V.Valor  AS 'Preço da Viagem',
V.Valor * 0.05 AS 'Desconto de 5%',
V.Valor * 0.95 AS 'Total a pagar (ROUND)'
FROM VIAGENS V INNER JOIN ALUNOS A
ON V.CodViagem = A.CodViagem;
GO