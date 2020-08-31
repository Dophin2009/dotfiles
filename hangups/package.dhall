let Stew = ../lib/stew/stew.dhall

let profile = ../loaded.dhall

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/hangups/hangups.conf.tmpl"
      , dest = ".config/hangups/hangups.conf"
      }

let package =
      Stew.Package::{ name = "hangups", templateFiles = [ configTemplate ] }

let variables = profile.hangups

in  { package, variables }
