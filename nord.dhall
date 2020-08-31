let home = (./lib/stew/env.dhall).home

let Profile = ./profile.dhall

let font = "Iosevka Nerd Font"

let colors =
      { primary =
        { background = "#2E3440", foreground = "#D8DEE9", alarm = "#BF616A" }
      , normal =
        { black = "#3B4252"
        , red = "#BF616A"
        , green = "#A3BE8C"
        , yellow = "#EBCB8B"
        , blue = "#81A1C1"
        , magenta = "#B48EAD"
        , cyan = "#88C0D0"
        , white = "#E5E9F0"
        }
      , bright =
        { black = "#4C566A"
        , red = "#BF616A"
        , green = "#A3BE8C"
        , yellow = "#EBCB8B"
        , blue = "#81A1C1"
        , magenta = "#B48EAD"
        , cyan = "#8FBCBB"
        , white = "#ECEFF4"
        }
      }

let wallpaper = "${home}/.config/wallpaper/nord.jpg"

let bat = { theme = "Nord" }

let dunst = { low_bg = "#32302f", normal_bg = "#32302f" }

let gtk = { theme = "nordic" }

let hangups = { theme = "solarized-dark" }

let i3 = { gaps = { inner = 15, outer = 0 } }

let neovim = { theme = "nord" }

let qutebrowser = { theme = "nord" }

let rofi = { theme = "nord" }

let taskwarrior = { theme = "dark-256" }

let tmux = { theme = "nord" }

let profile
    : Profile.Type
    = { font
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
