package Grupo6

import java.util.List

class FiltroStrategyAptas implements IFiltroStrategy {
	
	override filtrar(List<Receta> recetas , IAceptaSugerencias unSugerible) {
		recetas.filter[ unSugerible.getEsRecetaAptaParaMi(it) ].toList
	}
	
	
}