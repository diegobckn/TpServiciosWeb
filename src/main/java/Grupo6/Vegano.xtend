package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Vegano extends CondicionPreexistente {

	String condicion

	new() {
		condicion = "vegano"
	}

	override validarSexo(Usuario usuario) {
	}

	override validarPreferencias(Usuario usuario) {
		if (usuario.preferencias.exists[t|t == "Pollo"] && usuario.preferencias.exists[t|t == "Carne"] &&
			usuario.preferencias.exists[t|t == "Chivito"] && usuario.preferencias.exists[t|t == "Chori"]) {
			throw new BusinessException(
				"No puede ingresar Pollo, Carne, Chivito ni Chori
										 como preferencias para los usuarios veganos")
		}
	}

	override validarObligatorios(Usuario usuario) {
	}

	override boolean getEsRutinaSaludable(Usuario elUsuario) {
		return (elUsuario.preferencias.exists[t|t == "Frutas"])
	}

	override getEsRecetaApta(Receta laReceta) {
		return !(laReceta.verSiTiene(Alimento.CARNE, 1))
	}


}
