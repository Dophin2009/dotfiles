-- luacheck: globals pkg
require 'lib'

pkg.name = 'host::segv'

local dependencies = {
    'alacritty', 'bat', 'battery-notify', 'beets', 'bin', 'bitwarden',
    'cursedtag', 'dev', 'dict', 'dunst', 'elinks', 'fzf', 'gimp', 'git',
    'gnupg', 'gtk', 'hangups', 'i3', 'ibus', 'less', 'mpd', 'mpdnd', 'mplayer',
    'ncmpcpp', 'nvim', 'pass', 'polybar', 'qt', 'qutebrowser', 'ranger', 'rofi',
    'sh', 'terminfo', 'tmux', 'user-dirs', 'wallpaper', 'wget', 'x11',
    'youtube-dl', 'zathura', 'zsh', 'zsh/zprofile', 'zsh/zshrc'
}

for _, dep in ipairs(dependencies) do
    pkg.dependencies:extend('../../packages/' .. dep)
end
