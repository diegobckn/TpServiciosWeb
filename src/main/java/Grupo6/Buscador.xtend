package Grupo6

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors

class Buscador{
	List<IFiltroStrategy> filtros   
	
	new () {
		filtros = new ArrayList
	}
	
	def filtrar(Usuario unUsuario,List<Receta> seed) {
	  	filtros.fold (seed, [acum, f |	f.filtrar( acum, unUsuario).toList])
	}
	
	def agregarFiltros(Usuario usuario) {
		filtros.addAll(usuario.filtros)
	}
	
}