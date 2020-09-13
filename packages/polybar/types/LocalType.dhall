let BarModules = ./BarModules.dhall

let Network = ./Network.dhall

in  { modules : { top : BarModules, bottom : BarModules }
    , network : Optional Network
    }
