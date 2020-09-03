let Stew = ../../lib/stew/Prelude/Prelude

let local = ./local.dhall

let serviceTemplate =
      Stew.Template::{
      , src = "tree/.config/systemd/user/mpdnotify.service.tmpl"
      , dest = ".config/systemd/user/mpdnotify.service"
      }

let dependencies = [ ".." ]

let package =
      Stew.Package::{
      , name = "mpdnotify/systemd-service"
      , dependencies
      , templateFiles = [ serviceTemplate ]
      }

let variables = local

in  { package, variables }
