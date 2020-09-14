let Stew = ./lib/stew/Prelude/Prelude

let profile = ./profile.dhall ? (../../loaded.dhall).hangups

let configTemplate =
      Stew.Template::{
      , src = "tree/.config/hangups/hangups.conf.tmpl"
      , dest = ".config/hangups/hangups.conf"
      }

let package =
      Stew.Package::{ name = "hangups", templateFiles = [ configTemplate ] }

let variables = profile

in  { package, variables }
