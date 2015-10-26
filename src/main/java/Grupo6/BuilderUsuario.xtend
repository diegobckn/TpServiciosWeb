package Grupo6

import java.util.List
import java.util.ArrayList

class BuilderUsuario {
	
	Usuario usuarioCreado
	char sexo
	double altura
	double peso
	List<CondicionPreexistente> condicionesPreexistentes
	
	RutinaEjercicio rutinaDeEjercicio
	
	new () {
		condicionesPreexistentes = new ArrayList
	}
	
	def setAltura(double newAltura) {
		altura = newAltura
	}
	
	def setPeso(double newPeso) {
		peso = newPeso
	}
	
	def setSexo(char newSexo) {
		sexo = newSexo
	}
	
	def newCondicionesPreexistentes(CondicionPreexistente newCondicion) {
		condicionesPreexistentes.add(newCondicion)
	}
	
	def setRutinaDeEjercicio(RutinaEjercicio newRutina) {
		rutinaDeEjercicio = newRutina
	}
	
	
	def Usuario build () {
		usuarioCreado = new Usuario(altura, peso)
		usuarioCreado.condicionesPreexistentes.addAll(condicionesPreexistentes)
		usuarioCreado.rutinaDeEjercicio = rutinaDeEjercicio
		usuarioCreado.sexo = sexo
		
		usuarioCreado
	} 
	
}