(function() {
  
  var imports = ___.copy(___.sharedImports);
  imports.outers = imports;
  var htmlRoot = document.getElementById('base-test');
  attachDocumentStub(
      '-test', { rewrite: function () { return null; } }, imports,
      htmlRoot);
  imports.htmlEmitter___ = new HtmlEmitter(htmlRoot);
  imports.$v = valijaMaker.CALL___(imports);
  ___.grantRead(imports, '$v');
  imports.postUnittestResults = postUnittestResults;
  ___.grantCall(imports, 'postUnittestResults');
  ___.getNewModuleHandler().setImports(imports);  
})();