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
	function transformarAReceta(jsonReceta) {
		return Receta.asReceta(jsonReceta);
	}

	var self = this;
	var receta = [];
	this.getRecetaById = function() {
		copiarRecetaService.findAll($stateParams.id,function(data) {
			self.receta = data.data;
			this.receta = self.receta;
			this.receta.nuevoNombre = "Copia de " + this.receta.nombre;
		});
	};

	this.getRecetaById();
	
 this.aceptar = function () {
 copiarRecetaService.copiarReceta(this.receta.id,this.receta.nuevoNombre);
 $state.go("listarRecetas");
 };

	 
// self.nuevoNombre = "Copia de " + this.receta.nombre;
// this.receta = copiarRecetasService.getRecetaById($stateParams.id);
});



app.controller('loginController', function($stateParams, $state,loginService) {
	this.nombre = "";
	this.clave = "";

/*
 this.aceptar = function () {
 loginService.checkLogin(this.nombre,this.clave, function() {
	 $state.go("listarRecetas");
	 });
 };

 */



});


