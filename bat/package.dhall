let Stew = ../lib/stew.dhall

let profile = ../current.dhall

let Package = Stew.Package

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/bat/config.tmpl"
      , dest = ".config/bat/config"
      }

let package = Package::{ name = "bat", templateFiles = [ configTemplate ] }

let variables = profile

in  { package, variables }
