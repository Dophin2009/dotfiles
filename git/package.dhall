let Stew = ../lib/stew/Prelude/Prelude

let dependencies = [ "../sh" ]

let localFile =
      Stew.File::{ src = "config.local", dest = ".config/git/config.local" }

in  { package = Stew.Package::{
      , name = "git"
      , dependencies
      , files = [ localFile ]
      }
    }
