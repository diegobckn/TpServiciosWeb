package Grupo6

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Grupo implements IAceptaSugerencias {

	String nombre
	List<String> comidasQueGustan
	List<Usuario> participantes

	new() {
		comidasQueGustan = new ArrayList<String>()
		participantes = new ArrayList<Usuario>()
	}

	def void agregarUsuario(Usuario unUsuario) {
		participantes.add(unUsuario);
//		unUsuario.grupos.add(this)
	}

	def void quitarUsuario(Usuario unUsuario) {
		participantes.remove(unUsuario);
//		unUsuario.grupos.remove(this)
	}

	override getEsSugeridaParaMi(Receta unaReceta) {
		val gusta = comidasQueGustan.exists[unaReceta.verSiTiene(new Alimento(it), 0)]
		val sugeridaParaTodos = this.getEsSugeridaParaMisParticipantes(unaReceta)
//		System.out.println("grupo ");
//		System.out.println("sugeridaParaTodos : " + sugeridaParaTodos);
//		System.out.println("gusta : " + gusta);
		return gusta && sugeridaParaTodos
	}

	def boolean getEsSugeridaParaMisParticipantes(Receta unaReceta) {
		val paraTodos = participantes.forall[it.getEsSugeridaParaMi(unaReceta)]
		return paraTodos
	}
	
	override getTieneSobrepeso() {
		val sumIMC = participantes.map[s|s.getIMC].reduce[sum, size | sum + size]
		return (sumIMC / participantes.size) > 25
	}
	
	override getEsRecetaAptaParaMi(Receta unaReceta) {
		val paraTodos = participantes.forall[it.getEsRecetaAptaParaMi(unaReceta)]
		return paraTodos
	}

}
