let Stew = ../lib/stew/stew.dhall

let dependencies = [ "../sh", "../x11" ]

in  { package = Stew.Package::{ name = "zprofile", dependencies } }
