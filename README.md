[AtividadeAvaliativa09262023.txt](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/files/12863099/AtividadeAvaliativa09262023.txt)![image](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/0609e8d5-8ce5-492c-9077-f7b3733aaed0)
![image](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/4d0b0105-4a8d-475f-af71-430c3ea29a19)
![image](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/ec13afd7-5605-4aba-a9f1-c5fbc5474061)
![image](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/60067ca4-c0ba-4782-8ffa-bdb6e7196e56)
![image](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/363dfb7f-8b96-46da-b195-4646a84ab4a9)
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
#### Na  Aula11set2023 e Testeaula05set2023*  ,
Consultas Avançadas
1. Verificar quais vendedores possuem vendas realizadas.
SELECT
nome
FROM
tb_vendedor
WHERE
EXISTS (
SELECT
fk_vendedor
FROM
tb_venda
WHERE
fk_vendedor = pk_vendedor
)

2. Verificar quais vendedores não possuem vendas realizadas
SELECT
nome
FROM
tb_vendedor
WHERE
NOT EXISTS (
SELECT
fk_vendedor
FROM
tb_venda
WHERE
fk_vendedor = pk_vendedor
)

3. Verificar quais vendedores realizaram vendas para a Loja de São Paulo
SELECT
nome
FROM
tb_vendedor
WHERE
pk_vendedor IN (
SELECT
fk_vendedor
FROM
tb_venda
WHERE
fk_loja IN (
SELECT
pk_loja
FROM
tb_loja
WHERE
nome = 'Loja Unidade São Paulo'
)
)
4. Verificar quais vendedores realizaram vendas mas não para a Loja de São Paulo
SELECT
nome
FROM
tb_vendedor
WHERE
pk_vendedor IN (
SELECT
fk_vendedor
FROM
tb_venda
WHERE
fk_loja NOT IN (
SELECT
pk_loja
FROM
tb_loja
WHERE
nome = 'Loja Unidade São Paulo'
)
)



![image](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/97795bab-a0eb-43cd-8e35-6329e4596d97)

___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

Exercicio 11set2023

-- a) consultando todas as colunas da tabela cliente
SELECT * FROM tb_cliente

--  b) Consultando colunas específicas da tabela cliente como pk_cliente e nome
SELECT pk_cliente, nome from tb_cliente

-- c) Consultando colunas com alias (apelido): pk_cliente como código do cliente e nome como nome completo
SELECT  pk_cliente AS "código do cliente",  nome AS "nome completo"
FROM tb_cliente;

--d) Consultando com Condições: retornar dados da tabela cliente, mas somente para os nomes que NÃO sejam
-- maiores que Maria Rocha
-- Manipulando expressões: um comando SELECT pode retornar nas colunas de resultado uma coluna da tabela,
-- ou um valor calculado. Por exemplo, a tabela tb_produto contem pk_produto, nome e quantidade. 
SELECT nome state
FROM tb_cliente
WHERE 'Maria Rocha' > nome;


--e) Retorne a quantidade_estoque com o alias Estoque, quantidade_estoque * 1.1 com o alias Estoque com 10%
-- de aumento, nome com o alias Nome do produto
SELECT quantidade_estoque AS "Estoque", quantidade_estoque * 1.1 AS "Estoque com 10% de aumento",
nome as "Nome do produto" FROM tb_produto

--f) Na tabela tb_venda, retorne o valor_total, arredonde valor_total com duas casas decimais e use o
-- alias Valor Total com 2 casas decimais , fk_verndedor com o alias Código do vendedor
SELECT ROUND(valor_total, 2) AS "Valor Total com 2 casas decimais", fk_vendedor AS "Código do vendedor"
FROM tb_venda;


--g) Na tabela tb_produto, retorne pk_produto com o alias Código e nome com o alias Nome do produto,
-- para quantidade_estoque igual ou superior a 10:
SELECT  pk_produto AS "Código", nome AS "Nome do produto" FROM tb_produto
WHERE quantidade_estoque >= '10'

--h) Na tabela tb_produto, retorne pk_produto com o alias Código e nome com o alias Nome do produto,
-- quantidade_estoque com o alias Estoque, para quantidade_estoque que NÃO esteja entre 5 e 10
SELECT pk_produto AS "Código",  nome AS "Nome do produto" , quantidade_estoque AS "Estoque" 
FROM tb_produto
WHERE quantidade_estoque < 5 OR quantidade_estoque > 10;

-- i) retornar os dados de tb_vendedor: pk_vendedor e nome, para pk_vendedor que esteja no conjunto de dados
--2,4,6,8, 10
SELECT pk_vendedor, nome FROM tb_vendedor
WHERE pk_vendedor IN (1,4,6,8,10)

--j) retornar todos os vendedores cujos nomes comecem com A
SELECT nome FROM tb_vendedor WHERE nome LIKE 'A%'

--k) retornar todos os vendedores cujos nomes NãO comecem com A
SELECT nome FROM tb_vendedor WHERE nome NOT LIKE 'A%'

