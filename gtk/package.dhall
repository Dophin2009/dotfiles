let List/map = ../lib/prelude/List/map

let Stew = ../lib/stew.dhall

let profile = ../current.dhall

let LocalExport = ./types/local.dhall

let Package = Stew.Package

let local
    : LocalExport.Type
    = ./local.dhall ? LocalExport.default

let themes
    : List Text
    = [ "gruvbox-gtk", "nordic" ] # local.themes

let makeThemeFile =
      λ(name : Text) →
        Stew.File::{
        , src = "tree/.local/share/themes/${name}"
        , dest = ".local/share/themes/${name}"
        }

let switchThemeHook
    : Stew.Hook
    = { string = "hooks/switch-theme.sh \"${profile.gtk.theme}\""
      , name = "GTK current theme switch"
      }

let package =
      Package::{
      , name = "gtk"
      , files = List/map Text Stew.File.Type makeThemeFile themes
      , afterLink = [ switchThemeHook ] : List Stew.Hook
      }

in  { package }
