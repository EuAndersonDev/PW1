CREATE DATABASE empresa

USE empresa

GO

CREATE TABLE tbl_dados (
	nome varchar(150) NOT NULL,
	cargo varchar(30) NOT NULL,
	nascimento date NOT NULL,
	taxa_presenca float NOT NULL,
	salario_base int NOT NULL,
	avaliacao float NOT NULL,
	PRIMARY KEY(nome)
)

INSERT INTO tbl_dados VALUES
    ('João Maria de Jesus', 'Administrativo', '1978-07-23', 80.2, 10600, 8.7),
    ('Felipe dos Santos', 'Técnico', '1988-11-02', 90, 18200, 5.6),
    ('Maria José Silva', 'Técnico', '1990-12-23', 87.3, 15000, 4.5),
    ('José Silva', 'Administrativo', '1978-12-23', 60, 16200, 9.3),
    ('Mário Antunes', 'RH', '1977-02-11', 54.2, 8000, 7.2),
    ('Paulo Roberto Silva', 'RH', '1976-10-13', 87.2333, 8900, 9.9),
    ('Teresa Jardim', 'RH', '1980-01-13', 100, 4000, 7.7),
    ('Roberto Carlos Alves', 'RH', '1983-12-10', 23.64, 4000, 7.7),
    ('Paulo Jardim', 'RH', '1945-06-28', 34.89, 30500, 10.0),
    ('Maria Eduarda Carvalho da Rosa', 'Administrativo', '1970-08-30', 90.78, 9000, 6.6),
    ('Pedro Henrique Teixeira', 'Técnico', '1978-12-23', 100, 7400, 7.2);

SELECT * FROM tbl_dados
--Exercicio 2

SELECT nome AS 'Nome', SUBSTRING(CAST(taxa_presenca AS VARCHAR(10)), 1, 10) + '%' AS 'Taxa de Presença', 'R$' + SUBSTRING(CAST(salario_base AS VARCHAR(6)), 1, 6) AS 'Salario Base'
FROM tbl_dados ORDER BY taxa_presenca DESC

--Exercicio 3

CREATE TABLE tbl_departamento (
	nome varchar(50) NOT NULL,
	numero int NOT NULL,
	rg_gerente int NOT NULL,
	PRIMARY KEY(numero)
)

INSERT INTO tbl_departamento VALUES
	('Contabilidade', 1, 10101010),
	('Engenharia Civil', 2, 30303030),
	('Engenharia Mecânica', 3, 20202020);

SELECT * FROM tbl_departamento

CREATE TABLE tbl_empregado (
	nome varchar(150) NOT NULL,
	rg int NOT NULL IDENTITY(10101010, 10101010),
	cic int NOT NULL,
	departamento int NOT NULL,
	rg_supervisor int,
	salario varchar(9) NOT NULL,
	PRIMARY KEY(rg),
	FOREIGN KEY(departamento) REFERENCES tbl_departamento(numero)
)

INSERT INTO tbl_empregado (nome, cic,departamento,rg_supervisor,salario)
VALUES
	('João Luiz', 11111111, 1, NULL, '3.000,00'),
	('Fernando', 22222222, 2, 10101010, '2.500,00'),
	('Ricardo', 33333333, 2, 10101010, '2.300,00'),
	('Jorge', 44444444, 2, 20202020, '4.200,00'),
	('Renato', 55555555, 3, 20202020, '1.300,00');
 
SELECT * FROM tbl_empregado

--Exercicio 4

SELECT nome AS 'Nome', 
	   SUBSTRING(CAST(rg AS VARCHAR(8)), 1, 2) + '.' + SUBSTRING(CAST(rg AS VARCHAR(8)), 3, 3) + '.' + SUBSTRING(CAST(rg AS VARCHAR(8)),6,3) + '-' + 'X' AS 'RG',
	   SUBSTRING(CAST(cic AS VARCHAR(8)), 1, 3) + '.' +SUBSTRING(CAST(cic AS VARCHAR(8)),3,3) + '.' + SUBSTRING(CAST(cic AS VARCHAR(8)	),6,2) + 'X-XX' AS 'CPF' 
FROM tbl_empregado ORDER BY CPF

--Criação de Procedure SEM OS SELECTS DOS EXERCICIOS

CREATE PROCEDURE printarTabelas 
AS
	SELECT * FROM tbl_dados
	SELECT * FROM tbl_departamento
	SELECT * FROM tbl_empregado
GO;

--Criação de Procedure COM OS SELECTS DOS EXERCICIOS

CREATE PROCEDURE printarTabelasExercicios2e4
AS
	SELECT nome AS 'Nome', SUBSTRING(CAST(taxa_presenca AS VARCHAR(10)), 1, 10) + '%' AS 'Taxa de Presença', 'R$' + SUBSTRING(CAST(salario_base AS VARCHAR(6)), 1, 6) AS 'Salario Base'
	FROM tbl_dados ORDER BY taxa_presenca DESC

	SELECT nome AS 'Nome', 
	   SUBSTRING(CAST(rg AS VARCHAR(8)), 1, 2) + '.' + SUBSTRING(CAST(rg AS VARCHAR(8)), 3, 3) + '.' + SUBSTRING(CAST(rg AS VARCHAR(8)),6,3) + '-' + 'X' AS 'RG',
	   SUBSTRING(CAST(cic AS VARCHAR(8)), 1, 3) + '.' +SUBSTRING(CAST(cic AS VARCHAR(8)),3,3) + '.' + SUBSTRING(CAST(cic AS VARCHAR(8)	),6,2) + 'X-XX' AS 'CPF' 
	FROM tbl_empregado
GO;

--Printa as tabelas sem exercicios resolvidos
EXEC printarTabelas

--Printa os exercicios 2 e 4
EXEC printarTabelasExercicios2e4
