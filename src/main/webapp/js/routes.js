app.config(function ($stateProvider, $urlRouterProvider) {

 $urlRouterProvider.otherwise("/login");

 $stateProvider

   .state('login', {
     url: "/login",
     templateUrl: "partials/login.html",
      controller: "loginController as loginCtrl"
   })

   .state('listarRecetas', {
     url: "/",
     templateUrl: "partials/principal.html",
     controller: "ListarRecetasController as recetasCtrl"
   })

   .state('buscarRecetas', {
     url: "/buscar",
     templateUrl: "partials/buscar.html",
     controller: "BuscarRecetasController as buscarCtrl"
   })

   .state('verReceta', {
     url: "/receta/:id",
     templateUrl: "partials/ver_receta.html",
      controller: "VerRecetaController as verCtrl"
   })


   .state('copiarReceta', {
     url: "/copiar-receta/:id",
     templateUrl: "partials/copiar_receta.html",
      controller: "copiarRecetaController as copiarCtrl"
   })


});