// ==UserScript==
// @name               YouTube Auto Skip Ad
// @namespace          a
// @version            1.0.
// @match              *://www.youtube.com/*
// ==/UserScript==

(function () {
  "use strict";
  let closeAd = function () {
    let css =
        ".video-ads .ad-container .adDisplay,#player-ads,.ytp-ad-module,.ytp-ad-image-overlay{ display: none!important; }",
      head = document.head || document.getElementsByTagName("head")[0],
      style = document.createElement("style");

    style.type = "text/css";
    if (style.styleSheet) {
      style.styleSheet.cssText = css;
    } else {
      style.appendChild(document.createTextNode(css));
    }

    head.appendChild(style);
  };
  let skipInt;

  let skipAd = function () {
    //ytp-ad-preview-text
    //ytp-ad-skip-button
    let skipbtn =
      document.querySelector(".ytp-ad-skip-button.ytp-button") ||
      document.querySelector(".videoAdUiSkipButton ");
    //let skipbtn=document.querySelector(".ytp-ad-skip-button ")||document.querySelector(".videoAdUiSkipButton ");
    if (skipbtn) {
      skipbtn =
        document.querySelector(".ytp-ad-skip-button.ytp-button") ||
        document.querySelector(".videoAdUiSkipButton ");
      skipbtn.click();
      if (skipInt) {
        clearTimeout(skipInt);
      }
      skipInt = setTimeout(skipAd, 500);
    } else {
      if (skipInt) {
        clearTimeout(skipInt);
      }
      skipInt = setTimeout(skipAd, 500);
    }
  };

  closeAd();
  skipAd();
})();
