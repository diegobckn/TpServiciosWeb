package Grupo6

import Grupo6.Utils.DateTimeHelper
import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BusquedasXHora implements IBusquedaObservador, IBusquedaStrategy {
	
	HashMap<Integer, Integer> registro 
	
	new () {
		registro = new HashMap<Integer, Integer> ()
	}
	
	override recibirNotificacion(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}

	override ejecutarEstrategia(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	
	private def procesar(Usuario unUsuario, List<Receta> data) {
		val hora = DateTimeHelper.getInstance.getCurrentHour
		var valor_actual = registro.get(hora) 
		if (valor_actual == null) {
			valor_actual = 0
		}
		registro.put(hora, valor_actual +1)
	}
	
}