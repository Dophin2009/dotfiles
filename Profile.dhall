-- Profile type definition

let Profile =
      { alacritty : ./packages/alacritty/types/ProfileType.dhall
      , bat : ./packages/bat/types/ProfileType.dhall
      , dunst : ./packages/dunst/types/ProfileType.dhall
      , gtk : ./packages/gtk/types/ProfileType.dhall
      , hangups : ./packages/hangups/types/ProfileType.dhall
      , i3 : ./packages/i3/types/ProfileType.dhall
      , nvim : ./packages/nvim/types/ProfileType.dhall
      , qutebrowser : ./packages/qutebrowser/types/ProfileType.dhall
      , polybar : ./packages/polybar/types/ProfileType.dhall
      , rofi : ./packages/rofi/types/ProfileType.dhall
      , task : ./packages/task/types/ProfileType.dhall
      , termite : ./packages/termite/types/ProfileType.dhall
      , tmux : ./packages/tmux/types/ProfileType.dhall
      , wallpaper : ./packages/wallpaper/types/ProfileType.dhall
      , x11 : ./packages/x11/types/ProfileType.dhall
      }

in  Profile
