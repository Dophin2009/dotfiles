-- luacheck: globals vim
local jdtls = require('jdtls')
local g = vim.g

local handlers = require('lsp/handlers')
local on_attach = handlers.on_attach
local capabilities = handlers.capabilities

jdtls.start_or_attach({
    cmd = {g.nvim_config .. '/lua/lsp/jdtls/start.sh'},
    on_attach = on_attach,
    capabilities = capabilities
})
