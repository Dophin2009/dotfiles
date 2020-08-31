let LinkType = ./linktype.dhall

let Hook = ./hook.dhall

let File = ./file.dhall

let TemplateFile = (./template.dhall).File

let Package =
      { Type =
          { name : Text
          , dependencies : List Text
          , extensions : List Text
          , defaultLinkType : LinkType
          , ignorePatterns : List Text
          , files : List File.Type
          , templateFiles : List TemplateFile.Type
          , beforeLink : List Hook
          , afterLink : List Hook
          }
      , default =
        { dependencies = [] : List Text
        , extensions = [] : List Text
        , defaultLinkType = LinkType.Link
        , ignorePatterns = [] : List Text
        , files = [] : List File.Type
        , templateFiles = [] : List TemplateFile.Type
        , beforeLink = [] : List Hook
        , afterLink = [] : List Hook
        }
      }

in  Package
