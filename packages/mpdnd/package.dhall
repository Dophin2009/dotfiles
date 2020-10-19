let Stew = ./lib/stew/Prelude/Prelude

let local = ./local.dhall

let dependencies = [ "../sh", "../mpd" ]

let template =
      Stew.Template::{
      , src = "tree/.config/mpdnd/config.toml.tmpl"
      , dest = ".config/mpdnd/config.toml"
      }

let package =
      Stew.Package::{
      , name = "mpdnd"
      , dependencies
      , templateFiles = [ template ]
      }

let variables = local

in  { package, variables }
