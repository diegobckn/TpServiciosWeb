app.service('loginService', function($http) {
	var usuarioLogueado = [];

	this.checkLogin= function(usuario, callback,errorCallBack) {
		$http.post('/login',usuario)
		.then(callback, errorCallBack);
	}
	
	this.asignar = function(usuario){
		this.usuarioLogueado = usuario;
	}
	
});



app.service('recetasService', function($http) {

	this.findRecetas = function(callback) {
		$http.get('/recetas').then(callback);
	}
	
	this.findLabel = function(callback) {
		$http.get('/label').then(callback)
	}

	this.hacerFavorita = function(id, callback) {
		$http.post('/hacer-favorita/' + id).then(callback)
	}


});


app.service('buscarRecetasService', function($http) {

	this.findAll = function(callback,errorCallback) {
		$http.get('/recetas').then(callback,errorCallback);
	}

	this.buscarPosta = function(recetaEjemplo, callback,errorCallBack) {
		$http.post('/buscar-recetas', recetaEjemplo).then(callback,errorCallBack)
	}
	
	this.hacerFavorita = function(id, callback) {
		$http.post('/hacer-favorita/' + id).then(callback)
	}

});


app.service('verRecetaService', function($http) {
	this.findAll = function(id, callback) {
		$http.get('/receta/' + id).then(callback);
	}

	this.checkFavorita = function(id, callback) {
		$http.get('/check-favorita/' + id).then(callback);
	}
});

app.service('copiarRecetaService', function($http) {

	this.findReceta = function(id, callback) {
		$http.get('/copiar-receta/' + id).then(callback);
	}

	this.copiarReceta = function(receta, callback) {
		$http.post('/copiar-receta/' + receta.id,  receta).then(callback);
	}
});