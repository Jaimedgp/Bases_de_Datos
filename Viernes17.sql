/*
 * Apumtes de clase de bases
*/

CREATE TABLE PROPIETARIOS
	(DNI CHAR(10) NOT NULL CONSTRAINt pk_prop PRIMARY KEY,
	 NOMBRE CHAR(25) NOT NULL, 
	 DIRECCION CHAR(30),
	 PRIMARY KEY(DNI)); --se puede poner la primary key tanto en la fila como al final de la tabla

create table locales
	(codigo char(10) not null constraint pk_prop primary key,
	 dni char(10) not null,
	 ubicacion char(4) not null,
	 superficie DEC(8,2) not null,
	 constraint fk_loc foreign key (dni) references propietarios(dni));




-- para insertar nuevas fila --
insert into PROPIETARIOS(dni, NOMBRE, DIRECCION)
	values('13234567R', 'sanz Lluis', 'Gran via 26') 

-- tambien se puede escribir --
insert into locales
	values ('13234567R', 'sanz Lluis', 'Gran via 26') 

-- cuando algun valor es nul9 --
insert into PROPIETARIOS
	values('13234567R', null, 'Gran via 26') 

/*
 * ENCONTRAR LOS LOCALES CON SUPERFICIE MAYOR QUE 200 Y SU PROPIETARIO
 */

 select codigo, ubicacion, NOMBRE, DIRECCION --columnas que devuelva
 	from locales, propietarios -- intervienen
 where Locales.DNI = PROPIETARIOS.DNI and SUPERFICIE > 200