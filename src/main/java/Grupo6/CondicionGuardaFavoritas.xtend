package Grupo6

import Grupo6.ICondicion
import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

class CondicionGuardaFavoritas implements ICondicion {
	
	override seVerifica(Usuario unUsuario, List<Receta> data, BusquedaRecetas busquedaRecetas) {
		unUsuario.guardarSiempreFavoritas
	}
	
}