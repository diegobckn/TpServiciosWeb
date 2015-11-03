package Grupo6

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

import org.uqbar.commons.model.UserException
import Tests.SharedTestComponents

@Accessors

class RepoUsuarios {

	List<Usuario> usuariosAprobados = new ArrayList<Usuario>
	List<Usuario> usuariosPendientes = new ArrayList<Usuario>
	Usuario usuarioLogueado = null
	List<Grupo> grupos
	
	static RepoUsuarios instance

	new() {
		grupos = new ArrayList<Grupo>
		this.crearUsuariosDefault()
	}

	def static RepoUsuarios getInstance() {
		if (instance == (null)) {
			instance = new RepoUsuarios()
		}
		instance
	}

	def void add(Usuario unUsuario) {
		usuariosPendientes.add(unUsuario)
	}

	def void remove(Usuario unUsuario) {
		if (unUsuario.nombre != "") {
			usuariosAprobados.remove(usuariosAprobados.findFirst[it.nombre == unUsuario.nombre])
			usuariosPendientes.remove(usuariosPendientes.findFirst[it.nombre == unUsuario.nombre])
		}
	}

	def void update(Usuario unUsuario) {
		var usu = usuariosAprobados.findFirst[it.nombre == unUsuario.nombre]
		if (usu == null) {
			usu = usuariosPendientes.findFirst[it.nombre == unUsuario.nombre]
		}
		if (usu != null) {
			usu.modificar(unUsuario)
		}
	}

	def Usuario get(Usuario unUsuario) {
		usuariosAprobados.findFirst[it.nombre == unUsuario.nombre]
	}

	def List<Usuario> list(Usuario usuarioEjemplo) {
		usuariosAprobados.filter[coincidenCondiciones(it, usuarioEjemplo.condicionesPreexistentes)].toList
	}

	def boolean coincidenCondiciones(Usuario usuario, List<CondicionPreexistente> preexistentes) {
		preexistentes.isEmpty() // || usuario.condicionesPreexistentes.forall[ it.]  .stream().anyMatch(condicion -> preexistentes.contains(condicion));
	}

//
//	def List<Usuario> listPendinds(Usuario unUsuario) {
//		usuariosPendientes.filter[coincidenCondiciones(it, usuarioEjemplo.condicionesPreexistentes)].toList
//	}
//
//	private boolean coincidenCondiciones(Usuario unUsuario, List<condicionesPreexistentes> condiciones) {
//		return condiciones.isEmpty() || unUsuario.condicionesPreexistentes.stream().anyMatch(condicion -> condiciones.contains(condicion));
//	}
	def void approve(Usuario unUsuario) {
		var usu = usuariosPendientes.findFirst[it.nombre == unUsuario.nombre]
		if (usu != null) {
			usuariosAprobados.add(unUsuario)
			usuariosPendientes.remove(usu)
		}
	}

	def void deny(Usuario unUsuario) {
		var usu = usuariosPendientes.findFirst[it.nombre == unUsuario.nombre]
		if (usu != null) {
			usuariosPendientes.remove(usu)
		}
	}

	def crearUsuariosDefault() {
		val repo = RepositorioRecetas.getInstance()
		var recetaPublica1 = SharedTestComponents.getBifeConPure()
		val user1 = new Usuario(0, 0)
		user1.nombre = "Clark Kent"
		user1.clave = "cLark"
		user1.agregarAFavoritas(recetaPublica1)
		repo.recetas.add(recetaPublica1)

		val user2 = new Usuario(0, 0)
		user2.nombre = "Lana Lang"
		user2.clave = "lAna"

		val user3 = SharedTestComponents.getUsuarioConSobrepeso
		user3.filtros.add(new FiltroStrategyPorSobrePeso)
		user3.nombre = "Lex Luthor"
		user3.clave = "lEx"

		usuariosAprobados.add(user1)
		usuariosAprobados.add(user2)
		usuariosAprobados.add(user3)
		
		//DATOS PARA PRUEBAS//
		val recetaAux = new Receta()
		recetaAux.setAcceso(new RecetaAccesoPrivado(user1))
		recetaAux.nombre = "Receta privada Clark"
		recetaAux.calorias = 9200
		recetaAux.dificultad = "Media"
		recetaAux.temporada = "Primavera"
		repo.recetas.add(recetaAux)

		var miGrupo = new Grupo()
		miGrupo.nombre = "Grupo Copado"
		miGrupo.agregarUsuario(user1)
		miGrupo.agregarUsuario(user2)
		grupos.add(miGrupo)
		val recetaDeOtro = new Receta()
		recetaDeOtro.setAcceso(new RecetaAccesoPrivado(user2))
		recetaDeOtro.nombre = "Receta privada Lana"
		recetaDeOtro.calorias = 1200
		recetaDeOtro.dificultad = "Baja"
		recetaDeOtro.temporada = "Verano"

		repo.recetas.add(recetaDeOtro)
	}

	def chequearUsuario(String nombre, String clave) {
		var res = usuariosAprobados.findFirst[u|u.nombre.equals(nombre) && u.clave.equals(clave)]
		if (res !== null) {
			usuarioLogueado = res
		} else {
			throw new UserException("Datos incorrectos")
		}
	}

}
