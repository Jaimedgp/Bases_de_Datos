	-- se crea la base de datos del concurso
create database	CONCURSO_MASCOTAS;

	-- tabla con los datos de la nacionalidad
create table  NACIONALIDAD (
	idNacionalidad int identity primary key,
	nacionalidad varchar(80) not null);

	-- tabla con los datos del duenio
create table DUENIO (
	idDuenio int identity primary key,
	dni char(9) not null unique,
	nombre varchar(80) not null,
	apellido1 varchar(80) not null,
	apellido2 varchar(80) null,
	nacionalidad int not null foreign key references NACIONALIDAD(idNacionalidad));

	-- tabla con los datos de la especie
create table ESPECIE (
	idEspecie int primary key,
	nombre varchar(80) not null);

	-- tabla con los datos de la mascota
create table MASCOTA (
	idMascota int identity primary key,
	nombre varchar(80) not null,
	identificadorChip varchar(20) not null unique,
	peso DEC(2,1) not null,
	fechaNacimiento date not null,
	especie int foreign key references ESPECIE(idEspecie),
	duenio int not null);

	-- tabla con los datos del concurso
create table CONCURSO (
	idConcurso int identity primary key,
	titulo varchar(80) not null,
	premioEnMetalico money  not null,
	fechaMaximaRegistro date not null);

	-- tabla con los datos de registro
create table REGISTRO (
	idRegistro int identity primary key,
	idMascotas int not null foreign key references MASCOTAS(idMascotas),
	idConcurso int not null foreign key references CONCURSO(idConcurso),
	fechaRegistro date not null,
	puntuacion int null,
	comentarioPuntacion text null);


