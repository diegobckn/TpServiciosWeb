package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
class RecetaAccesoPrivado extends RecetaAcceso {

//	Usuario usuarioCarga
	List<Grupo> misGrupos
	
	private new() {
		misGrupos = new ArrayList<Grupo>
	}

	new(Usuario unUsuario) {
		this.usuarioCarga = unUsuario;
	}

	override puedeVerme(Usuario unUsuario) {
		
		misGrupos = RepoUsuarios.getInstance().grupos.filter(g | g.participantes.contains(unUsuario)).toList
		
		return this.usuarioCarga.equals(unUsuario) ||
			misGrupos.contains(usuarioCarga)
//			this.usuarioCarga.grupos.exists(
//				grCarga|unUsuario.grupos.exists(grUsuario|grCarga.nombre.equalsIgnoreCase(grUsuario.nombre)))
				
	}

	override puedeModificarme(Usuario unUsuario) {
		return (this.usuarioCarga.equals(unUsuario))
	}

}
