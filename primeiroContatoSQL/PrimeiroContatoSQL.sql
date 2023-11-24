CREATE DATABASE db_segunda_base

GO

USE db_segunda_base

CREATE TABLE tbl_aluno (
	matricula	int,
	rg				varchar(12) NOT NULL,
	cpf				varchar(14) NOT NULL,
	nome			varchar(100) NOT NULL,
	telefone		varchar(14) NOT NULL,
	curso			varchar(50) NOT NULL,
	unidade_escolar varchar(50) NOT NULL
	PRIMARY KEY (matricula)
)

INSERT INTO tbl_aluno (matricula, rg, cpf, nome, telefone, curso, unidade_escolar) VALUES
(2, '24.123.124-4', '355.204.266-68', 'Matheus Vinicius', '(11)94523-9284', 'Desenvolvimento de Sistemas', 'Cidade Tiradentes'),
(5, '26.295.959-6', '295.261.959-69', 'Anderson Augusto', '(21)95435-5126', 'Química', 'Cidade Tiradentes'),
(9, '59.631.509-2', '953.125.769-5x', 'Gabriel Lima', '(11)96912-6969', 'Nutrição', 'Getúlio Vargas'),
(4, '69.126.163-1', '494.205.126-04', 'Felipe Daniel', '(11)92512-5252', 'Segurança do Trabalho', 'Sapopemba'),
(7, '59.451.215-9', '193.591.251-01', 'Gabriel Ortiz', '(11)94125-3597', 'Química', 'Itaquera')

SELECT * FROM tbl_aluno



CREATE TABLE tbl_carro (
	placa	varchar(8),
	marca	varchar(20) NOT NULL,
	modelo	varchar(20) NOT NULL,
	cor		varchar(20) NOT NULL,
	ano		int NOT NULL
	PRIMARY KEY(placa)
)

INSERT INTO tbl_carro VALUES
('AFT-9087', 'VW', 'Gol', 'Preto', 2007),
('DXO-9876', 'Ford', 'Ka', 'Azul', 2000),
('EGT-4631', 'Renault', 'Clio', 'Verde', 2004),
('LKM-7380', 'Fiat', 'Palio', 'Prata', 1997),
('BCD-7521', 'Ford', 'Fiesta', 'Preto', 1999)

SELECT * FROM tbl_carro