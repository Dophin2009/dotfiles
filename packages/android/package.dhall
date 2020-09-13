let Stew = ./lib/stew/Prelude/Prelude

let dependencies = [ "../sh" ]

let package = Stew.Package::{ name = "android", dependencies }

in  { package }
