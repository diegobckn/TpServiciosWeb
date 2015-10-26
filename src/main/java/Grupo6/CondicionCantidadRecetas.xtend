package Grupo6

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

class CondicionCantidadRecetas implements ICondicion {
	int cantidad
	
	new (int cantidad) {
		this.cantidad = cantidad
	}
	
	override seVerifica(Usuario unUsuario, List<Receta> data, BusquedaRecetas busquedaRecetas) {
		data.size > this.cantidad 
	}
	
}