package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RutinaEjercicio {
	static RutinaEjercicio ACTIVA;
	static def RutinaEjercicio getACTIVA (){
		if (ACTIVA == null) 
			ACTIVA = new RutinaEjercicio ("ACTIVA")
		return ACTIVA;
	} 
	static RutinaEjercicio NADA;
	static def RutinaEjercicio getNADA (){
		if (NADA == null) 
			NADA = new RutinaEjercicio ("NADA")
		return NADA;
	} 
	static RutinaEjercicio LEVE;
	static def RutinaEjercicio getLEVE (){
		if (LEVE == null) 
			LEVE = new RutinaEjercicio ("LEVE")
		return LEVE;
	}
	static RutinaEjercicio MEDIANA;
	static def RutinaEjercicio getMEDIANA (){
		if (MEDIANA == null) 
			MEDIANA = new RutinaEjercicio ("MEDIANA")
		return MEDIANA;
	} 
	static RutinaEjercicio INTENSIVA;
	static def RutinaEjercicio getINTENSIVA (){
		if (INTENSIVA == null) 
			INTENSIVA = new RutinaEjercicio ("INTENSIVA")
		return INTENSIVA;
	}  
	

	String Nombre
	
	new (String unNombre)
	{
		Nombre = unNombre
	}
	
}