let Stew = ./lib/stew/Prelude/Prelude

let profile = ./profile ? (../../loaded.dhall).i3

let local = ./local.dhall

let configTemplate =
      Stew.Template::{
      , src = "tree/.config/i3/config.tmpl"
      , dest = ".config/i3/config"
      }

let reloadHook
    : Stew.Hook
    = { string = "hooks/reload-i3.sh", name = "Reload i3" }

let dependencies =
      [ "../battery-notify", "../polybar", "../wallpaper", "../fscreenshot" ]

let package =
      Stew.Package::{
      , name = "i3"
      , dependencies
      , templateFiles = [ configTemplate ]
      , afterLink = [ reloadHook ]
      }

let variables = profile ∧ local

in  { package, variables }
