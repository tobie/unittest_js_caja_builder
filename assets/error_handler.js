window.onerror = function (msg, url, line) {
  url = String(url);
  try {
    console.log(
        url.substring(url.lastIndexOf('/') + 1) + ':' + line + ' ' + msg);
    console.trace();
  } catch (ex) {
    alert(url.substring(url.lastIndexOf('/') + 1) + ':' + line + ' ' + msg);
  }
};