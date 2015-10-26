package Tests

import Grupo6.Celiaco
import Grupo6.Diabetico
import Grupo6.RutinaEjercicio
import Grupo6.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test



class Punto2Test {
	Usuario unUsuarioConIMCExacto
	Usuario unUsuarioDiabeticoConRutinaSaludable
	Usuario unUsuarioDiabeticoSinRutinaSaludable
	Usuario unUsuarioConBuenIMC
	@Before
	def void init() {
		unUsuarioConIMCExacto = new Usuario(80,2)
		unUsuarioConBuenIMC = new Usuario(83,1.82)
		unUsuarioDiabeticoConRutinaSaludable = new Usuario(83, 1.5)
		unUsuarioDiabeticoSinRutinaSaludable = new Usuario(83, 1.5)
		
		unUsuarioDiabeticoConRutinaSaludable.condicionesPreexistentes.add(new Diabetico())
		unUsuarioDiabeticoSinRutinaSaludable.condicionesPreexistentes.add(new Diabetico())
		unUsuarioDiabeticoSinRutinaSaludable.condicionesPreexistentes.add(new Celiaco())
		unUsuarioDiabeticoConRutinaSaludable.rutinaDeEjercicio=RutinaEjercicio.ACTIVA
		unUsuarioDiabeticoSinRutinaSaludable.rutinaDeEjercicio=RutinaEjercicio.NADA
		
	}

	@Test
	def void conseguirIMC(){
		var double imc = 20
		
		Assert.assertEquals(imc,unUsuarioConIMCExacto.getIMC(), 1 )
	}

	@Test
	def void tieneIMCSaludable(){
		Assert.assertTrue(unUsuarioConBuenIMC.getEsRutinaSaludable)
	}
	
	@Test
	 def void tieneRutinaSaludable(){
	 	Assert.assertTrue(unUsuarioDiabeticoConRutinaSaludable.getEsRutinaSaludable)
	 }
	 
	 @Test
	 def void noTieneRutinaSaludable(){
	 	Assert.assertFalse(unUsuarioDiabeticoSinRutinaSaludable.getEsRutinaSaludable)
	 }
}