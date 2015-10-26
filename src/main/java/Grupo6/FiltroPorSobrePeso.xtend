package Grupo6

import Grupo6.IFiltro

class FiltroPorSobrePeso implements IFiltro {
	
	IFiltro filtro
	
	new (IFiltro filtro)
	{
		this.filtro = filtro
	}
	
	override filtrar(Usuario unUsuario) {
		filtro.filtrar(unUsuario)
			.filter[ !unUsuario.tieneSobrepeso || it.calorias < 500 ]
	}
	
}