let home = (./lib/stew/env.dhall).home

let Profile = ./Profile.dhall

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

let alacritty = { font, colors }

let bat = { theme = "TwoDark" }

let dunst =
      { font
      , colors =
        { low =
          { foreground = colors.primary.foreground, background = "#32302f" }
        , normal =
          { foreground = colors.primary.foreground, background = "#32302f" }
        , critical =
          { foreground = colors.primary.foreground
          , background = colors.primary.alarm
          }
        }
      }

let gtk = { theme = "gruvbox-gtk" }

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

let nvim = { theme = "gruvbox-dark" }

let polybar = {}

let qutebrowser = { theme = "gruvbox-dark-medium" }

let rofi = { theme = "gruvbox-dark-hard" }

let task = { theme = "dark-256" }

let tmux = { theme = "gruvbox" }

let wallpaper = { path = "${home}/.config/wallpaper/gruvbox.jpg" }

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
      , polybar
      , rofi
      , task
      , tmux
      , wallpaper
      }

in  profile
