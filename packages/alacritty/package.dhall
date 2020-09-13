let Stew = ./lib/stew/Prelude/Prelude

let LocalExport = ./types/LocalType.dhall

let profile = ./profile.dhall ? (../../loaded.dhall).alacritty

let local = ./local.dhall ? LocalExport.default

let configTemplate =
      Stew.Template::{
      , src = "tree/.config/alacritty/alacritty.yml.tmpl"
      , dest = ".config/alacritty/alacritty.yml"
      }

let dependencies = [ "../qt" ]

let package =
      Stew.Package::{
      , name = "alacritty"
      , dependencies
      , templateFiles = [ configTemplate ]
      }

let variables = profile ∧ local

in  { package, variables }
