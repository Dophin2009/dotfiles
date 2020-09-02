let Stew = ../lib/stew/stew.dhall

let LocalType = ./types/LocalType.dhall

let local
    : LocalType
    = ./local.dhall

let template =
      Stew.TemplateFile::{
      , src = "tree/.config/user-dirs.dirs.tmpl"
      , dest = ".config/user-dirs.dirs"
      }

let package = Stew.Package::{ name = "user-dirs", templateFiles = [ template ] }

let variables = local

in  { package, variables }
