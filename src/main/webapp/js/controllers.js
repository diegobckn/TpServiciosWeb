app.controller('ListarRecetasController', function (recetasService, $state,loginService) {
	var self = this;
	this.recetas = [];
	this.usuarioLogueado = []
	
	
	

	function transformarAReceta(jsonReceta) {
		return Receta.asReceta(jsonReceta);
	}

	// TRAER LAS RECETAS - nueva función
	this.getRecetas = function() {
		recetasService.findAll(function(data) {
			self.recetas = _.map(data.data, Receta.asReceta);
		});
	}
	
	this.hacerFavorita = function(id){
		recetasService.hacerFavorita(id,function(data){
		});
		this.getRecetas();
	};
	
	this.usuarioLogueado  = loginService.usuarioLogueado;
	this.getRecetas();

});


app.controller('BuscarRecetasController', function ($stateParams, $state, buscarRecetasService,recetasService) {
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
	 
	 this.hacerFavorita = function(id){
		 buscarRecetasService.hacerFavorita(id,function(data){
		//nada
		});
		this.buscar();
	};

});



app.controller('VerRecetaController', function ($stateParams, $state, verRecetaService) {
	
	
	function transformarAReceta(jsonReceta) {
		return Receta.asReceta(jsonReceta);
	}
	
	var self = this;
	var receta = [];
	var esFavorita;
	
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

});



app.controller('loginController', function ($stateParams, $state, loginService) {
	var usuario = [];
	var self = this;
	usuario.nombre = "";	
	usuario.clave = "";

	function transformarAUsuario(jsonUsuario) {
		return Usuario.asUsuario(jsonUsuario);
	}

	
	
 this.aceptar = function () {
	 loginService.checkLogin(this.usuario, function(data) {
	 self.usuario = data.data;
	 self.usuario = transformarAUsuario(self.usuario);
	 
	 loginService.asignar(self.usuario);
	 
	 $state.go("listarRecetas");
	 });
 
 	
 	
 };



});


