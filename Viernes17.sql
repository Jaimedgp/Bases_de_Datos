/**************************************************
 *** APUNTES DE LA CLASE DE BASE DE DATOS       ***
 ***  INGENIERIA INFORMATICA.                   ***
 ***													Febrero 17, 2017  ***
 **************************************************/

/**
 * CREAR TABLAS EN SQL
 */

create table PROPIETARIOS 
	(dni 				char(10)	not null constraint pk_prop primary key,	--se puede poner la primary key en la misma fila
	 nombre			char(25)	not null,
	 direccion 	char(30)
		/*PRIMARY KEY(DNI)*/);--se puede poner la primary key al final de la tabla 

create table LOCALES
	(codigo			char(10)	not null,
	 codigoPer	char(10)	not null,
	 ubicacion	char(4)		not null,
	 superficie	dec(8,2)	not null,	-- numero decimal de 8 cifras y 2 decimales --
	 constraint fk_loc foreign key (codigoPer) references PROPIETARIOS(dni));	 

create table JUGADORES_BALONCESTO
	(dni				char(10)		not null,
	 sexo				char(1)			not null	check(sexo in ('M', 'F')),
	 fechaInsc	date				not null	default getdate());

/** 
 * INSERTAR NUEVAS FILAS
 */

insert into PROPIETARIOS(dni, nombre, diraccion)
	values('13234567R', 'sanz Lluis', 'Gran via 26') 

-- tambien se puede escribir --
insert into LOCALES
	values ('13234567R', 'sanz Lluis', 'Gran via 26') 

-- cuando algun valor es nul9 --
insert into PROPIETARIOS
	values('13234567R', null, 'Gran via 26') 

/*
 * ENCONTRAR LOS LOCALES CON SUPERFICIE MAYOR QUE 200 Y SU PROPIETARIO
 */

 select codigo, ubicacion, nombre, direccion --columnas que devuelva
 	from LOCALES, PROPIETARIOS -- intervienen
 where LOCALES.dni = PROPIETARIOS.dni and superficie > 200

