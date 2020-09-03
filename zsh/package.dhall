let Stew = ../lib/stew/Prelude/Prelude

let dependencies = [ "../sh", "../tmux" ]

in  { package = Stew.Package::{ name = "zsh", dependencies } }
