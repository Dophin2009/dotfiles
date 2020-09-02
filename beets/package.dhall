let Stew = ../lib/stew/stew.dhall

let home = (../lib/stew/env.dhall).home

let local = ./local.dhall

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/beets/config.yaml.tmpl"
      , dest = ".config/beets/config.yaml"
      }

let mkDataDirHook
    : Stew.Hook
    = { string = "hooks/mk-datadir.sh", name = "Create beets data directory" }

let package =
      Stew.Package::{
      , name = "beets"
      , templateFiles = [ configTemplate ]
      , afterLink = [ mkDataDirHook ]
      }

let variables = { home } ∧ local

in  { package, variables }
