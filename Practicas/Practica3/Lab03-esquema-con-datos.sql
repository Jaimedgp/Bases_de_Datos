
			------------------------------------------------------------------
---- Práctica 3: 
---- Bases de datos ----------------------------------------------
---- Ingeniería Informática, Universidad de Cantabria ------------
---- 2016/2017 ---------------------------------------------------
------------------------------------------------------------------
-- ATENCIÓN: SCRIPT CON ERRORES DE DISEÑO PARA CORREGIR EN CLASE -
------------------------------------------------------------------

-- Eliminar base de datos si existe (recreación completa)
use master

if exists(select * from sys.databases where name='gimnasio')
  drop database gimnasio

	-- Crea la base de datos
create database gimnasio;

	-- Usar la base de datos creada
use gimnasio;



------------------------
-- Creación de tablas --
------------------------

create table socio(
			idsocio integer primary key, 
			nombre varchar(30) null,
			apellido1 varchar(30) not null,
			apellido2 varchar(30) not null, 
			nif varchar(20) not null,
			fechaNacimiento date null,
			fechaRegistro date null default getdate(), -- if the value is null it changes by default to the current date 
			fechaBaja date null,
			email varchar(50) check (email like ('%@%')) null,
			telefono_contacto int null
);


create table sala(
			idsala integer primary key, 
			nombre char(15) not null,
			capacidad integer not null
);



create table actividad(
			idactividad integer primary key,
			nombre varchar(50) not null,
			descripcion varchar (200) not null,
			nivel char(5) constraint ch_nivel_act check(nivel in ('Alto','Bajo'))
);


create table edicionActividad(
			idedicion integer primary key,
			anio int not null,
			trimestre char(1) check (trimestre in ('1','2','3','4')) not null,
			numMaxSocios integer not null default(50),
			idsala integer foreign key references sala(idsala),
			idactividad integer foreign key references actividad(idactividad)
);


create table slotHora(
			idslot int primary key,
			inicio time not null,
			fin time not null,
			diaSemana char(20) check(diaSemana in ('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo'))
);


create table sesionActividadHora(
			idsesion integer primary key,
			idedicion integer foreign key references edicionActividad(idedicion),
			idslot integer foreign key references slotHora(idslot)
);


create table matriculaSocioEdicion(
			idmatricula integer primary key,
			idedicion integer foreign key references edicionActividad(idedicion),
			idsocio integer foreign key references socio(idsocio),
			fechaMatricula date not null, -- fecha en la que el socio de matriculó en la actividad
			fechaBaja date null);


	------------------------
	-- Inserción de datos --
	------------------------
INSERT [dbo].[socio] ([idsocio], [nombre], [apellido1], [apellido2], [nif], [fechaNacimiento], [fechaRegistro], [fechaBaja], [email], [telefono_contacto])
			VALUES (1, N'pepe', N'viyuela', N'gomez', N'123123L', CAST(N'1980-10-10' AS Date), CAST(N'2016-01-01' AS Date), NULL, N'pepe.viyuela@mial.com', NULL)
INSERT [dbo].[socio] ([idsocio], [nombre], [apellido1], [apellido2], [nif], [fechaNacimiento], [fechaRegistro], [fechaBaja], [email], [telefono_contacto]) 
			VALUES (2, N'jose', N'perez', N'fernandez', N'123124F', CAST(N'1990-09-10' AS Date), CAST(N'2015-12-02' AS Date), NULL, N'josep@mial.com', 454545454)
INSERT [dbo].[socio] ([idsocio], [nombre], [apellido1], [apellido2], [nif], [fechaNacimiento], [fechaRegistro], [fechaBaja], [email], [telefono_contacto]) 
			VALUES (3, N'ming', N'yao', N'fang', N'K293420L', CAST(N'1980-09-12' AS Date), CAST(N'2017-01-01' AS Date), NULL, N'ming.yao@mial.com', NULL)

INSERT [dbo].[sala] ([idsala], [nombre], [capacidad]) 
			VALUES (1, N'Sala 1         ', 50)
