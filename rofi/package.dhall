let Stew = ../lib/stew/stew.dhall

let profile = ../loaded.dhall

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/rofi/config.rasi.tmpl"
      , dest = ".config/rofi/config.rasi"
      }

let package =
      Stew.Package::{ name = "rofi", templateFiles = [ configTemplate ] }

let variables = profile.rofi

in  { package, variables }
