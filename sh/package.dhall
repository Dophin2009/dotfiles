let Stew = ../lib/stew/stew.dhall

let localFiles =
      Stew.File::{
      , src = "local"
      , dest = ".config/sh/local"
      , linkType = Stew.LinkType.Copy
      , replaceDirectories = Some True
      }

let package = Stew.Package::{ name = "sh", files = [ localFiles ] }

in  { package }
