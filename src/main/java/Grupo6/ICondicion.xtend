package Grupo6

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

interface ICondicion {
	def boolean seVerifica(Usuario unUsuario, List<Receta> data, BusquedaRecetas busquedaRecetas)
}