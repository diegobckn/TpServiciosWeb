package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Celiaco extends CondicionPreexistente {

	String condicion

	new() {
		condicion = "Celiaco"
	}

	override getEsRecetaApta(Receta laReceta) {
		return !laReceta.verSiTiene(Alimento.HARINA, 1)
	}

	override getEsRutinaSaludable(Usuario elUsuario) {
		return true
	}

	override validarObligatorios(Usuario elUsuario) {
	}

	override validarPreferencias(Usuario elUsuario) {
	}

	override validarSexo(Usuario elUsuario) {
	}
	



}
