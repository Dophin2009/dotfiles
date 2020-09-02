let Stew = ../lib/stew/stew.dhall

let dependencies = [ "../sh", "../tmux" ]

in  { package = Stew.Package::{ name = "zsh", dependencies } }
