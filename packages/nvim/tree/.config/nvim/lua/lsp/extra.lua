local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')

-- dhall language server
configs.dhall_lsp = {
    default_config = {
        cmd = {'dhall-lsp-server'},
        filetypes = {'dhall'},
        root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname) or
                       vim.loop.os_homedir()
        end,
        settings = {}
    }
}

