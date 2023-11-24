CREATE DATABASE clinica_medica

USE clinica_medica

GO

CREATE TABLE tbl_paciente (
	nome varchar(100) NOT NULL,
	endereco varchar(200) NOT NULL,
	telefone varchar(15) NOT NULL,
	numeroBeneficiario int NOT NULL IDENTITY(92764, 7),
	doencasPrevias varchar(100) NOT NULL,
	remedioDeUsoContinuo varchar(100) NOT NULL,
	PRIMARY KEY(numeroBeneficiario)
)

INSERT INTO tbl_paciente (nome, endereco, telefone, doencasPrevias, remedioDeUsoContinuo)
VALUES
    ('Maria Silva', 'Avenida dos Bosques, 456', '(21) 98765-4321', 'Hipertensão', 'Losartana'),
    ('João Pereira', 'Rua das Palmeiras, 789', '(31) 5555-5555',  'Diabetes Tipo 2', 'Insulina'),
    ('Ana Souza', 'Rua das Montanhas, 101', '(41) 1234-5678',  'Artrite Reumatoide', 'Metotrexato'),
    ('Carlos Santos', 'Avenida do Sol, 567', '(51) 9876-5432',  'Enxaqueca', 'Sumatriptana'),
    ('Isabel Oliveira', 'Rua das Estrelas, 246', '(61) 3333-3333', 'Asma Crônica', 'Salbutamol');

--EXECUÇÃO DE TABELA
SELECT * FROM tbl_paciente

CREATE TABLE tbl_especialidade (
	nome varchar(100) NOT NULL,
	numeroRegistro int NOT NULL IDENTITY(84, 1),
	publicoAlvo varchar(100) NOT NULL,
	PRIMARY KEY(numeroRegistro)
)

INSERT INTO tbl_especialidade (nome, publicoAlvo)
VALUES
	('Demartologista', 'Pessoas com Problema de pele'),
	('Cardiologista', 'Pessoas com problemas cardíacos'),
    ('Oftalmologista', 'Pessoas com problemas de visão'),
    ('Ortopedista', 'Pessoas com problemas ortopédicos'),
    ('Ginecologista', 'Mulheres com saúde reprodutiva');

--EXECUÇÃO DE TABELA
SELECT * FROM tbl_especialidade

CREATE TABLE tbl_agendamento (
	numeroAgendamento int NOT NULL IDENTITY(52456, 72),
	data date NOT NULL,
	hora time NOT NULL,
	queixa varchar(100) NOT NULL,
	gravidade int NOT NULL,
	PRIMARY KEY(numeroAgendamento)
)

INSERT INTO tbl_agendamento (data, hora, queixa, gravidade)
VALUES
	('2008-02-24', '11:20', 'Dor de cabeça e vômito', 5),
	('2023-09-15', '14:30', 'Febre alta e dor no peito', 9),
    ('2023-09-16', '10:15', 'Tosse persistente e falta de ar', 7),
    ('2023-09-17', '16:45', 'Dor abdominal aguda', 8),
    ('2023-09-18', '09:00', 'Lesão no joelho após queda', 6);

--EXECUÇÃO DE TABELA
SELECT * FROM tbl_agendamento

CREATE TABLE tbl_medico (
	nome varchar(100) NOT NULL,
	endereco varchar(200) NOT NULL,
	telefone varchar(18) NOT NULL,
	crm varchar(13) NOT NULL,
	numeroRegistro int NOT NULL IDENTITY(84, 1),
	PRIMARY KEY(crm),
	FOREIGN KEY(numeroRegistro) REFERENCES tbl_especialidade(numeroRegistro)
)

INSERT INTO tbl_medico (nome, endereco, telefone, crm)
VALUES
	('Roger Guedes','Rua das Flores, 123', '(12) 34567-8901', 'CRM/RJ 987654'),
	('Everson Silva', 'Avenida Central, 456', '(34) 56789-0123', 'CRM/MG 246813'),
	('Gabriel Gueto', 'Travessa dos Sonhos, 789', '(56) 78901-2345', 'CRM/BA 753951'),
	('Matheus Anjos', 'Praça da Liberdade, 1010', '(78) 90123-4567', 'CRM/RS 864209'),
	('Anderson Ortiz', 'Alameda dos Vales, 222', '(90) 12345-6789', 'CRM/PR 531486');

--EXECUÇÃO DE TABELA
SELECT * FROM tbl_medico

CREATE TABLE tbl_consulta (
	numeroConsulta int NOT NULL IDENTITY(2515, 1),
	data date NOT NULL,
	hora time NOT NULL, 
	numeroBeneficiario int NOT NULL,
	crm varchar(13) NOT NULL,
	numeroAgendamento int NOT NULL,
	PRIMARY KEY(numeroConsulta),
	FOREIGN KEY(numeroBeneficiario) REFERENCES tbl_paciente(numeroBeneficiario),
	FOREIGN KEY(crm) REFERENCES tbl_medico(crm),
	FOREIGN KEY(numeroAgendamento) REFERENCES tbl_agendamento(numeroAgendamento)
)

INSERT INTO tbl_consulta (data, hora, numeroBeneficiario, crm, numeroAgendamento)
VALUES
    ('2008-02-24', '11:20', 92764, 'CRM/RJ 987654', 52672),
    ('2008-04-28', '11:30', 92771, 'CRM/MG 246813', 52744),
    ('2008-11-25', '10:20', 92778, 'CRM/BA 753951', 52600),
    ('2009-11-20', '10:30', 92785, 'CRM/RS 864209', 52528),
    ('2023-09-18', '09:00', 92792, 'CRM/PR 531486', 52456);
   
--EXECUÇÃO DE TABELA	
SELECT * FROM tbl_consulta

CREATE PROCEDURE printarTabelas 
AS
	SELECT * FROM tbl_agendamento
	SELECT * FROM tbl_consulta
	SELECT * FROM tbl_especialidade
	SELECT * FROM tbl_medico
	SELECT * FROM tbl_paciente
GO;

--Printa todas as tabelas
EXEC printarTabelas