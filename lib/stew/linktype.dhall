{- LinkType: the way the files and files in subdirectories are linked.
      Link - using symlinks
      Copy - by copying
-}
let LinkType
    : Type
    = < Link | Copy >

in  LinkType
