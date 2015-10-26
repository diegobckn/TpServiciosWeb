package Grupo6

import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BusquedasTops implements IBusquedaObservador, IBusquedaStrategy {
	
	HashMap<String, Integer> registro 
	
	new () {
		registro = new HashMap<String, Integer> ()
	}
	
	override recibirNotificacion(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	override ejecutarEstrategia(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	private def procesar(Usuario unUsuario, List<Receta> data) {
		data.forEach [
			val nombre = it.nombre; 
			var valor_actual = registro.get(nombre) 
			if (valor_actual == null) {
				valor_actual = 0
			}
			registro.put(nombre, valor_actual +1)
		]
	}
	
	
	def int registroPorReceta(String nombre)
	{
		var valor_actual = registro.get(nombre) 
		if (valor_actual == null) {
			valor_actual = 0
		}
		return valor_actual 
	}
	
}