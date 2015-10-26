package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors
import Grupo6.Usuario

@Accessors

class Diabetico extends CondicionPreexistente {
	String condicion
	
	new (){
		condicion="Diabetico"
	}
	override validarSexo(Usuario usuario) {
		if (usuario.sexo == "") {
			throw new BusinessException("Debe ingresar el sexo para los usuarios diabeticos")
		}
	}
	
	override validarPreferencias(Usuario usuario) {
		if ( usuario.preferencias.length() == 0){
			throw new BusinessException("Debe ingresar el preferencias para los usuarios diabeticos")
		}
		
	}
	
	override validarObligatorios(Usuario usuario) {
		if ( usuario.fechaDeNacimiento == null){
			throw new BusinessException("Debe ingresar la fecha de nacimiento para los usuarios diabeticos")
		}
	}
	
	override boolean getEsRutinaSaludable(Usuario elUsuario){
		return (elUsuario.peso < 70 || elUsuario.rutinaDeEjercicio.equals(RutinaEjercicio.ACTIVA) || elUsuario.rutinaDeEjercicio.equals(RutinaEjercicio.INTENSIVA) )
	}
	
	override  getEsRecetaApta(Receta laReceta)
	{
		//recorrer ingredietes y ver si hay azucar
		//si hay chequear si son mas de 100g	
		return !laReceta.verSiTiene(Alimento.AZUCAR, 100)
		
	}
		
}
