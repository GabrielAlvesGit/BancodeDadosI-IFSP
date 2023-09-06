# BancodeDadosI-IFSP
Conteudo das aulas ministrada de Banco de Dados, 


#### Na AULA29AGO2023, foi minitrada para

* Criar um Banco, 
* Criar uma Tabela, 
* Relacionar Primary Key, 
* Inserir dados e Projeção de dados
* Execicio 30AGO2023 url: file:///C:/Users/Girls/Downloads/exercicio%20BD%20entregar%20nas%20aulas%20de%2029ago2023.pdf
 ![image](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/c0a32224-13a6-4628-86dc-cca386a984be)


Criamos o modelo do Banco no BRModelo
![image](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/d3ab198a-bfc3-4d1f-a52f-218289b12716)


CREATE DATABASE AULA29AGO2023
USE AULA29AGO2023 --ATIVAÇÃO DO BANCO
-- CRIAÇÃO DAS TABELAS
CREATE TABLE FABRICANTE
(--INICIO DA TABELA
    IdFabricante    int             not null,
    Nome            varchar(100)    not null,
    Endereco        varchar(100)    null, --pode ser nulo
    Bairro          varchar(50), --pode ser nulo
    Cidade          varchar(50),
    Estado          char(2),
    primary key(IdFabricante) --não se usa virgula na última linha
)--FIM DA TABELA

CREATE TABLE PRODUTO
(
    IdProduto         int           not null,
    Nome              varchar(100)  not null,
    Unidade           varchar(20),
    Valor             decimal(10,2),  --numeric(10,2)
    IdFabricante      int,
    primary key(IdProduto),
    foreign key(IdFabricante) references FABRICANTE(IdFabricante)--não tem vírgula
)

--INSERIR DADOS
--INSERT INTO <<NOME DA TABELA>> (COLUNA1, COLUNA, COLUNA3,...,COLUNA_n)
--VALUES
--(VALOR1, VALOR2, VALOR3,..., VALOR_n)
--OBS: QUANDO FOR INSERIR DADOS EM TODAS AS COLUNAS, NÃO É NECESSÁRIO,
-- POR OS NOMES DELAS AO LADO DO NOPME DA TABELA

INSERT INTO FABRICANTE (IdFabricante,Nome,Endereco,Bairro,Cidade,Estado)
VALUES
(1,'Fabricante 1','Rua Pedro, 525','Santana','São Paulo','SP')
select * from FABRICANTE

INSERT INTO FABRICANTE
VALUES
(2,'Fabricante 2','Rua Vicente, 525','Santana','São Paulo','SP')

INSERT INTO FABRICANTE
VALUES
(3,'Fabricante 3','Rua Jose Junior, 530','Tucuruvi','São Paulo','SP'),
(4,'Fabricante 4','Rua Junior, 880','Jardim Tremembé','São Paulo','SP')

INSERT INTO PRODUTO
VALUES
(1,'Produto 1', 'Peça',123,1),
(2,'Produto 2','Kg',2.54,1),
(3,'Produto 3','Duzia', 45,3)

select * from PRODUTO  --seleção
select idProduto, Nome, Valor from PRODUTO --projeção
--retornar todos os dados da tabela Produto que sejam do fabricante 1
SELECT * FROM PRODUTO
WHERE --CLAUSULA DE CONDIÇÃO
IdFabricante = 1

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'PRODUTOXXXX' )
BEGIN
print('nao existe')
-- aqui entra o comando CREATE TABLE...
CREATE TABLE PRODUTOXXXX
(
    IdProduto         int           not null,
    Nome              varchar(100)  not null,
    Unidade           varchar(20),
    Valor             decimal(10,2),  --numeric(10,2)
    IdFabricante      int,
    primary key(IdProduto),
    foreign key(IdFabricante) references FABRICANTE(IdFabricante)--não tem vírgula
)
END
ELSE
BEGIN
print('A TABELA JA existe')
END

EXEC SP_HELPINDEX @objname = PRODUTO
CREATE INDEX idx_Nome ON Produto (Nome)

CREATE TABLE tb_teste (
pk_teste    int         PRIMARY KEY,
campoA      VARCHAR(50) NOT NULL,
campoB      int         UNIQUE
)

insert into tb_teste
VALUES
(1,'AA',11)

insert into tb_teste
VALUES
(2,'BB',22)

select * from tb_teste

drop table tb_teste --exclui a tabela

CREATE TABLE tb_teste (
pk_teste int PRIMARY KEY,
campoA VARCHAR(50) NOT NULL,
campoB int UNIQUE,
idade int,
CONSTRAINT chk_idade CHECK (idade>18 AND idade<60)
)

