let Stew = ../lib/stew/Prelude/Prelude

let local = ./local.dhall

let dependencies = [ "../sh", "../mpd" ]

let template =
      Stew.Template::{
      , src = "tree/.config/mpdnotify/config.yaml.tmpl"
      , dest = ".config/mpdnotify/config.yaml"
      }

let package =
      Stew.Package::{
      , name = "mpdnotify"
      , dependencies
      , templateFiles = [ template ]
      }

let variables = local

in  { package, variables }
