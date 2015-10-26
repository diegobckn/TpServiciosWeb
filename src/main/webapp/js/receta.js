function Receta () {
    
};



Receta.asReceta = function (jsonReceta) {
  return angular.extend(new Receta(), jsonReceta);
};

