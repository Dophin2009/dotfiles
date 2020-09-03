let Stew = ../lib/stew/Prelude/Prelude

let dependencies = [ "../mpd" ]

in  { package = Stew.Package::{ name = "ncmpcpp", dependencies } }
