let Stew = ../lib/stew/stew.dhall

let profile = ../loaded.dhall

let imagesLink =
      Stew.File::{
      , src = "images"
      , dest = ".config/wallpaper/images"
      , replaceDirectories = Some True
      }

let currentLink =
      Stew.File::{
      , src = "images/${profile.wallpaper.name}.jpg"
      , dest = ".config/wallpaper/still.jpg"
      }

let reloadHook
    : Stew.Hook
    = { string = "hooks/reload-wallpaper.sh", name = "Reload wallpaper" }

let package =
      Stew.Package::{
      , name = "x11"
      , files = [ imagesLink, currentLink ]
      , afterLink = [ reloadHook ]
      }

let variables = profile.x11

in  { package, variables }
