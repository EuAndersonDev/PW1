CREATE DATABASE db_produtos

USE db_produtos

GO

CREATE TABLE tbl_produtos (
	produto varchar(30) NOT NULL,
	fornecedor varchar(30) NOT NULL,
	custo_unitario float NOT NULL,
	quantidade int NOT NULL,
	custo_total float NOT NULL,
	PRIMARY KEY(produto)
)

INSERT INTO tbl_produtos VALUES
('Produto 1', 'Fornecedor 1', 200.00, 30, 6000.00),
('Produto 2', 'Fornecedor 1', 100.00, 50, 5000.00),
('Produto 3', 'Fornecedor 1', 50.00, 50, 2500.00),
('Produto 4', 'Fornecedor 1', 10.00, 100, 1000.00),
('Produto 5', 'Fornecedor 1', 150.00, 20, 3000.00),
('Produto 6', 'Fornecedor 1', 250.00, 2, 500.00),
('Produto 7', 'Fornecedor 1', 300.00, 5, 1500.00)

SELECT * FROM tbl_produtos
 
ALTER TABLE tbl_produtos 
DROP column custo_total

ALTER TABLE tbl_produtos
ADD nomeProduto varchar(50), percentualLucro float

UPDATE tbl_produtos SET nomeProduto = 'Fuzil 12mm', percentualLucro = 0.8
 WHERE produto = 'Produto 1'
UPDATE tbl_produtos SET nomeProduto = 'Ak-47', percentualLucro = 0.6 
WHERE produto = 'Produto 2'
UPDATE tbl_produtos SET nomeProduto = 'AWM', percentualLucro = 0.7 
WHERE produto = 'Produto 3'
UPDATE tbl_produtos SET nomeProduto = 'Glock', percentualLucro = 0.5 
WHERE produto = 'Produto 4'
UPDATE tbl_produtos SET nomeProduto = 'Espingarda', percentualLucro = 0.3 
WHERE produto = 'Produto 5'
UPDATE tbl_produtos SET nomeProduto = 'Revolver 38mm', percentualLucro = 0.9 
WHERE produto = 'Produto 6'
UPDATE tbl_produtos SET nomeProduto = 'Revolver 50mm', percentualLucro = 0.99 
WHERE produto = 'Produto 7'

 

UPDATE tbl_produtos SET quantidade = 50
WHERE produto = 'Produto 1'
UPDATE tbl_produtos SET quantidade = 80
WHERE produto = 'Produto 4'


DELETE FROM tbl_produtos 
WHERE produto = 'Produto 6' or produto = 'Produto 7'

SELECT nomeProduto as Nome, quantidade as qtd FROM tbl_produtos

SELECT 
      nomeProduto,
      'R$_' + cast(custo_unitario*percentualLucro as varchar(4)) AS precoVenda 
FROM tbl_produtos