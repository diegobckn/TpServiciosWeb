app.service('loginService', function($http) {
	
	/*
	this.findAll = function(id, callback) {
		$http.get('/receta/' + id).then(callback);
	}
	*/
});



app.service('recetasService', function($http) {

	this.findAll = function(callback) {
		$http.get('/recetas').then(callback);
	}

	this.update = function(receta, callback) {
		$http.put('/receta/' + receta.id, receta).then(callback)
	}

});


app.service('buscarRecetasService', function($http) {

	this.findAll = function(callback) {
		$http.get('/recetas').then(callback);
	}

	this.buscarPosta = function(recetaEjemplo, callback) {
		$http.post('/buscar-recetas', recetaEjemplo).then(callback)
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

	this.findAll = function(id, callback) {
		$http.get('/copiar-receta/' + id).then(callback);
	}

	this.copiarReceta = function(receta, callback) {
		$http.post('/copiar-receta/' + receta.id,  receta).then(callback);
	}
});