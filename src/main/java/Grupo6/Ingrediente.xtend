package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors



@Accessors
class Ingrediente implements IComponente{
	
	String nombre
	Alimento tipoDeAlimento
	double cantidadEnGr 
	
	override verSiTiene(Alimento unAlimento, double unaCantidad) {
		val tiene = (unAlimento.nombre.equalsIgnoreCase(tipoDeAlimento.nombre ) && cantidadEnGr >= unaCantidad)
		return tiene
	}
	
	override tieneIngrediente(String nombreBuscado) {
		if (nombreBuscado.equals(nombre.toLowerCase)){
			true
		} else {
			false
		}
	}
	
	
}