--l) retornar todos os vendedores cujos nomes tenham a letra E em qualquer parte
SELECT nome FROM tb_vendedor WHERE nome LIKE '%E%'

 -- m) Juntando várias condições da tabela tb_produto: retornar pk_produto, nome, quantidade_estoque. Mas somente
-- para nome que comece com F ou pk_produto que seja igual a 2 e ainda para quantidade_estoque maior que 50
SELECT pk_produto, nome, quantidade_estoque FROM tb_produto
WHERE nome LIKE 'F%' OR pk_produto = 2 AND quantidade_estoque > 50

--n) retorne o total de clientes cadastrados
SELECT COUNT(*) AS "Total de Clientes"
FROM tb_cliente;

--o) usando a cláusula distinct - exibir a quantidade de lojas que emitiram nota fiscal
SELECT COUNT(DISTINCT fk_loja) AS "Quantidade de Lojas que Emitiram Nota Fiscal"
FROM tb_NotaFiscal;

--p) a partir de tb_notafiscal, exiba a quantidade de notas fiscais com o alias Quantidade de NF e exiba também
-- a coluna fk_loja. Agrupe os dados pela fk_loja
SELECT fk_loja,  COUNT(*) AS "Quantidade de NF"
FROM tb_notafiscal
GROUP BY fk_loja;

--q) Listar nome e quantidade de vendas por cliente, agrupando pelo nome do cliente e ordenar a lista pelo nome do
-- cliente em ordem decrescente
SELECT c.nome AS "Nome do Cliente", COUNT(v.pk_venda) AS "Quantidade de Vendas"
FROM tb_cliente c
LEFT JOIN tb_venda v ON c.pk_cliente = v.fk_cliente
GROUP BY c.nome
ORDER BY
    "Nome do Cliente" DESC;

    ___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
####  Exercício 26set2023*
1 – Recupere todos os clientes que foram atendidos nas vendas por vendedores da Loja Unidade Minas Gerais. 

2 – Para cada produto existente diga quais vendas foram realizadas e quantos itens foram pedidos.

3 – Para cada produto mostre as notas fiscais de venda para os itens que corresponderem aos seus produtos.

4 – Agrupe todos os vendedores e suas vendas

5 – Para cada vendedor mostre quantas vendas foram realizadas.

6 – Com base nas tabelas abaixo, execute o que se pede em seguida:

6.1 - Desenvolva um Banco de Dados, insira as duas tabelas e os registros 
acima;

6.2 - Crie uma consulta, usando inner join, que retorne todos os nomes cargos ocupados, os nomes dos funcionários, bem como todos os 
salários de funcionários que desempenham algum cargo;

6.3 - Crie uma nova consulta, usando where, que retorne todos os nomes cargos ocupados, os nomes dos funcionários, bem como todos os salários de funcionários que desempenham algum cargo; 

6.4 - Faça uma consulta, usando left join, que retorne todos os nomes cargos ocupados, todos os dados dos funcionários, bem como todos os salários de funcionários que desempenham algum cargo;

6.6 - Mostre os cargos que não possuem funcionários cadastrados; 

6.7 - Faça uma atualização, usando update e inner join e retorne todos os dados de funcionário, acrescentando uma coluna reajuste e salário reajustado, concedendo um reajuste de 5% somente para aqueles com salários menores que R$ 4.000,00
Obs: Essa última não conseguir fazer pois estava dando erro, 

___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

Exercicio 10-10-2023- Gabriel Josue

A)
CREATE TABLE Departamento(
	codDep int PRIMARY KEY,
  	descricao varchar(50)
) 

CREATE TABLE Empregado (
	codEmp int PRIMARY KEY,
  	nome varchar(50),
  	salario float,
  	idade int,
  	codDep int,
  	FOREIGN key(codDep) REFERENCES Departamento(codDep)
)

CREATE TABLE Projeto(
	codProj char PRIMARY KEY,
  	descricao varchar(50)
)

CREATE TABLE ProjetoEmpregado(
	codProj char,
  	codEmp int,
  	dataIn varchar(10),
  	dataFi varchar(10)
  	FOREIGN KEY(codEmp) REFERENCES Empregado(codEmp),
	FOREIGN KEY(codProj) REFERENCES Projeto(codProj),
)

B)
INSERT INTO Departamento
VALUES(001, 'Pesquisa');
INSERT INTO Departamento
VALUES(002, 'Desenvolvimento');

INSERT into Empregado
VALUES (200, 'Pedro', 3000.00, 45, 001);
INSERT into Empregado
VALUES (201, 'Paulo', 2200.00, 43, 001);
INSERT into Empregado
VALUES (202, 'Maria', 2500.00, 38, 001);
INSERT into Empregado
VALUES (203, 'Ana', 1800.00, 25, 002);

INSERT INTO Projeto
VALUES ('A','AATOM')
INSERT INTO Projeto
VALUES ('B','DW espaço-temporal')

INSERT into ProjetoEmpregado
VALUES ('A', 200, '01/01/2007', 'atual');
INSERT into ProjetoEmpregado
VALUES ('A', 201, '01/01/2007', 'atual');
INSERT into ProjetoEmpregado
VALUES ('A', 202, '01/02/2006', '18/02/2010');
INSERT into ProjetoEmpregado
VALUES ('B', 203, '15/02/2008', '15/02/2010');

