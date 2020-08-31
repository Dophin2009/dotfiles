let Engine = < Gtmpl >

let File =
      { Type = { src : Text, dest : Text, engine : Engine }
      , default.engine = Engine.Gtmpl
      }

in  { Engine, File }
