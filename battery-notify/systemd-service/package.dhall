let Stew = ../../lib/stew/Prelude/Prelude

let home = (../../lib/stew/Prelude/Env).home

let serviceTemplate =
      Stew.Template::{
      , src = "tree/.config/systemd/user/battery-monitor.service.tmpl"
      , dest = ".config/systemd/user/battery-monitor.service"
      }

let dependencies = [ ".." ]

let package =
      Stew.Package::{
      , name = "battery-notify/systemd-service"
      , dependencies
      , templateFiles = [ serviceTemplate ]
      }

let variables = { home }

in  { package, variables }
