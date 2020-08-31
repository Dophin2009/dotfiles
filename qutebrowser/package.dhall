let List/map = ../lib/prelude/List/map

let Stew = ../lib/stew/stew.dhall

let profile = ../loaded.dhall

let package =
      Stew.Package::{
      , name = "qutebrowser"
      , files =
            List/map Text Stew.File.Type makeThemeFile themes
          # [ currentThemeFile ]
      }

in  { package }
