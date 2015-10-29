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

@Controller
class RecetasController {
	QueComemosBuscador amBuscadorRecetas = new QueComemosBuscador()
	QueComemosLogin amUsu = new QueComemosLogin()
	extension JSONUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(RecetasController, 9000)
	}
	
	@Get("/login")
	def Result login() {
		ok('{ "status" : "OK" }');
	}
	
	@Get("/recetas")
	def Result recetas() {
		amUsu.usuario = "Lex Luthor"
		amUsu.clave = "lEx";
		amUsu.checkLogin()
		var usuarioHardCoded = amUsu.repoUsuarios.usuarioLogueado
		amBuscadorRecetas.usuarioLogueado = usuarioHardCoded
		amBuscadorRecetas.lista()
		var recetas = amBuscadorRecetas.resultado

		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
	
	
	@Get("/check-favorita/:id")
	def Result checkFavorita() {
		val iId = Integer.valueOf(id)
		amUsu.usuario = "Lex Luthor"
		amUsu.clave = "lEx";
		amUsu.checkLogin()
		amBuscadorRecetas.usuarioLogueado = amUsu.repoUsuarios.usuarioLogueado
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
		amUsu.usuario = "Lex Luthor"
		amUsu.clave = "lEx";
		amUsu.checkLogin()
		amBuscadorRecetas.usuarioLogueado = amUsu.repoUsuarios.usuarioLogueado
		amBuscadorRecetas.nombreCopia = copia.nombre
		
		amBuscadorRecetas.hacerCopia(iId)
		

		response.contentType = ContentType.APPLICATION_JSON
		ok('{ "status" : "OK" }');
	}

//	@Put('/tareas/:id')
//	def Result actualizar(@Body String body) {
//		val actualizado = body.fromJson(Tarea)
//		if (Integer.parseInt(id) != actualizado.id) {
//			return badRequest('{ "error": "Id en URL distinto del body"}')
//		}
//	
//		RepoTareas.instance.update(actualizado)
//		ok('{ "status" : "OK" }');
//	}
}
