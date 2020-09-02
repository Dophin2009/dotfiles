let Stew = ../lib/stew/stew.dhall

let dependencies = [ "../sh" ]

in  { package = Stew.Package::{ name = "notmuch", dependencies } }
