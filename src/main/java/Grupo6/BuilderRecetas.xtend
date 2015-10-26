package Grupo6

import java.util.ArrayList
import java.util.List

class BuilderRecetas {

	Receta recetaCreada
	RecetaAcceso acceso
	List<IComponente> ingredientes
	int calorias
	String temporada
	List<IComponente> condimentos
	String nombre
	String dificultad

	new() {
		ingredientes = new ArrayList
		condimentos = new ArrayList
	}

	def setNombre(String newNombre){
		nombre = newNombre
	}

	def setAcceso(RecetaAcceso newAcceso) {
		acceso = newAcceso
	}
	
	def setDificultad (String newDificultad){
		dificultad = newDificultad
		
	}

	def agregarIngrediente(IComponente newIngrediente) {
		ingredientes.add(newIngrediente)
	}

	def agregarCondimento(IComponente newCondimento) {
		condimentos.add(newCondimento)
	}

	def setCalorias(int newCalorias) {
		calorias = newCalorias
	}

	def setTemporada(String newTemporada) {
		temporada = newTemporada
	}

	def Receta build() {
		recetaCreada = new Receta()
		recetaCreada.ingredientes.addAll(ingredientes)
		recetaCreada.setAcceso(acceso)
		recetaCreada.condimentos.addAll(condimentos)
		recetaCreada.calorias = calorias
		recetaCreada.nombre = nombre
		recetaCreada.dificultad = dificultad
		recetaCreada.temporada = temporada
		recetaCreada
	}
}
