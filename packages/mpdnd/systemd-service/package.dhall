let Stew = ../lib/stew/Prelude/Prelude

let local = ./local.dhall

let serviceTemplate =
      Stew.Template::{
      , src = "tree/.config/systemd/user/mpdnd.service.tmpl"
      , dest = ".config/systemd/user/mpdnd.service"
      }

let dependencies = [ ".." ]

let package =
      Stew.Package::{
      , name = "mpdnd/systemd-service"
      , dependencies
      , templateFiles = [ serviceTemplate ]
      }

let variables = local

in  { package, variables }
