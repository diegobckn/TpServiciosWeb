package Grupo6


import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

abstract class RecetaAcceso {
	public Usuario usuarioCarga 
	def boolean puedeVerme(Usuario unUsuario)
	def boolean puedeModificarme(Usuario unUsuario)
}