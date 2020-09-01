let Stew = ../lib/stew/stew.dhall

let profile = ../loaded.dhall

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/termite/config.tmpl"
      , dest = ".config/termite/config"
      }

let package =
      Stew.Package::{ name = "termite", templateFiles = [ configTemplate ] }

let variables = profile.termite

in  { package, variables }
