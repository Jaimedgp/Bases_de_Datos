/********************************************************
 *** Creation and use the first DB in SQL SERVER 2014 ***
 *** 	using SQL sentences.                            ***
 *** 			                                            ***
 ***        - Create the DB with all the tables       ***
 *** 				- Author: Jaime Diez G-P                  ***
 ***                                                  ***
 ***   				+-------------------+                   ***
 ***					| CONCURSO_MASCOTAS |                   ***
 ***					+-------------------+                   ***
 ***					|   NACIONALIDAD    |                   ***
 ***					|      DUENIO       |                   ***
 ***					|     ESPECIE       |                   ***
 *** 					|     MASCOTA       |                   ***
 ***					|     CONCURSO      |                   ***
 ***					|     REGISTRO      |                   ***
 ***					+-------------------+                   *** 
 ********************************************************/

	-- creates de DB concurso
create database CONCURSO_MASCOTAS;

	-- table with owner's nacionality data
	-- +----------------+--------------+
	-- | idNacionalidad | nacionalidad |
	-- |      pk        |              |
	-- +----------------+--------------+
create table NACIONALIDAD (
	idNacionalidad integer identity primary key, -- in SQL Server integer => int
	nacionalidad varchar(80) not null);


	-- table with owner data
	-- +----------+-----+--------+-----------+-----------+--------------+
	-- | idDuenio | dni | nombre | apellido1 | apellido2 | nacionalidad |
	-- |    pk    |     |        |           |           |      fk      |
	-- +----------+-----+--------+-----------+-----------+--------------+
create table DUENIO (
	idDuenio integer identity primary key,
	dni char(9) not null unique,
	nombre varchar(80) not null,
	apellido1 varchar(80) not null,
	apellido2 varchar(80) null,
	nacionalidad integer not null foreign key references NACIONALIDAD(idNacionalidad));

	
	-- table with dog species data
	-- +-----------+--------+
	-- | idEspecie | nombre |
	-- |     pk    |        |
	-- +-----------+--------+
create table ESPECIE (
	idEspecie integer primary key,
	nombre varchar(80) not null);


	-- table with the dog data
	-- +-----------+--------+--------------------+------+---------------------+---------+--------+
	-- | idMascota | nombre | identificador Chip | peso | fecha de Nacimiento | especie | duenio |
	-- |     pk    |        |                    |      |                     |    fk   |        |
	-- +-----------+--------+--------------------+------+---------------------+---------+--------+
create table MASCOTA (
	idMascota integer identity primary key,
	nombre varchar(80) not null,
	identificadorChip varchar(20) not null unique,
	peso DEC(2,1) not null,
	fechaNacimiento date not null,
	especie integer foreign key references ESPECIE(idEspecie),
	duenio integer not null);


	-- table with competition data
	-- +------------+--------+--------------------+--------------------------+
	-- | idConcurso | titulo | premio en metalico | fecha maxima de registro |
	-- |     pk     |        |                    |                          |
	-- +------------+--------+--------------------+--------------------------+
create table CONCURSO (
	idConcurso integer identity primary key,
	titulo varchar(80) not null,
	premioEnMetalico money  not null,
	fechaMaximaRegistro date not null);


	-- table with registry data
	-- +------------+------------+------------+-------------------+------------+-----------------------+
	-- | idRegistro | idMascotas | idConcurso | fecha de registro | puntuacion | comentario puntuacion |
	-- |     pk     |     fk     |     fk     |                   |            |                       |
	-- +------------+------------+------------+-------------------+------------+-----------------------+
create table REGISTRO (
	idRegistro integer identity primary key,
	idMascotas integer not null foreign key references MASCOTAS(idMascotas),
	idConcurso integer not null foreign key references CONCURSO(idConcurso),
	fechaRegistro date not null,
	puntuacion integer null,
	comentarioPuntacion text null);
	
