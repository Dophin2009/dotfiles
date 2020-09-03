let Stew = ../lib/stew/Prelude/Prelude

let home = (../lib/stew/Prelude/Env).home

let profile = ../loaded.dhall

let localXinitrc =
      Stew.File::{ src = "xinitrc.local", dest = ".config/X11/xinitrc.local" }

let xresourcesTheme = "xresources.theme"

let themeTemplate =
      Stew.Template::{
      , src = "tree/.config/X11/xresources.theme.tmpl"
      , dest = ".config/X11/${xresourcesTheme}"
      }

let reloadHook
    : Stew.Hook
    = { string =
          "hooks/xrdb-merge.sh \"${home}/.config/X11/${xresourcesTheme}\""
      , name = "Load ${xresourcesTheme}"
      }

let dependencies = [ "../sh" ]

let package =
      Stew.Package::{
      , name = "x11"
      , dependencies
      , files = [ localXinitrc ]
      , templateFiles = [ themeTemplate ]
      , afterLink = [ reloadHook ]
      }

let variables = profile.x11

in  { package, variables }
