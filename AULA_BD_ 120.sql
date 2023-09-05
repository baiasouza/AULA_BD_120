create database filmes;

use filmes;

alter table filmes change ano_lacamento ano_lancamento int;

describe filmes;

create table filmes (
	id_filme int,
	titulo varchar(60),
    genero varchar(45),
    duracao varchar(45),
    ano_lacamento int,
    preco_aluguel double,
    primary key(id_filme)
);
    
create table atores (
	id_ator int,
    nome_ator varchar(60),
    ano_nascimento int,
    nacionalidade varchar(20),
    sexo varchar(10),
    primary key(id_ator)
);

create table atuacoes (
	id_protagonista int,
    id_filme int,
    id_ator int,
    foreign key(id_filme) references filmes(id_filme),
    foreign key(id_ator) references atores(id_ator)
);

select f.titulo, f.genero, nome_ator, a.nacionalidade, a.sexo, f.ano_lancamento from atuacoes at
inner join filmes f 
on f.id_filme = at.id_filme
inner join atores a 
on at.id_ator = a.id_ator;

select f.titulo, nome_ator ,a.ano_nascimento from atuacoes at
inner join filmes f 
on f.id_filme = at.id_filme
inner join atores a 
on at.id_ator = a.id_ator
where nome_ator = 'al pacino';

select at.nome_ator ,f.ano_lancamento from atores at
inner join atuacoes a 
on at.id_ator = a.id_ator
inner join filmes f
on a.id_filme = f.id_filme
where f.titulo like 'Jogos Vorazes';

select*from atuacoes;

select*from filmes where id_filme = '37';

select*from atores where id_ator = '1';

select f.titulo, f.genero, a.nome_ator from atuacoes at
inner join filmes f 
on f.id_filme = at.id_filme
inner join atores a 
on at.id_ator = a.id_ator where f.titulo like 'r%';

select distinct at.nome_ator, at.nacionalidade from atores at 
inner join atuacoes a on at.id_ator = a.id_ator
inner join filmes f on a.id_filme = f.id_filme
where at.nacionalidade like 'reino unido'
and f.genero like 'drama';

select distinct at.nome_ator, f.ano_lancamento
from atores at
inner join atuacoes a on at.id_ator =a.id_ator
inner join filmes f on a.id_filme = a.id_filme 
where f.ano_lancamento <'2010';
