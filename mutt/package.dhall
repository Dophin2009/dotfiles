let Stew = ../lib/stew/stew.dhall

let accountsFile =
      Stew.File::{ src = "accounts", dest = ".config/mutt/accounts" }

in  { package = Stew.Package::{ name = "mutt", files = [ accountsFile ] } }
