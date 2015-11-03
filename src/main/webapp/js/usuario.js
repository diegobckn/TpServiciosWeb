function Usuario () {
};



Usuario.asUsuario = function (jsonUsuario) {
  return angular.extend(new Usuario(), jsonUsuario);
};

