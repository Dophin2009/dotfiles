let Stew = ./lib/stew/Prelude/Prelude

let dependencies = [ "../sh", "../x11" ]

in  { package = Stew.Package::{ name = "zprofile", dependencies } }
