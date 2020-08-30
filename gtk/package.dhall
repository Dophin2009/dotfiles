let List/map = ../lib/prelude/List/map

let Homm = ../lib/homm.dhall

let profile = ../current.dhall

let LocalExport = ./types/local.dhall

let Package = Homm.Package

let local
    : LocalExport.Type
    = ./local.dhall ? LocalExport.default

let themes
    : List Text
    = [ "gruvbox-gtk", "nordic" ] # local.themes

let makeThemeFile =
      λ(name : Text) →
        Homm.File::{ path = "tree/.local/share/themes/${name}", shallow = True }

let switchThemeHook
    : Homm.Hook
    = { string = "hooks/switch-theme.sh \"${profile.gtk.theme}\""
      , name = "GTK current theme switch"
      }

let package =
      Package::{
      , name = "gtk"
      , files = List/map Text Homm.File.Type makeThemeFile themes
      , afterLink = [ switchThemeHook ] : List Homm.Hook
      }

in  package
