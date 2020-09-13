let Stew = ./lib/stew/Prelude/Prelude

let profile = ../../loaded.dhall

let configTemplate =
      Stew.Template::{
      , src = "tree/.config/rofi/config.rasi.tmpl"
      , dest = ".config/rofi/config.rasi"
      }

let package =
      Stew.Package::{ name = "rofi", templateFiles = [ configTemplate ] }

let variables = profile.rofi

in  { package, variables }
