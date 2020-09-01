let Stew = ../lib/stew/stew.dhall

let dependencies = [ "../sh", "../mpd" ]

in  { package = Stew.Package::{ name = "mpdnotify", dependencies } }
