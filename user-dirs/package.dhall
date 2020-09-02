let Stew = ../lib/stew/stew.dhall

let LocalType = ./types/LocalType.dhall

let local
    : LocalType
    = ./local.dhall

let variables = local

let package = Stew.Package::{ name = "user-dirs" }

in  { package, variables }
