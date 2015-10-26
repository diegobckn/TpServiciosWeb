package Grupo6

import java.util.List

interface IFiltroStrategy {
	def List<Receta> filtrar(List<Receta> listaDeRecetas, IAceptaSugerencias unSugerible)
}