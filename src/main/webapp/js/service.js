app.service('recetasService', function($http) {

	this.findAll = function(callback) {
		$http.get('/recetas').then(callback);
	}

	this.update = function(receta, callback) {
		$http.put('/receta/' + receta.id, receta).then(callback)
	}

});

app.service('verRecetaService', function($http) {
	this.findAll = function(id, callback) {
		$http.get('/receta/' + id).then(callback);
	}
});

app.service('copiarRecetaService', function($http) {

	this.findAll = function(id, callback) {
		$http.get('/copiar-receta/' + id).then(callback);
	}

	this.copy = function(id, callback) {
		$http.put('/copiar-receta/' + id).then(callback);
	}
});