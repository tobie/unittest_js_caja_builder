(function () {
  ___.sharedImports.console = {};
  for (var k in { log: 0, warn: 0, info: 0, error: 0, trace: 0,
                  group: 0, groupEnd: 0, time: 0, timeEnd: 0, dir: 0,
                  assert: 0, dirxml: 0, profile: 0, profileEnd: 0 }) {
    ___.sharedImports.console[k] = (function (k, f) {
      return ___.func(function () { f.apply(console, arguments); });
    })(k, console[k]);
  }
})();