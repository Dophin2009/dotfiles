let Template = ./template.dhall

in  { Env = ./env.dhall
    , File = ./file.dhall
    , Hook = ./hook.dhall
    , LinkType = ./linktype.dhall
    , Package = ./package.dhall
    , TemplateFile = Template.File
    , TemplateEngine = Template.Engine
    }
