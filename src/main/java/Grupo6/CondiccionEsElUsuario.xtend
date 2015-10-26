package Grupo6

import Grupo6.ICondicion
import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

class CondiccionEsElUsuario implements ICondicion {
	
	Usuario usuario
	new (Usuario unUsuario) {
		usuario = unUsuario
	}
	
	override seVerifica(Usuario unUsuario, List<Receta> data, BusquedaRecetas busquedaRecetas) {
		usuario.equals(unUsuario)
	}
	
}