package Grupo6

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
class Receta implements IComponente {
	int blah
	static int creadas = 0
	int id
	String nombre
	List<IComponente> ingredientes
	List<String> pasos
	int calorias
	String dificultad
	String temporada
	RecetaAcceso acceso
	String color
	List<IComponente> condimentos
	List<CondicionPreexistente> condicionesPreexistentes
	
	new () {
		init()
	} 
	
	new(String nombre){
		init()
		this.nombre = nombre
	}
	
	def init(){
		Receta.creadas += 1
		id = Receta.creadas
		ingredientes = new ArrayList<IComponente>()	
		pasos = new ArrayList<String>()
		condimentos = newArrayList
		condicionesPreexistentes = newArrayList
	}
	
 	override verSiTiene(Alimento unAlimento, double unaCantidad) {
		val tiene = ingredientes.exists[it.verSiTiene(unAlimento, unaCantidad) ]
		return tiene
	}
	
 	def boolean puedeVerme(Usuario unUsuario) {
		if (acceso == null) throw new IllegalArgumentException ("falta configurar el acceso")
		return acceso.puedeVerme(unUsuario)
	}
	
	def boolean puedeModificarme(Usuario unUsuario) {
		if (acceso == null) throw new IllegalArgumentException ("falta configurar el acceso")
		return acceso.puedeModificarme(unUsuario)
	}
	
	def  getCondicionesQueCumple() {
		RepositorioCondiciones.getInstance.condiciones.filter[c| c.getEsRecetaApta(this) ].toList()
	}

	def void agregarCondicionPrexistente(CondicionPreexistente unaCondicion){
		condicionesPreexistentes.add(unaCondicion)
	}
	
	def String getCreadaPor(){
		return acceso.usuarioCarga.nombre
	}
	
	def getPasosToString(){
		if(pasos.size>0)
		{
			pasos.join(". ") + "."
		}else{
			"no hay pasos disponibles"
		}
	}
	
	override tieneIngrediente(String nombre) {
		ingredientes.exists[i|i.tieneIngrediente(nombre.toLowerCase)]
	}
	
	def getCantidadEnGr(){
		"A gusto para acompañar"
	}
	
	def Receta getCopia(Usuario unUsuario) {
		var copiaReceta = new Receta()
		copiaReceta.nombre = nombre

		copiaReceta.ingredientes.addAll(ingredientes)
		copiaReceta.pasos.addAll(pasos)
		copiaReceta.calorias = calorias
		copiaReceta.dificultad = dificultad
		copiaReceta.temporada = temporada
		copiaReceta.acceso = new RecetaAccesoPrivado(unUsuario)
//		copiaReceta.acceso = new RecetaAccesoPublico()
		copiaReceta.condimentos.addAll(condimentos)
		copiaReceta.condicionesPreexistentes = condicionesPreexistentes
		
		copiaReceta
	}
	
		override equals(Object o) {
		try {
			val otra = o as Receta
			return otra.id.equals(this.id)
		} catch (ClassCastException e) {
			return false
		}
	}
	
	

	override hashCode() {
		id.hashCode
	}
}