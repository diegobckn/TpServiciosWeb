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
	
	
	function transformarAReceta(jsonReceta) {
		return Receta.asReceta(jsonReceta);
	}
	
	var self = this;
	var receta = [];
	this.getRecetaById = function() {
		verRecetaService.findAll($stateParams.id,function(data) {
			self.receta = data.data;
//			self.receta = _.map(data.data, Receta.asReceta);
		});
	};

	this.getRecetaById();

//	if (!this.receta) {
//		$state.go("listarRecetas");
//		return;
//	}

});
