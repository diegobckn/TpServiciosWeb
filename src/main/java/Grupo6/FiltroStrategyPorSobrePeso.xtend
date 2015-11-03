package Grupo6

import java.util.List
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown = true)
class FiltroStrategyPorSobrePeso implements IFiltroStrategy {
	
	
	override filtrar(List<Receta> recetas , IAceptaSugerencias unSugerible) {
		recetas.filter[ !unSugerible.tieneSobrepeso || it.calorias < 500 ].toList
	}
	
}