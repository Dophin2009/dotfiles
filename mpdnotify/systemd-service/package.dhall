let Stew = ../../lib/stew/stew.dhall

let local = ./local.dhall

let serviceTemplate =
      Stew.TemplateFile::{
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
