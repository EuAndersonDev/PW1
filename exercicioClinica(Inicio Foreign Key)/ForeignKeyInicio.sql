CREATE DATABASE clinica_medica

USE clinica_medica

GO

CREATE TABLE tbl_paciente (
	nome varchar(100) NOT NULL,
	endereco varchar(200) NOT NULL,
	telefone varchar(15) NOT NULL,
	numeroBeneficiario int NOT NULL,
	doencasPrevias varchar(100) NOT NULL,
	remedioDeUsoContinuo varchar(100) NOT NULL,
	PRIMARY KEY(numeroBeneficiario)
)

INSERT INTO tbl_paciente (nome, endereco, telefone, numeroBeneficiario, doencasPrevias, remedioDeUsoContinuo)
VALUES
    ('Maria Silva', 'Avenida dos Bosques, 456', '(21) 98765-4321', 987654321, 'Hipertensão', 'Losartana'),
    ('João Pereira', 'Rua das Palmeiras, 789', '(31) 5555-5555', 555555555, 'Diabetes Tipo 2', 'Insulina'),
    ('Ana Souza', 'Rua das Montanhas, 101', '(41) 1234-5678', 123456789, 'Artrite Reumatoide', 'Metotrexato'),
    ('Carlos Santos', 'Avenida do Sol, 567', '(51) 9876-5432', 987654321, 'Enxaqueca', 'Sumatriptana'),
    ('Isabel Oliveira', 'Rua das Estrelas, 246', '(61) 3333-3333', 333333333, 'Asma Crônica', 'Salbutamol');

CREATE TABLE tbl_especialidade (
	nome varchar(100) NOT NULL,
	numeroRegistro int NOT NULL,
	publicoAlvo varchar(30) NOT NULL,
	PRIMARY KEY(numeroRegistro)
)

INSERT INTO tbl_especialidade (nome, numeroRegistro, publicoAlvo)
VALUES
	('Demartologista', 53148653148624680, 'Pessoas com Problema de pele')
	('Cardiologista', 65432165432154321, 'Pessoas com problemas cardíacos'),
    ('Oftalmologista', 24681324681367890, 'Pessoas com problemas de visão'),
    ('Ortopedista', 98765498765443210, 'Pessoas com problemas ortopédicos'),
    ('Ginecologista', 86420986420998765, 'Mulheres com saúde reprodutiva');

CREATE TABLE tbl_agendamento (
	numeroAgendamento int NOT NULL,
	data date NOT NULL,
	hora time NOT NULL,
	queixa varchar(100) NOT NULL,
	gravidade int NOT NULL,
	PRIMARY KEY(numeroAgendamento)
)

INSERT INTO tbl_agendamento (numeroAgendamento, data, hora, queixa, gravidade)
VALUES
	(72596, '2008-02-24', '11:20', 'Dor de cabeça e vômito', 5);
	(83642, '2023-09-15', '14:30', 'Febre alta e dor no peito', 9),
    (93781, '2023-09-16', '10:15', 'Tosse persistente e falta de ar', 7),
    (64298, '2023-09-17', '16:45', 'Dor abdominal aguda', 8),
    (52473, '2023-09-18', '09:00', 'Lesão no joelho após queda', 6);

CREATE TABLE tbl_medico (
	nome varchar(100) NOT NULL,
	endereco varchar(200) NOT NULL,
	telefone varchar(18) NOT NULL,
	crm varchar(12) NOT NULL,
	numeroRegistro int NOT NULL,
	PRIMARY KEY(crm)
	FOREIGN KEY(numeroRegistro) REFERENCES tbl_especialidade(numeroRegistro)
)

INSERT INTO tbl_medico (nome, endereco, telefone, crm, numeroRegistro)
VALUES
	('Roger Guedes','Rua das Flores, 123', '(12) 34567-8901', 'CRM/RJ 987654', 53148653148624680),
	('Everson Silva', 'Avenida Central, 456', '(34) 56789-0123', 'CRM/MG 246813', 65432165432154321),
	('Gabriel Gueto', 'Travessa dos Sonhos, 789', '(56) 78901-2345', 'CRM/BA 753951', 24681324681367890),
	('Matheus Anjos', 'Praça da Liberdade, 1010', '(78) 90123-4567', 'CRM/RS 864209', 98765498765443210),
	('Anderson Ortiz', 'Alameda dos Vales, 222', '(90) 12345-6789', 'CRM/PR 531486', 86420986420998765);


CREATE TABLE tbl_consulta (
	numeroConsulta varchar(12) NOT NULL,
	data date NOT NULL,
	hora time NOT NULL, 
	numeroBeneficiario int,
	crm varchar(13) NOT NULL,
	numeroAgendamento int NOT NULL,
	PRIMARY KEY(numeroConsulta)
	FOREIGN KEY(numeroBeneficiario) REFERENCES tbl_paciente(numeroBeneficiario)
	FOREIGN KEY(crm) REFERENCES tbl_medico(crm)
	FOREIGN KEY(numeroAgendamento) REFERENCES tbl_numeroAgendamento(numeroAgendamento)
)

INSERT INTO tbl_consulta (numeroConsulta, data, hora, numeroBeneficiario, crm, numeroAgendamento)
VALUES
	(654.654/5678, 2008-02-24, '11:20', 987654321, 'CRM/RJ 987654', 72596)
	(252.756/5321, 2008-04-28, '11:30', 555555555, 'CRM/MG 246813', 83642)
	(549.251/2153, 2008-11-25, '10:20', 123456789, 'CRM/BA 753951', 93781)
	(217.126/3266, 2009-11-20, '10:30', 987654321, 'CRM/RS 864209', 64298)