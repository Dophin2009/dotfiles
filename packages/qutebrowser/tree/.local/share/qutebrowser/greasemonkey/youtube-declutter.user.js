// ==UserScript==
// @name               YouTube Declutter
// @namespace          a
// @version            1.0.
// @match              *://www.youtube.com/*
// ==/UserScript==

const filterChip = document.querySelector("#header > ytd-feed-filter-chip-bar-renderer")
filterChip.style.display = "none";
