CREATE DATABASE aula05set2023     
USE AULA22AGO23

CREATE TABLE EMPREGADO (
NOME VARCHAR(30) NOT NULL,
NSS INTEGER NOT NULL,
CPF NUMERIC(11) NOT NULL,
ENDERECO VARCHAR(50),
CARGO VARCHAR(20),
SALARIO DECIMAL(10,2),
COD_DEPTO INTEGER NOT NULL,
-- AS CHAVES PK E FK, PODEM SER DECLARADAS NO FINAL DO BLOCO
PRIMARY KEY (NSS),
FOREIGN KEY (COD_DEPTO) REFERENCES DEPARTAMENTO(CODIGO)
)

INSTITUTO FEDERAL DE
EDUCAÇÃO, CIÊNCIA E
TECNOLOGIA DE SÃO PAULO
CAMPUS
São Paulo
Banco de Dados Aula 20
Professor: Francisco Veríssimo Luciano
E-mail: fvluciano@hotmail.com
10 - Aula 10 - Modelo Físico de Banco de Dados - Parte III
10.1 – Criando mais algumas tabelas e relembrando alguns comandos
10.1.1 – Comando CREATE
Crie inicialmente um banco de dados com o nome de EMPRESA
-- CRIAÇÃO DE TABELAS
CREATE TABLE EMPREGADO (
NOME VARCHAR(30) NOT NULL,
NSS INTEGER NOT NULL,
CPF NUMERIC(11) NOT NULL,
ENDERECO VARCHAR(50),
CARGO VARCHAR(20),
SALARIO DECIMAL(10,2),
COD_DEPTO INTEGER NOT NULL,
-- AS CHAVES PK E FK, PODEM SER DECLARADAS NO FINAL DO BLOCO
PRIMARY KEY (NSS),

)


CREATE TABLE DEPARTAMENTO (
NOME VARCHAR(30) NOT NULL,
CODIGO INTEGER NOT NULL,
GNSS INTEGER,
GDATAINICIO DATE,
-- AS CHAVES PK E FK, PODEM SER DECLARADAS NO FINAL DO BLOCO
PRIMARY KEY (CODIGO),
FOREIGN KEY (GNSS) REFERENCES EMPREGADO(NSS)
)


--ALTER Tabela <ação>
--<ação>
--ADD novo_atrib tipo [<restrção de coluna>]
--ADD [CONS nome] <Restrição de tabela>
-- Drop atributo
-- Drop Contraint nome

ALTER TABLE EMPREGADO ADD CONSTRAINT FK_Gerente
FOREIGN KEY (COD_DEPTO) REFERENCES DEPARTAMENTO(CODIGO)

DROP TABLE DEPARTAMENTO