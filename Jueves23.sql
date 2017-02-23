/****************************************************
 *** APUNTES DE LA CLASE DE BASES DE DATOS        ***
 ***  INGENIERIA INFORMATICA.                     ***
 ***                             Febrero 23, 2017 ***
 ****************************************************/

 -- la solucion cuando los datos se van aumentando (varios propietarios, 
 --  varios locales) es otra tabla. importancia de un buen foreign key.
 --  relaciones "1 a n (un local un propietario)", "n a n (varios locales 
 --  varios propietarios)" o "1 a 1 (un producto un precio)"

 -- se crean dos archiivos cuando se crea la base de datos.


	-- actualizar la direccion de propietarios
 update PROPIETARIOS set direccion = 'Alta 87'
	where dni='20333444F';

	-- se borra la fila de locales con codigo XXXX
delete from LOCALES
	where codigo = 'L-234';

	-- toda operacion que se realiza sobre el gestor es transaccional

	-- producto cartesiano BUSCAR

alter table LOCALES with nocheck add
	constraint CK_licales check (dni_propietarios <> dni_arrendatario); -- check que no no sean iguales

	-- DISPARADORES	
create trigger ctrl_locales on LOCALES for insert, update as 
	begin
		if (select count(*) from
