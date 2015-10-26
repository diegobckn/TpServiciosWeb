package Grupo6

import java.util.List
import org.apache.log4j.LogManager
import org.apache.log4j.Logger
import queComemos.entrega3.repositorio.BusquedaRecetas

class AccionLoguear implements IAccion {
	
	String mensaje
	Logger logger = LogManager.getRootLogger();
	
	new (String texto) {
		this.mensaje = texto
	}
	
	override Ejecutar(Usuario unUsuario, List<Receta> data, BusquedaRecetas busquedaRecetas) {
		if (logger != null) {
			logger.info( String.format(this.mensaje, unUsuario.nombre, data.size))
		}
	}
}
