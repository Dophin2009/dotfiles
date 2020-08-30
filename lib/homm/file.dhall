let LinkType = ./linktype.dhall

let File =
      { Type = { path : Text, linkType : LinkType, shallow : Bool }
      , default = { linkType = LinkType.Link, shallow = False }
      }

in  File
