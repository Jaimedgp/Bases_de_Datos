/**
 * PRIMERA PRUEBA CON BASES DE DATOS 
 *            EN MYSQL
 *
 */

create database if not exists JGP_PROJECTESES;

use JGP_PROJECTESES;

create table if not exists DATA(
		cod_project char(10),
		name char(10),
		numbers float,
		primary key(cod_project));

create table if not exists PLOT(
		types char(10), -- check('Linear','Exponential','Logarithmic','Polynomial','Sinusoidal'),
		Xaxes char(10),
		Yaxes char(10),
		primary key(types),
		foreign key (Xaxes) references DATA(name));


create table if not exists PROJECTES(
		path_directory varchar(20),
		graphic char(10), -- check('Linear','Exponential','Logarithmic','Polynomial','Sinusoidal'),
		data char(10),
		primary key(data));
-- esto es solo una prueba --
