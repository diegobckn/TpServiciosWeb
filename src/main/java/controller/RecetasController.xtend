package controller

import applicationModel.QueComemosBuscador
import applicationModel.QueComemosLogin
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Body
import Grupo6.Receta
import org.uqbar.xtrest.api.annotation.Post
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.core.type.TypeReference
import java.util.HashMap
import java.util.Map

@Controller
class RecetasController {

	QueComemosBuscador amBuscadorRecetas = new QueComemosBuscador()
	QueComemosLogin amUsu = new QueComemosLogin()
	String nombre
	String clave
	extension JSONUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(RecetasController, 9000)
	}
	
	@Post("/login")
	def	Result setLogin(@Body String body){
		nombre = body.getPropertyValue("nombre") as String
		clave = body.getPropertyValue("clave") as String
		
		try {
        amBuscadorRecetas.usuarioLogueado = amUsu.loguear(nombre,clave)
        ok(amBuscadorRecetas.usuarioLogueado.toJson);
	    } catch (Exception e) {
	        badRequest(e.message)
	    }
	}
	
	@Get("/logclark")
	def	Result logclark(@Body String body){
		nombre = "Clark Kent"
		clave = "cLark"
		
		try {
        amBuscadorRecetas.usuarioLogueado = amUsu.loguear(nombre,clave)
        ok(amBuscadorRecetas.usuarioLogueado.toJson);
	    } catch (Exception e) {
	        badRequest(e.message)
	    }
	}
	
	@Get("/quecomemos/logclark")
	def	Result queComemosLogclark(@Body String body){
		nombre = "Clark Kent"
		clave = "cLark"
		
		try {
        amBuscadorRecetas.usuarioLogueado = amUsu.loguear(nombre,clave)
        ok(amBuscadorRecetas.usuarioLogueado.toJson);
	    } catch (Exception e) {
	        badRequest(e.message)
	    }
	}
	
	@Get("/loglex")
	def	Result loglex(@Body String body){
		nombre = "Lex Luthor"
		clave = "lEx"
		
		try {
        amBuscadorRecetas.usuarioLogueado = amUsu.loguear(nombre,clave)
        ok(amBuscadorRecetas.usuarioLogueado.toJson);
	    } catch (Exception e) {
	        badRequest(e.message)
	    }
	}
	
	
	@Get("/quecomemos/loglex")
	def	Result queComemosLoglex(@Body String body){
		nombre = "Lex Luthor"
		clave = "lEx"
		
		try {
        amBuscadorRecetas.usuarioLogueado = amUsu.loguear(nombre,clave)
        ok(amBuscadorRecetas.usuarioLogueado.toJson);
	    } catch (Exception e) {
	        badRequest(e.message)
	    }
	}

	@Get("/recetas")//p
	def Result recetas() {
		amBuscadorRecetas.lista()
		var recetas = amBuscadorRecetas.resultado
		
		recetas.forEach[r | amBuscadorRecetas.usuarioLogueado.setColorFondo(r)]

		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
	
	
	@Get("/quecomemos/recetas")//p
	def Result queComemosRecetas() {
		amBuscadorRecetas.lista()
		var recetas = amBuscadorRecetas.resultado
		
		recetas.forEach[r | amBuscadorRecetas.usuarioLogueado.setColorFondo(r)]

		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
	
	
	@Get("/label")
	def Result findLabel() {
		var label = amBuscadorRecetas.labelResultado
		ok(label)
	}
	
	@Post("/buscar-recetas")//p
	def Result buscarRecetas(@Body String body) {
		try {
		amBuscadorRecetas.usuarioLogueado = amUsu.checkLogin()

		amBuscadorRecetas.busquedaNombre = body.getPropertyValue("nombre") as String
		amBuscadorRecetas.busquedaCaloriasMinima = Integer.valueOf(body.getPropertyValue("caloriasMinima") as String)
		amBuscadorRecetas.busquedaCaloriasMaxima = Integer.valueOf(body.getPropertyValue("caloriasMaxima") as String)
		amBuscadorRecetas.busquedaIngrediente = body.getPropertyValue("conIngrediente")as String
		amBuscadorRecetas.busquedaDificultad = body.getPropertyValue("dificultad")as String
		amBuscadorRecetas.busquedaTemporada = body.getPropertyValue("temporada")as String
		amBuscadorRecetas.busquedaConFiltros = Boolean.valueOf(body.getPropertyValue("conFiltros") as String)

	
	
		amBuscadorRecetas.buscar()
		var resultado = amBuscadorRecetas.resultado
		resultado.forEach[r | amBuscadorRecetas.usuarioLogueado.setColorFondo(r)]
		response.contentType = ContentType.APPLICATION_JSON
		ok(resultado.toJson)
	    } catch (Exception e) {
	        badRequest(e.message)
	    }
	}
	

	
	@Post("/hacer-favorita/:id") //p
	def Result hacerFavorita() {
		val iId = Integer.valueOf(id)
		amBuscadorRecetas.usuarioLogueado = amUsu.checkLogin()

		amBuscadorRecetas.hacerFavorita(iId)
		
		response.contentType = ContentType.APPLICATION_JSON
		ok('{ "status" : "OK" }');
	}
	
	
	@Get("/check-favorita/:id")
	def Result checkFavorita() {
		val iId = Integer.valueOf(id)
		amBuscadorRecetas.usuarioLogueado = amUsu.checkLogin()

		var esFavorita = amBuscadorRecetas.checkFavorita(iId)
		
		response.contentType = ContentType.APPLICATION_JSON
		ok(esFavorita.toJson)
	}

	@Get("/receta/:id")
	def Result receta() {
		val iId = Integer.valueOf(id)
		var receta = amBuscadorRecetas.getElegida(iId)
		response.contentType = ContentType.APPLICATION_JSON

		ok(receta.toJson)
	}
	
	@Get("/quecomemos/receta/:id")
	def Result queComemosReceta() {
		val iId = Integer.valueOf(id)
		var receta = amBuscadorRecetas.getElegida(iId)
		response.contentType = ContentType.APPLICATION_JSON

		ok(receta.toJson)
	}

	@Get("/copiar-receta/:id")
	def Result copiarReceta() {
		val cId = Integer.valueOf(id)
		var receta = amBuscadorRecetas.getElegida(cId)
		response.contentType = ContentType.APPLICATION_JSON

		ok(receta.toJson)
	}

	@Post('/copiar-receta/:id')
	def Result copiar(@Body String body) {
		val iId = Integer.valueOf(id)
		var copia = body.fromJson(Receta)
		amUsu.checkLogin()
		amBuscadorRecetas.usuarioLogueado = amUsu.repoUsuarios.usuarioLogueado
		amBuscadorRecetas.nombreCopia = copia.nombre
		
		amBuscadorRecetas.hacerCopia(iId)
		

		response.contentType = ContentType.APPLICATION_JSON
		ok('{ "status" : "OK" }');
	}
	
	
	
	def getPropertyValue(String body, String propiedad) {
	val propiedades = new ObjectMapper().readValue(body,
		new TypeReference<HashMap<String, String>>() {})
		(propiedades as Map).get(propiedad)
	}
	

}
