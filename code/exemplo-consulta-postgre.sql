/*
create table usuarios
(
	usuarios_id serial primary key,
	usuarios_nome varchar(50),
	usuarios_email varchar(60),
	usuarios_fone varchar(30),
	usuarios_regdata timestamp default current_time 
)

create table mensagem (
	mensagem_id serial primary key,
	usuarios_id int,
	mensagem_titulo varchar(100),
	mensagem_conteudo text,
	mensagem_regdata timestamp default current_time
)
alter table mensagem
add foreign key fk_usuarios_id(usuarios_id) references usuarios(usuarios_id); 

*/
 
/* COMANDOS BÁSICOS DE CONSULTA*/
insert into mensagem(mensagem_titulo, mensagem_conteudo)
values('Test com chave estrangeira', 'Mensagem para armazenamento');

select * from mensagem;

select count(*) from mensagem;

select * from mensagem limit 2;

select max(mensagem_regdate) from mensagem;

select * from usuarios order by 2;

/** Quantidade de registros por minuto */
select date_part('m', mensagem_regdate), count(*) from mensagem group by date_part('m', mensagem_regdate);

select * from mensagem where mensagem_titulo like '%News%';

select * from mensagem where lower(mensagem_titulo) like lower('news%');

select * from usuarios;


/** Comando select para todos que tenham 'edu' no final do email*/
select * from usuarios where usuarios_email like '%edu';

/* comando select para todos que iniciem com a letra A*/
select * from usuarios where usuarios_nome like 'A%';

/* comando select para todos que contenham AVA no nome */
select * from usuarios where 
lower(usuarios_nome) like lower('AVA%') or 
lower(usuarios_nome) like lower('%AVA') or
lower(usuarios_nome) like lower('%AVA%');

/* listar todos que iniciem com W*/
select * from usuarios where usuarios_nome like 'W%';

/* agrupar por quantidade de letra */
select date_part('m', mensagem_regdate), count(*) from mensagem group by date_part('m', mensagem_regdate);

SELECT substring(usuarios_nome from 1 for 1) from usuarios;

select substring(usuarios_nome from 1 for 1), count(*)
from usuarios 
group by substring(usuarios_nome from 1 for 1) order by 1;


select usuarios_id, count(*) from mensagem group by usuarios_id order by 2 desc;

select u.usuarios_nome, m.mensagem_titulo, m.mensagem_regdate
from mensagem m inner join usuarios u
on m.usuarios_id = u.usuarios_id;

select u.usuarios_nome, count(*) as quantidade
from mensagem m inner join usuarios u on m.usuarios_id = u.usuarios_id 
group by u.usuarios_nome
order by 2 desc;

select u.usuarios_nome, count(*) as quantidade
from mensagem m, usuarios u
where m.usuarios_id = u.usuarios_id 
group by u.usuarios_nome 
order by 2 desc;
