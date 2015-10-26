package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Hipertenso extends CondicionPreexistente {


	new() {
		condicion = "Hipertenso"
	}

	override validarSexo(Usuario usuario) {
	}

	override validarPreferencias(Usuario usuario) {
		if (usuario.preferencias.length() == 0) {
			throw new BusinessException("Debe ingresar el preferencias para los usuarios hipertensos")
		}

	}

	override validarObligatorios(Usuario usuario) {
	}

	override boolean getEsRutinaSaludable(Usuario elUsuario) {
		return (elUsuario.rutinaDeEjercicio.equals(RutinaEjercicio.ACTIVA) ||
			elUsuario.rutinaDeEjercicio.equals(RutinaEjercicio.INTENSIVA) )
	}

	override getEsRecetaApta(Receta laReceta) {
		return !(laReceta.verSiTiene(Alimento.SAL, 1))
	}


}
