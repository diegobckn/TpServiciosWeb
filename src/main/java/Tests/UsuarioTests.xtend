package Tests

import Grupo6.BusinessException
import Grupo6.Diabetico
import Grupo6.Receta
import Grupo6.Usuario
import java.util.Date
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class UsuarioTest {

	Usuario unUsuario
	Usuario unDiabetico
	
	Receta unaReceta

	@Before
	def void init() {
		unUsuario = new Usuario(83, 1.88)
		unDiabetico = new Usuario(83, 1.88)

		unDiabetico.condicionesPreexistentes.add(new Diabetico())
	}

	@Test
	def void obtieneIMC() {
		Assert.assertEquals(unUsuario.getIMC(), 23.48, 0.01)
	}

	@Test(expected=typeof(BusinessException))
	def void usuarioConNombreCorto() {
		unUsuario.nombre = "Jua"
		unUsuario.validar()
	}

	@Test
	def void usuarioDiabeticoValido() {
		unDiabetico.nombre = "Juan"
		unDiabetico.fechaDeNacimiento = new Date(1979, 2, 20)
		unDiabetico.sexo = 'M'
		unDiabetico.preferencias.add("Pollo")
		unDiabetico.validar()
		Assert.assertEquals(unDiabetico.nombre, "Juan")
	}
	
	@Test(expected=typeof(BusinessException))
	def void usuarioDiabeticoSinFechaDeNacimiento() {
		unDiabetico.nombre = "Juan"
		unDiabetico.sexo = 'M'
		unDiabetico.preferencias.add("Pollo")
		unDiabetico.validar()
		Assert.assertEquals(unDiabetico.nombre, "Juan")
	}


//	@Test
//	def void crearReceta() {
//		alim = new Alimento("Azucar", Diabetico, 100)
//		
//		unaReceta.ingredientes.add(new Ingrediente(new Alimento("Azucar", ), 100))
//		unaReceta.ingredientes.add(new Ingrediente(new Azucar("Chango"), 100))
//	}

}