insert into tb_teste
VALUES
(1,'AA',11, 55) --idade é de 55 anos

insert into tb_teste
VALUES
(22,'BBBB',23, 70) --idade é de 70 anos

CREATE TABLE tb_teste1 (
pk_teste int IDENTITY(0,1) PRIMARY KEY, --autonumeração começa em 0(zero) e incremente em 1
campoA VARCHAR(50) NOT NULL,
campoB int UNIQUE,
idade int,
CONSTRAINT chk_idade1 CHECK (idade>18 AND idade<60)
)

insert into tb_teste1
VALUES
('Jose da Silva Junior',34, 44) --idade é de 55 anos

select * from tb_teste1

ALTER TABLE tb_teste ADD campoC VARCHAR(20)
--Verificar se o atributo foi criado:
exec sp_columns tb_teste

ALTER TABLE tb_teste DROP COLUMN campoC
--Visualizar se o atributo foi removido:
exec sp_columns tb_teste

ALTER TABLE tb_teste ALTER COLUMN campoC int

CREATE TABLE Cliente (
CodCliente int NOT NULL,
Nome varchar(50),
CPF varchar(11) NULL,
DataCadastro datetime NOT NULL DEFAULT (getdate()),
Cidade varchar(20) NULL,
UF char(2) NULL,
Pais varchar(20) DEFAULT ('Brasil')
)
CREATE TABLE Departamento (
CodDepartamento int,
Nome varchar(50),
CodDeptSuperior int Null
)
CREATE TABLE Funcionario (
CodFuncionario int,
Nome varchar(50),
CodDepartamento int,
Ramal int Null,
Salario money,
DataAdmissao datetime,
DataCadastro datetime NOT NULL DEFAULT (getdate()),
Sexo char(1)
)

-- não há necessidade de escrever as colunas, quando forem
--inseridos dados em todas elas
INSERT INTO Funcionario VALUES (1, 'Primeiro Funcionário', 2,
122, 234.23, '01/01/1998', '01/01/1998', 'M')
INSERT INTO Funcionario VALUES (2, 'Segundo Funcionário', 2,
322, 434.23, '02/02/1999', '02/02/1999', 'M')
INSERT INTO Funcionario VALUES (3, 'Terceiro Funcionário', 1,
444, 555.55, '03/03/1995', '03/03/1995', 'F')
-- quando forem inseridos dados em apenas algumas colunas, é
--obrigatório inserir seus nomes
insert into Funcionario (CodFuncionario, Nome,
CodDepartamento, Sexo, Salario, DataAdmissao)
values (4, 'Quarto Funcionário', 1, 'M', 1500.34,
'10/30/1996')
insert into Funcionario (CodFuncionario, Nome,
CodDepartamento, Sexo, Salario, DataAdmissao)
values (5, 'Quinto Funcionário', 3, 'M', 500.34,
'07/30/1997')

select * from funcionario
WHERE
CodDepartamento != 2 or salario < 1000

___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
#### Na  Aula05set2023 e Testeaula05set2023*  , foi minitrada para

* Criar um Banco, 
* Criar uma Tabela, 
* Relacionar Primary Key, 
* Inserir dados e Projeção de dados
* Inclui/remove definições de colunas e restrições(ALTER Tabela <ação>), 
* Drop tabela(Deletar),
* Projeção de coluna (select '*' Nome da tabela) vai consultar todas as colunas,
* Seleção vai consultar alguma coluna especifica :
* consultando todas as colunas da tabela
Select * from authors
 ```
 -- Consultando colunas específicas de uma Tabela
Select au_id, au_fname, au_lname
from authors
-- Consultando colunas com alias
Select au_id as Identif, au_fname as Nome, au_lname as Sobrenome
from authors
-- Consultando com Condições
Select au_fname, au_lname, city, state
from authors
where state='CA'
-- Manipulando expressões
select price Preço , (price * 1.1) "Preço com 10% de aumento", title
from titles

As funções SUM, AVG e COUNT(expr) permitem especificar também o operador DISTINCT, que
indica para considerar apenas os valores distintos. Por exemplo, a tabela 'funcionarios' do banco
de dados Exemplo contém informação sobre qual departamento este funcionário trabalha. Para
saber quais os departamentos que têm ao menos um funcionario, execute o seguinte comando:
```


* Execicio 30AGO2023 url: file:///C:/Users/Girls/Downloads/exercicio%20BD%20entregar%20nas%20aulas%20de%2029ago2023.pdf


___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