C)
SELECT * from Empregado
WHERE salario > 2000.00 
and idade > 40;

D)
SELECT EM.* from Empregado EM
JOIN Departamento DP on EM.codDep = DP.codDep
WHERE DP.descricao Like 'Pesquisa';

E)
SELECT EM.nome, EM.idade, DP.descricao from Empregado EM
JOIN Departamento DP on EM.codDep = DP.codDep
WHERE EM.idade < 40;

F)
SELECT EM.nome, DP.descricao from Empregado EM
JOIN Departamento DP on EM.codDep = DP.codDep
JOIN ProjetoEmpregado PJE on EM.codEmp = PJE.codEmp
WHERE PJE.datain > '01/01/2007'

G)
SELECT EM.nome from Empregado EM
JOIN ProjetoEmpregado PJE on EM.codEmp = PJE.codEmp
JOIN Projeto PJ ON PJ.codProj = PJE.codProj
WHERE PJ.descricao LIKE 'AATOM';

H)
SELECT DP.descricao, EM.nome, EM.salario from Empregado EM
JOIN Departamento DP on EM.codDep = DP.codDep
GROUP BY DP.descricao, EM.nome, EM.salario;t…]()
![Snapshot_2023-10-10_21-33-32](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/57d46c5c-16ba-4725-bf88-7b1de5282f40)


