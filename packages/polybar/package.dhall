let List/map = ./lib/dhall-lang/Prelude/List/map

let Text/concatSep = ./lib/dhall-lang/Prelude/Text/concatSep

let Optional/fold = ./lib/dhall-lang/Prelude/Optional/fold

let Stew = ./lib/stew/Prelude/Prelude

let Module = ./types/Module.dhall

let BarModules = ./types/BarModules.dhall

let Network = ./types/Network.dhall

let Module/toText = ./types/Module/toText.dhall

let home = (./lib/stew/Prelude/Env).home

let profile = ../../loaded.dhall

let local = ./local.dhall

let joinModuleText
    : List Module → Text
    = λ(list : List Module) →
        Text/concatSep " " (List/map Module Text Module/toText list)

let mapBarModules =
      λ(bar : BarModules) →
        { left = joinModuleText bar.left
        , center = joinModuleText bar.center
        , right = joinModuleText bar.right
        }

let variables =
        profile.polybar
      ∧ { modules =
          { top = mapBarModules local.modules.top
          , bottom = mapBarModules local.modules.bottom
          }
        , network =
            Optional/fold
              Network
              local.network
              Network
              (λ(x : Network) → x)
              { interface = "", type = "" }
        }

let configTemplate =
      Stew.Template::{
      , src = "tree/.config/polybar/settings.ini.tmpl"
      , dest = ".config/polybar/settings.ini"
      }

let networkTemplate =
      Stew.Template::{
      , src = "tree/.config/polybar/modules/network.ini.tmpl"
      , dest = ".config/polybar/modules/network.ini"
      }

let reloadHook
    : Stew.Hook
    = { string = "${home}/.local/bin/launch-polybar", name = "Reload polybar" }

let dependencies = [ "../sh" ]

let package =
      Stew.Package::{
      , name = "polybar"
      , dependencies
      , templateFiles = [ configTemplate, networkTemplate ]
      , afterLink = [ reloadHook ]
      }

in  { package, variables }
