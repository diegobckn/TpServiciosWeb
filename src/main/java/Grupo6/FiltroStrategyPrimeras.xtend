package Grupo6

import java.util.List

class FiltroStrategyPrimeras implements IFiltroStrategy {
	
	int cuantas
	
	new ( int cuantas)
	{
		this.cuantas = cuantas
	}
	
	
	override filtrar(List<Receta> recetas , IAceptaSugerencias unSugerible) {
		recetas.take(cuantas).toList
	}
	
	
}