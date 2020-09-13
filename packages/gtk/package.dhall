let List/map = ./lib/dhall-lang/Prelude/List/map

let Stew = ./lib/stew/Prelude/Prelude

let LocalExport = ./types/LocalType.dhall

let profile = ./profile.dhall ? (../../loaded.dhall).gtk

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
      , src = "tree/.local/share/themes/${profile.theme}"
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
