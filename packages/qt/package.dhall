let Stew = ./lib/stew/Prelude/Prelude

let dependencies = [ "../sh" ]

in  { package = Stew.Package::{ name = "qt", dependencies } }
