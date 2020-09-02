let Stew = ../lib/stew/stew.dhall

let profile = ../loaded.dhall

let local = ./local.dhall

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/i3/config.tmpl"
      , dest = ".config/i3/config"
      }

let reloadHook
    : Stew.Hook
    = { string = "hooks/reload-i3.sh", name = "Reload i3" }

let dependencies = [ "../polybar", "../wallpaper", "../fscreenshot" ]

let package =
      Stew.Package::{
      , name = "i3"
      , dependencies
      , templateFiles = [ configTemplate ]
      , afterLink = [ reloadHook ]
      }

let variables = profile.i3 ∧ local

in  { package, variables }
