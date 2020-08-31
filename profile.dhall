let Profile =
      { Type =
          { font : Text
          , colors :
              { bright :
                  { black : Text
                  , blue : Text
                  , cyan : Text
                  , green : Text
                  , magenta : Text
                  , red : Text
                  , white : Text
                  , yellow : Text
                  }
              , normal :
                  { black : Text
                  , blue : Text
                  , cyan : Text
                  , green : Text
                  , magenta : Text
                  , red : Text
                  , white : Text
                  , yellow : Text
                  }
              , primary : { background : Text, foreground : Text, alarm : Text }
              }
          , wallpaper : Text
          , bat : { theme : Text }
          , dunst : { low_bg : Text, normal_bg : Text }
          , gtk : { theme : Text }
          , hangups : { theme : Text }
          , i3 : { gaps : { inner : Natural, outer : Natural } }
          , neovim : { theme : Text }
          , qutebrowser : { theme : Text }
          , rofi : { theme : Text }
          , taskwarrior : { theme : Text }
          , tmux : { theme : Text }
          }
      }

in  Profile
