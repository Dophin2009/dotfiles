let Stew = ./lib/stew/Prelude/Prelude

let home = (./lib/stew/Prelude/Env).home

let local = ./local.dhall

let configTemplate =
      Stew.Template::{
      , src = "tree/.config/mpd/mpd.conf.tmpl"
      , dest = ".config/mpd/mpd.conf"
      }

let dependencies = [ "../sh" ]

let package =
      Stew.Package::{
      , name = "mpd"
      , dependencies
      , templateFiles = [ configTemplate ]
      }

let variables = { home } ∧ local

in  { package, variables }
