package applicationModel

import org.eclipse.xtend.lib.annotations.Accessors

import Grupo6.RepoUsuarios

@Accessors

class QueComemosLogin {
	String usuario = ""
	String clave = ""
	RepoUsuarios repoUsuarios
	
	new() {
		repoUsuarios = RepoUsuarios.getInstance
	}
	
	def checkLogin(){
		repoUsuarios.chequearUsuario(usuario,clave)
	}
	
	
}