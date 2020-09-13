let Stew = ./lib/stew/Prelude/Prelude

let profile = ./profile.dhall ? (../../loaded.dhall).bat

let configTemplate =
      Stew.Template::{
      , src = "tree/.config/bat/config.tmpl"
      , dest = ".config/bat/config"
      }

let package = Stew.Package::{ name = "bat", templateFiles = [ configTemplate ] }

let variables = profile

in  { package, variables }
