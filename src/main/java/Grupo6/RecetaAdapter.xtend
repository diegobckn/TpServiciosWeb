package Grupo6

class RecetaAdapter {
	
	static def Receta fromRecetaExterna(queComemos.entrega3.dominio.Receta recetaExt)
	{
		val Receta unaReceta = new Receta()
		unaReceta.nombre = recetaExt.nombre
		unaReceta.dificultad = recetaExt.dificultadReceta.toString()
		unaReceta.calorias = recetaExt.totalCalorias
		recetaExt.ingredientes.forEach[ 
			var ing = new Ingrediente();
			ing.nombre = it;
			ing.cantidadEnGr = 0;
			ing.tipoDeAlimento = new Alimento(it);
			unaReceta.ingredientes.add(ing); 
		]
		unaReceta.acceso = new RecetaAccesoPublico() 
		return unaReceta
	}
}