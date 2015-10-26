package Tests

import Grupo6.BusinessException
import Grupo6.Receta
import Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import Grupo6.RecetaAccesoPublico
import Grupo6.RecetaAccesoPrivado

class Punto4Test {
	
	Usuario unUsuario
	Usuario otroUsuario
	
	
	Receta unaRecetaDeUnUsuario
	Receta unaRecetaDeOtroUsuario
	Receta unaRecetaPublica

	@Before
	def void init() {
		unUsuario = new Usuario(83, 1.88)
		unaRecetaDeUnUsuario = new Receta()
		unaRecetaDeUnUsuario.acceso = new RecetaAccesoPrivado(unUsuario)

		unaRecetaPublica = new Receta()
		unaRecetaPublica.acceso = new RecetaAccesoPublico()

		otroUsuario = new Usuario(83, 1.88)
		unaRecetaDeOtroUsuario = new Receta()
		unaRecetaDeOtroUsuario.acceso = new RecetaAccesoPrivado(otroUsuario)
	}

	@Test
	def void verRecetaPropia() {
		Assert.assertTrue(unaRecetaDeUnUsuario.puedeVerme(unUsuario))
	}

	@Test
	def void verRecetaPublica() {
		Assert.assertTrue(unaRecetaPublica.puedeVerme(unUsuario))
	}
	
	@Test
	def void verRecetaAjena() {
		Assert.assertFalse(unaRecetaDeOtroUsuario.puedeVerme(unUsuario))
	}

	@Test
	def void modificarRecetaPropia() {
		Assert.assertTrue(unaRecetaDeUnUsuario.puedeModificarme(unUsuario))
	}

	@Test
	def void modificarRecetaPublica() {
		Assert.assertTrue(unaRecetaPublica.puedeModificarme(unUsuario))
	}
	
	@Test
	def void modificarRecetaAjena() {
		Assert.assertFalse(unaRecetaDeOtroUsuario.puedeModificarme(unUsuario))
	}


}