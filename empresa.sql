--24 FEV 25--
CREATE DATABASE empresacj3028607;
GO

USE empresacj3028607;
GO

CREATE TABLE funcionarios
(
	ID         INT				PRIMARY KEY,
	Nome       VARCHAR(25)		NOT NULL,
	Sexo       CHAR(1)			NULL,
	Admissao   DATE				NOT NULL,
	Salario    DECIMAL(10, 2)	NOT NULL
);
GO

SET DATEFORMAT DMY;
GO

INSERT INTO funcionarios
	(
	ID,
	Nome,
	Sexo,
	Admissao,
	Salario
	)
VALUES 
	(1, 'Maria Da Silva', 'F', '10/01/2018', 25000.00);
GO

INSERT INTO funcionarios VALUES 
	(2, 'Pedro Pereira', 'M', '25/05/2015', 990.00);
GO
--INSERT INTO funcionarios VALUES  (2, 'Maria Cristina', 'F', '10/09/2015', 1200.00); GO
INSERT INTO funcionarios VALUES 
	(3, 'Maria Cristina', 'M', '15/05/2015', 1200.00);
GO

INSERT INTO funcionarios VALUES 
	(4, 'Antonio Carlos', 'F', '10/09/2015', 990.00);
GO

INSERT INTO funcionarios VALUES 
	(5, 'Marcelo Augusto', 'M', '09/12/2017', 1900.00),
	(6, 'Pedro Silva', 'M', '15/11/2015', 1050.00),
	(7, 'Monica Da Silva', 'F', '12/10/2014', 3000.00),
	(8, 'Tiago Lima', 'M', '10/05/2016', 1350.50);
GO

SELECT ID AS 'Código do Funcionário',
	Nome,
	Sexo,
	Admissao AS 'Admissão',
	Salario AS 'Salário'
FROM funcionarios;
Go

SELECT * FROM funcionarios;
Go

SELECT TOP 3 * FROM funcionarios;
Go

SELECT TOP 3
	ID,
	Nome
FROM funcionarios;
Go

SELECT * FROM funcionarios
WHERE Sexo = 'M'AND
Salario > 1000;
Go

SELECT * FROM funcionarios
ORDER BY Nome;
Go

SELECT * FROM funcionarios
ORDER BY Nome ASC;
Go

SELECT * FROM funcionarios
ORDER BY Nome DESC;
Go

INSERT INTO funcionarios VALUES 
	(9, 'Maria Cristina', 'F', '21/09/2012', 1700.00),
	(10, 'Maria Cristina', 'F', '10/10/2017', 1400.00);
GO

SELECT * FROM funcionarios
	WHERE Salario < 3000
	ORDER BY Nome, 
		Salario DESC;
Go
