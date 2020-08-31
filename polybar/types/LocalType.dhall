let Module = ./Module.dhall

let ModuleList = List Module

let BarModules = ./BarModules.dhall

in  { modules : { top : BarModules, bottom : BarModules }
    , network : Optional { interface : Text, type : Text }
    }
