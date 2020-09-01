let Stew = ../lib/stew/stew.dhall

let profile = ../loaded.dhall

let themeFile =
      Stew.File::{
      , src = "tree/.config/tmux/themes/${profile.tmux.theme}.conf"
      , dest = ".config/tmux/theme.conf"
      }

let reloadHook
    : Stew.Hook
    = { string = "hooks/reload-tmux.sh", name = "Reload tmux" }

let package =
      Stew.Package::{
      , name = "tmux"
      , files = [ themeFile ]
      , afterLink = [ reloadHook ]
      }

in  { package }
