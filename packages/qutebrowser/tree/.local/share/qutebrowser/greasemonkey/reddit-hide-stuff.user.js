// ==UserScript==
// @name          Reddit Hide Stuff
// @namespace     https://github.com/Dophin2009
// @version       1.01
// @description   Hide some stuff on reddit.
// @author        Dophin2009
// @match         *://*.reddit.com/*
// @grant         none
// @icon          https://www.redditstatic.com/desktop2x/img/favicon/apple-icon-76x76.png
// ==/UserScript==

(function () {
  function select(query) {
    /** @type {HTMLElement} */
    const el = document.querySelector(query);
    return el;
  }

  function selectAll(query) {
    /** @type {Array<HTMLElement>} */
    const arr = Array.from(document.querySelectorAll(query));
    return arr;
  }

  function displayNone(el) {
    el.style.setProperty("display", "none");
  }

  // Hide ad containers
  const scores = selectAll(".native-ad-container");
  for (let el of scores) {
    displayNone(el);
  }

  // Hide premium advertisement
  const premium = selectAll(".premium-banner-outer");
  for (let el of premium) {
    displayNone(el);
  }

  // Hide username
  let user = select("#header-bottom-right > span.user");
  user.innerHTML = "??? (??)";

  // Hide beta optin
  let beta = select("#redesign-beta-optin-btn");
  displayNone(beta);
})();
