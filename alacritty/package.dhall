let Stew = ../lib/stew/stew.dhall

let profile = ../loaded.dhall

let local = ./local.dhall

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/alacritty/alacritty.yml.tmpl"
      , dest = ".config/alacritty/alacritty.yml"
      }

let package =
      Stew.Package::{ name = "alacritty", templateFiles = [ configTemplate ] }

let variables = profile.alacritty ∧ local

in  { package, variables }
