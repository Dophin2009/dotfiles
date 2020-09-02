let LinkType = ./linktype.dhall

let File =
      { Type =
          { src : Text
          , dest : Text
          , linkType : LinkType
          , replaceFiles : Optional Bool
          , replaceDirectories : Optional Bool
          }
      , default =
        { linkType = LinkType.Link
        , replaceFiles = None
        , replaceDirectories = None
        }
      }

in  File
