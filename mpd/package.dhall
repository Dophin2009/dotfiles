let Stew = ../lib/stew/stew.dhall

let home = (../lib/stew/env.dhall).home

let local = ./local.dhall

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/mpd/mpd.conf.tmpl"
      , dest = ".config/mpd/mpd.conf"
      }

let package = Stew.Package::{ name = "mpd", templateFiles = [ configTemplate ] }

let variables = { home } ∧ local

in  { package, variables }
