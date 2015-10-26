app.service('recetasService', function($http) {

	this.findAll = function(callback) {
		$http.get('/recetas').then(callback);
	}

	this.update = function(receta, callback) {
		$http.put('/receta/' + receta.id, receta).then(callback)
	}

});

app.service('verRecetaService', function($http) {

	this.findAll = function(callback) {
		$http.get('/recetas/:id').then(callback);
	}

	// this.update = function(receta, callback) {
	// $http.put('/receta/' + receta.id, receta).then(callback)
	// }

});