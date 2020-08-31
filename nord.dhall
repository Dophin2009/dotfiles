let home = (./lib/stew/env.dhall).home

let Profile = ./Profile.dhall

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

let alacritty = { font, colors }

let bat = { theme = "Nord" }

let dunst =
      { font
      , colors =
        { low =
          { foreground = colors.primary.foreground, background = "#4C566A" }
        , normal =
          { foreground = colors.primary.foreground, background = "#4C566A" }
        , critical =
          { foreground = colors.primary.foreground
          , background = colors.primary.alarm
          }
        }
      }

let gtk = { theme = "nordic" }

let hangups = { theme = "solarized-dark" }

let i3 =
      { font = { family = font, size = 10 }
      , colors =
        { foc =
          { border = colors.primary.background
          , bg = colors.primary.background
          , text = colors.primary.foreground
          , indic = colors.primary.background
          , cborder = colors.bright.white
          }
        , foc_in =
          { border = colors.primary.background
          , bg = colors.primary.background
          , text = colors.primary.foreground
          , indic = colors.primary.background
          , cborder = colors.normal.white
          }
        , unfoc =
          { border = colors.primary.background
          , bg = colors.primary.background
          , text = colors.primary.foreground
          , indic = colors.primary.background
          , cborder = colors.normal.white
          }
        , urgent =
          { border = colors.primary.background
          , bg = colors.primary.background
          , text = colors.primary.foreground
          , indic = colors.primary.background
          , cborder = colors.normal.white
          }
        , ph =
          { border = colors.primary.background
          , bg = colors.primary.background
          , text = colors.primary.foreground
          , indic = colors.primary.background
          , cborder = colors.normal.white
          }
        }
      , gaps = { inner = 15, outer = 0 }
      }

let nvim = { theme = "nord" }

let qutebrowser = { theme = "nord" }

let rofi = { theme = "nord" }

let task = { theme = "dark-256" }

let tmux = { theme = "nord" }

let wallpaper = { path = "${home}/.config/wallpaper/nord.jpg" }

let profile
    : Profile
    = { alacritty
      , bat
      , dunst
      , gtk
      , hangups
      , i3
      , nvim
      , qutebrowser
      , rofi
      , task
      , tmux
      , wallpaper
      }

in  profile
