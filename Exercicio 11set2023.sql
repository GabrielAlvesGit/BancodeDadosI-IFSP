CREATE DATABASE bd_vendas2;
USE bd_vendas2;

CREATE TABLE tb_cliente (
pk_cliente int PRIMARY KEY IDENTITY(0,1),
nome varchar(255) NOT NULL,
cpf varchar(11) NOT NULL
);
CREATE TABLE tb_vendedor (
pk_vendedor int PRIMARY KEY IDENTITY(0,1),
nome varchar(255) NOT NULL
);
CREATE TABLE tb_produto (
pk_produto int PRIMARY KEY IDENTITY(0,1),
nome varchar(255) NOT NULL,
quantidade_estoque int NOT NULL
);
CREATE TABLE tb_loja (
pk_loja int PRIMARY KEY IDENTITY(0,1),
nome varchar(255) NOT NULL,
cnpj varchar(14) NOT NULL
);
CREATE TABLE tb_venda (
pk_venda int PRIMARY KEY IDENTITY(0,1),
percentual_desconto float,
data_venda datetime NOT NULL,
fk_loja int REFERENCES tb_loja(pk_loja),
fk_vendedor int REFERENCES tb_vendedor(pk_vendedor),
fk_cliente int REFERENCES tb_cliente(pk_cliente),
valor_total float,
);
CREATE TABLE tb_NotaFiscal (
pk_notafiscal int PRIMARY KEY IDENTITY(0,1),
fk_loja int NOT NULL,
fk_venda int
);
CREATE TABLE tb_itens (
pk_item int PRIMARY KEY IDENTITY(0,1),
fk_venda int,
fk_produto int
);

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
INSERT INTO tb_vendedor VALUES ('Daniel Oliveira');
INSERT INTO tb_vendedor VALUES ('Marcos Cunha');
INSERT INTO tb_vendedor VALUES ('Olivia Marta');
INSERT INTO tb_vendedor VALUES ('Carlos Dias');
INSERT INTO tb_vendedor VALUES ('Pedro Pedreira');
INSERT INTO tb_vendedor VALUES ('GUSTAVO MOTTA');
INSERT INTO tb_vendedor VALUES ('ADILSON EVANDRO');
INSERT INTO tb_loja VALUES ('Loja Unidade Minas Gerais','11111111110');
INSERT INTO tb_loja VALUES ('Loja Unidade São Paulo','11111111111');
INSERT INTO tb_loja VALUES ('Loja Unidade Rio de Janeiro','11111111112');
INSERT INTO tb_loja VALUES ('Loja Unidade Espirito Santo','11111111113');
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'18-06-12 10:34:09 PM',5),1,1,0,0)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'15-06-12 10:34:09 PM',5),2,2,1,0)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'13-06-12 10:34:09 PM',5),0,3,2,0)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'12-06-12 10:34:09 PM',5),1,4,3,0)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'15-06-12 10:34:09 PM',5),1,0,4,0)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'19-06-12 10:34:09 PM',5),1,1,5,0)
INSERT INTO tb_venda VALUES (1.5,convert(datetime,'20-06-12 10:34:09 PM',5),2,2,6,0)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'18-07-12 10:34:09 PM',5),2,3,7,0)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'11-07-12 10:34:09 PM',5),2,4,8,0)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'10-07-12 10:34:09 PM',5),0,0,9,0)
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'28-07-12 10:34:09 PM',5),0,1,1,0)
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'1-05-13 10:34:09 PM',5),0,1,2,0)
INSERT INTO tb_venda VALUES (2.5,convert(datetime,'8-05-13 10:34:09 PM',5),1,1,2,0)
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'12-05-13 10:34:09 PM',5),2,2,3,0)
INSERT INTO tb_venda VALUES (13.5,convert(datetime,'18-05-13 10:34:09 PM',5),0,2,3,0)
INSERT INTO tb_venda VALUES (3.5,convert(datetime,'28-05-13 10:34:09 PM',5),1,2,5,0)
INSERT INTO tb_venda VALUES (23.5,convert(datetime,'19-08-13 10:34:09 PM',5),2,3,5,0)
INSERT INTO tb_venda VALUES (33.5,convert(datetime,'20-08-13 10:34:09 PM',5),0,3,5,0)
INSERT INTO tb_venda VALUES (43.5,convert(datetime,'21-09-13 10:34:09 PM',5),1,4,7,0)
INSERT INTO tb_venda VALUES (53.5,convert(datetime,'18-10-13 10:34:09 PM',5),2,4,7,0)
INSERT INTO tb_venda VALUES (63.5,convert(datetime,'11-11-13 10:34:09 PM',5),0,4,7,0)
INSERT INTO tb_venda VALUES (44.5,convert(datetime,'21-09-13 10:34:09 PM',5),1,4,7,33.333)
INSERT INTO tb_venda VALUES (55.5,convert(datetime,'18-10-13 10:34:09 PM',5),2,4,7,44.444)
INSERT INTO tb_venda VALUES (66.5,convert(datetime,'11-11-13 10:34:09 PM',5),0,4,7,555.555)
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




