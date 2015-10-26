package Grupo6

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Mensaje {
	
	String De
	String Para
	String Asunto
	String Texto
	
	override String toString()
	{
		"De:"+ De +", Para:"+ Para + ", Asunto:"+ Asunto + ", Texto:"+ Texto 
	}
	
}