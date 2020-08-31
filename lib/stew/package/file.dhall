let LinkType = ./linktype.dhall

let File =
      { Type = { src : Text, dest : Text, linkType : LinkType }
      , default.linkType = LinkType.Link
      }

in  File
