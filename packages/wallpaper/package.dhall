let Stew = ./lib/stew/Prelude/Prelude

let profile = ../../loaded.dhall

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

let dependencies = [ "../sh" ]

let package =
      Stew.Package::{
      , name = "wallpaper"
      , dependencies
      , files = [ imagesLink, currentLink ]
      , afterLink = [ reloadHook ]
      }

in  { package }