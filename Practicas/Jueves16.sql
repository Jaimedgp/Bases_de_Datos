/************************************
 *        DATABASE MAEST            *
 ************************************
 *
 * 	Create the Database Maest
 *
 ************************************************/

 create database MAEST;


	-- 
	-- Table Genero 
	--
create table GENERO (
	id_Genero char(9), 
	nombre char(10) unique,
	descripcion varchar(100),
	primary key(idGenero)
);


	--
	-- Table IDIOMA
	--
create table IDIOMA (
	id_idioma char(9),
	nombre char(10) unique,
	primary key (id_idioma)
);


	--
	-- Table EMPRESA DESARROLLADORA
	--
create table EMPRESADESARROLLADORA (
	id_desarrollador char(9),
	Nombre char(10),
	primary key (id_desarrollador)
);


	--
	-- Table Medio de Pago 
	--
create table MEDIOPAGO (
	id_medio_pago char(9),
	nombre char(10) unique,
	descripcion varchar(100)
	esTarjeta bit check(1,0),
	primary key (id_medio_pago)
);


	--
	-- Table Pais
	--
create table PAIS (
	id_pais char(9),
	nombre char(10) unique,
	primary key (id_medio_pago)
);


	--
	-- Table Grupo
	--
create table GRUPO (
	id_grupo char(9),
	nombre char(10) unique,
	descripcion char(100),
	fecha_creacion datetime
	fecha_cierre null,
	max_usuario int,
	check(fecha_creacion < fecha_cierre),
	check(max_usuario >= 2),
	primary key (id_grupo)
);
	

	--
	-- Table usuario
	--
create table USUARIO (
	id_usuario char(9),
	apellido1 char(10),
	apellido2 char(10) null,
	nombre_usuario char(10) unique,
	fecha_nacimiento date,
	fecha_registro date default getdate(),
	email char(20) unique,
	id_pais char(9),
	constraint foreign key(id_pais) references PAIS(id_pais),
	primary key(id_usuario)
	check(email = '%@%')
);


	--
	-- Table Amistad
	--
create table AMISTAD (
	id_usuario1 char(9),
	id_usuario2 char(9),
	constraint foreign key(id_usuario1) references USUARIO(id_usuario)
	constraint foreign key(id_usuario2) references USUARIO(id_usuario)
);


	--
	-- Table Usuario de Grupo
	--
create table USUARIOGRUPO (
	id_usuario char(9),
	id_grupo char(9),
	fecha_adscripcion date,
	fecha_baja null,
	check(fecha_adscripcion < fecha_baja)
	constraint foreign key(id_usuario) references USUARIO(id_usuario)
	constraint foreign key(id_grupo) references GRUPO(id_grupo)
);


	--
	-- Table COMPRA
	--
create table COMPRA (
	id_compra char(9),
	fecha_compra datetime,
	id_usuario char(9),
	id_medio_pago char(9),
	cuenta_pago char(20),
	cvv_tarjeta int null,
	fecha_caducidad_tarjeta date null,
	vat DEC(5,3),
	check(vat >= 0)
	foreign key(id_usuario) references USUARIO(id_usuario)
	foreign key(id_medio_pago) references MEDIOPAGO(ID_MEDIO_PAGO)
);


	--
	-- Table Factura
	--
create table FACTURA (
	id_factura char(9),
	direccionFactura char(50),
	nif_factura char(10),
	fecha_generacion_factura date,
	id_compra char(9) unique,
	foreign key(id_compra references COMPRA(id_compra)
	primary key (id_factura)
);
	

	--
	-- Table GENERO VIDEOJUEGOS
	--
create table GENEROVIDEOJUEGO (
	id_Genero char(9),
	id_Videojuego char(9),
	constraint foreign key (id_Genero) references GENERO(id_Genero)
);




