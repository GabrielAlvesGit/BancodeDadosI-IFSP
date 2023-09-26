![image](https://github.com/GabrielAlvesGit/BancodeDadosI-IFSP/assets/102634725/0609e8d5-8ce5-492c-9077-f7b3733aaed0)
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