___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
CREATE DATABASE bd_vendas;
USE bd_vendas;
CREATE TABLE tb_cliente (
pk_cliente int PRIMARY KEY IDENTITY(0,1),
nome varchar(255) NOT NULL,
cpf varchar(11) NOT NULL
)
;
CREATE TABLE tb_vendedor (
pk_vendedor int PRIMARY KEY IDENTITY(0,1),
nome varchar(255) NOT NULL
)
;
CREATE TABLE tb_produto (
pk_produto int PRIMARY KEY IDENTITY(0,1),
nome varchar(255) NOT NULL,
quantidade_estoque int NOT NULL
)
;
CREATE TABLE tb_loja (
pk_loja int PRIMARY KEY IDENTITY(0,1),
nome varchar(255) NOT NULL,
cnpj varchar(14) NOT NULL
)
;
CREATE TABLE tb_venda (
pk_venda int PRIMARY KEY IDENTITY(0,1),
percentual_desconto float,
data_venda datetime NOT NULL,
fk_loja int REFERENCES tb_loja(pk_loja),
fk_vendedor int REFERENCES tb_vendedor(pk_vendedor),
fk_cliente int REFERENCES tb_cliente(pk_cliente),
valor_total float,
)
;
CREATE TABLE tb_NotaFiscal (
pk_notafiscal int PRIMARY KEY IDENTITY(0,1),
fk_loja int NOT NULL,
fk_venda int
)
;
CREATE TABLE tb_itens (
pk_item int PRIMARY KEY IDENTITY(0,1),
fk_venda int,
fk_produto int
)
;
INSERT INTO tb_produto VALUES ('keyboard',20);
INSERT INTO tb_produto VALUES ('monitor',50);
INSERT INTO tb_produto VALUES ('mouse',100);
INSERT INTO tb_produto VALUES ('mouse pad',200);
INSERT INTO tb_produto VALUES ('mouse wireless',50);
INSERT INTO tb_produto VALUES ('pen drive 2GB',200);
INSERT INTO tb_produto VALUES ('pen drive 8GB',200);
INSERT INTO tb_produto VALUES ('pen drive 16GB',200);
INSERT INTO tb_cliente VALUES ('Joao Pedro Neves','11122233300');
INSERT INTO tb_cliente VALUES ('Joao Botelho Alves','11122233301');
INSERT INTO tb_cliente VALUES ('Maria da Silva Soares','11122233302');
INSERT INTO tb_cliente VALUES ('Ana Maria Rocha','11122233303');
INSERT INTO tb_cliente VALUES ('Cristina Maria Ana Silva','11122233304');
INSERT INTO tb_cliente VALUES ('Carlos Augusto Vieira','11122233305');
INSERT INTO tb_cliente VALUES ('Marcelo Lopes Vieira','11122233306');
INSERT INTO tb_cliente VALUES ('Joao Jose da Silva','11122233307');
INSERT INTO tb_cliente VALUES ('Carlos Magno Monteiro','11122233308');
INSERT INTO tb_cliente VALUES ('Jose Maria da Silva','11122233309');
INSERT INTO tb_cliente VALUES ('Marta Vieira Nunes','11122233310');
INSERT INTO tb_cliente VALUES ('Carla Carolina Mendes','11122233311');
INSERT INTO tb_cliente VALUES ('Daiana Moreira Silva','11122233312');
INSERT INTO tb_vendedor VALUES ('Daniel Andres Oliveira');
INSERT INTO tb_vendedor VALUES ('Marcos Cunha');
INSERT INTO tb_vendedor VALUES ('Andreia Olivia Marta');
INSERT INTO tb_vendedor VALUES ('Carlos Dias');
INSERT INTO tb_vendedor VALUES ('Pedro Pedreira');
INSERT INTO tb_vendedor VALUES ('GUSTAVO MOTTA');
INSERT INTO tb_vendedor VALUES ('ADILSON EVANDRO');
INSERT INTO tb_loja VALUES ('Loja Unidade Minas Gerais','11111111110');
INSERT INTO tb_loja VALUES ('Loja Unidade Sгo Paulo','11111111111');
INSERT INTO tb_loja VALUES ('Loja Unidade Rio de Janeiro','11111111112');
INSERT INTO tb_loja VALUES ('Loja Unidade Epнrito Santo','11111111113');
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'18-06-12 10:34:09 PM',5),1,1,0,10)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'15-06-12 10:34:09 PM',5),2,2,1,20)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'13-06-12 10:34:09 PM',5),0,3,2,30)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'12-06-12 10:34:09 PM',5),1,4,3,40)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'15-06-12 10:34:09 PM',5),1,0,4,50)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'19-06-12 10:34:09 PM',5),1,1,5,60)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'20-06-12 10:34:09 PM',5),2,2,6,70)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'18-07-12 10:34:09 PM',5),2,3,7,80)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'11-07-12 10:34:09 PM',5),2,4,8,90)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'10-07-12 10:34:09 PM',5),0,0,9,10)
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'28-07-12 10:34:09 PM',5),0,1,1,20)
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'1-05-13 10:34:09 PM',5),0,1,2,30)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'8-05-13 10:34:09 PM',5),1,1,2,40)
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'12-05-13 10:34:09 PM',5),2,2,3,50)
INSERT INTO tb_venda VALUES (13.5,convert(datetime,'18-05-13 10:34:09 PM',5),0,2,3,60)
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'28-05-13 10:34:09 PM',5),1,2,5,70)
INSERT INTO tb_venda VALUES (23.5,convert(datetime,'19-08-13 10:34:09 PM',5),2,3,5,80)
INSERT INTO tb_venda VALUES (33.5,convert(datetime,'20-08-13 10:34:09 PM',5),0,3,5,90)
INSERT INTO tb_venda VALUES (43.5,convert(datetime,'21-09-13 10:34:09 PM',5),1,4,7,10)
INSERT INTO tb_venda VALUES (53.5,convert(datetime,'18-10-13 10:34:09 PM',5),2,4,7,20)
INSERT INTO tb_venda VALUES (63.5,convert(datetime,'11-11-13 10:34:09 PM',5),0,4,7,30)
INSERT INTO tb_itens VALUES (0,1)
INSERT INTO tb_itens VALUES (1,1)
INSERT INTO tb_itens VALUES (2,1)
INSERT INTO tb_itens VALUES (3,1)
INSERT INTO tb_itens VALUES (4,1)
INSERT INTO tb_itens VALUES (5,1)
INSERT INTO tb_itens VALUES (6,1)
INSERT INTO tb_itens VALUES (7,1)
INSERT INTO tb_itens VALUES (8,1)
INSERT INTO tb_itens VALUES (9,1)
INSERT INTO tb_itens VALUES (10,1)
INSERT INTO tb_itens VALUES (11,1)
INSERT INTO tb_itens VALUES (12,1)
INSERT INTO tb_itens VALUES (13,1)
INSERT INTO tb_itens VALUES (14,1)
INSERT INTO tb_itens VALUES (15,1)
INSERT INTO tb_itens VALUES (16,1)
INSERT INTO tb_itens VALUES (17,1)
INSERT INTO tb_itens VALUES (18,1)
INSERT INTO tb_itens VALUES (19,1)
INSERT INTO tb_itens VALUES (20,1)
INSERT INTO tb_itens VALUES (21,1)
INSERT INTO tb_itens VALUES (0,2)
INSERT INTO tb_itens VALUES (1,2)
INSERT INTO tb_itens VALUES (2,2)
INSERT INTO tb_itens VALUES (3,2)
INSERT INTO tb_itens VALUES (4,2)
INSERT INTO tb_itens VALUES (5,2)
INSERT INTO tb_itens VALUES (6,2)
INSERT INTO tb_itens VALUES (7,2)
INSERT INTO tb_itens VALUES (8,2)
INSERT INTO tb_itens VALUES (9,2)
INSERT INTO tb_itens VALUES (10,2)
INSERT INTO tb_itens VALUES (11,2)
INSERT INTO tb_itens VALUES (12,2)
INSERT INTO tb_itens VALUES (13,2)
INSERT INTO tb_itens VALUES (14,2)
INSERT INTO tb_itens VALUES (15,2)
INSERT INTO tb_itens VALUES (16,2)
INSERT INTO tb_itens VALUES (17,2)
INSERT INTO tb_itens VALUES (18,2)
INSERT INTO tb_itens VALUES (19,2)
INSERT INTO tb_itens VALUES (20,2)
INSERT INTO tb_itens VALUES (21,2)
INSERT INTO tb_itens VALUES (0,3)
INSERT INTO tb_itens VALUES (1,4)
INSERT INTO tb_itens VALUES (2,5)
INSERT INTO tb_itens VALUES (3,6)
INSERT INTO tb_itens VALUES (4,7)
INSERT INTO tb_itens VALUES (5,0)
INSERT INTO tb_itens VALUES (6,1)
INSERT INTO tb_itens VALUES (7,2)
INSERT INTO tb_itens VALUES (8,3)
INSERT INTO tb_itens VALUES (9,4)
INSERT INTO tb_itens VALUES (10,5)
INSERT INTO tb_itens VALUES (11,6)
INSERT INTO tb_itens VALUES (12,7)
INSERT INTO tb_itens VALUES (13,0)
INSERT INTO tb_itens VALUES (14,1)
INSERT INTO tb_itens VALUES (15,2)
INSERT INTO tb_itens VALUES (16,3)
INSERT INTO tb_itens VALUES (17,4)
INSERT INTO tb_itens VALUES (18,5)
INSERT INTO tb_itens VALUES (19,6)
INSERT INTO tb_itens VALUES (20,7)
INSERT INTO tb_itens VALUES (21,0)
INSERT INTO tb_itens VALUES (0,1)
INSERT INTO tb_itens VALUES (1,2)
INSERT INTO tb_itens VALUES (2,3)
INSERT INTO tb_itens VALUES (3,4)
INSERT INTO tb_itens VALUES (4,5)
INSERT INTO tb_itens VALUES (5,6)
INSERT INTO tb_itens VALUES (6,7)
INSERT INTO tb_itens VALUES (7,0)
INSERT INTO tb_itens VALUES (8,1)
INSERT INTO tb_itens VALUES (9,2)
INSERT INTO tb_itens VALUES (10,3)
INSERT INTO tb_itens VALUES (11,4)
INSERT INTO tb_itens VALUES (12,5)
INSERT INTO tb_itens VALUES (13,6)
INSERT INTO tb_itens VALUES (14,7)
INSERT INTO tb_itens VALUES (15,0)
INSERT INTO tb_itens VALUES (16,1)
INSERT INTO tb_itens VALUES (17,2)
INSERT INTO tb_itens VALUES (18,3)
INSERT INTO tb_itens VALUES (19,4)
INSERT INTO tb_itens VALUES (20,5)
INSERT INTO tb_itens VALUES (21,6)
INSERT INTO tb_itens VALUES (0,7)
INSERT INTO tb_itens VALUES (1,0)
INSERT INTO tb_itens VALUES (2,1)
INSERT INTO tb_itens VALUES (3,2)
INSERT INTO tb_itens VALUES (4,3)
INSERT INTO tb_itens VALUES (5,4)
INSERT INTO tb_itens VALUES (6,5)
INSERT INTO tb_itens VALUES (7,6)
INSERT INTO tb_itens VALUES (8,7)
INSERT INTO tb_itens VALUES (9,0)
INSERT INTO tb_itens VALUES (10,1)
INSERT INTO tb_itens VALUES (11,2)
INSERT INTO tb_itens VALUES (12,3)
INSERT INTO tb_itens VALUES (13,4)
INSERT INTO tb_itens VALUES (14,5)
INSERT INTO tb_itens VALUES (15,3)
INSERT INTO tb_itens VALUES (16,6)
INSERT INTO tb_itens VALUES (17,7)
INSERT INTO tb_itens VALUES (18,0)
INSERT INTO tb_itens VALUES (19,1)
INSERT INTO tb_itens VALUES (20,4)
INSERT INTO tb_itens VALUES (21,5)
INSERT INTO tb_notafiscal VALUES (0,0)
INSERT INTO tb_notafiscal VALUES (0,1)
INSERT INTO tb_notafiscal VALUES (2,2)
INSERT INTO tb_notafiscal VALUES (2,3)
INSERT INTO tb_notafiscal VALUES (0,4)
INSERT INTO tb_notafiscal VALUES (2,5)
INSERT INTO tb_notafiscal VALUES (0,6)
INSERT INTO tb_notafiscal VALUES (1,7)
INSERT INTO tb_notafiscal VALUES (2,8)
INSERT INTO tb_notafiscal VALUES (0,9)
INSERT INTO tb_notafiscal VALUES (2,10)
INSERT INTO tb_notafiscal VALUES (2,11)
INSERT INTO tb_notafiscal VALUES (0,12)
INSERT INTO tb_notafiscal VALUES (2,13)
INSERT INTO tb_notafiscal VALUES (2,14)
INSERT INTO tb_notafiscal VALUES (0,15)
INSERT INTO tb_notafiscal VALUES (1,16)
INSERT INTO tb_notafiscal VALUES (2,17)
INSERT INTO tb_notafiscal VALUES (0,18)
INSERT INTO tb_notafiscal VALUES (1,19)
INSERT INTO tb_notafiscal VALUES (2,20)
INSERT INTO tb_notafiscal VALUES (0,21)
INSERT INTO tb_notafiscal VALUES (1,22)
INSERT INTO tb_notafiscal VALUES (1,23)
INSERT INTO tb_notafiscal VALUES (0,24)
INSERT INTO tb_notafiscal VALUES (1,25)
INSERT INTO tb_notafiscal VALUES (2,26)
INSERT INTO tb_notafiscal VALUES (1,27)
INSERT INTO tb_notafiscal VALUES (1,28)
INSERT INTO tb_notafiscal VALUES (2,29)
INSERT INTO tb_notafiscal VALUES (1,30)
INSERT INTO tb_notafiscal VALUES (1,31)
INSERT INTO tb_notafiscal VALUES (1,32)
INSERT INTO tb_notafiscal VALUES (0,33)
INSERT INTO tb_notafiscal VALUES (1,34)
INSERT INTO tb_notafiscal VALUES (1,35)
INSERT INTO tb_notafiscal VALUES (0,36)

