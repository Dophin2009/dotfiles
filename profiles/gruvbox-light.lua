local font = 'JetBrains Mono Nerd Font'

local colors = {
    primary = {background = '#f9f5d7', foreground = '#3c3836'},
    normal = {
        black = '#fbf1c7',
        red = '#cc241d',
        green = '#98971a',
        yellow = '#d79921',
        blue = '#458588',
        magenta = '#b16286',
        cyan = '#689d6a',
        white = '#7c6f64'
    },
    bright = {
        black = '#928374',
        red = '#9d0006',
        green = '#79740e',
        yellow = '#b57614',
        blue = '#076678',
        magenta = '#8f3f71',
        cyan = '#427b58',
        white = '#3c3836'
    }
}

local M = {
    alacritty = {font = font, colors = colors, font_size = 10},
    bat = {theme = 'gruvbox-light'},
    -- TODO: Light theme
    discord = {theme = 'gruvbox'},
    dunst = {
        font = {family = font, size = 9},
        colors = {
            colors = {
                low = {
                    foreground = colors.primary.foreground,
                    background = '#fbf1c7'
                },
                normal = {
                    foreground = colors.primary.foreground,
                    background = '#fbf1c7'
                },
                critical = {
                    foreground = colors.primary.background,
                    background = colors.primary.alarm
                }
            }

        }
    },
    fzf = {name = 'gruvbox-light'},
    git = {delta = {theme = 'gruvbox-light'}},
    -- TODO: Light theme
    gtk = {theme = 'gruvbox-gtk'},
    hangups = {theme = 'default'},
    i3 = {
        font = {family = font, size = 10},
        colors = {
            foc = {
                border = colors.primary.background,
                bg = colors.primary.background,
                text = colors.primary.foreground,
                indic = colors.primary.background,
                cborder = colors.bright.white
            },
            foc_in = {
                border = colors.primary.background,
                bg = colors.primary.background,
                text = colors.primary.foreground,
                indic = colors.primary.background,
                cborder = colors.normal.white
            },
            unfoc = {
                border = colors.primary.background,
                bg = colors.primary.background,
                text = colors.primary.foreground,
                indic = colors.primary.background,
                cborder = colors.normal.white
            },
            urgent = {
                border = colors.primary.background,
                bg = colors.primary.background,
                text = colors.primary.foreground,
                indic = colors.primary.background,
                cborder = colors.normal.white
            },
            ph = {
                border = colors.primary.background,
                bg = colors.primary.background,
                text = colors.primary.foreground,
                indic = colors.primary.background,
                cborder = colors.normal.white
            }
        },
        gaps = {inner = 5, outer = 0}
    },
    nvim = {theme = 'gruvbox/light'},
    polybar = {
        font = font,
        colors = {
            black = colors.normal.black,
            darkgray = colors.bright.black,
            gray = colors.normal.white,
            white = colors.bright.white,
            darkred = colors.normal.red,
            red = colors.bright.red,
            darkblue = colors.normal.blue,
            blue = colors.bright.blue,
            darkyellow = colors.normal.yellow,
            yellow = colors.bright.yellow,
            darkcyan = colors.normal.cyan,
            cyan = colors.bright.cyan,
            background = colors.primary.background,
            foreground = colors.primary.foreground,
            alert = colors.primary.alarm
        }
    },
    qutebrowser = {theme = 'gruvbox-light-hard'},
    rofi = {font = font, theme = 'gruvbox-light-hard'},
    -- TODO: Light theme
    task = {theme = 'dark-256'},
    tmux = {theme = 'gruvbox-light'},
    x11 = {
        colors = {
            background = colors.primary.background,
            foreground = colors.primary.foreground,
            c0 = colors.normal.black,
            c1 = colors.normal.red,
            c2 = colors.normal.green,
            c3 = colors.normal.yellow,
            c4 = colors.normal.blue,
            c5 = colors.normal.magenta,
            c6 = colors.normal.cyan,
            c7 = colors.normal.white,
            c8 = colors.bright.black,
            c9 = colors.bright.red,
            c10 = colors.bright.green,
            c11 = colors.bright.yellow,
            c12 = colors.bright.blue,
            c13 = colors.bright.magenta,
            c14 = colors.bright.cyan,
            c15 = colors.bright.white
        }
    },

    wallpaper = {name = 'gruvbox'}
}

return M
