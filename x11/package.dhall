let Stew = ../lib/stew/stew.dhall

let home = (../lib/stew/env.dhall).home

let profile = ../loaded.dhall

let localXinitrc =
      Stew.File::{ src = "xinitrc.local", dest = ".config/X11/xinitrc.local" }

let xresourcesTheme = "xresources.theme"

let themeTemplate =
      Stew.TemplateFile::{
      , src = "tree/.config/X11/xresources.theme.tmpl"
      , dest = ".config/X11/${xresourcesTheme}"
      }

let reloadHook
    : Stew.Hook
    = { string =
          "hooks/xrdb-merge.sh \"${home}/.config/X11/${xresourcesTheme}\""
      , name = "Load ${xresourcesTheme}"
      }

let package =
      Stew.Package::{
      , name = "x11"
      , files = [ localXinitrc ]
      , templateFiles = [ themeTemplate ]
      , afterLink = [ reloadHook ]
      }

let variables = profile.x11

in  { package, variables }