SELECT * from tb_cliente

-- Construa a seguinte SP
CREATE PROCEDURE sp_procedure_variavel_coluna AS
DECLARE @cpf varchar(11)
BEGIN
SELECT @cpf = cpf FROM tb_cliente WHERE pk_cliente = 1
print @cpf
END

-- Executar 
EXEC  sp_procedure_variavel_coluna

-- Construa a seguinte SP criando com um mesmo nome, mas com 1 
CREATE PROCEDURE sp_procedure_variavel_coluna1 AS
DECLARE @cpf varchar(11)
BEGIN
SELECT @cpf = cpf FROM tb_cliente WHERE pk_cliente != 1
print @cpf
END

-- Executar 
EXEC  sp_procedure_variavel_coluna1



--  Stored Procedures 
CREATE PROCEDURE sp_minha_procedure AS
BEGIN
SELECT 'HELLO WORLD!'
END

-- parвmetros ( São o nomes do cabeçalhos)
CREATE PROCEDURE sp_minha_procedure@pk_cliente int) AS
BEGIN
SELECT * FROM tb_cliente WHERE pk_cliente = @pk_cliente
END
Para executar, faзa:
EXEC sp_minha_procedure 1
SP com vбrios parвmetros:
CREATE PROCEDURE sp_minha_procedure(@pk_cliente int, @nome
varchar(255)) AS
BEGIN
UPDATE tb_cliente SET nome = @nome WHERE pk_cliente = @pk_cliente
END
-- Para executar, faça:
EXEC sp_minha_procedure 1

