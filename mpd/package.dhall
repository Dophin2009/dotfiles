let Stew = ../lib/stew/stew.dhall

let home = (../lib/stew/env.dhall).home

let local = ./local.dhall

let configTemplate =
      Stew.TemplateFile::{
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
