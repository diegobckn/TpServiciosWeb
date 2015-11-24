package Grupo6

import Tests.SharedTestComponents
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException

@Accessors
class RepositorioRecetas implements IFiltro {
	List<Receta> recetas
	Buscador buscador
	Receta recetaSeleccionada
	List<IBusquedaObservador> buscadores
	static RepositorioRecetas instance = null

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioRecetas()
		}
		instance
	}

	new() {
		recetas = new ArrayList<Receta>
		recetas.add(getRecetaPrueba())

		//		recetas.add(SharedTestComponents.getBifeConPure)
		buscador = new Buscador

	}

	def Iterable<Receta> getRecetasVisiblesPor(Usuario unUsuario) {
		return recetas.filter[it.puedeVerme(unUsuario)]
	}

	def Iterable<Receta> consultarRecetas(Usuario unUsuario) {
		return this.getRecetasVisiblesPor(unUsuario)
	}

	def List<Receta> buscarPorNombreReceta(String nombreReceta, List<Receta> resultado) {
		if (nombreReceta == null) {
			return resultado
		} else {
			return resultado.filter[receta|receta.nombre.toLowerCase.contains(nombreReceta.toLowerCase)].toList
		}
	}

	def List<Receta> buscarPorCalorias(Integer minCal, Integer maxCal, List<Receta> resultado) {
		if (minCal > maxCal) {
			throw new UserException("Las calorias mìnimas debe ser menores a las màximas")
		}

		if ((minCal == null || minCal == 0) || (maxCal == null || maxCal == 0)) {
			return resultado
		} else {
			return resultado.filter[receta|((receta.calorias > minCal) && (receta.calorias < maxCal))].toList
		}
	}

	def List<Receta> buscarPorDificultad(String dificultad, List<Receta> resultado) {
		if (dificultad == null || dificultad == "") {
			return resultado
		} else {
			return resultado.filter[receta|receta.dificultad.toLowerCase.contains(dificultad.toLowerCase)].toList
		}
	}

	def List<Receta> buscarPorTemporada(String temporada, List<Receta> resultado) {
		if (temporada == null || temporada === "") {
			return resultado
		} else {
			return resultado.filter[receta|receta.temporada.toLowerCase.contains(temporada.toLowerCase)].toList

		}
	}

	def List<Receta> buscarPorIngrediente(String ingrediente, List<Receta> resultado) {
		if (ingrediente == null || ingrediente === "") {
			return resultado
		} else {
			return resultado.filter[receta|receta.tieneIngrediente(ingrediente)].toList
		}
	}

	def List<Receta> filtrarConFiltrosUsuario(Usuario unUsuario) {
		buscador.agregarFiltros(unUsuario)
		this.consultarRecetasConFiltros(unUsuario, unUsuario.filtros)
	}

	def List<Receta> consultarRecetasConFiltros(Usuario unUsuario, List<IFiltroStrategy> filtros) {
		val List<Receta> seed = this.getRecetasVisiblesPor(unUsuario).toList
		val res = buscador.filtrar(unUsuario, seed)
		return res
	}

	override filtrar(Usuario unUsuario) {
		this.getRecetasVisiblesPor(unUsuario)
	}

	def Receta getRecetaPrueba() {
		val unaReceta = new Receta()

		unaReceta.acceso = new RecetaAccesoPublico
		var Ingrediente azucar = new Ingrediente()
		azucar.nombre = "Azucar"
		azucar.tipoDeAlimento = new Alimento("AZUCAR")
		azucar.cantidadEnGr = 350
		var Ingrediente leche = new Ingrediente()
		leche.nombre = "Leche"
		leche.tipoDeAlimento = new Alimento("LECHE")
		leche.cantidadEnGr = 1000
		var Ingrediente chispasChoco = new Ingrediente()
		chispasChoco.nombre = "Chispas de chocolate"
		chispasChoco.tipoDeAlimento = new Alimento("AZUCAR")
		chispasChoco.cantidadEnGr = 50

		unaReceta.nombre = "Dulce de Leche con Chocolate"
		unaReceta.temporada = "Todos los dias"
		unaReceta.dificultad = "Media"
		unaReceta.ingredientes.add(azucar)
		unaReceta.ingredientes.add(leche)
		unaReceta.condimentos.add(chispasChoco)
		unaReceta.calorias = 190

		unaReceta.pasos.add("paso1")
		unaReceta.pasos.add("paso2")
		unaReceta.pasos.add("paso3")
		unaReceta
	}

	def Receta getById(int id) {
		recetas.findFirst[r|r.id.equals(id)] // && r.puedeVerme(RepoUsuarios.getInstance.usuarioLogueado)]
	}

}
