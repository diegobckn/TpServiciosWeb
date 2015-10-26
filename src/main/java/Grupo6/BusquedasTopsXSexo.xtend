package Grupo6

import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BusquedasTopsXSexo implements IBusquedaObservador, IBusquedaStrategy {
	
	HashMap<String, BusquedasTops> registro 
	
	new () {
		registro = new HashMap<String, BusquedasTops> ()
	}
	
	override recibirNotificacion(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	override ejecutarEstrategia(Usuario unUsuario, List<Receta> data) {
		procesar(unUsuario, data)
	}
	private def procesar(Usuario unUsuario, List<Receta> data) {
		val String sexo = String.valueOf(unUsuario.sexo); 
		var top = registro.get(sexo) 
		if (top == null) {
			top = new BusquedasTops()

		}
		top.recibirNotificacion(unUsuario, data)
		registro.put(sexo, top )
	}
	
}