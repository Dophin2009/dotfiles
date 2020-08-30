let Template = ./package/template.dhall

in  { Env = ./env.dhall
    , File = ./package/file.dhall
    , Hook = ./package/hook.dhall
    , LinkType = ./package/linktype.dhall
    , Package = ./package/package.dhall
    , TemplateFile = Template.File
    , TemplateEngine = Template.Engine
    }
