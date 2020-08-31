let Stew = ../lib/stew/stew.dhall

let Profile = ../Profile.dhall

let profile
    : Profile
    = ../loaded.dhall

let configTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/bat/config.tmpl"
      , dest = ".config/bat/config"
      }

let package = Stew.Package::{ name = "bat", templateFiles = [ configTemplate ] }

let variables = profile.bat

in  { package, variables }