-- Crindo  Procedure com IF
CREATE PROCEDURE sp_procedure_if_UM(@pk_cliente int) AS
BEGIN
IF(@pk_cliente>10)
BEGIN
SELECT * FROM tb_cliente WHERE pk_cliente > 10
END
ELSE
BEGIN
SELECT * FROM tb_cliente WHERE pk_cliente < 10
END
END

EXEC  sp_procedure_if_UM 6

--  Stored Procedures 
CREATE PROCEDURE sp_minha_procedure AS
BEGIN
SELECT 'HELLO WORLD!'
END

-- vai mostra o Hello Word
EXEC sp_minha_procedure

-- Deletar o Banco
DROP PROCEDURE sp_minha_procedure

CREATE PROCEDURE sp_procedure_com_variavel AS
DECLARE @idade int,
@nome varchar(4)
BEGIN
set @idade = 15
set @nome = 'IFSP'
print @idade
print @nome
END

-- vai mostra o Hello Word
EXEC sp_procedure_com_variavel
-- exercicio: Faça uma SP que retorne a mйdia da quantidade em estoque de todos os produtos
CREATE PROCEDURE sp_media_quantidade_produto_2 AS
BEGIN
SELECT AVG(quantidadeProduto) AS 'MEDIA' from produto 
END


EXEC sp_media_quantidade_produto_2

------------------------------------------------------------------------------ FUNÇÃO -----------------------------------------------
-- Exemplo de função escalar
Create FUNCTION F_AreaTriangulo (@base smallint, @altura smallint)
RETURNS int -- tipo de retorno
AS
BEGIN
RETURN ((@base * @altura)/2) -- CALCULANDO A AREA DO TRIANGULO
END

-- Para executar a função
SELECT dbo.F_AreaTriangulo(5,30) -- data bse owner
SELECT dbo.F_AreaTriangulo(3,17)

-- função escalar
Create FUNCTION F_AreaCirculo (@raio int)
RETURNS Bigint
AS
BEGIN
DECLARE @area Bigint
SET @area = PI() * POWER(@raio,2)
RETURN @area
END

-- executar a função
SELECT dbo. F_AreaCirculo (10)

-- Comandos para criação das tabelas Funcionario e Regiao
CREATE TABLE [Funcionario](
[Cod_Func] [int] NOT NULL,
[Nome_Func] [varchar](100) NULL,
[Sexo_Func] [char](1) NULL,
[Sal_Func] [float] NULL,
[Data_Func] [datetime] NULL,
[Num_Regiao] [int] NULL
)
CREATE TABLE [Regiao](
[Num_Regiao] [int] NOT NULL,
[Regiao] [varchar](50) NULL
)

