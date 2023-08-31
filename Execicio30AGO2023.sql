CREATE DATABASE BD23AGO2023;

USE BD23AGO2023;
CREATE TABLE Fornecedor
(
    Cod_Fornecedor   int            not null,
    Desc_Fornecedor  CHAR(60)          not null,
    Rua_Forn         CHAR(60)          not null, 
    Numero_Forn      char(4)          not null,
    Bairro_Forn      char(60)          not null,     
    CEP_Forn         char(9)          not null,  
    Cidade_Forn      char(60)          not null,  
    UF_Forn          char(2)          not null, 
    primary key(Cod_Fornecedor)     
);

CREATE TABLE Telefone
(
    Cod_Telefone    int            not null,
    Telefone       CHAR(60)        not null,
    Cod_Fornecedor INT,
    primary key(Cod_Telefone),
    foreign key(Cod_Fornecedor) references Fornecedor(Cod_Fornecedor)
);

select * from Telefone;

CREATE TABLE Produto
(
    Cod_Prod      int               not null,
    Desc_Produto  CHAR(60)          not null,
    Preco_Produto decimal(6,3)      not null,
    Quant_Produto DECIMAL(2)            not null,
    primary key(Cod_Prod) 
);


CREATE TABLE Empregado
(
    Cod_Empregado      int            not null,
    Nome_Empregado     CHAR(60)          not null,
    CPF_Empregado      CHAR(14)          not null,
    Rua_Empregado      CHAR(60)          not null,
    Numero_Empregado   DECIMAL(4)          not null,
    Bairro_Empregado   CHAR(60)          not null,
    Cep_Empregado      CHAR(9)          not null,
    Cidade_Empregado   char(60)          not null,
    UF_Empregado       char(2)          not null,

    primary key(Cod_Empregado) 
);

CREATE TABLE Prod_Venda
(
    Cod_Vend             int            not null,
    Quantidade_Produto   decimal(60)          not null,
    Comissao_Venda_Emp   decimal(14)          not null,
    Cod_Prod      int, 
    Cod_Empregado      int,   
    primary key (Cod_Vend ),
    foreign key(Cod_Prod) references Produto(Cod_Prod),
    foreign key(Cod_Empregado) references Empregado(Cod_Empregado)
);

select * from Prod_Venda;


CREATE TABLE Venda
(
Cod_Venda      int not null, 
Data_Venda     date not null,
Rua_Venda     char(60) not null,
Numero_Venda  int(4) not null,
Bairro_Venda  char(60) not null,
CEP_Venda  char(9) not null,
Cidade    char(60) not null,
UF_Venda  char(2) not null,
primary key(Cod_Venda)
);

INSERT INTO Fornecedor VALUES 
(1, 'Objeto 1', 'Rua Ceara','30','Jardim Alegre','04851513','São Paulo','SP'),
(2, 'Objeto 2', 'Rua Alberto','50','Jardim Alves','05651519','São Paulo','SP'),
(3, 'Objeto 3', 'Rua Selestina','60','Jardim Porto','03851515','São Paulo','SP');

select * from  Empregado;

INSERT INTO Telefone VALUES 
(1, '(11)978064552', '1'),
(2, '(11)40028955', '2'),
(3, '(12)987567804', '2');

INSERT INTO Produto VALUES 
(1, 'Copo de vidro', '50,00','1'),
(2, 'Balde de salada', '10,00','2'),
(3, 'Caixa organizadora', '30,00','1');

INSERT INTO Empregado VALUES 
(1, 'Joao', '32228099600','Rua Benedita','0089','Jardim Santa Lucia','08996548','Minas Gerais','SP'),
(2, 'Alicia', '22286500500','Rua Roma','0090','Jardim Jandira','09867054','São Paulo','SP'),
(3, 'Bruna', '66658799400','Rua Mar','0091','AV Oste santo','0985678426','São Paulo','SP');

INSERT Prod_Venda VALUES 
(1, '1', '1','1','1'),
(2, '2', '2','2','2'),
(3, '1', '1','3','3');

INSERT INTO Venda VALUES 
(1, '2023-08-30','AV Jardins','0001','Ciadade Jardins','67894567','São Paulo','SP'),
(2, '2023-08-31','AV Panema','0002','Jardim Colombia','6753467','São Paulo','SP'),
(3, '2023-08-31','AV Paulista','0003','Jardim Paulista','78653456','São Paulo','SP');
select * from  Venda;
drop table   Venda;