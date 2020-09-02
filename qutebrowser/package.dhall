let Stew = ../lib/stew/stew.dhall

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

let dependencies = [ "../qt" ]

let package =
      Stew.Package::{
      , name = "qutebrowser"
      , dependencies
      , files = [ themeFile ]
      , afterLink = [ greasemonkeyDLHook ]
      }

in  { package }
