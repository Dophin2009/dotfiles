let Stew = ../lib/stew/stew.dhall

let dependencies = [ "../mpd" ]

in  { package = Stew.Package::{ name = "ncmpcpp", dependencies } }
