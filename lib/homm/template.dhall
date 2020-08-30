let Engine = < Liquid >

let File =
      { Type = { src : Text, dest : Text, engine : Engine }
      , default.engine = Engine.Liquid
      }

in  { Engine, File }
