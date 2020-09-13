let Stew = ./lib/stew/Prelude/Prelude

let profile = ../../loaded.dhall

let themeFile =
      Stew.File::{
      , src = "tree/.config/nvim/themes/${profile.nvim.theme}.vim"
      , dest = ".config/nvim/theme.vim"
      }

let dependencies = [ "../sh" ]

let package =
      Stew.Package::{ name = "nvim", dependencies, files = [ themeFile ] }

in  { package }
