let Stew = ../lib/stew/stew.dhall

let dependencies = [ "../sh" ]

let localFile =
      Stew.File::{ src = "config.local", dest = ".config/git/config.local" }

in  { package = Stew.Package::{
      , name = "git"
      , dependencies
      , files = [ localFile ]
      }
    }