-- Comandos para popular as duas tabelas
insert into funcionario values(1,'Manda Chuva','M',5000,
'1998-01-01 00:00:00.000',1)
insert into funcionario values(2,'Chuchu','M',3000,
'1999-01-01 00:00:00.000',1)
insert into funcionario values(3,'Bacana','M',2000,
'2000-01-01 00:00:00.000',2)
insert into funcionario values(4,'Espeto','M',2500,
'2001-01-01 00:00:00.000',2)
insert into funcionario values(5,'Batatinha','F',4000,
'2002-01-01 00:00:00.000',3)

insert into Regiao values (1,'Norte')
insert into Regiao values (2,'Sul')
insert into Regiao values (3,'Leste')
insert into Regiao values (4,'Oeste')

-- Selecionar  tabela
SELECT * FROM Funcionario

-- Comandos para criação das tabelas Funcionario e Regiao

Create FUNCTION F_DataCadastro (@data smallDatetime)
RETURNS TABLE
AS
RETURN (SELECT * FROM dbo.Funcionario
WHERE Data_Func = @data)

-- executar a função
SELECT * FROM F_DataCadastro('01/01/98')

--Fazendo JOIN com o resultado da função F_DataCadastro
Select F.*, Regiao.Regiao
from F_DataCadastro('01/01/98') as F, Regiao
where F.Num_Regiao = Regiao.Num_Regiao

-- Comandos para criação das tabelas USuarios
CREATE TABLE [dbo].[Usuario](
[User_Name] [varchar](50) NULL,
[Num_Regiao] [int] NULL
)

-- Comandos para popular as duas tabelas
insert into usuario values ('george',1)
insert into usuario values ('dbo',10)
insert into usuario values ('ana',2)

--  Comandos para criação das tabelas Funcionario e
Create FUNCTION F_Func2 ( )
RETURNS @Func Table ( Nome_Func varchar(100) not null,
Sal_Func decimal(10,2) not null )
AS
BEGIN
DECLARE @numreg tinyint
SELECT @numreg = Num_Regiao FROM Usuario WHERE User_name = User
IF @numreg IS NOT NULL AND @numreg <> 10
INSERT @Func
SELECT Nome_Func, Sal_Func FROM Funcionario WHERE
Num_regiao = @numreg
ELSE IF @numreg = 10
INSERT @Func
SELECT Nome_Func, Sal_Func FROM Funcionario
RETURN
END
--Código que executa a função ***
SELECT * FROM dbo.F_Func2( )

-- Crie uma função que calcule o valor do delta
-- de uma função do segundo grau
CREATE FUNCTION f_delta ()


___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
Aula 24/10

