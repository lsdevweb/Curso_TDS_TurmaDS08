create database origem;
use origem;
create table tbpais (
codpais int not null primary key auto_increment,
pais varchar (50)not null,
estado varchar (50)not null);
insert into tbpais(pais, estado) values
('Brasil' , 'Minas Gerais'),
('França','Paris');
select * from tbpais;
create table tbestado(
codestado int not null primary key auto_increment,
estado varchar (50) not null,
sigla varchar(2) not null,
cod_estado_pais int not null,
foreign Key(cod_estado_pais)
references tbpais(codpais));

select * from tbestado;

insert into tbestado(estado,sigla ,cod_estado_pais)values
('Rio Grande do Sul' , 'RS', 1),
('Paris','PA' , 2),
('Monaco','Mo' , 2),
('Lily','LI' , 2);

select * from tbpais;
select * from tbestado;


insert into tbestado(estado,sigla ,cod_estado_pais)values
('Rio de Janeiro' , 'RJ', 1),
('São Paulo','SP' , 1),
('Goias','GO' , 1),
('Olympique','OY' , 2);



select * from tbestado;
/*--Excluindo uma coluna na tabela
alter table tbpais drop column estado;*/
alter table tbpais drop column estado;
select * from tbpais;

alter table tbestado change sigla uf  varchar (2);

select * from tbestado;