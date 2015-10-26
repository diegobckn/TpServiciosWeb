package Grupo6

class RecetaAccesoPublico extends RecetaAcceso {
	
	new(){
		usuarioCarga = new Usuario(1,1)
		usuarioCarga.nombre = "Público"
	}

	override puedeVerme(Usuario unUsuario) {
		return true
	}
	
	override puedeModificarme(Usuario unUsuario) {
		return true
	}
}