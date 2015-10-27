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

app.controller('VerRecetaController', function($stateParams, $state,verRecetaService) {
	
	
	function transformarAReceta(jsonReceta) {
		return Receta.asReceta(jsonReceta);
	}
	
	var self = this;
	var receta = [];
	this.getRecetaById = function() {
		verRecetaService.findAll($stateParams.id,function(data) {
			self.receta = data.data;
		});
	};

	this.getRecetaById();

});


app.controller('copiarRecetaController', function ($stateParams, $state, copiarRecetaService) {
	var self = this;
	var receta = [];
	
	this.getRecetaById = function() {
		copiarRecetaService.findAll($stateParams.id,function(data) {
			self.receta = data.data;
		});
	};

	this.getRecetaById()
	
// this.aceptar = function () {
// copiarRecetasService.copiarReceta(this.receta,this.nuevoNombre);
// $state.go("listarRecetas");
// };

	 
// self.nuevoNombre = "Copia de " + this.receta.nombre;
// this.receta = copiarRecetasService.getRecetaById($stateParams.id);
});