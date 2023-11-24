-- DDL

CREATE DATABASE db_produtos

USE db_produtos

CREATE TABLE tlb_produtos(
	codigo int NOT NULL,
	produto varchar(20) NOT NULL,
	data_compra date NOT NULL
	PRIMARY KEY(codigo)
)

-- DML
INSERT INTO tlb_produtos (codigo, produto, data_compra) VALUES
(1, 'Açucar', GETDATE()),
(2, 'Arroz', GETDATE())

-- DQL
SELECT * FROM tlb_produtos

