let Stew = ../lib/stew/stew.dhall

let profile = ../loaded.dhall

let themeFile =
      Stew.File::{
      , src = "tree/.config/task/themes/${profile.task.theme}.theme"
      , dest = ".config/task/theme.theme"
      }

let package = Stew.Package::{ name = "task", files = [ themeFile ] }

in  { package }