INSERT [dbo].[sala] ([idsala], [nombre], [capacidad]) 
			VALUES (2, N'Sala 2         ', 30)
INSERT [dbo].[sala] ([idsala], [nombre], [capacidad]) 
			VALUES (3, N'Sala 3         ', 15)

INSERT [dbo].[actividad] ([idactividad], [nombre], [descripcion], [nivel]) 
			VALUES (1, N'Pilates', N'Relaja y ejercita tus músculos en esta actividad', N'Bajo ')
INSERT [dbo].[actividad] ([idactividad], [nombre], [descripcion], [nivel]) 
			VALUES (2, N'Fitness Revolution', N'Clase de fitness que combina diferentes elementos para ponerte en forma', N'Alto ')
INSERT [dbo].[actividad] ([idactividad], [nombre], [descripcion], [nivel]) 
			VALUES (3, N'Crossfit', N'Realiza ejercicios que potenciarán tu musculatura y fuerza física', N'Alto ')

INSERT [dbo].[edicionActividad] ([idedicion], [anio], [trimestre], [numMaxSocios], [idsala], [idactividad]) 
			VALUES (1, 2017, N'1', 20, 1, 1)
INSERT [dbo].[edicionActividad] ([idedicion], [anio], [trimestre], [numMaxSocios], [idsala], [idactividad]) 
			VALUES (2, 2017, N'1', 15, 2, 2)
INSERT [dbo].[edicionActividad] ([idedicion], [anio], [trimestre], [numMaxSocios], [idsala], [idactividad]) 
			VALUES (3, 2017, N'1', 30, 3, 3)

INSERT [dbo].[matriculaSocioEdicion] ([idmatricula], [idedicion], [idsocio], [fechaMatricula], [fechaBaja]) 
			VALUES (1, 1, 1, CAST(N'2017-01-01' AS Date), NULL)
INSERT [dbo].[matriculaSocioEdicion] ([idmatricula], [idedicion], [idsocio], [fechaMatricula], [fechaBaja]) 
			VALUES (2, 1, 2, CAST(N'2017-01-01' AS Date), NULL)
INSERT [dbo].[matriculaSocioEdicion] ([idmatricula], [idedicion], [idsocio], [fechaMatricula], [fechaBaja]) 
			VALUES (3, 2, 1, CAST(N'2017-01-01' AS Date), NULL)
INSERT [dbo].[matriculaSocioEdicion] ([idmatricula], [idedicion], [idsocio], [fechaMatricula], [fechaBaja]) 
			VALUES (4, 3, 3, CAST(N'2017-01-01' AS Date), NULL)

INSERT [dbo].[slotHora] ([idslot], [inicio], [fin], [diaSemana]) 
			VALUES (1, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), N'Lunes               ')
INSERT [dbo].[slotHora] ([idslot], [inicio], [fin], [diaSemana]) 
			VALUES (2, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), N'Miércoles           ')
INSERT [dbo].[slotHora] ([idslot], [inicio], [fin], [diaSemana]) 
			VALUES (4, CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Jueves              ')
INSERT [dbo].[slotHora] ([idslot], [inicio], [fin], [diaSemana]) 
			VALUES (3, CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Martes              ')

INSERT [dbo].[sesionActividadHora] ([idsesion], [idedicion], [idslot]) 
			VALUES (1, 1, 1)
INSERT [dbo].[sesionActividadHora] ([idsesion], [idedicion], [idslot]) 
			VALUES (2, 1, 2)
INSERT [dbo].[sesionActividadHora] ([idsesion], [idedicion], [idslot]) 
			VALUES (3, 2, 1)
INSERT [dbo].[sesionActividadHora] ([idsesion], [idedicion], [idslot]) 
			VALUES (4, 2, 3)
INSERT [dbo].[sesionActividadHora] ([idsesion], [idedicion], [idslot]) 
			VALUES (5, 3, 3)
INSERT [dbo].[sesionActividadHora] ([idsesion], [idedicion], [idslot]) 
			VALUES (6, 3, 4)
