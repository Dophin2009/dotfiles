let Stew = ../lib/stew.dhall

let profile = ../current.dhall

let Package = Stew.Package

let alacrittyTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/alacritty/alacritty.yml.tmpl"
      , dest = ".config/alacritty/alacritty.yml"
      }

let package = Package::{ name = "gtk", templateFiles = [ alacrittyTemplate ] }

let variables = profile

in  { package, variables }
