	-- se crea la base de datos del concurso
create database	CONCURSO_MASCOTAS;

	-- tabla con los datos de la nacionalidad
create table  NACIONALIDAD (
idNacionalidad integer identity primary key,
	nacionalidad varchar(80) not null);

	-- tabla con los datos del duenio
create table DUENIO (
	idDuenio integer identity primary key,
	dni char(9) not null unique,
	nombre varchar(80) not null,
	apellido1 varchar(80) not null,
	apellido2 varchar(80) null,
	nacionalidad integer not null foreign key references NACIONALIDAD(idNacionalidad));

	-- tabla con los datos de la especie
create table ESPECIE (
	idEspecie integer primary key,
	nombre varchar(80) not null);

	-- tabla con los datos de la mascota
create table MASCOTA (
	idMascota integer identity primary key,
	nombre varchar(80) not null,
	identificadorChip varchar(20) not null unique,
	peso DEC(2,1) not null,
	fechaNacimiento date not null,
	especie integer foreign key references ESPECIE(idEspecie),
	duenio integer not null);

	-- tabla con los datos del concurso
create table CONCURSO (
	idConcurso integer identity primary key,
	titulo varchar(80) not null,
	premioEnMetalico money  not null,
	fechaMaximaRegistro date not null);

	-- tabla con los datos de registro
create table REGISTRO (
	idRegistro integer identity primary key,
	idMascotas integer not null foreign key references MASCOTAS(idMascotas),
	idConcurso integer not null foreign key references CONCURSO(idConcurso),
	fechaRegistro date not null,
	puntuacion integer null,
	comentarioPuntacion text null);


