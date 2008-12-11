var valijaMaker = undefined;

(function(){
  var imports = ___.copy(___.sharedImports);
  imports.loader = {
    provide: ___.func(function(v) { valijaMaker = v; })
  };
  ___.grantRead(imports, 'loader');
  ___.grantCall(imports.loader, 'provide');
  ___.getNewModuleHandler().setImports(imports);
  ___.getNewModuleHandler().handleUncaughtException = function(e) {
    throw e;
  };
  
})();