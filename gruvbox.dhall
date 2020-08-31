let home = (./lib/stew/env.dhall).home

let Profile = ./profile.dhall

let font = "Iosevka Nerd Font"

let colors =
      { bright =
        { black = "#928374"
        , blue = "#83a598"
        , cyan = "#8ec07c"
        , green = "#b8bb26"
        , magenta = "#d3869b"
        , red = "#fb4934"
        , white = "#ebdbb2"
        , yellow = "#fabd2f"
        }
      , normal =
        { black = "#282828"
        , blue = "#458588"
        , cyan = "#689d6a"
        , green = "#98971a"
        , magenta = "#b16286"
        , red = "#cc241d"
        , white = "#a89984"
        , yellow = "#d79921"
        }
      , primary =
        { background = "#282828", foreground = "#ebdbb2", alarm = "#cc241d" }
      }

let wallpaper = "${home}/.config/wallpaper/gruvbox.jpg"

let bat = { theme = "TwoDark" }

let dunst = { low_bg = "#32302f", normal_bg = "#32302f" }

let gtk = { theme = "gruvbox-gtk" }

let hangups = { theme = "solarized-dark" }

let i3 = { gaps = { inner = 15, outer = 0 } }

let neovim = { theme = "gruvbox-dark" }

let qutebrowser = { theme = "gruvbox-dark-medium" }

let rofi = { theme = "gruvbox-dark-hard" }

let taskwarrior = { theme = "dark-256" }

let tmux = { theme = "gruvbox" }

let profile =
      Profile::{
      , font
      , colors
      , bat
      , dunst
      , gtk
      , hangups
      , i3
      , neovim
      , qutebrowser
      , rofi
      , taskwarrior
      , tmux
      , wallpaper
      }

in  profile
