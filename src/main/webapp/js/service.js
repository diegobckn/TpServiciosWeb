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

app.service('verRecetaService', function($http) {
	this.findAll = function(id, callback) {
		$http.get('/receta/' + id).then(callback);
	}
});

app.service('copiarRecetaService', function($http) {

	this.findAll = function(id, callback) {
		$http.get('/copiar-receta/' + id).then(callback);
	}

	this.permaLink = function doDashes2(str) {
	var reemplazarEspaciosPor = "";
    return str.replace(/[^a-z0-9]+/gi, reemplazarEspaciosPor).replace(/^-*|-*$/g, '').toLowerCase();
	}

	this.copiarReceta = function(id,nuevoNombre, callback) {
		nuevoNombre  = this.permaLink(nuevoNombre);
		$http.get('/copiar-receta/' + id+'/' + nuevoNombre).then(callback);
	}
});