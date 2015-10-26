package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RecetaAccesoPrivado extends RecetaAcceso {

//	Usuario usuarioCarga

	private new() {
	}

	new(Usuario unUsuario) {
		this.usuarioCarga = unUsuario;
	}

	override puedeVerme(Usuario unUsuario) {
		return this.usuarioCarga.equals(unUsuario) ||
			this.usuarioCarga.grupos.exists(
				grCarga|unUsuario.grupos.exists(grUsuario|grCarga.nombre.equalsIgnoreCase(grUsuario.nombre)))
	}

	override puedeModificarme(Usuario unUsuario) {
		return (this.usuarioCarga.equals(unUsuario))
	}

}
