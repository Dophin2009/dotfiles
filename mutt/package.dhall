let Stew = ../lib/stew/Prelude/Prelude

let accountsFile =
      Stew.File::{ src = "accounts", dest = ".config/mutt/accounts" }

in  { package = Stew.Package::{ name = "mutt", files = [ accountsFile ] } }
