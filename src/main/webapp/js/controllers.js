app.controller('ListarRecetasController', function (recetasService) {
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


app.controller('BuscarRecetasController', function ($stateParams, $state, buscarRecetasService) {
	var self = this;
	this.recetas = [];
	this.recetaEjemplo;

	this.iniciarValoresBusqueda = function() {
		this.recetaEjemplo = new Receta();
		this.recetaEjemplo.nombre = "";
		this.recetaEjemplo.dificultad = "";
		this.recetaEjemplo.temporada = "";
		this.recetaEjemplo.conIngrediente = "";
		this.recetaEjemplo.conFiltros = false;
		this.recetaEjemplo.caloriasMinima = 0;
		this.recetaEjemplo.caloriasMaxima = 0;
	};
	this.iniciarValoresBusqueda();

	function transformarAReceta(jsonReceta) {
		return Receta.asReceta(jsonReceta);
	}

	this.limpiarLista = function () {
		 this.recetas = [];
	 $state.go("buscarRecetas");
	 };



	this.buscar = function () {
	 buscarRecetasService.buscarPosta(this.recetaEjemplo,function(data) {
	 	self.recetas = data.data;
	 });
	 $state.go("buscarRecetas");
	 };

});



app.controller('VerRecetaController', function ($stateParams, $state, verRecetaService) {
	
	
	function transformarAReceta(jsonReceta) {
		return Receta.asReceta(jsonReceta);
	}
	
	var self = this;
	var receta = [];
	this.getRecetaById = function() {
		verRecetaService.findAll($stateParams.id,function(data) {
			self.receta = data.data;
		});

		verRecetaService.checkFavorita($stateParams.id,function(data) {
			self.esFavorita = data.data;
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
			this.receta.viejoNombre = this.receta.nombre;
			this.receta.nombre = "Copia de " + this.receta.nombre;
			
			this.receta.ingredientes = [];
			this.receta.condimentos = [];
			this.receta.condicionesQueCumple = [];
			this.receta.acceso = null;
		});

	};

	this.getRecetaById();
	
 this.aceptar = function () {
 copiarRecetaService.copiarReceta(this.receta);
 $state.go("listarRecetas");
 };

	 
// self.nuevoNombre = "Copia de " + this.receta.nombre;
// this.receta = copiarRecetasService.getRecetaById($stateParams.id);
});



app.controller('loginController', function ($stateParams, $state,loginService) {
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


