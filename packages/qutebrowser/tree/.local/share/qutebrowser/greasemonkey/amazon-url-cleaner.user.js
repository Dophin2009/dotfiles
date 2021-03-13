// ==UserScript==
// @name        Amazon: URL Cleaner
// @author      Rami S Ejailat
// @description Replace the URL with the shortest possible clean URL for Amazon items
// @copyright   RamiEjailat (https://openuserjs.org/users/RamiEjailat)
// @license     MIT
// @version     20190810
// @match       *://*.amazon.com/dp/*
// @match       *://*.amazon.com/*/dp/*
// @match       *://*.amazon.com/gp/product/*
// @match       *://*.amazon.com/*/ASIN/*
// @icon        https://www.amazon.com/favicon.ico
// @run-at      document-start
// ==/UserScript==

function getProductId() {
  var m;
  m = document.location.href.match(/(?:.+\/)?dp\/([^/?]+)/);
  if (m) return m[1];
  m = document.location.href.match(/gp\/product\/([^/?]+)/);
  if (m) return m[1];
  m = document.location.href.match(/ASIN\/([^/?]+)/);
  if (m) return m[1];
}

var productId = getProductId();
if (productId) {
  history.replaceState(
      {}, document.title, 'https://'+ document.domain + '/dp/' + productId);
}