let Stew = ../lib/stew/stew.dhall

let dependencies = [ "../sh" ]

in  { package = Stew.Package::{ name = "lock-screen", dependencies } }
