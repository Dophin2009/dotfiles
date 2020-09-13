let Stew = ./lib/stew/Prelude/Prelude

let profile = ../../loaded.dhall

let configTemplate =
      Stew.Template::{
      , src = "tree/.config/termite/config.tmpl"
      , dest = ".config/termite/config"
      }

let package =
      Stew.Package::{ name = "termite", templateFiles = [ configTemplate ] }

let variables = profile.termite

in  { package, variables }
