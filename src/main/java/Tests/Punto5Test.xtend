package Tests

import Grupo6.Alimento
import Grupo6.Ingrediente
import Grupo6.Receta
import Grupo6.RecetaAccesoPublico
import org.junit.Before
import org.junit.Test

class Punto5Test {
	Receta recetaPure
	Receta recetaBifeConPure
	Ingrediente papa
	Ingrediente leche
	Ingrediente bife

	@Before
	def void init() {
		recetaPure = new Receta()
		recetaPure.acceso = new RecetaAccesoPublico()
		
		papa = new Ingrediente()
		papa.nombre = "Papa"
		papa.tipoDeAlimento = new Alimento("PAPA")
		papa.cantidadEnGr = 500

		leche = new Ingrediente()
		leche.nombre = "Leche"
		leche.tipoDeAlimento = new Alimento("LECHE")
		leche.cantidadEnGr = 500
		
		
		recetaPure.ingredientes.add(papa)
		recetaPure.ingredientes.add(leche)

		recetaBifeConPure = new Receta()
		recetaBifeConPure.acceso = new RecetaAccesoPublico()

		bife = new Ingrediente()
		bife.nombre = "bife"
		bife.tipoDeAlimento = Alimento.getCARNE()
		bife.cantidadEnGr = 200
		
		recetaBifeConPure.ingredientes.add(bife)
		recetaBifeConPure.ingredientes.add(recetaPure)

	}

	@Test
	def void verRecetaPropia() {
		recetaBifeConPure.ingredientes.add(recetaPure)		
	}
	
}