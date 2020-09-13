let Stew = ./lib/stew/Prelude/Prelude

let profile = ../../loaded.dhall

let themeFile =
      Stew.File::{
      , src = "tree/.config/task/themes/${profile.task.theme}.theme"
      , dest = ".config/task/theme.theme"
      }

let dependencies = [ "../sh" ]

let package =
      Stew.Package::{ name = "task", dependencies, files = [ themeFile ] }

in  { package }
