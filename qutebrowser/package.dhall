let Optional/map = ../lib/dhall-lang/Prelude/Optional/map

let Optional/fold = ../lib/dhall-lang/Prelude/Optional/fold

let Stew = ../lib/stew/Prelude/Prelude

let profile = ../loaded.dhall

let themeFile =
      Stew.File::{
      , src = "tree/.config/qutebrowser/themes/${profile.qutebrowser.theme}.py"
      , dest = ".config/qutebrowser/theme.py"
      }

let greasemonkeyDLHook
    : Stew.Hook
    = { string = "hooks/greasemonkey-dl.sh"
      , name = "Download greasemonkey scripts"
      }

let searchEnginesFile =
      Stew.File::{
      , src = "searchengines.yaml"
      , dest = ".config/qutebrowser/searchengines.yaml"
      }

let files =
      Optional/fold
        Text
        (Some ./searchengines.yaml as Text ? None Text)
        (List Stew.File.Type)
        (λ(_ : Text) → [ themeFile, searchEnginesFile ])
        [ themeFile ]

let dependencies = [ "../qt" ]

let package =
      Stew.Package::{
      , name = "qutebrowser"
      , dependencies
      , files
      , afterLink = [ greasemonkeyDLHook ]
      }

in  { package }
