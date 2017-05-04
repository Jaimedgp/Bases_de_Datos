use maetsBD;
go

	-- procedimiento para mostrar mensaje de error
CREATE PROCEDURE usp_showerrorinfo
AS
SELECT ERROR_NUMBER() AS [Numero de Error],
ERROR_STATE() AS [Estado del Error],
ERROR_SEVERITY() AS [Severidad del Error],
ERROR_LINE() AS [Linea],
ISNULL(ERROR_PROCEDURE(), 'No esta en un proc') AS [Procedimiento],
ERROR_MESSAGE() AS [Mensaje]
GO

	--		7. Implementar un procedimiento que añada un nuevo género a un videojuego. Si
	--	el género ya está asignado al videojuego, deberá lanzar un error. Probar el procedimiento.

create procedure videojuego_genero @genro int, @vidojuego int as
begin try
	begin transaction
	if (exists(select * from generovideojuego where @genro = idgenero and @vidojuego=idvideojuego)) 
		begin raiserror('el genro ya esta asignado al videojuego',16,1)
	end

	insert 
	commit transaction
end try
begin catch
	rollback transaction
end catch

	--		8. Desarrollar un procedimiento que permita eliminar un grupo de la base de datos
	--	siempre y cuando no haya usuarios registrados en él. También deberá lanzar error si
	--	el grupo no existe. 

create procedure delete_group @codgroup int as

	begin try
	begin transaction
		if (not exists(select * from grupo where @codgroup=idgrupo))
			begin raiserror('No existe tal grupo',16,1)
		end

		declare @usr 

		delete from grupos where idgrupo=@codgroup
