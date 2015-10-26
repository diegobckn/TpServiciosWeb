package Grupo6

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

class Regla {
	
	ICondicion condicion
	IAccion accion
	
	new (ICondicion cond, IAccion acc)
	{
		this.condicion = cond
		this.accion = acc
	}
	
	def void Ejecutar(Usuario unUsuario, List<Receta> data, BusquedaRecetas busquedaRecetas)
	{
		if (this.condicion.seVerifica(unUsuario, data, busquedaRecetas))
			this.accion.Ejecutar(unUsuario, data, busquedaRecetas)
	}
}