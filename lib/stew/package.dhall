let LinkType = ./linktype.dhall

let Hook = ./hook.dhall

let File = ./file.dhall

let TemplateFile = (./template.dhall).File

let Package =
      { Type =
          { name : Text
          , defaultLinkType : LinkType
          , files : List File.Type
          , templateFiles : List TemplateFile.Type
          , beforeLink : List Hook
          , afterLink : List Hook
          }
      , default =
        { defaultLinkType = LinkType.Link
        , files = [] : List File.Type
        , templateFiles = [] : List TemplateFile.Type
        , beforeLink = [] : List Hook
        , afterLink = [] : List Hook
        }
      }

in  Package
