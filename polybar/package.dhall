let List/map = ../lib/prelude/List/map

let Text/concatSep = ../lib/prelude/Text/concatSep

let Optional/fold = ../lib/prelude/Optional/fold

let Stew = ../lib/stew/stew.dhall

let Module = ./types/Module.dhall

let BarModules = ./types/BarModules.dhall

let Network = ./types/Network.dhall

let Module/toText = ./types/Module/toText.dhall

let home = (../lib/stew/env.dhall).home

let profile = ../loaded.dhall

let local = ./local.dhall

let joinModuleText
    : List Module → Text
    = λ(list : List Module) →
        Text/concatSep " " (List/map Module Text Module/toText list)

let mapBarModules =
      λ(bar : BarModules) →
        { left = joinModuleText local.modules.top.left
        , center = joinModuleText local.modules.top.center
        , right = joinModuleText local.modules.top.right
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
      Stew.TemplateFile::{
      , src = "tree/.config/polybar/settings.ini.tmpl"
      , dest = ".config/polybar/settings.ini"
      }

let networkTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/polybar/modules/network.ini.tmpl"
      , dest = ".config/polybar/modules/network.ini"
      }

let reloadHook
    : Stew.Hook
    = { string = "${home}/.local/bin/launch-polybar", name = "Reload polybar" }

let package =
      Stew.Package::{
      , name = "polybar"
      , templateFiles = [ configTemplate, networkTemplate ]
      , afterLink = [ reloadHook ]
      }

in  { package, variables }
