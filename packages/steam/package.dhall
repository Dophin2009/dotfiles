let Stew = ./lib/stew/Prelude/Prelude

let installHook
    : Stew.Hook
    = { string = "hooks/install-metro.sh", name = "Install metro-for-steam" }

let dependencies = [ "../sh" ]

in  { package = Stew.Package::{
      , name = "steam"
      , dependencies
      , afterLink = [ installHook ]
      }
    }
