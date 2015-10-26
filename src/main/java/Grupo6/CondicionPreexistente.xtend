package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors



@Accessors
abstract class CondicionPreexistente {
	
	String condicion
	
	def void validarObligatorios (Usuario elUsuario)
	def void validarSexo (Usuario elUsuario)
	def void validarPreferencias (Usuario elUsuario)
	def boolean getEsRutinaSaludable(Usuario elUsuario)
	
	def boolean getEsRecetaApta(Receta laReceta)
	
}