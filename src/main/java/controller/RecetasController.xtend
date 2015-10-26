package controller

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import applicationModel.QueComemosBuscador
import Grupo6.Receta
import java.util.ArrayList
import Grupo6.Usuario
import applicationModel.QueComemosLogin

@Controller
class RecetasController {
	QueComemosBuscador am = new QueComemosBuscador()
	QueComemosLogin amUsu = new QueComemosLogin()
	extension JSONUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(RecetasController, 9000)
	}


	@Get("/recetas")
	def Result recetas() {
		amUsu.usuario = "Lex Luthor"
		amUsu.clave = "lEx";
		amUsu.checkLogin()
		var usuarioHardCoded = amUsu.repoUsuarios.usuarioLogueado
		am.usuarioLogueado = usuarioHardCoded
		am.lista()
		var recetas = am.resultado//.instance.tareasPendientes

		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
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
