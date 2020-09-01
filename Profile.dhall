-- Profile type definition

let Profile =
      { alacritty : ./alacritty/types/ProfileType.dhall
      , bat : ./bat/types/ProfileType.dhall
      , dunst : ./dunst/types/ProfileType.dhall
      , gtk : ./gtk/types/ProfileType.dhall
      , hangups : ./hangups/types/ProfileType.dhall
      , i3 : ./i3/types/ProfileType.dhall
      , nvim : ./nvim/types/ProfileType.dhall
      , qutebrowser : ./qutebrowser/types/ProfileType.dhall
      , polybar : ./polybar/types/ProfileType.dhall
      , rofi : ./rofi/types/ProfileType.dhall
      , task : ./task/types/ProfileType.dhall
      , termite : ./termite/types/ProfileType.dhall
      , tmux : ./tmux/types/ProfileType.dhall
      , wallpaper : ./wallpaper/types/ProfileType.dhall
      , x11 : ./x11/types/ProfileType.dhall
      }

in  Profile
