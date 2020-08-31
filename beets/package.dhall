let Stew = ../lib/stew/stew.dhall

let local = ./local.dhall

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/beets/config.yaml.tmpl"
      , dest = ".config/beets/config.yaml"
      }

let package =
      Stew.Package::{ name = "beets", templateFiles = [ configTemplate ] }

let variables = local

in  { package, variables }
