let List/map = ../lib/prelude/List/map

let Stew = ../lib/stew/stew.dhall

let LocalExport = ./types/LocalType.dhall

let profile = ../loaded.dhall

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
        , replaceDirectories = Some True
        }

let currentThemeFile =
      Stew.File::{
      , src = "tree/.local/share/themes/${profile.gtk.theme}"
      , dest = ".local/share/themes/current-theme"
      , replaceDirectories = Some True
      }

let dependencies = [ "../sh" ]

let package =
      Stew.Package::{
      , name = "gtk"
      , dependencies
      , files =
            List/map Text Stew.File.Type makeThemeFile themes
          # [ currentThemeFile ]
      }

in  { package }
