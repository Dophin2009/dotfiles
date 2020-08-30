let Profile = ./profile.dhall

let font = "Iosevka Nerd Font"

let profile
    : Profile.Type
    = { font, gtk.theme = "gruvbox-gtk" }

in  profile
