package applicationModel

import Grupo6.CondicionPreexistente
import Grupo6.Receta
import Grupo6.RepositorioRecetas
import Grupo6.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
class QueComemosBuscador {
	Receta recetaElegida
	Usuario usuarioLogueado
	Integer busquedaCaloriasMinima = 0
	Integer busquedaCaloriasMaxima = 0
	String busquedaNombre = ""
	String busquedaIngrediente = ""
	String busquedaDificultad = ""
	String busquedaTemporada = ""
	List<Receta> resultado
	boolean busquedaConFiltros = false
	String labelResultado = ""
	String nombreCopia	= ""
	
	new() {
	}
	
	
	
	def repo(){
		return RepositorioRecetas.getInstance()
	}

	def void buscar()
	{
		 resultado = newArrayList
		
			resultado = repo.getRecetasVisiblesPor(usuarioLogueado).toList()

			if (busquedaConFiltros) {
				resultado = repo.filtrarConFiltrosUsuario(usuarioLogueado)
			} else {
		
			resultado = repo.buscarPorNombreReceta(busquedaNombre, resultado)
			var int minima = new Integer(busquedaCaloriasMinima)
			var int maxima = new Integer(busquedaCaloriasMaxima)
			resultado = repo.buscarPorCalorias(minima, maxima, resultado)
			resultado = repo.buscarPorDificultad(busquedaDificultad, resultado)
			resultado = repo.buscarPorTemporada(busquedaTemporada, resultado)
			resultado = repo.buscarPorIngrediente(busquedaIngrediente, resultado)
//			usuarioLogueado.ultimasRecetasConsultadas = resultado
				}
	}
	
	def void lista()
	{
		resultado = new ArrayList<Receta>()
		if (usuarioLogueado.recetasFavoritas.size > 0) {
			resultado.addAll(usuarioLogueado.recetasFavoritas)
			labelResultado = "Estas son tus recetas favoritas"
		} else if (usuarioLogueado.ultimasRecetasConsultadas.size > 0) {
			labelResultado = "Estas son tus ultimas consultas"
			resultado.addAll(usuarioLogueado.ultimasRecetasConsultadas)
		} else {
			resultado = repo.getRecetasVisiblesPor(usuarioLogueado).toList()
			labelResultado = "Estas son las recetas Disponibles"
		}
	}
	
	
	
	def List<CondicionPreexistente> condicionesPermitidas(int id){
		seleccionarReceta(id)
		return recetaElegida.getCondicionesQueCumple()
	} 
	
	
		
	def limpiar()
	{
		resultado = new ArrayList<Receta>()
		labelResultado = "Busqueda reseteada"
		usuarioLogueado.ultimasRecetasConsultadas.clear()
	}
	
	def getElegida(int id){
		return repo.getById(id)
	}
	
	
	def seleccionarReceta(int id){
		recetaElegida = getElegida(id)
	}	
	
	def hacerCopia(int id){
		seleccionarReceta(id)
		var Receta copia = recetaElegida.getCopia(usuarioLogueado)
		copia.nombre = nombreCopia
		repo.recetas.add(copia)
	}
	
	def boolean checkFavorita(int id){
		seleccionarReceta(id)
		return usuarioLogueado.recetasFavoritas.exists[it.id.equals(recetaElegida.id)]
	}
	
	def void hacerFavorita(int id){
		seleccionarReceta(id)
		usuarioLogueado.agregarAFavoritas(recetaElegida)
	}
	
}
