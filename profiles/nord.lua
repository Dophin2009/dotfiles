local M = {}

local font = 'JetBrains Mono Nerd Font'

local colors = {
    primary = {
        background = '#2E3440',
        foreground = '#D8DEE9',
        alarm = '#BF616A'
    },
    normal = {
        black = '#3B4252',
        red = '#BF616A',
        green = '#A3BE8C',
        yellow = '#EBCB8B',
        blue = '#81A1C1',
        magenta = '#B48EAD',
        cyan = '#88C0D0',
        white = '#E5E9F0'
    },
    bright = {
        black = '#4C566A',
        red = '#BF616A',
        green = '#A3BE8C',
        yellow = '#EBCB8B',
        blue = '#81A1C1',
        magenta = '#B48EAD',
        cyan = '#8FBCBB',
        white = '#ECEFF4'
    }
}

M.alacritty = {font = font, colors = colors, font_size = 10}

M.bat = {theme = 'Nord'}

M.dunst = {
    font = {family = font, size = 9},
    colors = {
        low = {foreground = colors.primary.foreground, background = '#4C566A'},
        normal = {
            foreground = colors.primary.foreground,
            background = '#4C566A'
        },
        critical = {
            foreground = colors.primary.foreground,
            background = colors.primary.alarm
        }
    }
}

M.fzf = {name = 'nord'}

M.git = {delta = {theme = 'Nord'}}

M.gtk = {theme = 'nordic'}

M.hangups = {theme = 'solarized-dark'}

M.i3 = {
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
    gaps = {inner = 15, outer = 0}
}

M.nvim = {theme = 'nord'}

M.polybar = {
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
}

M.qutebrowser = {theme = 'nord'}

M.rofi = {font = font, theme = 'nord'}

M.task = {theme = 'dark-256'}

M.termite = {
    font = {family = font, size = 9},
    colors = {
        background = colors.primary.background,
        foreground = colors.primary.foreground,
        foregroundBold = colors.primary.foreground,
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
}

M.tmux = {theme = 'nord'}

M.wallpaper = {name = 'nord'}

M.x11 = {
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
}

return M
