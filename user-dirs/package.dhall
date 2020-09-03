let Stew = ../lib/stew/Prelude/Prelude

let LocalType = ./types/LocalType.dhall

let local
    : LocalType
    = ./local.dhall

let template =
      Stew.Template::{
      , src = "tree/.config/user-dirs.dirs.tmpl"
      , dest = ".config/user-dirs.dirs"
      }

let package = Stew.Package::{ name = "user-dirs", templateFiles = [ template ] }

let variables = local

in  { package, variables }
