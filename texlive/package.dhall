let Stew = ../lib/stew/stew.dhall

in  { package = Stew.Package::{ name = "texlive", dependencies } }
