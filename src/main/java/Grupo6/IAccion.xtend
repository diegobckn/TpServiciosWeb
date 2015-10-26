package Grupo6

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

interface IAccion {
	def void Ejecutar(Usuario unUsuario, List<Receta> data, BusquedaRecetas busquedaRecetas)
}