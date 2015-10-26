package Grupo6

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

class AccionMarcarComoFavoritas implements IAccion  {

	override Ejecutar(Usuario unUsuario, List<Receta> data, BusquedaRecetas busquedaRecetas) {
		data.forEach[
			unUsuario.agregarAFavoritas(it)
		]
	}
	
}