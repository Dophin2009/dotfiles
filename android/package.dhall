let Stew = ../lib/stew/stew.dhall

let dependencies = [ "../sh" ]

let package = Stew.Package::{ name = "android", dependencies }

in  { package }
