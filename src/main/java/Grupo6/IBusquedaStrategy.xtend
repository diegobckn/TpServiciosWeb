package Grupo6

import java.util.List

interface IBusquedaStrategy {
	
	def void ejecutarEstrategia(Usuario unUsuario, List<Receta> data)

}