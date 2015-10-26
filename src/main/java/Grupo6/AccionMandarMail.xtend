package Grupo6

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

class AccionMandarMail implements IAccion {
	
	Mensaje mensaje
	
	new (Mensaje mens) {
		this.mensaje = mens
	}
	
	override Ejecutar(Usuario unUsuario, List<Receta> data, BusquedaRecetas busquedaRecetas) {
		val IMailSender sender = null
		if (sender.equals(null)) {
			var Mensaje mens = new Mensaje()
			mens.de = mensaje.de
			mens.texto = String.format(this.mensaje.texto, unUsuario.nombre, busquedaRecetas.toString)
			sender.Enviar(mens)
		}
	}
	
}