```
CREATE DATABASE bd_trigger
use bd_trigger

CREATE TABLE tb_produto(
    pro_cod int PRIMARY KEY IDENTITY(0,1),
    pro_nome VARCHAR (50) not null,
    pro_descricao VARCHAR (50) not null,
    pro_valorpago float,
    pro_valorvenda float,
    pro_qtde int
)

CREATE TABLE tb_venda(
    ven_cod int PRIMARY KEY IDENTITY,
    ven_data DATE NOt NULL,
    ven_nfiscal INT,
    ven_total FLOAT,
    ven_nparcelas INT,
    ven_status VARCHAR (50) NOT NULL
)

CREATE TABLE tb_itensvenda(
    itv_cod INT PRIMARY KEY IDENTITY (0,1),
    itv_qtde INT,
    itv_valor FLOAT,
    fk_ven_cod INT REFERENCES tb_venda (ven_cod),
    fk_pro_cod INT REFERENCES tb_produto(pro_cod)  
)


INSERT INTO tb_produto VALUES 
(1,'Carrinho', 'Carrinho de controle remoto', 10.00, 10.00, 1)

select * from tb_produto

INSERT INTO tb_produto
VALUES (1 ,'Carrinho de controle remoto', 'A fun remote control car', 10.00, 10.00, 1)

DROP TABLE tb_produto
-- The above line inserts a single row of data into the tb_produto table.

SELECT * FROM tb_produto


-- The above line inserts a single row of data into the tb_produto table.

SELECT * FROM tb_produto


------------- Continuidade da aula 

create database bd_UF;
use bd_UF;
create table estado (id integer, nome varchar(20), sigla char(2));
insert into estado (id, nome, sigla) values(1, 'Amazonas','AM');
insert into estado (id, nome, sigla) values(2, 'Acre','AC');
insert into estado (id, nome, sigla) values(3, 'Bahia','BA');
insert into estado (id, nome, sigla) values(4, 'Paraná','PR');
insert into estado (id, nome, sigla) values(5, 'Rio Grande do Sul','RS');
insert into estado (id, nome, sigla) values(6, 'Santa Catarina','SC');
insert into estado (id, nome, sigla) values(7, 'São Paulo','SP');
insert into estado (id, nome, sigla) values(8, 'Rio de Janeiro','RJ');
insert into estado (id, nome, sigla) values(9, 'Minas Gerais','MG');

SELECT sigla,
CASE 
  WHEN sigla IN ('PR', 'RS', 'SC') THEN 'Sul'
  WHEN sigla IN ('SP', 'RJ', 'ES', 'MG') THEN 'Sudeste'
  WHEN sigla IN ('MT', 'MS', 'GO') THEN 'Centro-Oeste'
  WHEN sigla IN ('BA','AL','SE','PB','PE','RN','CE','PI','MA') THEN 'Nordeste'
  WHEN sigla IN ('AM', 'RR', 'AP', 'PA', 'TO', 'RO', 'AC') THEN 'Norte'
ELSE ''
END AS regiao
FROM estado
ORDER BY sigla;

create table produto (
idProduto int,
nomeProduto varchar(50),
precoProduto decimal(10,2),
quantidadeProduto int);

INSERT INTO produto (idProduto, nomeProduto, precoProduto, quantidadeProduto)
VALUES (1, 'água mineral', 4.98, 120), (2, 'margarina', 5.98, 100),
(3, 'pão de forma', 5.98, 50), (4, 'vinagre', 7.99, 75),
(5, 'sabão em pó', 7.50, 108), (6, 'detergente', 3.98, 90),
(7, 'vinho tinto', 189.90, 30), (8, 'macarrão espaguete', 7.90, 145),
(9, 'molho de tomate', 2.99, 130), (10, 'arroz integral', 7.48, 45),
(11, 'arroz branco', 23.90, 170);

select * from produto

exercicio: Faça uma SP que retorne a mйdia da quantidade em estoque de todos os produtos



------ Continuidade da aula

CREATE DATABASE bd_teste

use bd_teste

CREATE TABLE CAIXA (
DATA DATETIME,
SALDO_INICIAL DECIMAL(10,2),
SALDO_FINAL DECIMAL(10,2) )
INSERT INTO CAIXA
VALUES (CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 100)), 100, 100)


CREATE TABLE VENDAS (
DATA DATETIME,
CODIGO INT,
VALOR DECIMAL(10,2) )

go

-- for - quando houver um insert ele vai disparar  geralemnte e data e hora
CREATE TRIGGER TGR_VENDAS_AI
ON VENDAS
FOR INSERT
AS
BEGIN
    DECLARE
    @VALOR DECIMAL(10,2),
    @DATA DATETIME
    SELECT @DATA = DATA, @VALOR = VALOR FROM INSERTED
    
    UPDATE CAIXA SET SALDO_FINAL = SALDO_FINAL + @VALOR
    WHERE DATA = @DATA
END


INSERT INTO VENDAS
VALUES (CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 100)), 1, 10)

SELECT * FROM VENDAS

select * from CAIXA -– verificando o conteúdo da tabela CAIXA


-- Trigger no delete na tabela vendas
CREATE TRIGGER TGR_VENDAS_AD
ON VENDAS
FOR DELETE
AS
BEGIN
    DECLARE
    @VALOR DECIMAL(10,2),
    @DATA DATETIME
    SELECT @DATA = DATA, @VALOR = VALOR FROM DELETED
    UPDATE CAIXA SET SALDO_FINAL = SALDO_FINAL - @VALOR
    WHERE DATA = @DATA
END




CREATE TABLE CARGO
(
CARGOID INT IDENTITY(1,1),
NOME VARCHAR(50),
ATIVIDADES VARCHAR(100),
DEPARTID INT
)

CREATE TRIGGER TR_INSERT_CARGO
ON CARGO
FOR INSERT
AS
BEGIN
SELECT I.* FROM INSERTED I
INNER JOIN CARGO C
ON (I.CARGOID = C.CARGOID)
END


INSERT INTO CARGO (NOME, ATIVIDADES,DEPARTID)
VALUES ('ESTAGIÁRIO DE TI', '', NULL);

INSERT INTO CARGO (NOME, ATIVIDADES,DEPARTID)
VALUES ('pROGRAMADOR jUNIOR', 'DESENVOLVER FRONT END', 12);

SELECT * FROM CARGO


GO
-- CASO DE UPDATE 
CREATE TRIGGER TR_UPDATE_CARGO
ON CARGO
FOR UPDATE
AS
BEGIN
--ANTES DA ATUALIZAÇÃO
SELECT D.* FROM DELETED D
INNER JOIN CARGO C
ON (D.CARGOID = C.CARGOID)
--DEPOIS DA ATUALIZAÇÃO
SELECT I.* FROM INSERTED I
INNER JOIN CARGO C
ON (I.CARGOID = C.CARGOID)
END

 SELECT * from cargo

UPDATE CARGO
SET ATIVIDADES = 'AUXILIAR OS PROCESSOS DOS ANALISTAS DE TI E ADQUIRIR EXPERIENCIA
PROFISSIONAL', DEPARTID = 10
WHERE CARGOID = 1

GO


CREATE TRIGGER TR_DELETE_CARGO
ON CARGO
FOR DELETE
AS
BEGIN
--REGISTRO DELETADO
PRINT 'REGISTRO EXCLUÍDO COM SUCESSO!!!'
END

DELETE FROM CARGO
WHERE CARGOID = 2

-- Verifique a tabela Cargo agora:
select * from cargo







```
___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________






