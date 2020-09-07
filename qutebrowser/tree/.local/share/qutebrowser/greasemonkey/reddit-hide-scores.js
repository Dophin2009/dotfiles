// ==UserScript==
// @name          Reddit Hide Votes
// @namespace     https://github.com/Dophin2009
// @version       1.01
// @description   Hides the scores of unvoted posts and comments.
// @author        Dophin2009
// @match         *://*.reddit.com/*
// @grant         none
// @icon          https://www.redditstatic.com/desktop2x/img/favicon/apple-icon-76x76.png
// ==/UserScript==

(function () {
  const elements = Array.from(document.querySelectorAll(".score.unvoted"));

  for (let el of elements) {
    el.style.setProperty("color", "rgba(0, 0, 0, 0)");
  }
})();
