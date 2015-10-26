app.controller('ListarRecetasController', function(recetasService) {
	var self = this;
	this.recetas = [];

	function transformarAReceta(jsonReceta) {
		return Receta.asReceta(jsonReceta);
	}

	// TRAER LAS RECETAS - nueva función
	this.getRecetas = function() {
		recetasService.findAll(function(data) {
			self.recetas = _.map(data.data, Receta.asReceta);
		});
	}

	this.getRecetas();

});

app.controller('VerRecetaController', function($stateParams, $state,
		verRecetaService) {
	var self = this;
	var receta = [];
	// La idea de este metodo es que consiga la receta que coinsida con el id para poder mostrarla ya que es filtrada previamente. Pero por alguna razon no llega
	// Revisar el service.js (verRecetaService) y RecetasController.xtend
	this.getRecetaById = function() {
		verRecetaService.findAll(function(data) {
			self.receta = _.map(data.data, Receta.asReceta);
		});
	};

	this.getRecetaById();

	if (!this.receta) {
		$state.go("listarRecetas");
		return;
	}

});
