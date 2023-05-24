# Vamos criar um banco de dados chamado "Comercio"
create database if not exists Comercio;

#Vamos usar o banco "Comercio"
use Comercio;

# Vamos criar algumas tabelas

# Se as Tabelas jA existirem e precisarmos alterar algum atributo
# podemos remover as tabelas a partir dos comandos a baixo:
drop table if exists Itens_venda;
drop table if exists Produto;
drop table if exists Venda;


# Criando a Tabela Venda
CREATE TABLE if not exists Venda (
    id integer auto_increment,
    data_venda date default('2020-10-05'),
    cliente varchar(100) not null,
    primary key(id)
);

# Vamos criar a Tabela Produto

CREATE TABLE if not exists Produto (
    id integer auto_increment,
    nome varchar(200) not null unique,
    tipo varchar(200) default('Nao Perecivel'),
    valor_unidade real default(0.0),
    primary key(id)
);

# Vamos criar a Tabela Itens_venda
CREATE TABLE if not exists Itens_venda (
    venda_id integer not null,
    produto_id integer not null,
    quantidade integer default (1),
    preco_total real default (0.0),
    foreign key(venda_id) references Venda(id),
    foreign key(produto_id) references Produto(id)
);
 
# Vamos inserir algumas tuplas nas tabelas
# Insercao de alguns produtos
insert into Produto(nome,tipo,valor_unidade) value ('Arroz', 'Nao Perecivel', 20.50);
insert into Produto (nome, tipo, valor_unidade) value ('Feijao', 'Nao Perecivel', 15.75);
insert into Produto (nome, tipo, valor_unidade) value ('Macarrao', 'Nao Perecivel', 10.99);
insert into Produto (nome, tipo, valor_unidade) value ('Leite', 'Perecivel', 3.99);
insert into Produto (nome, tipo, valor_unidade) value ('Cafe', 'Nao Perecivel', 12.25);
insert into Produto (nome, tipo, valor_unidade) value ('Acucar', 'Nao Perecivel', 8.50);
insert into Produto (nome, tipo, valor_unidade) value ('aleo de Soja', 'Nao Perecivel', 7.99);
insert into Produto (nome, tipo, valor_unidade) value ('Sal', 'Nao Perecivel', 2.25);
insert into Produto (nome, tipo, valor_unidade) value ('Farinha de Trigo', 'Nao Perecivel', 6.75);
insert into Produto (nome, tipo, valor_unidade) value ('Sabao em Po', 'Nao Perecivel', 14.50);
insert into Produto (nome, tipo, valor_unidade) value ('Desodorante', 'Nao Perecivel', 9.99);
insert into Produto (nome, tipo, valor_unidade) value ('Papel Higienico', 'Nao Perecivel', 5.25);
insert into Produto (nome, tipo, valor_unidade) value ('Detergente', 'Nao Perecivel', 3.75);
insert into Produto (nome, tipo, valor_unidade) value ('Sabonete', 'Nao Perecivel', 2.99);
insert into Produto (nome, tipo, valor_unidade) value ('Shampoo', 'Nao Perecivel', 11.50);
insert into Produto (nome, tipo, valor_unidade) value ('Condicionador', 'Nao Perecivel', 13.25);
insert into Produto (nome, tipo, valor_unidade) value ('Escova de Dentes', 'Nao Perecivel', 4.99);
insert into Produto (nome, tipo, valor_unidade) value ('Pasta de Dentes', 'Nao Perecivel', 3.50);
insert into Produto (nome, tipo, valor_unidade) value ('Amaciante de Roupas', 'Nao Perecivel', 8.75);
insert into Produto (nome, tipo, valor_unidade) value ('Agua Mineral', 'Perecivel', 2.50);

#Insercao de Venda

insert into Venda(data_venda, cliente) value ('2000-10-08','Kely');
insert into Venda (data_venda, cliente) values ('2001-05-15', 'Joao');
insert into Venda (data_venda, cliente) values ('2002-05-15', 'Joao');
insert into Venda (data_venda, cliente) values ('2001-10-15', 'Joao');
insert into Venda (data_venda, cliente) values ('2002-12-03', 'Maria');
insert into Venda (data_venda, cliente) values ('2003-08-21', 'Pedro');
insert into Venda (data_venda, cliente) values ('2002-05-15', 'Ana');
insert into Venda (data_venda, cliente) values ('2005-11-12', 'Ana');
insert into Venda (data_venda, cliente) values ('2005-07-27', 'Carlos');
insert into Venda (data_venda, cliente) values ('2015-07-27', 'Carlos');
insert into Venda (data_venda, cliente) values ('2006-09-05', 'Laura');
insert into Venda (data_venda, cliente) values ('2006-09-07', 'Laura');
insert into Venda (data_venda, cliente) values ('2006-09-08', 'Laura');
insert into Venda (data_venda, cliente) values ('2007-03-18', 'Mariana');
insert into Venda (data_venda, cliente) values ('2017-03-18', 'Mariana');
insert into Venda (data_venda, cliente) values ('2008-06-30', 'Ricardo');
insert into Venda (data_venda, cliente) values ('2017-03-18', 'Ricardo');
insert into Venda (data_venda, cliente) values ('2009-12-09', 'Patricia');

# Inserção de Itens_venda, vamos inserir somente os dados: venda_id, produto_id e quantidade. O preço total vamos atualizar depois
insert into Itens_venda(venda_id, produto_id, quantidade, preco_total) values(1,1,10, 0.0);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (1, 1, 10, 205.00);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (2, 2, 5, 78.75);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (2, 1, 5, 78.75);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (2, 3, 5, 78.75);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (3, 3, 3, 32.97);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (3, 1, 1, 32.97);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (4, 4, 2, 7.98);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (4, 1, 2, 7.98);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (4, 2, 2, 7.98);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (4, 5, 2, 7.98);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (5, 5, 4, 49.00);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (5, 1, 4, 49.00);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (5, 2, 4, 49.00);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (6, 6, 1, 8.50);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (6, 1, 1, 8.50);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (7, 7, 2, 15.98);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (7, 1, 2, 15.98);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (7, 2, 2, 15.98);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (8, 8, 3, 6.75);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (8, 1, 3, 6.75);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (8, 2, 3, 6.75);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (9, 9, 1, 6.75);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (9, 2, 1, 6.75);
insert into Itens_venda (venda_id, produto_id, quantidade, preco_total) values (9, 3, 1, 6.75);

# Exercícios:
/*
	1 - Mostre o valor mais caro de produto
    2 - Mostre o menor valor de produto;
    3 - Mostre todos os dados do "Itens_venda" com o maior preço;
    4 - Mostre a média de valores dos produtos;
    5 - Conte a quantidade de produtos que possuem o valor menor que a média;
    6 - Conte a quantidade de produtos que possuem o valor maior que a média;
*/

