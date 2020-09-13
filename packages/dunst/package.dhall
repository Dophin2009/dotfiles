let Stew = ./lib/stew/Prelude/Prelude

let profile = ../../loaded.dhall

let configTemplate =
      Stew.Template::{
      , src = "tree/.config/dunst/dunstrc.tmpl"
      , dest = ".config/dunst/dunstrc"
      }

let restartHook = { name = "Restart dunst", string = "hooks/dunst-restart.sh" }

let package =
      Stew.Package::{
      , name = "dunst"
      , templateFiles = [ configTemplate ]
      , afterLink = [ restartHook ]
      }

let variables = profile.dunst

in  { package, variables }
