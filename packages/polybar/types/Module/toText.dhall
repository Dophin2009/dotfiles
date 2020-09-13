let Module = ./Module.dhall

let toText =
      λ(module : Module) →
        merge
          { AnimatedWallpaper = "animated-wallpaper"
          , Audio = "audio"
          , MPD = "mpd"
          , Date = "date"
          , Filesystem = "filesystem"
          , CPU = "cpu"
          , Memory = "memory"
          , I3 = "i3"
          , Keyboard = "keyboard"
          , Ibus = "ibus"
          , Mullvad = "mullvad"
          , Network = "network"
          , PacmanYayUpdates = "pacman-yay-updates"
          }
          module

in  toText
