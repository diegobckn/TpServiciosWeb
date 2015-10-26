package Grupo6

interface IAceptaSugerencias {
	def boolean getEsSugeridaParaMi(Receta unaReceta)
	def boolean getTieneSobrepeso()
	def boolean getEsRecetaAptaParaMi(Receta unaReceta)
}