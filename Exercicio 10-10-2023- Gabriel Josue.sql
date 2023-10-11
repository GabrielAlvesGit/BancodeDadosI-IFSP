CREATE DATABASE BDEXERCICIO
USE BDEXERCICIO

CREATE TABLE Departamento
(
    codDep INT PRIMARY KEY,
    descricao VARCHAR(50)
)

CREATE TABLE Empregado
(
    codEmp INT PRIMARY KEY,
    Nome VARCHAR (50),
    Salario FLOAT,
    idade INT,
    CodDep Int FOREIGN KEY(codDep) REFERENCES Departamento(codDep)
)


CREATE TABLE Projeto
(
    codProj VARCHAR PRIMARY KEY,
    Descricao VARCHAR (50)
)

    
CREATE TABLE ProjetoEmprego
(
    codProj VARCHAR FOREIGN KEY(codProj) REFERENCES Projeto(codProj),
    codEmp Int FOREIGN KEY(codEmp) REFERENCES Empregado(codEmp),
    dataIn VARCHAR(10),
    dataFi VARCHAR(10) 
)


INSERT INTO Departamento
VALUES
(001,'Pesquisa'),
(002,'Desenvolvimento');

INSERT INTO Empregado
VALUES
(200,'Pedro', 3000.00, 45, 001),
(201,'Paula', 2200.00, 43, 001),
(202,'Maria', 3000.00, 38, 001),
(203,'Ana', 3000.00, 25, 002);

SELECT * FROM Empregado

INSERT INTO ProjetoEmprego
VALUES
('A',200, '01/01/2007', 'Atual'),
('A',201, '01/01/2007', 'Atual'),
('A',202, '01/02/2006', '18/02/2010'),
('B',203, '15/02/2006', '15/02/2010');

INSERT INTO Projeto
VALUES
('A','AATOM'),
('B','DW espaço-temporal');


SELECT * FROM Empregado


--C)
SELECT * FROM Empregado
WHERE Salario > 2000 and idade > 40

--D) 
SELECT * from Empregado Em
JOIN Departamento De on De.codDep = Em.CodDep
WHERE De.descricao = 'Pesquisa'

--E)
SELECT Em.Nome, Em.idade, De.descricao from Empregado Em
JOIN Departamento De on De.codDep = Em.CodDep
WHERE Em.idade < 40

--F)
SELECT Em.nome, De.descricao FROM Empregado Em
JOIN Departamento De on De.codDep = Em.CodDep
JOIN ProjetoEmprego Pe on Pe.codEmp = Em.codEmp
WHERE Pe.dataIn > '01/01/2007'

--G)
SELECT Em.nome FROM Empregado Em
JOIN ProjetoEmprego Pe on Pe.codEmp = Em.codEmp
JOIN Projeto Pj on Pj.codProj = Pe.codProj
WHERE Pj.Descricao = 'AATOM'


--H)
SELECT Em.nome, Em.salario, De.Descricao FROM Empregado Em
JOIN Departamento De on De.codDep = Em.CodDep
GROUP BY De.descricao, Em.nome, Em.Salario;


SELECT * FROM ProjetoEmprego
