app.controller('RecetasController', function(recetasService) {
    var self = this;
    this.recetas = [];

    function transformarAReceta(jsonReceta) {
        return Receta.asReceta(jsonReceta);
    }

    // TRAER LAS RECETAS - nueva función
    this.getRecetas = function () {
        recetasService.findAll(function (data) {
            self.recetas = _.map(data.data, Receta.asReceta);
            });
      }

      /*
      this.cumplir = function (tarea) {
            tarea.cumplir();
            tareasService.update(tarea, function() {
                self.getTareas();
            });
      }
      */

	this.getRecetas();
});
