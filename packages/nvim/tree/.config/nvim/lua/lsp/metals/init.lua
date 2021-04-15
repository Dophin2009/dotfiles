local metals = require('metals')

local config = metals.bare_config
local handlers = require('lsp/handlers')
config.on_attach = handlers.on_attach
config.capabilities = handlers.capabilities

metals.initialize_or_attach(config)

local api = vim.api
api.nvim_command [[augroup NvimMetals]]
api.nvim_command [[autocmd!]]
api.nvim_command [[autocmd BufEnter <buffer> lua require'metals'.did_focus()]]
api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
-- api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
api.nvim_command [[augroup end]]
